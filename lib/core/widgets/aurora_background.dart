import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';
import '../theme/app_motion.dart';
import '../utils/color_utils.dart';

enum AuroraMood { ember, glacier, balanced, calm, alert }

/// Living atmosphere behind every screen: three light bodies orbiting on
/// elliptical paths with perspective scaling, read through a heavy blur so they
/// behave like volumetric light rather than flat circles.
class AuroraBackground extends StatelessWidget {
  const AuroraBackground({
    super.key,
    this.mood = AuroraMood.balanced,
    this.intensity = 1.0,
    this.animate = true,
    this.child,
    this.showGrain = true,
  });

  final AuroraMood mood;
  final double intensity;
  final bool animate;
  final Widget? child;
  final bool showGrain;

  @override
  Widget build(BuildContext context) {
    final Widget canvas = DecoratedBox(
      decoration: const BoxDecoration(gradient: AppGradients.duskCanvas),
      child: RepaintBoundary(
        child: _AuroraField(
          mood: mood,
          intensity: intensity,
          animate: animate,
          showGrain: showGrain,
        ),
      ),
    );

    if (child == null) return canvas;

    return Stack(fit: StackFit.expand, children: <Widget>[canvas, child!]);
  }
}

class _AuroraField extends StatelessWidget {
  const _AuroraField({
    required this.mood,
    required this.intensity,
    required this.animate,
    required this.showGrain,
  });

  final AuroraMood mood;
  final double intensity;
  final bool animate;
  final bool showGrain;

  @override
  Widget build(BuildContext context) {
    final Widget painted = CustomPaint(
      painter: _AuroraPainter(
        progress: 0,
        mood: mood,
        intensity: intensity,
        showGrain: showGrain,
      ),
      size: Size.infinite,
    );

    if (!animate) return painted;

    return painted
        .animate(onPlay: (AnimationController c) => c.repeat())
        .custom(
          duration: AppMotion.ambient,
          curve: Curves.linear,
          builder: (BuildContext context, double value, Widget? _) {
            return CustomPaint(
              painter: _AuroraPainter(
                progress: value,
                mood: mood,
                intensity: intensity,
                showGrain: showGrain,
              ),
              size: Size.infinite,
            );
          },
        );
  }
}

class _LightBody {
  const _LightBody({
    required this.color,
    required this.centre,
    required this.radiusFactor,
    required this.orbit,
    required this.phase,
    required this.depth,
  });

  final Color color;
  final Offset centre;
  final double radiusFactor;
  final Offset orbit;
  final double phase;

  /// 0 = far away (small, dim), 1 = close to the viewer (large, bright).
  final double depth;
}

class _AuroraPainter extends CustomPainter {
  const _AuroraPainter({
    required this.progress,
    required this.mood,
    required this.intensity,
    required this.showGrain,
  });

  final double progress;
  final AuroraMood mood;
  final double intensity;
  final bool showGrain;

