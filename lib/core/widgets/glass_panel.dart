import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';
import '../theme/app_shapes.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import 'pressable.dart';

enum GlassTone { soft, standard, raised, ember, glacier }

/// The product's fundamental surface: a frosted pane of glass floating over the
/// aurora canvas, with a lit top rim and a hairline border.
class GlassPanel extends StatelessWidget {
  const GlassPanel({
    super.key,
    required this.child,
    this.tone = GlassTone.standard,
    this.padding,
    this.margin,
    this.borderRadius,
    this.blur = AppBlur.panel,
    this.onTap,
    this.showRim = true,
    this.width,
    this.height,
    this.shadows,
    this.borderColor,
    this.alignment,
  });

  final Widget child;
  final GlassTone tone;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final double blur;
  final VoidCallback? onTap;
  final bool showRim;
  final double? width;
  final double? height;
  final List<BoxShadow>? shadows;
  final Color? borderColor;
  final AlignmentGeometry? alignment;

  Gradient get _fill {
    switch (tone) {
      case GlassTone.soft:
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            withCustomOpacity(AppColors.white, 0.08),
            withCustomOpacity(AppColors.white, 0.03),
          ],
        );
      case GlassTone.standard:
        return AppGradients.glassPanel;
      case GlassTone.raised:
        return AppGradients.glassPanelRaised;
      case GlassTone.ember:
        return AppGradients.tint(AppColors.ember);
      case GlassTone.glacier:
        return AppGradients.tint(AppColors.glacier);
    }
  }

  Color get _border {
    if (borderColor != null) return borderColor!;
    switch (tone) {
      case GlassTone.soft:
        return AppColors.glassBorderSoft;
      case GlassTone.standard:
      case GlassTone.raised:
        return AppColors.glassBorder;
      case GlassTone.ember:
        return withCustomOpacity(AppColors.emberBright, 0.34);
      case GlassTone.glacier:
        return withCustomOpacity(AppColors.glacier, 0.34);
    }
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = borderRadius ?? AppRadii.rLg;

    final Widget panel = Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: shadows ?? AppShadows.panel,
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: _fill,
              borderRadius: radius,
              border: Border.all(color: _border, width: 1),
            ),
            child: Stack(
              children: <Widget>[
                if (showRim)
                  Positioned(
                    left: getSize(18),
                    right: getSize(18),
                    top: 0,
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        gradient: AppGradients.glassRim,
                      ),
                    ),
                  ),
                Padding(
                  padding: padding ?? AppSpacing.tilePadding,
                  child: alignment == null
                      ? child
                      : Align(alignment: alignment!, child: child),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return Pressable(onTap: onTap, child: panel);
  }
}
