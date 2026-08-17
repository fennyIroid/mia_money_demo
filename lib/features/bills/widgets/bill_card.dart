import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/core_models.dart';

class BillCard extends StatelessWidget {
  const BillCard({super.key, required this.bill, required this.onTap});

  final Bill bill;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final PriceChange? change = bill.latestPriceChange;

    return GlassPanel(
      onTap: onTap,
      tone: GlassTone.soft,
      borderColor:
          bill.status == BillStatus.overdue ||
              bill.status == BillStatus.amountChanged
          ? withCustomOpacity(bill.status.color, 0.4)
          : AppColors.glassBorderSoft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(38),
                height: getSize(38),
                decoration: BoxDecoration(
                  color: withCustomOpacity(bill.status.color, 0.14),
                  borderRadius: AppRadii.rSm,
                  border: Border.all(
                    color: withCustomOpacity(bill.status.color, 0.24),
                  ),
                ),
                child: Icon(
                  bill.kind.icon,
                  size: getFontSize(17),
                  color: bill.status.color,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      bill.provider,
                      fontSize: 14.5,
                      textStyle: AppTypography.titleSmall,
                      maxLines: 1,
                    ),
                    verticalSpace(3),
                    BaseText(
                      bill.serviceName ??
                          '${bill.frequency.label} · ${bill.kind.label}',
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  MoneyLabel(text: formatCurrency(bill.amount), fontSize: 15),
                  verticalSpace(3),
                  BaseText(
                    dueLabel(bill.dueDate),
                    fontSize: 10.5,
                    textColor: bill.status == BillStatus.overdue
                        ? AppColors.negative
                        : AppColors.faint,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(10),
          Wrap(
            spacing: getSize(6),
            runSpacing: getSize(6),
            children: <Widget>[
              StatusPill(
                label: bill.status.label,
                color: bill.status.color,
                icon: bill.status.icon,
                dense: true,
              ),
              if (bill.isAutopay)
                const StatusPill(
                  label: 'Autopay',
                  color: AppColors.lagoon,
                  icon: Icons.repeat_rounded,
                  dense: true,
                ),
              if (bill.isVariableAmount)
                const StatusPill(
                  label: 'Variable',
                  color: AppColors.caution,
                  icon: Icons.show_chart_rounded,
                  dense: true,
                ),
              if (change != null && change.percent != null)
                StatusPill(
                  label:
                      '${change.percent! >= 0 ? '+' : '−'}${change.percent!.abs().toStringAsFixed(1)}%',
                  color: change.percent! >= 0
                      ? AppColors.negative
                      : AppColors.positive,
                  icon: change.percent! >= 0
                      ? Icons.trending_up_rounded
                      : Icons.trending_down_rounded,
                  dense: true,
                ),
              if (bill.visibility != RecordVisibility.private)
                StatusPill(
                  label: bill.visibility == RecordVisibility.household
                      ? 'Ours'
                      : 'Shared',
                  color: AppColors.glacier,
                  icon: bill.visibility.icon,
                  dense: true,
                ),
              if (bill.assignedTo != null)
                StatusPill(
                  label: 'Assigned to ${bill.assignedTo}',
                  color: AppColors.violetHaze,
                  icon: Icons.person_rounded,
                  dense: true,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