  List<_LightBody> get _bodies {
    switch (mood) {
      case AuroraMood.ember:
        return const <_LightBody>[
          _LightBody(
            color: AppColors.ember,
            centre: Offset(0.78, 0.12),
            radiusFactor: 0.72,
            orbit: Offset(0.10, 0.06),
            phase: 0.0,
            depth: 1.0,
          ),
          _LightBody(
            color: AppColors.rust,
            centre: Offset(0.18, 0.42),
            radiusFactor: 0.58,
            orbit: Offset(0.08, 0.10),
            phase: 0.35,
            depth: 0.55,
          ),
          _LightBody(
            color: AppColors.amberGlow,
            centre: Offset(0.52, 0.86),
            radiusFactor: 0.5,
            orbit: Offset(0.12, 0.05),
            phase: 0.7,
            depth: 0.3,
          ),
        ];
      case AuroraMood.glacier:
        return const <_LightBody>[
          _LightBody(
            color: AppColors.glacier,
            centre: Offset(0.22, 0.16),
            radiusFactor: 0.74,
            orbit: Offset(0.09, 0.07),
            phase: 0.1,
            depth: 1.0,
          ),
          _LightBody(
            color: AppColors.glacierDeep,
            centre: Offset(0.82, 0.5),
            radiusFactor: 0.62,
            orbit: Offset(0.07, 0.11),
            phase: 0.5,
            depth: 0.5,
          ),
          _LightBody(
            color: AppColors.lagoon,
            centre: Offset(0.4, 0.9),
            radiusFactor: 0.46,
            orbit: Offset(0.13, 0.05),
            phase: 0.8,
            depth: 0.28,
          ),
        ];
      case AuroraMood.balanced:
        return const <_LightBody>[
          _LightBody(
            color: AppColors.ember,
            centre: Offset(0.84, 0.08),
            radiusFactor: 0.68,
            orbit: Offset(0.10, 0.06),
            phase: 0.0,
            depth: 1.0,
          ),
          _LightBody(
            color: AppColors.glacier,
            centre: Offset(0.12, 0.34),
            radiusFactor: 0.66,
            orbit: Offset(0.09, 0.09),
            phase: 0.42,
            depth: 0.6,
          ),
          _LightBody(
            color: AppColors.violetHaze,
            centre: Offset(0.6, 0.92),
            radiusFactor: 0.52,
            orbit: Offset(0.12, 0.06),
            phase: 0.76,
            depth: 0.32,
          ),
        ];
      case AuroraMood.calm:
        return const <_LightBody>[
          _LightBody(
            color: AppColors.glacierDeep,
            centre: Offset(0.3, 0.2),
            radiusFactor: 0.8,
            orbit: Offset(0.05, 0.04),
            phase: 0.2,
            depth: 0.7,
          ),
          _LightBody(
            color: AppColors.lagoon,
            centre: Offset(0.76, 0.72),
            radiusFactor: 0.6,
            orbit: Offset(0.06, 0.05),
            phase: 0.6,
            depth: 0.4,
          ),
        ];
      case AuroraMood.alert:
        return const <_LightBody>[
          _LightBody(
            color: AppColors.negative,
            centre: Offset(0.8, 0.12),
            radiusFactor: 0.6,
            orbit: Offset(0.08, 0.05),
            phase: 0.0,
            depth: 0.9,
          ),
          _LightBody(
            color: AppColors.caution,
            centre: Offset(0.2, 0.4),
            radiusFactor: 0.56,
            orbit: Offset(0.09, 0.08),
            phase: 0.5,
            depth: 0.5,
          ),
        ];
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double diagonal = size.longestSide;
    final double tau = math.pi * 2;

    for (final _LightBody body in _bodies) {
      final double angle = (progress + body.phase) * tau;

      // Perspective: the body swells as it swings toward the viewer.
      final double zPulse = 0.5 + 0.5 * math.sin(angle * 0.75);
      final double perspective = 0.82 + (0.36 * zPulse * body.depth);

      final Offset centre = Offset(
        (body.centre.dx + math.cos(angle) * body.orbit.dx) * size.width,
        (body.centre.dy + math.sin(angle * 1.3) * body.orbit.dy) * size.height,
      );

      final double radius = diagonal * body.radiusFactor * 0.5 * perspective;
      final double alpha = (0.28 + 0.16 * zPulse) * intensity * body.depth;

      final Paint paint = Paint()
        ..shader = RadialGradient(
          colors: <Color>[
            withCustomOpacity(body.color, alpha),
            withCustomOpacity(body.color, alpha * 0.42),
            AppColors.transparent,
          ],
          stops: const <double>[0.0, 0.42, 1.0],
        ).createShader(Rect.fromCircle(center: centre, radius: radius))
        ..blendMode = BlendMode.plus;

      canvas.drawCircle(centre, radius, paint);
    }

    // Cool floor so the bottom of every screen stays readable behind content.
    final Paint floor = Paint()
      ..shader =
          LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              AppColors.transparent,
              withCustomOpacity(AppColors.ink, 0.62),
            ],
          ).createShader(
            Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.5),
          );
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.5),
      floor,
    );

    if (showGrain) {
      _paintGrain(canvas, size);
    }
  }

  /// Deterministic dot field. Breaks up the gradient banding that otherwise
  /// makes large blurred fills look synthetic on OLED screens.
  void _paintGrain(Canvas canvas, Size size) {
    final Paint dot = Paint()
      ..color = withCustomOpacity(AppColors.white, 0.022)
      ..blendMode = BlendMode.plus;
    const int columns = 46;
    final double step = size.width / columns;
    for (int x = 0; x < columns; x++) {
      for (double y = 0; y < size.height; y += step) {
        final double jitter = ((x * 37 + y.toInt() * 17) % 11) / 11.0;
        canvas.drawCircle(
          Offset(x * step + jitter * step, y + jitter * step),
          0.7,
          dot,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_AuroraPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.mood != mood ||
      oldDelegate.intensity != intensity;
}

/// Static, cheap version of the aurora for use inside small tiles and sheets
/// where a full animated field would be wasteful.
class AuroraWash extends StatelessWidget {
  const AuroraWash({
    super.key,
    this.color = AppColors.ember,
    this.alignment = Alignment.topRight,
    this.scale = 1.0,
  });

  final Color color;
  final Alignment alignment;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Align(
        alignment: alignment,
        child: FractionallySizedBox(
          widthFactor: 1.1 * scale,
          heightFactor: 1.1 * scale,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: <Color>[
                  withCustomOpacity(color, 0.34),
                  AppColors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
