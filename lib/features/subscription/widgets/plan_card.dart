import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_gradients.dart';
import '../../../core/theme/app_motion.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/user_models.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({
    super.key,
    required this.plan,
    required this.selected,
    required this.onTap,
  });

  final SubscriptionPlan plan;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      pressedScale: 0.98,
      child: AnimatedContainer(
        duration: AppMotion.quick,
        curve: AppMotion.standard,
        padding: EdgeInsets.all(getSize(18)),
        decoration: BoxDecoration(
          gradient: selected
              ? AppGradients.tint(AppColors.ember)
              : AppGradients.glassPanel,
          borderRadius: AppRadii.rXl,
          border: Border.all(
            color: selected
                ? withCustomOpacity(AppColors.emberBright, 0.66)
                : AppColors.glassBorderSoft,
            width: selected ? 1.5 : 1,
          ),
          boxShadow: selected
              ? AppShadows.glow(AppColors.ember, strength: 0.7)
              : AppShadows.none,
        ),
        child: Row(
          children: <Widget>[
            AnimatedContainer(
              duration: AppMotion.quick,
              width: getSize(22),
              height: getSize(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? AppColors.ember : AppColors.transparent,
                border: Border.all(
                  color: selected ? AppColors.ember : AppColors.glassBorder,
                  width: 1.6,
                ),
              ),
              child: selected
                  ? Icon(
                      Icons.check_rounded,
                      size: getFontSize(14),
                      color: AppColors.ink,
                    )
                  : null,
            ),
            horizontalSpace(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: BaseText(
                          plan.term == PlanTerm.annual ? 'Annual' : 'Monthly',
                          fontSize: 16,
                          textStyle: AppTypography.titleSmall,
                          maxLines: 1,
                        ),
                      ),
                      horizontalSpace(8),
                      if (plan.isBestValue)
                        const Flexible(
                          child: StatusPill(
                            label: 'Best value',
                            color: AppColors.amberGlow,
                            icon: Icons.star_rounded,
                            dense: true,
                          ),
                        ),
                    ],
                  ),
                  verticalSpace(4),
                  BaseText(
                    plan.term == PlanTerm.annual
                        ? '${formatCurrency(plan.effectiveMonthly)} a month, billed yearly'
                        : 'Billed monthly, cancel any time',
                    fontSize: 12,
                    textColor: AppColors.muted,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                BaseText(
                  formatCurrency(plan.priceAud),
                  fontSize: 22,
                  textStyle: AppTypography.figureMedium,
                ),
                if (plan.savingPercent != null)
                  BaseText(
                    'save ${plan.savingPercent}%',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.positive,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlanEntitlementRow extends StatelessWidget {
  const PlanEntitlementRow({
    super.key,
    required this.label,
    required this.icon,
    this.included = true,
    this.detail,
  });

  final String label;
  final IconData icon;
  final bool included;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSize(7)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            included ? Icons.check_circle_rounded : Icons.remove_circle_outline,
            size: getFontSize(16),
            color: included ? AppColors.positive : AppColors.faint,
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseText(
                  label,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  textColor: included ? AppColors.frost : AppColors.muted,
                ),
                if (detail != null) ...<Widget>[
                  verticalSpace(2),
                  BaseText(
                    detail!,
                    fontSize: 11.5,
                    textColor: AppColors.faint,
                    height: 1.4,
                  ),
                ],
              ],
            ),
          ),
          horizontalSpace(8),
          Icon(icon, size: getFontSize(15), color: AppColors.faint),
        ],
      ),
    );
  }
}
