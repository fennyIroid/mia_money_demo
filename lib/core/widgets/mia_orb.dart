import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_colors.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';

/// The Mia mark: an armillary of tilted rings orbiting a molten core, projected
/// in real perspective. Three rings tumble on different axes and the satellites
/// riding them grow, brighten and blur as they swing toward the viewer, so the
/// object reads as a solid thing in space rather than layered flat circles.
///
/// Used on the splash, in onboarding and as the Ask Mia presence.
class MiaOrb extends StatelessWidget {
  const MiaOrb({
    super.key,
    this.size = 240,
    this.speed = 1.0,
    this.coreColor = AppColors.ember,
    this.ringColor = AppColors.glacier,
    this.satelliteColor = AppColors.amberGlow,
    this.energy = 1.0,
    this.showSatellites = true,
  });

  final double size;
  final double speed;
  final Color coreColor;
  final Color ringColor;
  final Color satelliteColor;

  /// 0 → dormant and dim, 1 → fully lit. Ask Mia raises this while thinking.
  final double energy;
  final bool showSatellites;

  @override
  Widget build(BuildContext context) {
    final Duration cycle = Duration(
      milliseconds: (11000 / speed.clamp(0.1, 6)).round(),
    );

    return SizedBox(
      width: getSize(size),
      height: getSize(size),
      child: RepaintBoundary(
        child: const SizedBox.expand()
            .animate(onPlay: (AnimationController c) => c.repeat())
            .custom(
              duration: cycle,
              curve: Curves.linear,
              builder: (BuildContext context, double t, Widget? _) {
                return CustomPaint(
                  painter: _OrbPainter(
                    t: t,
                    coreColor: coreColor,
                    ringColor: ringColor,
                    satelliteColor: satelliteColor,
                    energy: energy,
                    showSatellites: showSatellites,
                  ),
                );
              },
            ),
      ),
    );
  }
}

/// Minimal 3D point used by the orb projection.
class _V3 {
  const _V3(this.x, this.y, this.z);

  final double x;
  final double y;
  final double z;

  _V3 rotateX(double a) {
    final double c = math.cos(a);
    final double s = math.sin(a);
    return _V3(x, y * c - z * s, y * s + z * c);
  }

  _V3 rotateY(double a) {
    final double c = math.cos(a);
    final double s = math.sin(a);
    return _V3(x * c + z * s, y, -x * s + z * c);
  }

  _V3 rotateZ(double a) {
    final double c = math.cos(a);
    final double s = math.sin(a);
    return _V3(x * c - y * s, x * s + y * c, z);
  }
}

class _RingSpec {
  const _RingSpec({
    required this.radius,
    required this.tiltX,
    required this.tiltZ,
    required this.spin,
    required this.satellites,
    required this.thickness,
  });

  final double radius;
  final double tiltX;
  final double tiltZ;
  final double spin;
  final int satellites;
  final double thickness;
}

class _OrbPainter extends CustomPainter {
  const _OrbPainter({
    required this.t,
    required this.coreColor,
    required this.ringColor,
    required this.satelliteColor,
    required this.energy,
    required this.showSatellites,
  });

  final double t;
  final Color coreColor;
  final Color ringColor;
  final Color satelliteColor;
  final double energy;
  final bool showSatellites;

  static const List<_RingSpec> _rings = <_RingSpec>[
    _RingSpec(
      radius: 0.94,
      tiltX: 1.16,
      tiltZ: 0.22,
      spin: 1.0,
      satellites: 3,
      thickness: 1.5,
    ),
    _RingSpec(
      radius: 0.74,
      tiltX: 0.52,
      tiltZ: -0.62,
      spin: -1.42,
      satellites: 2,
      thickness: 1.2,
    ),
    _RingSpec(
      radius: 0.56,
      tiltX: 1.46,
      tiltZ: 0.88,
      spin: 1.9,
      satellites: 2,
      thickness: 1.0,
    ),
  ];

  /// Perspective focal length in unit space. Lower = more dramatic depth.
  static const double _focal = 2.6;

  Offset _project(_V3 p, Offset centre, double scale) {
    final double depthScale = _focal / (_focal + p.z);
    return Offset(
      centre.dx + p.x * scale * depthScale,
      centre.dy + p.y * scale * depthScale,
    );
  }

  double _depthFactor(double z) => (_focal / (_focal + z)).clamp(0.55, 1.7);

