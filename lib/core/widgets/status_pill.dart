import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_shapes.dart';
import '../theme/app_typography.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'base_text.dart';

/// Status is never carried by colour alone — every pill pairs its hue with an
/// icon and a word, which is the accessibility rule from the brief.
class StatusPill extends StatelessWidget {
  const StatusPill({
    super.key,
    required this.label,
    this.color = AppColors.glacier,
    this.icon,
    this.fontSize = 10,
    this.dense = false,
    this.solid = false,
  });

  final String label;
  final Color color;
  final IconData? icon;
  final double fontSize;
  final bool dense;
  final bool solid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(dense ? 7 : 10),
        vertical: getSize(dense ? 3 : 5),
      ),
      decoration: BoxDecoration(
        color: solid ? color : withCustomOpacity(color, 0.16),
        borderRadius: AppRadii.rPill,
        border: Border.all(
          color: solid ? AppColors.transparent : withCustomOpacity(color, 0.34),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(
              icon,
              size: getFontSize(fontSize + 2),
              color: solid ? AppColors.ink : color,
            ),
            horizontalSpace(4),
          ],
          Flexible(
            child: BaseText(
              label.toUpperCase(),
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              textColor: solid ? AppColors.ink : color,
              textStyle: AppTypography.overline,
              letterSpacing: 1.0,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

/// Small dot + word freshness marker ("live", "2h ago", "stale").
class FreshnessChip extends StatelessWidget {
  const FreshnessChip({
    super.key,
    required this.label,
    this.color = AppColors.positive,
    this.pulse = false,
  });

  final String label;
  final Color color;
  final bool pulse;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: getSize(6),
          height: getSize(6),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: pulse
                ? <BoxShadow>[
                    BoxShadow(
                      color: withCustomOpacity(color, 0.7),
                      blurRadius: getSize(8),
                    ),
                  ]
                : null,
          ),
        ),
        horizontalSpace(6),
        BaseText(
          label,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          textColor: AppColors.muted,
        ),
      ],
    );
  }
}

/// Signed delta used on report rows and What Changed cards.
class DeltaBadge extends StatelessWidget {
  const DeltaBadge({
    super.key,
    required this.value,
    this.isPercent = true,
    this.invertColours = false,
    this.fontSize = 11,
  });

  final double? value;
  final bool isPercent;

  /// For spending, "up" is bad. For income and savings, "up" is good.
  final bool invertColours;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return StatusPill(
        label: 'New',
        color: AppColors.glacier,
        icon: Icons.fiber_new_rounded,
        fontSize: fontSize,
        dense: true,
      );
    }

    final bool isUp = value! >= 0;
    final bool good = invertColours ? isUp : !isUp;
    final Color color = value! == 0
        ? AppColors.muted
        : good
        ? AppColors.positive
        : AppColors.negative;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          isUp ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
          size: getFontSize(fontSize + 2),
          color: color,
        ),
        horizontalSpace(2),
        BaseText(
          isPercent
              ? '${value!.abs().toStringAsFixed(1)}%'
              : value!.abs().toStringAsFixed(2),
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          textColor: color,
        ),
      ],
    );
  }
}
