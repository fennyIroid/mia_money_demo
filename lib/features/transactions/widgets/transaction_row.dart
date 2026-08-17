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
import '../../../data/models/core_models.dart';
import '../../../data/models/money_models.dart';

class TransactionRow extends StatelessWidget {
  const TransactionRow({
    super.key,
    required this.transaction,
    required this.category,
    required this.onTap,
    this.isSelected = false,
    this.onLongPress,
  });

  final MiaTransaction transaction;
  final MiaCategory? category;
  final VoidCallback onTap;
  final bool isSelected;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final Color accent = category?.color ?? AppColors.glacier;

    return GlassPanel(
      tone: GlassTone.soft,
      onTap: onTap,
      borderRadius: AppRadii.rLg,
      padding: EdgeInsets.symmetric(
        horizontal: getSize(14),
        vertical: getSize(12),
      ),
      borderColor: isSelected
          ? withCustomOpacity(AppColors.ember, 0.6)
          : AppColors.glassBorderSoft,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(38),
                height: getSize(38),
                decoration: BoxDecoration(
                  color: withCustomOpacity(accent, 0.14),
                  borderRadius: AppRadii.rSm,
                  border: Border.all(color: withCustomOpacity(accent, 0.24)),
                ),
                child: Icon(
                  category?.icon ?? Icons.receipt_rounded,
                  size: getFontSize(17),
                  color: accent,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      transaction.merchantDisplay,
                      fontSize: 14.5,
                      textStyle: AppTypography.titleSmall,
                      maxLines: 1,
                    ),
                    verticalSpace(3),
                    BaseText(
                      '${category?.name ?? 'Uncategorised'} · ${transaction.accountName}',
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  MoneyLabel(
                    text: formatCurrency(transaction.amount),
                    isCredit: transaction.isCredit,
                    fontSize: 15,
                  ),
                  verticalSpace(3),
                  BaseText(
                    relativeLabel(transaction.date),
                    fontSize: 10.5,
                    textColor: AppColors.faint,
                  ),
                ],
              ),
            ],
          ),
          if (_badges(transaction).isNotEmpty) ...<Widget>[
            verticalSpace(10),
            Row(
              children: <Widget>[
                horizontalSpace(50),
                Expanded(
                  child: Wrap(
                    spacing: getSize(6),
                    runSpacing: getSize(6),
                    children: _badges(transaction),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  List<Widget> _badges(MiaTransaction t) {
    return <Widget>[
      if (t.status == TransactionStatus.pending)
        StatusPill(
          label: 'Pending',
          color: t.status.color,
          icon: Icons.schedule_rounded,
          dense: true,
        ),
      if (t.treatment != TransactionTreatment.normal)
        StatusPill(
          label: t.treatment.label,
          color: AppColors.violetHaze,
          icon: Icons.rule_rounded,
          dense: true,
        ),
      if (t.isSplit)
        StatusPill(
          label: '${t.splits.length}-way split',
          color: AppColors.lagoon,
          icon: Icons.call_split_rounded,
          dense: true,
        ),
      if (t.receiptId != null)
        StatusPill(
          label: 'Receipt',
          color: AppColors.glacier,
          icon: Icons.receipt_rounded,
          dense: true,
        ),
      if (t.possibleDuplicateOf != null)
        StatusPill(
          label: 'Possible duplicate',
          color: AppColors.caution,
          icon: Icons.copy_all_rounded,
          dense: true,
        ),
      if (t.isReimbursable)
        StatusPill(
          label: 'Reimbursable',
          color: AppColors.positive,
          icon: Icons.work_history_rounded,
          dense: true,
        ),
      if (t.visibility != RecordVisibility.private)
        StatusPill(
          label: t.visibility == RecordVisibility.household ? 'Ours' : 'Shared',
          color: AppColors.glacier,
          icon: t.visibility.icon,
          dense: true,
        ),
      if (t.layers.userCategoryId != null)
        StatusPill(
          label: 'You confirmed',
          color: AppColors.positive,
          icon: Icons.verified_rounded,
          dense: true,
        ),
    ];
  }
}