  @override
  void paint(Canvas canvas, Size size) {
    final Offset centre = size.center(Offset.zero);
    final double unit = size.shortestSide / 2;
    final double tau = math.pi * 2;
    final double base = t * tau;

    _paintAtmosphere(canvas, centre, unit);

    // Rings and their satellites are drawn back-to-front so nearer geometry
    // genuinely occludes what is behind it.
    final List<_Drawable> queue = <_Drawable>[];

    for (int r = 0; r < _rings.length; r++) {
      final _RingSpec ring = _rings[r];
      final double spin = base * ring.spin;
      final double wobble = math.sin(base * 0.6 + r) * 0.16;

      const int segments = 96;
      final List<Offset> points = <Offset>[];
      final List<double> depths = <double>[];

      for (int i = 0; i <= segments; i++) {
        final double a = (i / segments) * tau;
        _V3 p = _V3(math.cos(a) * ring.radius, math.sin(a) * ring.radius, 0);
        p = p.rotateX(ring.tiltX + wobble).rotateZ(ring.tiltZ).rotateY(spin);
        points.add(_project(p, centre, unit * 0.86));
        depths.add(p.z);
      }

      for (int i = 0; i < segments; i++) {
        final double z = (depths[i] + depths[i + 1]) / 2;
        queue.add(
          _Drawable(
            z: z,
            paint: (Canvas c) {
              final double d = _depthFactor(z);
              final double alpha = (0.10 + 0.42 * ((d - 0.55) / 1.15)) * energy;
              c.drawLine(
                points[i],
                points[i + 1],
                Paint()
                  ..color = withCustomOpacity(
                    Color.lerp(ringColor, AppColors.frost, (d - 0.55) / 1.15) ??
                        ringColor,
                    alpha.clamp(0.0, 1.0),
                  )
                  ..strokeWidth = ring.thickness * d
                  ..strokeCap = StrokeCap.round,
              );
            },
          ),
        );
      }

      if (!showSatellites) continue;

      for (int s = 0; s < ring.satellites; s++) {
        final double a = (s / ring.satellites) * tau + base * 1.7 * ring.spin;
        _V3 p = _V3(math.cos(a) * ring.radius, math.sin(a) * ring.radius, 0);
        p = p.rotateX(ring.tiltX + wobble).rotateZ(ring.tiltZ).rotateY(spin);
        final Offset pos = _project(p, centre, unit * 0.86);
        final double d = _depthFactor(p.z);
        queue.add(
          _Drawable(
            z: p.z + 0.001,
            paint: (Canvas c) {
              final double radius = unit * 0.052 * d;
              c.drawCircle(
                pos,
                radius * 2.6,
                Paint()
                  ..color = withCustomOpacity(satelliteColor, 0.18 * energy * d)
                  ..maskFilter = MaskFilter.blur(
                    BlurStyle.normal,
                    radius * 1.6,
                  ),
              );
              c.drawCircle(
                pos,
                radius,
                Paint()
                  ..shader = RadialGradient(
                    colors: <Color>[
                      AppColors.frost,
                      satelliteColor,
                      withCustomOpacity(satelliteColor, 0.2),
                    ],
                    stops: const <double>[0.0, 0.55, 1.0],
                  ).createShader(Rect.fromCircle(center: pos, radius: radius)),
              );
            },
          ),
        );
      }
    }

    queue.sort((_Drawable a, _Drawable b) => b.z.compareTo(a.z));

    // Back half of the geometry.
    for (final _Drawable d in queue.where((_Drawable d) => d.z > 0)) {
      d.paint(canvas);
    }

    _paintCore(canvas, centre, unit, base);

    // Front half, drawn over the core so rings pass in front of it.
    for (final _Drawable d in queue.where((_Drawable d) => d.z <= 0)) {
      d.paint(canvas);
    }
  }

  void _paintAtmosphere(Canvas canvas, Offset centre, double unit) {
    canvas.drawCircle(
      centre,
      unit * 1.02,
      Paint()
        ..shader = RadialGradient(
          colors: <Color>[
            withCustomOpacity(coreColor, 0.26 * energy),
            withCustomOpacity(ringColor, 0.14 * energy),
            AppColors.transparent,
          ],
          stops: const <double>[0.0, 0.5, 1.0],
        ).createShader(Rect.fromCircle(center: centre, radius: unit * 1.02))
        ..blendMode = BlendMode.plus,
    );
  }

  void _paintCore(Canvas canvas, Offset centre, double unit, double base) {
    final double pulse = 0.5 + 0.5 * math.sin(base * 0.9);
    final double coreRadius = unit * (0.27 + 0.018 * pulse);

    // Molten body with an off-centre specular so it reads as a lit sphere.
    final Offset highlight = Offset(
      centre.dx - coreRadius * 0.32,
      centre.dy - coreRadius * 0.38,
    );

    canvas.drawCircle(
      centre,
      coreRadius * 2.1,
      Paint()
        ..color = withCustomOpacity(coreColor, 0.32 * energy)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, coreRadius * 1.2)
        ..blendMode = BlendMode.plus,
    );

    canvas.drawCircle(
      centre,
      coreRadius,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.35, -0.42),
          radius: 0.95,
          colors: <Color>[
            AppColors.frost,
            AppColors.amberGlow,
            coreColor,
            AppColors.rust,
            withCustomOpacity(AppColors.emberDeep, 0.9),
          ],
          stops: const <double>[0.0, 0.18, 0.48, 0.78, 1.0],
        ).createShader(Rect.fromCircle(center: centre, radius: coreRadius)),
    );

    // Terminator shading on the far side.
    canvas.drawCircle(
      centre,
      coreRadius,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(0.55, 0.62),
          radius: 0.9,
          colors: <Color>[
            withCustomOpacity(AppColors.ink, 0.55),
            AppColors.transparent,
          ],
        ).createShader(Rect.fromCircle(center: centre, radius: coreRadius)),
    );

    canvas.drawCircle(
      highlight,
      coreRadius * 0.22,
      Paint()
        ..color = withCustomOpacity(AppColors.white, 0.55)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, coreRadius * 0.2),
    );

    // Thin equator that catches the light, echoing the ring family.
    canvas.drawOval(
      Rect.fromCenter(
        center: centre,
        width: coreRadius * 2.5,
        height: coreRadius * 0.7,
      ),
      Paint()
        ..color = withCustomOpacity(AppColors.amberGlow, 0.34 * energy)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.1,
    );
  }

  @override
  bool shouldRepaint(_OrbPainter old) =>
      old.t != t || old.energy != energy || old.coreColor != coreColor;
}

class _Drawable {
  const _Drawable({required this.z, required this.paint});

  final double z;
  final void Function(Canvas) paint;
}
