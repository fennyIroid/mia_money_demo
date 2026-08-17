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
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/admin_models.dart';
import '../bloc/bills_bloc.dart';
import '../../../data/models/core_models.dart';

@RoutePage()
class ExpectedMoneyView extends StatelessWidget {
  const ExpectedMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillsBloc>(
      create: (BuildContext context) =>
          getIt<BillsBloc>()..add(const BillsEvent.load()),
      child: const ExpectedMoneyScaffold(),
    );
  }
}

class ExpectedMoneyScaffold extends StatelessWidget {
  const ExpectedMoneyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillsBloc, BillsState>(
      builder: (BuildContext context, BillsState state) {
        final BillsBloc bloc = context.read<BillsBloc>();

        return MiaScaffold(
          title: 'Expected money',
          overline: 'Owed to you',
          mood: AuroraMood.glacier,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Track something you are owed',
              leadingIcon: Icons.add_rounded,
              onTap: () async {
                final ExpectedMoney? created = await context.router
                    .push<ExpectedMoney>(const ExpectedMoneyEditorRoute());
                if (created == null || !context.mounted) return;
                bloc.add(const BillsEvent.load());
                showMiaToast(
                  context,
                  message:
                      '${formatCurrency(created.amount)} from ${created.counterparty} is now tracked.',
                  icon: Icons.hourglass_bottom_rounded,
                );
              },
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                withScale: true,
                child: BentoHeroTile(
                  label: 'Waiting on',
                  icon: Icons.hourglass_bottom_rounded,
                  accent: AppColors.lagoon,
                  figure: ValueTicker(value: state.expectedTotal, fontSize: 42),
                  caption:
                      'Never counted as income until it actually arrives and you confirm it.',
                ),
              ),
              verticalSpace(20),
              if (!state.isReady)
                const SkeletonTileList(count: 4, tileHeight: 120)
              else if (state.expectedOpen.isEmpty)
                const MiaStateView(kind: MiaStateKind.caughtUp)
              else
                ...List<Widget>.generate(state.expectedOpen.length, (int i) {
                  final ExpectedMoney item = state.expectedOpen[i];
                  return Padding(
                    padding: EdgeInsets.only(bottom: getSize(10)),
                    child: Reveal(
                      index: i,
                      child: ExpectedMoneyCard(
                        item: item,
                        onConfirm: () {
                          bloc.add(BillsEvent.confirmExpectedMatch(item.id));
                          showMiaToast(
                            context,
                            message:
                                'Matched. The incoming amount will not be double counted as income.',
                          );
                        },
                        onChase: () {
                          bloc.add(BillsEvent.chaseExpected(item.id));
                          showMiaToast(
                            context,
                            message:
                                'Chased. ${item.counterparty} is now expected within 14 days.',
                            icon: Icons.forward_to_inbox_rounded,
                            accent: AppColors.glacier,
                          );
                        },
                        onWriteOff: () async {
                          final bool confirmed = await confirmDestructive(
                            context: context,
                            title: 'Write this off?',
                            message:
                                'The record closes. It was never counted as income, so no figure moves.',
                            confirmLabel: 'Write it off',
                            consequences: <String>[
                              'It leaves the waiting-on total',
                              'The history of the claim is kept',
                            ],
                          );
                          if (!confirmed || !context.mounted) return;
                          bloc.add(BillsEvent.expectedWrittenOff(item.id));
                          showMiaToast(
                            context,
                            message:
                                '${item.counterparty} written off. Nothing was counted as income.',
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

class ExpectedMoneyCard extends StatelessWidget {
  const ExpectedMoneyCard({
    super.key,
    required this.item,
    required this.onConfirm,
    required this.onChase,
    required this.onWriteOff,
  });

  final ExpectedMoney item;
  final VoidCallback onConfirm;
  final VoidCallback onChase;
  final VoidCallback onWriteOff;

  @override
  Widget build(BuildContext context) {
    final bool overdue = item.status == ExpectedMoneyStatus.overdue;
    final bool hasMatch = item.status == ExpectedMoneyStatus.possibleMatch;

    return GlassPanel(
      tone: GlassTone.soft,
      borderColor: hasMatch
          ? withCustomOpacity(AppColors.positive, 0.4)
          : overdue
          ? withCustomOpacity(AppColors.negative, 0.34)
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
                  color: withCustomOpacity(AppColors.lagoon, 0.14),
                  borderRadius: AppRadii.rSm,
                ),
                child: Icon(
                  item.kind.icon,
                  size: getFontSize(17),
                  color: AppColors.lagoon,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      item.counterparty,
                      fontSize: 14.5,
                      textStyle: AppTypography.titleSmall,
                    ),
                    verticalSpace(3),
                    BaseText(
                      '${item.kind.label} · expected ${formatDayMonth(item.expectedDate)}',
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                    ),
                  ],
                ),
              ),
              MoneyLabel(
                text: item.amountMax == null
                    ? formatCurrency(item.amount)
                    : '${formatCurrency(item.amount)}–${formatCurrency(item.amountMax!)}',
                isCredit: true,
                fontSize: 15,
              ),
            ],
          ),
          verticalSpace(10),
          Wrap(
            spacing: getSize(6),
            runSpacing: getSize(6),
            children: <Widget>[
              StatusPill(
                label: overdue
                    ? '${item.expectedDate.difference(DateTime.now()).inDays.abs()}d overdue'
                    : 'Waiting ${item.waitingDays}d',
                color: overdue ? AppColors.negative : AppColors.caution,
                icon: Icons.schedule_rounded,
                dense: true,
              ),
              if (hasMatch)
                StatusPill(
                  label:
                      'Possible match ${(item.possibleMatchConfidence! * 100).round()}%',
                  color: AppColors.positive,
                  icon: Icons.link_rounded,
                  dense: true,
                ),
              StatusPill(
                label: item.visibility.label,
                color: AppColors.glacier,
                icon: item.visibility.icon,
                dense: true,
              ),
            ],
          ),
          if (item.note != null) ...<Widget>[
            verticalSpace(10),
            BaseText(
              item.note!,
              fontSize: 12,
              textColor: AppColors.muted,
              height: 1.45,
            ),
          ],
          verticalSpace(12),
          if (hasMatch)
            MiaButton(
              label: 'Confirm this match',
              size: MiaButtonSize.small,
              variant: MiaButtonVariant.frost,
              onTap: onConfirm,
            )
          else
            Row(
              children: <Widget>[
                Expanded(
                  child: MiaButton(
                    label: 'Chase it',
                    size: MiaButtonSize.small,
                    variant: MiaButtonVariant.ghost,
                    onTap: onChase,
                  ),
                ),
                horizontalSpace(8),
                MiaButton(
                  label: 'Write it off',
                  size: MiaButtonSize.small,
                  variant: MiaButtonVariant.outline,
                  expanded: false,
                  onTap: onWriteOff,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
