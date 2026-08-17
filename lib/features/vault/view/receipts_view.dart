import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/admin_models.dart';
import '../bloc/vault_bloc.dart';

@RoutePage()
class ReceiptsView extends StatelessWidget {
  const ReceiptsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VaultBloc>(
      create: (BuildContext context) =>
          getIt<VaultBloc>()..add(const VaultEvent.load()),
      child: const ReceiptsScaffold(),
    );
  }
}

class ReceiptsScaffold extends StatelessWidget {
  const ReceiptsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VaultBloc, VaultState>(
      builder: (BuildContext context, VaultState state) {
        final VaultBloc bloc = context.read<VaultBloc>();

        return MiaScaffold(
          title: 'Receipts',
          overline: 'Receipt-level evidence',
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Add a receipt',
              leadingIcon: Icons.receipt_rounded,
              onTap: () async {
                final Receipt? created = await context.router.push<Receipt>(
                  const ReceiptEditorRoute(),
                );
                if (created == null || !context.mounted) return;
                bloc.add(const VaultEvent.load());
                showMiaToast(
                  context,
                  message:
                      '${created.merchant} receipt saved for ${formatCurrency(created.total)}.',
                  icon: Icons.receipt_rounded,
                );
              },
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: MiaNoticeStrip(
                  message:
                      'Phase 1 reads merchant, date, subtotal, GST and total — not individual products.',
                  icon: Icons.info_outline_rounded,
                  accent: AppColors.glacier,
                ),
              ),
              verticalSpace(16),
              if (!state.isReady)
                const SkeletonTileList(count: 4, tileHeight: 130)
              else if (state.receipts.isEmpty)
                const MiaStateView(kind: MiaStateKind.empty)
              else
                ...List<Widget>.generate(state.receipts.length, (int i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: getSize(10)),
                    child: Reveal(
                      index: i.clamp(0, 8),
                      child: ReceiptCard(
                        receipt: state.receipts[i],
                        onAcceptMatch: () {
                          final Receipt receipt = state.receipts[i];
                          bloc.add(
                            VaultEvent.receiptMatchAccepted(
                              receiptId: receipt.id,
                              transactionId: receipt.matchedTransactionId!,
                            ),
                          );
                          showMiaToast(
                            context,
                            message:
                                'Attached. The transaction now carries this receipt as evidence.',
                          );
                        },
                        onRejectMatch: () {
                          bloc.add(
                            VaultEvent.receiptMatchRejected(
                              state.receipts[i].id,
                            ),
                          );
                          showMiaToast(
                            context,
                            message:
                                'Left unattached. The receipt is kept on its own.',
                            icon: Icons.link_off_rounded,
                            accent: AppColors.caution,
                          );
                        },
                      ),
                    ),
                  );
                }),
            ],
          ),
        );
      },
    );
  }
}

class ReceiptCard extends StatelessWidget {
  const ReceiptCard({
    super.key,
    required this.receipt,
    required this.onAcceptMatch,
    required this.onRejectMatch,
  });

  final Receipt receipt;
  final VoidCallback onAcceptMatch;
  final VoidCallback onRejectMatch;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      borderColor: receipt.hasMismatch
          ? withCustomOpacity(AppColors.caution, 0.4)
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
                  color: withCustomOpacity(AppColors.amberGlow, 0.14),
                  borderRadius: AppRadii.rSm,
                ),
                child: Icon(
                  Icons.receipt_rounded,
                  size: getFontSize(17),
                  color: AppColors.amberGlow,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      receipt.merchant,
                      fontSize: 14.5,
                      textStyle: AppTypography.titleSmall,
                    ),
                    verticalSpace(3),
                    BaseText(
                      formatFullDate(receipt.purchaseDate),
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                    ),
                  ],
                ),
              ),
              MoneyLabel(text: formatCurrency(receipt.total), fontSize: 15),
            ],
          ),
          verticalSpace(12),
          if (receipt.subtotal != null || receipt.gst != null)
            Column(
              children: <Widget>[
                if (receipt.subtotal != null)
                  EvidenceRow(
                    label: 'Subtotal',
                    value: formatCurrency(receipt.subtotal!),
                  ),
                if (receipt.gst != null)
                  EvidenceRow(
                    label: 'GST',
                    value: formatCurrency(receipt.gst!),
                  ),
                if (receipt.receiptNumber != null)
                  EvidenceRow(
                    label: 'Receipt number',
                    value: receipt.receiptNumber!,
                    monospaceValue: true,
                  ),
              ],
            ),
          verticalSpace(8),
          Wrap(
            spacing: getSize(6),
            runSpacing: getSize(6),
            children: <Widget>[
              StatusPill(
                label: receipt.state.label,
                color: receipt.state.color,
                dense: true,
              ),
              if (receipt.matchedTransactionId != null)
                StatusPill(
                  label: 'Matched ${(receipt.matchConfidence! * 100).round()}%',
                  color: AppColors.positive,
                  icon: Icons.link_rounded,
                  dense: true,
                ),
              if (receipt.hasMismatch)
                StatusPill(
                  label:
                      'Off by ${formatCurrency((receipt.total - receipt.matchedAmount!).abs())}',
                  color: AppColors.caution,
                  icon: Icons.priority_high_rounded,
                  dense: true,
                ),
              if (receipt.isDuplicate)
                const StatusPill(
                  label: 'Duplicate',
                  color: AppColors.violetHaze,
                  icon: Icons.copy_all_rounded,
                  dense: true,
                ),
            ],
          ),
          if (receipt.matchedTransactionId != null &&
              !receipt.hasMismatch) ...<Widget>[
            verticalSpace(12),
            Row(
              children: <Widget>[
                Expanded(
                  child: MiaButton(
                    label: 'Accept match',
                    size: MiaButtonSize.small,
                    variant: MiaButtonVariant.frost,
                    onTap: onAcceptMatch,
                  ),
                ),
                horizontalSpace(8),
                MiaButton(
                  label: 'Not this',
                  size: MiaButtonSize.small,
                  variant: MiaButtonVariant.outline,
                  expanded: false,
                  onTap: onRejectMatch,
                ),
              ],
            ),
          ],
          if (receipt.hasMismatch) ...<Widget>[
            verticalSpace(12),
            MiaNoticeStrip(
              message:
                  'The receipt total and the card transaction disagree. Correct whichever is wrong before it flows into your figures.',
              icon: Icons.rule_rounded,
              accent: AppColors.caution,
              actionLabel: 'Accept',
              // Believing the bank over the receipt is a decision, so it is
              // recorded as one: the pair is confirmed as it stands.
              onAction: onAcceptMatch,
            ),
          ],
        ],
      ),
    );
  }
}
