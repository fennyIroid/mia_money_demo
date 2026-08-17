import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_motion.dart';
import '../theme/app_shapes.dart';
import '../theme/app_typography.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'base_text.dart';

/// Hand-rolled micro visuals for tiles. Deliberately not a charting library:
/// these need to sit inside a 34px corner of a bento tile and animate in with
/// the rest of the page.
class Sparkline extends StatelessWidget {
  const Sparkline({
    super.key,
    required this.values,
    this.color = AppColors.frost,
    this.width = 64,
    this.height = 26,
    this.fill = true,
    this.showDot = true,
    this.strokeWidth = 1.8,
  });

  final List<double> values;
  final Color color;
  final double width;
  final double height;
  final bool fill;
  final bool showDot;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: AppMotion.cinematic,
      curve: AppMotion.enter,
      builder: (BuildContext context, double t, Widget? _) {
        return CustomPaint(
          size: Size(getSize(width), getSize(height)),
          painter: _SparklinePainter(
            values: values,
            color: color,
            progress: t,
            fill: fill,
            showDot: showDot,
            strokeWidth: strokeWidth,
          ),
        );
      },
    );
  }
}

class _SparklinePainter extends CustomPainter {
  const _SparklinePainter({
    required this.values,
    required this.color,
    required this.progress,
    required this.fill,
    required this.showDot,
    required this.strokeWidth,
  });

  final List<double> values;
  final Color color;
  final double progress;
  final bool fill;
  final bool showDot;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;

    final double minV = values.reduce(math.min);
    final double maxV = values.reduce(math.max);
    final double span = (maxV - minV).abs() < 0.0001 ? 1 : maxV - minV;
    final double step = size.width / (values.length - 1);

    final Path line = Path();
    final List<Offset> points = <Offset>[];
    for (int i = 0; i < values.length; i++) {
      final double x = step * i;
      final double y = size.height - ((values[i] - minV) / span) * size.height;
      points.add(Offset(x, y));
    }

    line.moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      final Offset prev = points[i - 1];
      final Offset curr = points[i];
      final Offset control = Offset((prev.dx + curr.dx) / 2, prev.dy);
      final Offset control2 = Offset((prev.dx + curr.dx) / 2, curr.dy);
      line.cubicTo(
        control.dx,
        control.dy,
        control2.dx,
        control2.dy,
        curr.dx,
        curr.dy,
      );
    }

    if (fill) {
      final Path area = Path.from(line)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close();
      canvas.drawPath(
        area,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              withCustomOpacity(color, 0.34 * progress),
              AppColors.transparent,
            ],
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      );
    }

    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width * progress, size.height));
    canvas.drawPath(
      line,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
    canvas.restore();

    if (showDot && progress > 0.98) {
      canvas.drawCircle(points.last, strokeWidth * 1.5, Paint()..color = color);
      canvas.drawCircle(
        points.last,
        strokeWidth * 3.2,
        Paint()..color = withCustomOpacity(color, 0.24),
      );
    }
  }

  @override
  bool shouldRepaint(_SparklinePainter old) =>
      old.progress != progress || old.values != values;
}

/// Vertical bar micro chart (the "payment history" visual in the reference).
class BarSpark extends StatelessWidget {
  const BarSpark({
    super.key,
    required this.values,
    this.color = AppColors.frost,
    this.width = 60,
    this.height = 26,
    this.highlightLast = true,
  });

  final List<double> values;
  final Color color;
  final double width;
  final double height;
  final bool highlightLast;

