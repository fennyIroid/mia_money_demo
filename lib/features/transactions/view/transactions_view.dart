import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/money_models.dart';
import '../bloc/transactions_bloc.dart';
import '../widgets/bulk_edit_actions.dart';
import '../widgets/transaction_row.dart';

@RoutePage()
class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionsBloc>(
      create: (BuildContext context) =>
          getIt<TransactionsBloc>()..add(const TransactionsEvent.load()),
      child: const TransactionsScaffold(),
    );
  }
}

class TransactionsScaffold extends StatelessWidget {
  const TransactionsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (BuildContext context, TransactionsState state) {
        final TransactionsBloc bloc = context.read<TransactionsBloc>();
        final List<MiaTransaction> items = state.visible;

        return Scaffold(
          backgroundColor: AppColors.ink,
          extendBody: true,
          body: AuroraBackground(
            mood: AuroraMood.calm,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(20)),
                    child: Column(
                      children: <Widget>[
                        verticalSpace(6),
                        Row(
                          children: <Widget>[
                            GlassIconButton(
                              icon: Icons.arrow_back_ios_new_rounded,
                              iconSize: 14,
                              diameter: 38,
                              onTap: () => context.router.maybePop(),
                            ),
                            horizontalSpace(12),
                            Expanded(
                              child: BaseText(
                                'Transactions',
                                fontSize: 22,
                                textStyle: AppTypography.titleMedium,
                              ),
                            ),
                            GlassIconButton(
                              icon: Icons.rule_rounded,
                              diameter: 38,
                              iconSize: 16,
                              semanticLabel: 'Rules centre',
                              onTap: () =>
                                  context.router.push(const RulesRoute()),
                            ),
                            horizontalSpace(8),
                            GlassIconButton(
                              icon: Icons.sync_alt_rounded,
                              diameter: 38,
                              iconSize: 16,
                              semanticLabel: 'Reconciliation',
                              onTap: () async {
                                await context.router.push(
                                  const ReconciliationRoute(),
                                );
                                bloc.add(
                                  const TransactionsEvent.load(isRefresh: true),
                                );
                              },
                            ),
                            horizontalSpace(8),
                            GlassIconButton(
                              icon: Icons.add_rounded,
                              diameter: 38,
                              iconSize: 18,
                              semanticLabel: 'Log a transaction',
                              onTap: () async {
                                final MiaTransaction? created = await context
                                    .router
                                    .push<MiaTransaction>(
                                      const LogTransactionRoute(),
                                    );
                                if (created == null || !context.mounted) {
                                  return;
                                }
                                bloc.add(
                                  const TransactionsEvent.load(isRefresh: true),
                                );
                                showMiaToast(
                                  context,
                                  message:
                                      '${created.description} logged against ${created.accountName}.',
                                  icon: Icons.edit_note_rounded,
                                );
                              },
                            ),
                          ],
                        ),
                        verticalSpace(14),
                        MiaSearchField(
                          initialValue: state.query,
                          hint: 'Merchant, amount, note',
                          onChanged: (String value) =>
                              bloc.add(TransactionsEvent.searchChanged(value)),
                        ),
                        verticalSpace(12),
                      ],
                    ),
                  ),
                  MiaChipRow(
                    labels: TransactionFilter.values
                        .map((TransactionFilter f) => f.label)
                        .toList(),
                    selectedIndex: TransactionFilter.values.indexOf(
                      state.filter,
                    ),
                    onChanged: (int i) => bloc.add(
                      TransactionsEvent.filterChanged(
                        TransactionFilter.values[i],
                      ),
                    ),
                  ),
                  verticalSpace(14),
                  Expanded(
                    child: !state.isReady
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(20),
                            ),
                            child: const SkeletonTileList(count: 6),
                          )
                        : items.isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getSize(20),
                            ),
                            child: const MiaStateView(
                              kind: MiaStateKind.empty,
                              title: 'Nothing matches',
                              message:
                                  'Try a different filter, or clear the search.',
                            ),
                          )
                        : SmartRefresher(
                            controller: state.refreshController,
                            enablePullDown: true,
                            enablePullUp: true,
                            header: const ClassicHeader(
                              textStyle: TextStyle(color: AppColors.muted),
                              completeText: 'Up to date',
                              refreshingText: 'Recalculating',
                              idleText: 'Pull to refresh',
                              releaseText: 'Release',
                            ),
                            footer: const ClassicFooter(
                              textStyle: TextStyle(color: AppColors.muted),
                              noDataText: 'That is the whole window',
                              idleText: 'Load more',
                              loadingText: 'Loading',
                            ),
                            onRefresh: () => bloc.add(
                              const TransactionsEvent.load(isRefresh: true),
                            ),
                            onLoading: () =>
                                bloc.add(const TransactionsEvent.load()),
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.only(
                                left: getSize(20),
                                right: getSize(20),
                                bottom: getSize(180),
                              ),
                              itemCount: items.length,
                              separatorBuilder: (BuildContext context, int i) =>
                                  verticalSpace(8),
                              itemBuilder: (BuildContext context, int i) {
                                final MiaTransaction t = items[i];
                                return Reveal(
                                  index: i.clamp(0, 8),
                                  child: TransactionRow(
                                    transaction: t,
                                    category: state.categoryFor(t),
                                    isSelected: state.selectedIds.contains(
                                      t.id,
                                    ),
                                    onLongPress: () => bloc.add(
                                      TransactionsEvent.selectionToggled(t.id),
                                    ),
                                    onTap: () async {
                                      await context.router.push(
                                        TransactionDetailRoute(transaction: t),
                                      );
                                      bloc.add(
                                        const TransactionsEvent.load(
                                          isRefresh: true,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: state.selectedIds.isEmpty
              ? null
              : MiaBottomBar(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GlassPanel(
                          tone: GlassTone.soft,
                          padding: EdgeInsets.symmetric(
                            horizontal: getSize(14),
                            vertical: getSize(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              BaseText(
                                'Selected total',
                                fontSize: 10,
                                textStyle: AppTypography.overline,
                              ),
                              verticalSpace(4),
                              BaseText(
                                formatCurrency(state.selectedTotal),
                                fontSize: 18,
                                textStyle: AppTypography.figureMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      horizontalSpace(10),
                      MiaButton(
                        label: 'Bulk edit',
                        size: MiaButtonSize.medium,
                        expanded: false,
                        onTap: () async {
                          final BulkEditChoice? choice = await chooseBulkEdit(
                            context,
                            count: state.selectedIds.length,
                            categories: state.categories,
                          );
                          if (choice == null || !context.mounted) return;
                          bloc.add(
                            TransactionsEvent.bulkCorrectionApplied(
                              categoryId: choice.categoryId,
                              treatment: choice.treatment,
                            ),
                          );
                          showMiaToast(
                            context,
                            message: choice.description,
                            icon: Icons.done_all_rounded,
                          );
                        },
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
