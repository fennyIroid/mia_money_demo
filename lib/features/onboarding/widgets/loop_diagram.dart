import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/widgets/base_text.dart';

/// The core product loop as a tilted carousel. Seven stages ride an ellipse; the
/// stage nearest the viewer is large and lit while the far side recedes, and a
/// travelling comet marks whose turn it is. The tilt is what makes it read as a
/// loop in space rather than a list bent into a circle.
class LoopDiagram extends StatelessWidget {
  const LoopDiagram({super.key, this.size = 300});

  final double size;

  static const List<String> stages = <String>[
    'Collect',
    'Understand',
    'Ask',
    'Correct',
    'Remember',
    'Act',
    'Recheck',
  ];

  static const List<IconData> icons = <IconData>[
    Icons.download_rounded,
    Icons.psychology_rounded,
    Icons.help_outline_rounded,
    Icons.edit_rounded,
    Icons.bookmark_rounded,
    Icons.bolt_rounded,
    Icons.refresh_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    final double box = getSize(size);

    return SizedBox(
      width: box,
      height: box * 0.82,
      child: const SizedBox.expand()
          .animate(onPlay: (AnimationController c) => c.repeat())
          .custom(
            duration: const Duration(milliseconds: 14000),
            curve: Curves.linear,
            builder: (BuildContext context, double t, Widget? _) {
              return LoopDiagramFrame(progress: t, box: box);
            },
          ),
    );
  }
}

class LoopDiagramFrame extends StatelessWidget {
  const LoopDiagramFrame({
    super.key,
    required this.progress,
    required this.box,
  });

  final double progress;
  final double box;

  @override
  Widget build(BuildContext context) {
    final double tau = math.pi * 2;
    final double centreX = box / 2;
    final double centreY = box * 0.41;
    final double radiusX = box * 0.38;
    final double radiusY = box * 0.19;

    final List<Widget> nodes = <Widget>[];

    for (int i = 0; i < LoopDiagram.stages.length; i++) {
      final double angle =
          (i / LoopDiagram.stages.length) * tau + progress * tau - math.pi / 2;
      final double x = centreX + math.cos(angle) * radiusX;
      final double y = centreY + math.sin(angle) * radiusY;

      // sin(angle) = 1 means nearest the viewer.
      final double depth = (math.sin(angle) + 1) / 2;
      final double scale = 0.68 + depth * 0.52;
      final double opacity = 0.34 + depth * 0.66;

      nodes.add(
        Positioned(
          left: x - getSize(46) * scale,
          top: y - getSize(20) * scale,
          child: Opacity(
            opacity: opacity,
            child: Transform.scale(
              scale: scale,
              child: LoopStageChip(
                label: LoopDiagram.stages[i],
                icon: LoopDiagram.icons[i],
                isFront: depth > 0.82,
              ),
            ),
          ),
        ),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned.fill(
          child: CustomPaint(
            painter: _LoopOrbitPainter(
              progress: progress,
              centre: Offset(centreX, centreY),
              radiusX: radiusX,
              radiusY: radiusY,
            ),
          ),
        ),
        ...nodes,
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
            child: BaseText(
              'Nothing moves until the evidence does',
              fontSize: 11,
              textStyle: AppTypography.overline,
              textColor: withCustomOpacity(AppColors.mist, 0.55),
            ),
          ),
        ),
      ],
    );
  }
}

class LoopStageChip extends StatelessWidget {
  const LoopStageChip({
    super.key,
    required this.label,
    required this.icon,
    required this.isFront,
  });

  final String label;
  final IconData icon;
  final bool isFront;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(12),
        vertical: getSize(8),
      ),
      decoration: BoxDecoration(
        color: isFront
            ? withCustomOpacity(AppColors.ember, 0.22)
            : withCustomOpacity(AppColors.white, 0.07),
        borderRadius: AppRadii.rPill,
        border: Border.all(
          color: isFront
              ? withCustomOpacity(AppColors.amberGlow, 0.6)
              : AppColors.glassBorderSoft,
        ),
        boxShadow: isFront
            ? AppShadows.glow(AppColors.ember, strength: 0.6)
            : AppShadows.none,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            size: getFontSize(13),
            color: isFront ? AppColors.amberGlow : AppColors.mist,
          ),
          SizedBox(width: getSize(6)),
          BaseText(
            label,
            fontSize: 12.5,
            fontWeight: isFront ? FontWeight.w700 : FontWeight.w500,
            textColor: isFront ? AppColors.frost : AppColors.mist,
          ),
        ],
      ),
    );
  }
}

class _LoopOrbitPainter extends CustomPainter {
  const _LoopOrbitPainter({
    required this.progress,
    required this.centre,
    required this.radiusX,
    required this.radiusY,
  });

  final double progress;
  final Offset centre;
  final double radiusX;
  final double radiusY;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCenter(
      center: centre,
      width: radiusX * 2,
      height: radiusY * 2,
    );

    canvas.drawOval(
      rect,
      Paint()
        ..color = withCustomOpacity(AppColors.white, 0.08)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    // Comet: a bright arc sweeping the ellipse, brightest at its head.
    const double tail = math.pi * 0.6;
    final double head = progress * math.pi * 2 - math.pi / 2;
    canvas.drawArc(
      rect,
      head - tail,
      tail,
      false,
      Paint()
        ..shader = SweepGradient(
          startAngle: head - tail,
          endAngle: head,
          colors: <Color>[
            AppColors.transparent,
            withCustomOpacity(AppColors.ember, 0.55),
            AppColors.amberGlow,
          ],
          transform: GradientRotation(head - tail),
        ).createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.2
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawCircle(
      centre,
      radiusX * 0.34,
      Paint()
        ..shader = RadialGradient(
          colors: <Color>[
            withCustomOpacity(AppColors.ember, 0.22),
            AppColors.transparent,
          ],
        ).createShader(Rect.fromCircle(center: centre, radius: radiusX * 0.34))
        ..blendMode = BlendMode.plus,
    );
  }

  @override
  bool shouldRepaint(_LoopOrbitPainter old) => old.progress != progress;
}
