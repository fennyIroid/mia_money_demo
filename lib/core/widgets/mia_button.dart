import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';
import '../theme/app_shapes.dart';
import '../theme/app_typography.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'base_text.dart';
import 'pressable.dart';

enum MiaButtonVariant { primary, frost, ghost, outline, danger }

enum MiaButtonSize { small, medium, large }

class MiaButton extends StatelessWidget {
  const MiaButton({
    super.key,
    required this.label,
    this.onTap,
    this.variant = MiaButtonVariant.primary,
    this.size = MiaButtonSize.large,
    this.leadingIcon,
    this.trailingIcon,
    this.expanded = true,
    this.isEnabled = true,
  });

  final String label;
  final VoidCallback? onTap;
  final MiaButtonVariant variant;
  final MiaButtonSize size;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool expanded;
  final bool isEnabled;

  double get _height {
    switch (size) {
      case MiaButtonSize.small:
        return getSize(40);
      case MiaButtonSize.medium:
        return getSize(50);
      case MiaButtonSize.large:
        return getSize(58);
    }
  }

  double get _fontSize {
    switch (size) {
      case MiaButtonSize.small:
        return 13;
      case MiaButtonSize.medium:
        return 15;
      case MiaButtonSize.large:
        return 16;
    }
  }

  Color get _labelColor {
    switch (variant) {
      case MiaButtonVariant.primary:
        return AppColors.ink;
      case MiaButtonVariant.frost:
        return AppColors.ink;
      case MiaButtonVariant.ghost:
      case MiaButtonVariant.outline:
        return AppColors.frost;
      case MiaButtonVariant.danger:
        return AppColors.negative;
    }
  }

  Gradient? get _gradient {
    switch (variant) {
      case MiaButtonVariant.primary:
        return AppGradients.emberFlare;
      case MiaButtonVariant.frost:
        return const LinearGradient(
          colors: <Color>[AppColors.white, AppColors.frost],
        );
      case MiaButtonVariant.ghost:
        return AppGradients.glassPanel;
      case MiaButtonVariant.outline:
        return null;
      case MiaButtonVariant.danger:
        return AppGradients.tint(AppColors.negative);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool active = isEnabled && onTap != null;

    final Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      children: <Widget>[
        if (leadingIcon != null) ...<Widget>[
          Icon(leadingIcon, size: getFontSize(18), color: _labelColor),
          horizontalSpace(8),
        ],
        Flexible(
          child: BaseText(
            label,
            fontSize: _fontSize,
            fontWeight: FontWeight.w600,
            textColor: _labelColor,
            textStyle: AppTypography.label,
            letterSpacing: 0.1,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        if (trailingIcon != null) ...<Widget>[
          horizontalSpace(8),
          Icon(trailingIcon, size: getFontSize(18), color: _labelColor),
        ],
      ],
    );

    final Widget body = Container(
      height: _height,
      width: expanded ? double.infinity : null,
      padding: EdgeInsets.symmetric(horizontal: getSize(expanded ? 16 : 22)),
      decoration: BoxDecoration(
        gradient: _gradient,
        borderRadius: AppRadii.rPill,
        border: variant == MiaButtonVariant.outline
            ? Border.all(color: AppColors.glassBorder)
            : variant == MiaButtonVariant.ghost
            ? Border.all(color: AppColors.glassBorderSoft)
            : null,
        boxShadow: variant == MiaButtonVariant.primary
            ? AppShadows.glow(AppColors.ember, strength: 0.9)
            : AppShadows.none,
      ),
      child: variant == MiaButtonVariant.ghost
          ? ClipRRect(
              borderRadius: AppRadii.rPill,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: AppBlur.subtle,
                  sigmaY: AppBlur.subtle,
                ),
                child: Center(child: content),
              ),
            )
          : Center(child: content),
    );

    return Opacity(
      opacity: active ? 1 : 0.4,
      child: Pressable(
        onTap: active ? onTap : null,
        semanticLabel: label,
        child: body,
      ),
    );
  }
}

/// Circular glass action used for back buttons, tile affordances and the
/// floating Ask Mia trigger.
class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.diameter = 44,
    this.iconSize = 18,
    this.tone = AppColors.frost,
    this.filled = false,
    this.semanticLabel,
    this.badgeCount,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final double diameter;
  final double iconSize;
  final Color tone;
  final bool filled;
  final String? semanticLabel;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    final Widget circle = Container(
      width: getSize(diameter),
      height: getSize(diameter),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: filled ? AppGradients.emberFlare : AppGradients.glassPanel,
        border: Border.all(
          color: filled ? AppColors.transparent : AppColors.glassBorder,
        ),
        boxShadow: filled
            ? AppShadows.glow(AppColors.ember, strength: 0.6)
            : AppShadows.none,
      ),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: AppBlur.subtle,
            sigmaY: AppBlur.subtle,
          ),
          child: Center(
            child: Icon(
              icon,
              size: getFontSize(iconSize),
              color: filled ? AppColors.ink : tone,
            ),
          ),
        ),
      ),
    );

    final Widget withBadge = badgeCount == null || badgeCount == 0
        ? circle
        : Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              circle,
              Positioned(
                right: -getSize(2),
                top: -getSize(2),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getSize(5),
                    vertical: getSize(2),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.ember,
                    borderRadius: AppRadii.rPill,
                    border: Border.all(color: AppColors.ink, width: 1.5),
                  ),
                  child: BaseText(
                    '$badgeCount',
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    textColor: AppColors.ink,
                  ),
                ),
              ),
            ],
          );

    return Pressable(
      onTap: onTap,
      semanticLabel: semanticLabel,
      pressedScale: 0.9,
      child: withBadge,
    );
  }
}

/// Text-only action for tertiary choices ("Not now", "Skip", "Learn more").
class MiaTextAction extends StatelessWidget {
  const MiaTextAction({
    super.key,
    required this.label,
    this.onTap,
    this.color,
    this.fontSize = 14,
    this.icon,
  });

  final String label;
  final VoidCallback? onTap;
  final Color? color;
  final double fontSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      pressedScale: 0.94,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getSize(8),
          horizontal: getSize(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: BaseText(
                label,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                textColor: color ?? withCustomOpacity(AppColors.frost, 0.82),
                maxLines: 1,
              ),
            ),
            if (icon != null) ...<Widget>[
              horizontalSpace(6),
              Icon(
                icon,
                size: getFontSize(fontSize),
                color: color ?? withCustomOpacity(AppColors.frost, 0.82),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
