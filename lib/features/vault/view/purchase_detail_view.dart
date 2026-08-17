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
import '../../../data/models/admin_models.dart';
import '../../../data/models/core_models.dart';
import '../../../data/repositories/admin_repository.dart';

@RoutePage()
class PurchaseDetailView extends StatelessWidget {
  const PurchaseDetailView({super.key, required this.purchase});

  final PurchaseRecord purchase;

  double get _warrantyFraction {
    if (purchase.warrantyEnd == null || purchase.warrantyMonths == null) {
      return 0;
    }
    final int total = purchase.warrantyMonths! * 30;
    final int used = DateTime.now().difference(purchase.purchaseDate).inDays;
    return (1 - (used / total)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return MiaScaffold(
      title: purchase.itemName,
      overline: purchase.itemType ?? 'Purchase',
      mood: AuroraMood.calm,
      bottomBar: MiaBottomBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: MiaButton(
                label: purchase.remindersEnabled
                    ? 'Turn reminders off'
                    : 'Turn reminders on',
                variant: MiaButtonVariant.frost,
                onTap: () async {
                  final bool next = !purchase.remindersEnabled;
                  await getIt<VaultRepository>().setReminders(
                    purchase.id,
                    next,
                  );
                  if (!context.mounted) return;
                  showMiaToast(
                    context,
                    message: next
                        ? 'Mia will remind you 60 days before the written warranty ends.'
                        : 'Reminders off. The warranty dates are still kept.',
                    icon: next
                        ? Icons.notifications_active_rounded
                        : Icons.notifications_off_rounded,
                    accent: next ? AppColors.positive : AppColors.caution,
                  );
                  await context.router.maybePop(true);
                },
              ),
            ),
            horizontalSpace(10),
            MiaButton(
              label: 'Note an issue',
              variant: MiaButtonVariant.outline,
              expanded: false,
              onTap: () async {
                // A fault recorded against the item is what a claim is built
                // from later, so it is written to the record itself.
                await getIt<VaultRepository>().noteIssue(
                  purchase.id,
                  'Issue noted by you on ${formatFullDate(DateTime.now())}.',
                );
                if (!context.mounted) return;
                showMiaToast(
                  context,
                  message:
                      'Issue noted against ${purchase.itemName} with today\'s date.',
                  icon: Icons.report_problem_rounded,
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
                      ProgressRing(
                        value: _warrantyFraction,
                        color: purchase.status.color,
                        size: 76,
                        strokeWidth: 7,
                        child: BaseText(
                          purchase.daysRemaining == null ||
                                  purchase.daysRemaining! < 0
                              ? '0'
                              : '${purchase.daysRemaining}',
                          fontSize: 18,
                          textStyle: AppTypography.figureMedium,
                        ),
                      ),
                      horizontalSpace(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            StatusPill(
                              label: purchase.status.label,
                              color: purchase.status.color,
                              icon: Icons.shield_rounded,
                            ),
                            verticalSpace(10),
                            BaseText(
                              purchase.warrantyEnd == null
                                  ? 'No warranty end recorded'
                                  : 'Written warranty ends ${formatFullDate(purchase.warrantyEnd!)}',
                              fontSize: 13,
                              textColor: AppColors.mist,
                              height: 1.45,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  BaseText(
                    'Mia states that the written warranty has ended. It does not decide entitlement under Australian Consumer Law.',
                    fontSize: 11.5,
                    textColor: AppColors.faint,
                    height: 1.5,
                  ),
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
                    'Item detail',
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                  ),
                  verticalSpace(6),
                  EvidenceRow(label: 'Retailer', value: purchase.retailer),
                  if (purchase.brand != null)
                    EvidenceRow(label: 'Brand', value: purchase.brand!),
                  if (purchase.model != null)
                    EvidenceRow(label: 'Model', value: purchase.model!),
                  if (purchase.serialNumber != null)
                    EvidenceRow(
                      label: 'Serial number',
                      value: purchase.serialNumber!,
                      monospaceValue: true,
                    ),
                  EvidenceRow(
                    label: 'Purchase date',
                    value: formatFullDate(purchase.purchaseDate),
                  ),
                  if (purchase.amount != null)
                    EvidenceRow(
                      label: 'Amount',
                      value: formatCurrency(purchase.amount!),
                    ),
                  if (purchase.warrantyMonths != null)
                    EvidenceRow(
                      label: 'Written warranty',
                      value: '${purchase.warrantyMonths} months',
                    ),
                  if (purchase.extendedWarrantyEnd != null)
                    EvidenceRow(
                      label: 'Extended warranty ends',
                      value: formatFullDate(purchase.extendedWarrantyEnd!),
                    ),
                  if (purchase.location != null)
                    EvidenceRow(label: 'Location', value: purchase.location!),
                  EvidenceRow(label: 'Owner', value: purchase.owner),
                  EvidenceRow(
                    label: 'Visibility',
                    value: purchase.visibility.label,
                    icon: purchase.visibility.icon,
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(16),
          Reveal(
            index: 2,
            child: GlassPanel(
              tone: GlassTone.soft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    'Reminders',
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                  ),
                  verticalSpace(6),
                  const EvidenceRow(
                    label: '12 months remaining',
                    value: 'Scheduled',
                  ),
                  const EvidenceRow(
                    label: '6 months remaining',
                    value: 'Scheduled',
                  ),
                  const EvidenceRow(
                    label: 'Written warranty ended',
                    value: 'Scheduled',
                  ),
                  verticalSpace(6),
                  BaseText(
                    'Only reminders still in the future are scheduled.',
                    fontSize: 11,
                    textColor: AppColors.faint,
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(16),
          Reveal(
            index: 3,
            child: GlassPanel(
              tone: GlassTone.soft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    'Supporting evidence',
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                  ),
                  verticalSpace(6),
                  EvidenceRow(
                    label: 'Receipt',
                    value: purchase.receiptId ?? 'Not attached',
                    icon: Icons.receipt_rounded,
                  ),
                  EvidenceRow(
                    label: 'Documents',
                    value: '${purchase.documentIds.length} attached',
                    icon: Icons.description_rounded,
                  ),
                  if (purchase.note != null)
                    EvidenceRow(label: 'Note', value: purchase.note!),
                  const EvidenceRow(
                    label: 'Claims',
                    value: 'Mia does not submit or manage claims',
                    valueColor: AppColors.caution,
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