  @override
  Widget build(BuildContext context) {
    final double maxV = values.isEmpty
        ? 1
        : values.reduce(math.max).clamp(0.0001, double.infinity);

    return SizedBox(
      width: getSize(width),
      height: getSize(height),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(values.length, (int i) {
          final bool isLast = i == values.length - 1;
          return TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: values[i] / maxV),
            duration: AppMotion.slow + AppMotion.stagger * i,
            curve: AppMotion.enter,
            builder: (BuildContext context, double t, Widget? _) {
              return Container(
                width: getSize(width / (values.length * 2.1)),
                height: getSize(height) * t.clamp(0.08, 1.0),
                decoration: BoxDecoration(
                  color: highlightLast && isLast
                      ? color
                      : withCustomOpacity(color, 0.42),
                  borderRadius: AppRadii.rPill,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

/// The arc gauge from the reference: a dial with a tick ring and a travelling
/// indicator. Used for scores, budget pace and Vagal-Tone-style indices.
class ArcGauge extends StatelessWidget {
  const ArcGauge({
    super.key,
    required this.value,
    this.min = 0,
    this.max = 100,
    this.size = 200,
    this.trackColor = AppColors.glassFill,
    this.progressColor = AppColors.ember,
    this.centreChild,
    this.leftLabel,
    this.rightLabel,
    this.showTicks = true,
  });

  final double value;
  final double min;
  final double max;
  final double size;
  final Color trackColor;
  final Color progressColor;
  final Widget? centreChild;
  final String? leftLabel;
  final String? rightLabel;
  final bool showTicks;

  @override
  Widget build(BuildContext context) {
    final double t = ((value - min) / (max - min)).clamp(0.0, 1.0);

    return SizedBox(
      width: getSize(size),
      height: getSize(size * 0.78),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: t),
            duration: AppMotion.cinematic,
            curve: AppMotion.enter,
            builder: (BuildContext context, double animated, Widget? _) {
              return CustomPaint(
                size: Size(getSize(size), getSize(size * 0.78)),
                painter: _ArcGaugePainter(
                  progress: animated,
                  trackColor: trackColor,
                  progressColor: progressColor,
                  showTicks: showTicks,
                ),
              );
            },
          ),
          if (centreChild != null)
            Padding(
              padding: EdgeInsets.only(top: getSize(size * 0.08)),
              child: centreChild,
            ),
          if (leftLabel != null)
            Positioned(
              left: 0,
              bottom: 0,
              child: BaseText(
                leftLabel!,
                fontSize: 10,
                textStyle: AppTypography.overline,
                textColor: AppColors.faint,
              ),
            ),
          if (rightLabel != null)
            Positioned(
              right: 0,
              bottom: 0,
              child: BaseText(
                rightLabel!,
                fontSize: 10,
                textStyle: AppTypography.overline,
                textColor: AppColors.faint,
              ),
            ),
        ],
      ),
    );
  }
}

class _ArcGaugePainter extends CustomPainter {
  const _ArcGaugePainter({
    required this.progress,
    required this.trackColor,
    required this.progressColor,
    required this.showTicks,
  });

  final double progress;
  final Color trackColor;
  final Color progressColor;
  final bool showTicks;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset centre = Offset(size.width / 2, size.height * 0.86);
    final double radius = size.width * 0.42;
    const double startAngle = math.pi * 0.86;
    const double sweep = math.pi * 1.28;

    canvas.drawArc(
      Rect.fromCircle(center: centre, radius: radius),
      startAngle,
      sweep,
      false,
      Paint()
        ..color = trackColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.014
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawArc(
      Rect.fromCircle(center: centre, radius: radius),
      startAngle,
      sweep * progress,
      false,
      Paint()
        ..shader = SweepGradient(
          startAngle: startAngle,
          endAngle: startAngle + sweep,
          colors: <Color>[
            withCustomOpacity(progressColor, 0.4),
            progressColor,
            AppColors.frost,
          ],
        ).createShader(Rect.fromCircle(center: centre, radius: radius))
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.width * 0.022
        ..strokeCap = StrokeCap.round,
    );

    if (showTicks) {
      final double tickRadius = radius * 0.8;
      const int tickCount = 34;
      for (int i = 0; i <= tickCount; i++) {
        final double t = i / tickCount;
        final double angle = startAngle + sweep * t;
        final bool active = t <= progress;
        final double length = active ? size.width * 0.05 : size.width * 0.028;
        final Offset inner = Offset(
          centre.dx + math.cos(angle) * (tickRadius - length),
          centre.dy + math.sin(angle) * (tickRadius - length),
        );
        final Offset outer = Offset(
          centre.dx + math.cos(angle) * tickRadius,
          centre.dy + math.sin(angle) * tickRadius,
        );
        canvas.drawLine(
          inner,
          outer,
          Paint()
            ..color = active
                ? withCustomOpacity(AppColors.frost, 0.9)
                : withCustomOpacity(AppColors.frost, 0.18)
            ..strokeWidth = size.width * 0.006
            ..strokeCap = StrokeCap.round,
        );
      }
    }

    // Travelling indicator with a soft halo, mirroring the reference dial.
    final double indicatorAngle = startAngle + sweep * progress;
    final Offset knob = Offset(
      centre.dx + math.cos(indicatorAngle) * radius,
      centre.dy + math.sin(indicatorAngle) * radius,
    );
    canvas.drawCircle(
      knob,
      size.width * 0.032,
      Paint()..color = withCustomOpacity(AppColors.frost, 0.22),
    );
    canvas.drawCircle(
      knob,
      size.width * 0.017,
      Paint()..color = AppColors.frost,
    );
  }

  @override
  bool shouldRepaint(_ArcGaugePainter old) => old.progress != progress;
}

/// Ring used for goals and budget categories.
class ProgressRing extends StatelessWidget {
  const ProgressRing({
    super.key,
    required this.value,
    this.size = 64,
    this.strokeWidth = 6,
    this.color = AppColors.ember,
    this.trackColor = AppColors.glassFill,
    this.child,
  });

  final double value;
  final double size;
  final double strokeWidth;
  final Color color;
  final Color trackColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getSize(size),
      height: getSize(size),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: value.clamp(0.0, 1.0)),
            duration: AppMotion.cinematic,
            curve: AppMotion.enter,
            builder: (BuildContext context, double t, Widget? _) {
              return CustomPaint(
                size: Size(getSize(size), getSize(size)),
                painter: _RingPainter(
                  progress: t,
                  color: color,
                  trackColor: trackColor,
                  strokeWidth: getSize(strokeWidth),
                ),
              );
            },
          ),
          ?child,
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
    required this.strokeWidth,
  });

  final double progress;
  final Color color;
  final Color trackColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset centre = size.center(Offset.zero);
    final double radius = (size.shortestSide - strokeWidth) / 2;

    canvas.drawCircle(
      centre,
      radius,
      Paint()
        ..color = trackColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    canvas.drawArc(
      Rect.fromCircle(center: centre, radius: radius),
      -math.pi / 2,
      math.pi * 2 * progress,
      false,
      Paint()
        ..shader = SweepGradient(
          startAngle: -math.pi / 2,
          endAngle: math.pi * 1.5,
          colors: <Color>[withCustomOpacity(color, 0.45), color],
        ).createShader(Rect.fromCircle(center: centre, radius: radius))
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress;
}

/// Horizontal proportion bar used by budgets, category shares and coverage.
class ProportionBar extends StatelessWidget {
  const ProportionBar({
    super.key,
    required this.value,
    this.color = AppColors.ember,
    this.height = 6,
    this.trackColor = AppColors.glassFill,
    this.markerValue,
  });

  final double value;
  final Color color;
  final double height;
  final Color trackColor;

  /// Optional "expected pace" marker drawn as a bright hairline.
  final double? markerValue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: getSize(height),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: trackColor,
                  borderRadius: AppRadii.rPill,
                ),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: value.clamp(0.0, 1.0)),
                duration: AppMotion.cinematic,
                curve: AppMotion.enter,
                builder: (BuildContext context, double t, Widget? _) {
                  return FractionallySizedBox(
                    widthFactor: t,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[withCustomOpacity(color, 0.7), color],
                        ),
                        borderRadius: AppRadii.rPill,
                      ),
                    ),
                  );
                },
              ),
              if (markerValue != null)
                Positioned(
                  left: constraints.maxWidth * markerValue!.clamp(0.0, 1.0),
                  top: -getSize(2),
                  bottom: -getSize(2),
                  child: Container(
                    width: getSize(2),
                    decoration: BoxDecoration(
                      color: AppColors.frost,
                      borderRadius: AppRadii.rPill,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// Stacked flow bar used by cash-flow and True Cost of Life breakdowns.
class StackedFlowBar extends StatelessWidget {
  const StackedFlowBar({
    super.key,
    required this.segments,
    this.height = 14,
    this.showLegend = true,
  });

  final List<FlowSegment> segments;
  final double height;
  final bool showLegend;

  @override
  Widget build(BuildContext context) {
    final double total = segments.fold<double>(
      0,
      (double sum, FlowSegment s) => sum + s.value,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: AppRadii.rPill,
          child: SizedBox(
            height: getSize(height),
            child: Row(
              children: segments.map((FlowSegment s) {
                return Expanded(
                  flex: total == 0 ? 1 : ((s.value / total) * 1000).round(),
                  child: Container(
                    margin: EdgeInsets.only(right: getSize(2)),
                    decoration: BoxDecoration(
                      color: s.color,
                      borderRadius: AppRadii.rPill,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        if (showLegend) ...<Widget>[
          verticalSpace(12),
          Wrap(
            spacing: getSize(14),
            runSpacing: getSize(8),
            children: segments.map((FlowSegment s) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: getSize(8),
                    height: getSize(8),
                    decoration: BoxDecoration(
                      color: s.color,
                      borderRadius: AppRadii.rXs,
                    ),
                  ),
                  horizontalSpace(6),
                  BaseText(s.label, fontSize: 11, textColor: AppColors.muted),
                ],
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}

class FlowSegment {
  const FlowSegment({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final double value;
  final Color color;
}
