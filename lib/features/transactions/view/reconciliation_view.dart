import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/currency_utils.dart';
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
import '../../../data/dummy/dummy_money.dart';
import '../../../data/models/money_models.dart';
import '../bloc/transactions_bloc.dart';

@RoutePage()
class ReconciliationView extends StatelessWidget {
  const ReconciliationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionsBloc>(
      create: (BuildContext context) =>
          getIt<TransactionsBloc>()..add(const TransactionsEvent.load()),
      child: const ReconciliationScaffold(),
    );
  }
}

class ReconciliationScaffold extends StatelessWidget {
  const ReconciliationScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (BuildContext context, TransactionsState state) {
        return MiaScaffold(
          title: 'Reconciliation',
          overline: 'Pairs, duplicates and double counting',
          mood: AuroraMood.glacier,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: MiaNoticeStrip(
                  message:
                      'Confirming a pair changes what counts as spending or income. Mia holds each one until you decide.',
                  icon: Icons.sync_alt_rounded,
                  accent: AppColors.glacier,
                ),
              ),
              verticalSpace(16),
              if (!state.isReady)
                const SkeletonTileList(count: 3, tileHeight: 160)
              else if (state.candidates.isEmpty)
                const MiaStateView(kind: MiaStateKind.caughtUp)
              else
                ...List<Widget>.generate(state.candidates.length, (int i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: getSize(10)),
                    child: Reveal(
                      index: i,
                      child: ReconciliationCard(
                        candidate: state.candidates[i],
                        onConfirm: () {
                          context.read<TransactionsBloc>().add(
                            TransactionsEvent.reconciliationConfirmed(
                              state.candidates[i].id,
                            ),
                          );
                          showMiaToast(
                            context,
                            message:
                                'Paired. Both sides are excluded from spending and income.',
                            icon: Icons.sync_alt_rounded,
                          );
                        },
                        onReject: () {
                          context.read<TransactionsBloc>().add(
                            TransactionsEvent.reconciliationDismissed(
                              state.candidates[i].id,
                            ),
                          );
                          showMiaToast(
                            context,
                            message:
                                'Left as two separate records. Nothing was changed.',
                            icon: Icons.close_rounded,
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

class ReconciliationCard extends StatelessWidget {
  const ReconciliationCard({
    super.key,
    required this.candidate,
    required this.onConfirm,
    required this.onReject,
  });

  final ReconciliationCandidate candidate;
  final VoidCallback onConfirm;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    final MiaTransaction primary = DummyMoney.transactionById(
      candidate.primaryTransactionId,
    );
    final MiaTransaction match = DummyMoney.transactionById(
      candidate.matchTransactionId,
    );

    return GlassPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(34),
                height: getSize(34),
                decoration: BoxDecoration(
                  color: withCustomOpacity(AppColors.glacier, 0.14),
                  borderRadius: AppRadii.rXs,
                ),
                child: Icon(
                  candidate.kind.icon,
                  size: getFontSize(16),
                  color: AppColors.glacier,
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: BaseText(
                  candidate.kind.label,
                  fontSize: 15,
                  textStyle: AppTypography.titleSmall,
                ),
              ),
              BaseText(
                '${(candidate.confidence * 100).round()}%',
                fontSize: 13,
                textStyle: AppTypography.figureMedium,
                textColor: candidate.confidence > 0.9
                    ? AppColors.positive
                    : AppColors.caution,
              ),
            ],
          ),
          verticalSpace(14),
          ReconciliationSide(transaction: primary, label: 'This'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: getSize(6)),
            child: Row(
              children: <Widget>[
                horizontalSpace(16),
                Icon(
                  Icons.link_rounded,
                  size: getFontSize(15),
                  color: AppColors.faint,
                ),
                horizontalSpace(10),
                Expanded(
                  child: Container(height: 1, color: AppColors.glassBorderSoft),
                ),
              ],
            ),
          ),
          ReconciliationSide(transaction: match, label: 'Pairs with'),
          verticalSpace(14),
          Container(
            padding: EdgeInsets.all(getSize(12)),
            decoration: BoxDecoration(
              color: AppColors.glassFillSoft,
              borderRadius: AppRadii.rSm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseText(
                  candidate.reason,
                  fontSize: 12,
                  textColor: AppColors.mist,
                  height: 1.45,
                ),
                if (candidate.calculationImpact != null) ...<Widget>[
                  verticalSpace(8),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.functions_rounded,
                        size: getFontSize(12),
                        color: AppColors.lagoon,
                      ),
                      horizontalSpace(6),
                      Expanded(
                        child: BaseText(
                          candidate.calculationImpact!,
                          fontSize: 11.5,
                          textColor: AppColors.lagoon,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          verticalSpace(12),
          Row(
            children: <Widget>[
              Expanded(
                child: MiaButton(
                  label: 'Confirm pair',
                  size: MiaButtonSize.small,
                  variant: MiaButtonVariant.frost,
                  onTap: onConfirm,
                ),
              ),
              horizontalSpace(8),
              MiaButton(
                label: 'Not a pair',
                size: MiaButtonSize.small,
                variant: MiaButtonVariant.outline,
                expanded: false,
                onTap: onReject,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReconciliationSide extends StatelessWidget {
  const ReconciliationSide({
    super.key,
    required this.transaction,
    required this.label,
  });

  final MiaTransaction transaction;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: getSize(70),
          child: BaseText(
            label,
            fontSize: 9.5,
            textStyle: AppTypography.overline,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseText(
                transaction.merchantDisplay,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                maxLines: 1,
              ),
              verticalSpace(2),
              BaseText(
                transaction.accountName,
                fontSize: 11,
                textColor: AppColors.faint,
              ),
            ],
          ),
        ),
        MoneyLabel(
          text: formatCurrency(transaction.amount),
          isCredit: transaction.isCredit,
          fontSize: 14,
        ),
      ],
    );
  }
}
