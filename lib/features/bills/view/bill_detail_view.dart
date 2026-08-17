import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/admin_models.dart';
import '../../../data/models/core_models.dart';
import '../../../data/repositories/admin_repository.dart';

@RoutePage()
class BillDetailView extends StatelessWidget {
  const BillDetailView({super.key, required this.bill});

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    return MiaScaffold(
      title: bill.provider,
      overline: bill.kind.label,
      mood: AuroraMood.ember,
      bottomBar: MiaBottomBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: MiaButton(
                label: bill.status == BillStatus.paid
                    ? 'Already paid'
                    : 'Mark as paid',
                isEnabled: bill.status != BillStatus.paid,
                onTap: () async {
                  await getIt<BillRepository>().markPaid(bill.id);
                  if (!context.mounted) return;
                  showMiaToast(
                    context,
                    message:
                        'Marked paid. It leaves the Coming Up timeline and the linked payment will not double count.',
                  );
                  await context.router.maybePop(true);
                },
              ),
            ),
            horizontalSpace(10),
            MiaButton(
              label: 'Cancel it',
              variant: MiaButtonVariant.outline,
              expanded: false,
              isEnabled: bill.status != BillStatus.cancelled,
              onTap: () async {
                final bool confirmed = await confirmDestructive(
                  context: context,
                  title: 'Cancel this commitment?',
                  message:
                      'Mia stops expecting it. Payments already made stay in the ledger exactly as they are.',
                  confirmLabel: 'Cancel it',
                  consequences: <String>[
                    'It leaves your monthly commitment figure',
                    'It leaves the Coming Up timeline',
                    'The price history is kept',
                  ],
                );
                if (!confirmed || !context.mounted) return;
                await getIt<BillRepository>().cancelBill(bill.id);
                if (!context.mounted) return;
                showMiaToast(
                  context,
                  message: '${bill.provider} is no longer expected.',
                  icon: Icons.cancel_rounded,
                  accent: AppColors.caution,
                );
                await context.router.maybePop(true);
              },
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
                      StatusPill(
                        label: bill.status.label,
                        color: bill.status.color,
                        icon: bill.status.icon,
                      ),
                      horizontalSpace(8),
                      Expanded(
                        child: BaseText(
                          dueLabel(bill.dueDate),
                          fontSize: 12,
                          textColor: AppColors.mist,
                          textAlign: TextAlign.end,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  ValueTicker(value: bill.amount, fontSize: 40),
                  verticalSpace(8),
                  BaseText(
                    '${bill.frequency.label} · ${formatCurrency(bill.monthlyEquivalent)} a month equivalent',
                    fontSize: 12,
                    textColor: AppColors.muted,
                  ),
                  if (bill.expectedMin != null &&
                      bill.expectedMax != null) ...<Widget>[
                    verticalSpace(16),
                    BaseText(
                      'Expected range',
                      fontSize: 10,
                      textStyle: AppTypography.overline,
                    ),
                    verticalSpace(8),
                    ProportionBar(
                      value:
                          ((bill.amount - bill.expectedMin!) /
                                  (bill.expectedMax! - bill.expectedMin!))
                              .clamp(0.0, 1.0),
                      color: bill.amount > bill.expectedMax!
                          ? AppColors.negative
                          : AppColors.positive,
                      height: 8,
                    ),
                    verticalSpace(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BaseText(
                          formatCurrency(bill.expectedMin!),
                          fontSize: 10.5,
                          textColor: AppColors.faint,
                        ),
                        BaseText(
                          formatCurrency(bill.expectedMax!),
                          fontSize: 10.5,
                          textColor: AppColors.faint,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          verticalSpace(16),
          Reveal(
            index: 1,
            child: GlassPanel(
              tone: GlassTone.soft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    'Bill detail',
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                  ),
                  verticalSpace(6),
                  EvidenceRow(
                    label: 'Issue date',
                    value: bill.issueDate == null
                        ? 'Not supplied'
                        : formatFullDate(bill.issueDate!),
                  ),
                  EvidenceRow(
                    label: 'Service period',
                    value: bill.servicePeriodStart == null
                        ? 'Not supplied'
                        : '${formatDayMonth(bill.servicePeriodStart!)} – ${formatDayMonth(bill.servicePeriodEnd ?? bill.dueDate)}',
                  ),
                  EvidenceRow(
                    label: 'Payment account',
                    value: bill.paymentAccountName ?? 'Not set',
                  ),
                  EvidenceRow(
                    label: 'Autopay',
                    value: bill.isAutopay ? 'On' : 'Off',
                  ),
                  EvidenceRow(label: 'Owner', value: bill.owner),
                  EvidenceRow(
                    label: 'Visibility',
                    value: bill.visibility.label,
                  ),
                  if (bill.propertyName != null)
                    EvidenceRow(label: 'Property', value: bill.propertyName!),
                  if (bill.benefitEndDate != null)
                    EvidenceRow(
                      label: 'Benefit period ends',
                      value: formatFullDate(bill.benefitEndDate!),
                      valueColor: AppColors.caution,
                    ),
                  EvidenceRow(
                    label: 'Source',
                    value: bill.source.label,
                    icon: bill.source.icon,
                  ),
                ],
              ),
            ),
          ),
          if (bill.priceHistory.isNotEmpty) ...<Widget>[
            verticalSpace(16),
            Reveal(
              index: 2,
              child: GlassPanel(
                tone: GlassTone.soft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      'Price history',
                      fontSize: 10,
                      textStyle: AppTypography.overline,
                    ),
                    verticalSpace(12),
                    Sparkline(
                      values: <double>[
                        ...bill.priceHistory.map(
                          (PriceChange c) => c.previousAmount,
                        ),
                        bill.amount,
                      ],
                      color: AppColors.amberGlow,
                      width: 300,
                      height: 54,
                    ),
                    verticalSpace(12),
                    ...bill.priceHistory.map((PriceChange change) {
                      return EvidenceRow(
                        label: formatFullDate(change.date),
                        value:
                            '${formatCurrency(change.previousAmount)} → ${formatCurrency(change.newAmount)}',
                        valueColor: change.delta > 0
                            ? AppColors.negative
                            : AppColors.positive,
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
          verticalSpace(16),
          Reveal(
            index: 3,
            child: GlassPanel(
              tone: GlassTone.soft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    'Evidence',
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                  ),
                  verticalSpace(6),
                  if (bill.evidence.isEmpty)
                    BaseText(
                      'No document attached yet. Forward the bill email or upload the PDF to attach evidence.',
                      fontSize: 12,
                      textColor: AppColors.faint,
                      height: 1.5,
                    )
                  else
                    ...bill.evidence.map(
                      (EvidenceLink link) => EvidenceRow(
                        label: link.label,
                        value: 'Open',
                        icon: link.kind.icon,
                      ),
                    ),
                  verticalSpace(6),
                  EvidenceRow(
                    label: 'Linked payment',
                    value: bill.linkedTransactionId ?? 'Not matched yet',
                    icon: Icons.link_rounded,
                  ),
                  const EvidenceRow(
                    label: 'Double counting',
                    value: 'Bill and payment counted once',
                    valueColor: AppColors.positive,
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
