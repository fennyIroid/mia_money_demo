import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'base_text.dart';
import 'pressable.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.overline,
    this.actionLabel,
    this.onActionTap,
    this.trailing,
    this.padding,
  });

  final String title;
  final String? overline;
  final String? actionLabel;
  final VoidCallback? onActionTap;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: getSize(14)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (overline != null) ...<Widget>[
                  BaseText(
                    overline!,
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                    textColor: AppColors.ember,
                  ),
                  verticalSpace(6),
                ],
                BaseText(
                  title,
                  fontSize: 20,
                  textStyle: AppTypography.titleMedium,
                ),
              ],
            ),
          ),
          ?trailing,
          if (actionLabel != null)
            Pressable(
              onTap: onActionTap,
              pressedScale: 0.94,
              child: Row(
                children: <Widget>[
                  BaseText(
                    actionLabel!,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.glacier,
                  ),
                  horizontalSpace(2),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: getFontSize(16),
                    color: AppColors.glacier,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
