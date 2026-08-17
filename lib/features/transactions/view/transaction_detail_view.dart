import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_avatar.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/dummy/dummy_money.dart';
import '../../../data/models/core_models.dart';
import '../../../data/models/money_models.dart';
import '../../../data/repositories/money_repository.dart';
import '../widgets/classification_layers_panel.dart';
import '../widgets/transaction_correction_actions.dart';

@RoutePage()
class TransactionDetailView extends StatelessWidget {
  const TransactionDetailView({super.key, required this.transaction});

  final MiaTransaction transaction;

  @override
  Widget build(BuildContext context) {
    final MiaCategory category = DummyMoney.categoryById(
      transaction.layers.effectiveCategoryId,
    );

    return MiaScaffold(
      title: transaction.merchantDisplay,
      overline: formatDateTimeStamp(transaction.date),
      mood: AuroraMood.calm,
      actions: <Widget>[
        GlassIconButton(
          icon: Icons.more_horiz_rounded,
          diameter: 40,
          iconSize: 18,
          onTap: () async {
            final bool changed = await showTransactionCorrections(
              context,
              transaction,
            );
            if (changed && context.mounted) {
              await context.router.maybePop(true);
            }
          },
        ),
      ],
      bottomBar: MiaBottomBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: MiaButton(
                label: 'Confirm as is',
                onTap: () async {
                  // Confirming is a correction too: it promotes Mia's mapping
                  // to a value the user has stood behind.
                  await getIt<TransactionRepository>().applyCorrection(
                    transactionId: transaction.id,
                    categoryId: transaction.layers.effectiveCategoryId,
                  );
                  if (!context.mounted) return;
                  showMiaToast(
                    context,
                    message: 'Confirmed. Mia will remember this.',
                  );
                  await context.router.maybePop(true);
                },
              ),
            ),
            horizontalSpace(10),
            MiaButton(
              label: 'Split',
              variant: MiaButtonVariant.outline,
              expanded: false,
              onTap: () => context.router.push(
                TransactionSplitRoute(transaction: transaction),
              ),
            ),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Reveal(
            withScale: true,
            child: GlassPanel(
              tone: GlassTone.raised,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: getSize(44),
                        height: getSize(44),
                        decoration: BoxDecoration(
                          color: category.color.withValues(alpha: 0.16),
                          borderRadius: BorderRadius.circular(getSize(14)),
                        ),
                        child: Icon(
                          category.icon,
                          color: category.color,
                          size: getFontSize(20),
                        ),
                      ),
                      horizontalSpace(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BaseText(
                              category.name,
                              fontSize: 15,
                              textStyle: AppTypography.titleSmall,
                            ),
                            verticalSpace(3),
                            BaseText(
                              transaction.accountName,
                              fontSize: 12,
                              textColor: AppColors.muted,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(18),
                  ValueTicker(
                    value: transaction.amount,
                    fontSize: 42,
                    textColor: transaction.isCredit
                        ? AppColors.positive
                        : AppColors.frost,
                  ),
                  verticalSpace(14),
                  Wrap(
                    spacing: getSize(6),
                    runSpacing: getSize(6),
                    children: <Widget>[
                      StatusPill(
                        label: transaction.status.label,
                        color: transaction.status.color,
                        dense: true,
                      ),
                      StatusPill(
                        label: transaction.treatment.label,
                        color: AppColors.violetHaze,
                        dense: true,
                      ),
                      StatusPill(
                        label: transaction.visibility.label,
                        color: AppColors.glacier,
                        icon: transaction.visibility.icon,
                        dense: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(16),
          Reveal(
            index: 1,
            child: ClassificationLayersPanel(transaction: transaction),
          ),
          verticalSpace(16),
          if (transaction.isSplit) ...<Widget>[
            Reveal(
              index: 2,
              child: GlassPanel(
                tone: GlassTone.soft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      'Split lines',
                      fontSize: 10,
                      textStyle: AppTypography.overline,
                    ),
                    verticalSpace(6),
                    ...transaction.splits.map((TransactionSplit split) {
                      final MiaCategory splitCategory = DummyMoney.categoryById(
                        split.categoryId,
                      );
                      return EvidenceRow(
                        label:
                            '${splitCategory.name}${split.note == null ? '' : ' · ${split.note}'}',
                        value: formatCurrency(split.amount),
                        icon: splitCategory.icon,
                      );
                    }),
                    verticalSpace(6),
                    Container(height: 1, color: AppColors.glassBorderSoft),
                    verticalSpace(6),
                    EvidenceRow(
                      label: 'Parent not counted separately',
                      value: formatCurrency(transaction.amount),
                      valueColor: AppColors.positive,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(16),
          ],
          Reveal(
            index: 3,
            child: GlassPanel(
              tone: GlassTone.soft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    'Linked records',
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                  ),
                  verticalSpace(6),
                  EvidenceRow(
                    label: 'Receipt',
                    value: transaction.receiptId ?? 'None attached',
                    icon: Icons.receipt_rounded,
                  ),
                  EvidenceRow(
                    label: 'Bill',
                    value: transaction.billId ?? 'Not linked',
                    icon: Icons.receipt_long_rounded,
                  ),
                  EvidenceRow(
                    label: 'Recurring schedule',
                    value: transaction.recurringId ?? 'Not recurring',
                    icon: Icons.autorenew_rounded,
                  ),
                  EvidenceRow(
                    label: 'Transfer pair',
                    value: transaction.transferPairId ?? 'None',
                    icon: Icons.sync_alt_rounded,
                  ),
                  EvidenceRow(
                    label: 'Refund pair',
                    value: transaction.refundPairId ?? 'None',
                    icon: Icons.replay_rounded,
                  ),
                  EvidenceRow(
                    label: 'Counts toward',
                    value: transaction.countsAsSpending
                        ? 'Eligible spending'
                        : transaction.countsAsIncome
                        ? 'Genuine income'
                        : 'Excluded from both',
                    valueColor:
                        transaction.countsAsSpending ||
                            transaction.countsAsIncome
                        ? AppColors.frost
                        : AppColors.caution,
                    icon: Icons.functions_rounded,
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(16),
          Reveal(
            index: 4,
            child: GlassPanel(
              tone: GlassTone.soft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      BaseText(
                        'Household',
                        fontSize: 10,
                        textStyle: AppTypography.overline,
                      ),
                      const Spacer(),
                      MiaAvatarStack(
                        names: <String>[transaction.owner],
                        size: 24,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  EvidenceRow(label: 'Owner', value: transaction.owner),
                  EvidenceRow(
                    label: 'Assigned to',
                    value: transaction.assignedTo ?? 'No one',
                  ),
                  EvidenceRow(
                    label: 'Comments',
                    value: '${transaction.comments.length}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
