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
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/insight_models.dart';
import '../bloc/money_bloc.dart';
import '../widgets/calculation_meta_panel.dart';

@RoutePage()
class BudgetsView extends StatelessWidget {
  const BudgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoneyBloc>(
      create: (BuildContext context) =>
          getIt<MoneyBloc>()..add(const MoneyEvent.load()),
      child: const BudgetsScaffold(),
    );
  }
}

class BudgetsScaffold extends StatelessWidget {
  const BudgetsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (BuildContext context, MoneyState state) {
        final MoneyBloc bloc = context.read<MoneyBloc>();
        final BudgetPeriod? budget = state.budget;

        return MiaScaffold(
          title: 'Budgets',
          overline: budget?.label ?? 'This period',
          mood: AuroraMood.balanced,
          actions: <Widget>[
            GlassIconButtonPlaceholder(
              onTap: () => showMiaSheet<void>(
                context: context,
                title: 'How much structure?',
                overline: 'Budgeting is optional in Mia',
                child: Column(
                  children: BudgetMode.values.map((BudgetMode mode) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: getSize(10)),
                      child: MiaChoiceCard(
                        title: mode.label,
                        description: mode.description,
                        icon: mode.icon,
                        selected: state.budgetMode == mode,
                        onTap: () {
                          bloc.add(MoneyEvent.budgetModeChanged(mode));
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
          child: budget == null
              ? const SkeletonTileList(count: 5, tileHeight: 90)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Reveal(
                      withScale: true,
                      child: BentoHeroTile(
                        label: '${state.budgetMode.label} · ${budget.label}',
                        icon: Icons.pie_chart_rounded,
                        accent: AppColors.violetHaze,
                        figure: ValueTicker(
                          value: budget.totalPlanned - budget.totalActual,
                          fontSize: 40,
                        ),
                        caption: 'left across every allocation',
                        footer: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ProportionBar(
                              value: budget.totalPlanned == 0
                                  ? 0
                                  : budget.totalActual / budget.totalPlanned,
                              markerValue: budget.elapsedFraction,
                              color: budget.totalActual > budget.totalPlanned
                                  ? AppColors.negative
                                  : AppColors.positive,
                              height: 10,
                            ),
                            verticalSpace(10),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: StatusPill(
                                    label:
                                        budget.totalActual /
                                                (budget.totalPlanned == 0
                                                    ? 1
                                                    : budget.totalPlanned) >
                                            budget.elapsedFraction
                                        ? 'Behind pace'
                                        : 'On pace',
                                    color:
                                        budget.totalActual /
                                                (budget.totalPlanned == 0
                                                    ? 1
                                                    : budget.totalPlanned) >
                                            budget.elapsedFraction
                                        ? AppColors.caution
                                        : AppColors.positive,
                                    icon: Icons.speed_rounded,
                                    dense: true,
                                  ),
                                ),
                                horizontalSpace(8),
                                Flexible(
                                  child: BaseText(
                                    '${formatCurrency(budget.totalActual)} of ${formatCurrency(budget.totalPlanned)}',
                                    fontSize: 11.5,
                                    textColor: AppColors.muted,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(18),
                    ...List<Widget>.generate(budget.allocations.length, (
                      int i,
                    ) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: getSize(8)),
                        child: Reveal(
                          index: i.clamp(0, 8),
                          child: BudgetAllocationCard(
                            allocation: budget.allocations[i],
                            paceMarker: budget.elapsedFraction,
                          ),
                        ),
                      );
                    }),
                    verticalSpace(12),
                    Reveal(
                      index: 9,
                      child: MiaNoticeStrip(
                        message:
                            'Subcategory limits can never exceed their parent without Mia warning you. Rollovers and rebalances are previewed before they apply.',
                        icon: Icons.account_tree_rounded,
                        accent: AppColors.violetHaze,
                      ),
                    ),
                    verticalSpace(16),
                    Reveal(
                      index: 10,
                      child: CalculationMetaPanel(meta: budget.meta),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

/// Small wrapper so the scaffold action stays a single-purpose widget.
class GlassIconButtonPlaceholder extends StatelessWidget {
  const GlassIconButtonPlaceholder({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.tune_rounded,
        size: getFontSize(20),
        color: AppColors.frost,
      ),
    );
  }
}

class BudgetAllocationCard extends StatelessWidget {
  const BudgetAllocationCard({
    super.key,
    required this.allocation,
    required this.paceMarker,
  });

  final BudgetAllocation allocation;
  final double paceMarker;

  @override
  Widget build(BuildContext context) {
    final bool over = allocation.remaining < 0;

    return GlassPanel(
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(34),
                height: getSize(34),
                decoration: BoxDecoration(
                  color: withCustomOpacity(allocation.color, 0.16),
                  borderRadius: AppRadii.rXs,
                ),
                child: Icon(
                  allocation.icon,
                  size: getFontSize(15),
                  color: allocation.color,
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      allocation.categoryName,
                      fontSize: 14,
                      textStyle: AppTypography.titleSmall,
                    ),
                    if (allocation.isSinkingFund) ...<Widget>[
                      verticalSpace(3),
                      BaseText(
                        'Sinking fund',
                        fontSize: 10.5,
                        textColor: AppColors.violetHaze,
                      ),
                    ],
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  BaseText(
                    formatCurrency(allocation.remaining.abs()),
                    fontSize: 15,
                    textStyle: AppTypography.figureMedium,
                    textColor: over ? AppColors.negative : AppColors.frost,
                  ),
                  BaseText(
                    over ? 'over' : 'left',
                    fontSize: 10,
                    textColor: AppColors.faint,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(12),
          ProportionBar(
            value: allocation.usedFraction,
            markerValue: paceMarker,
            color: over ? AppColors.negative : allocation.color,
            height: 7,
          ),
          verticalSpace(8),
          Row(
            children: <Widget>[
              Flexible(
                child: BaseText(
                  '${formatCurrency(allocation.actual)} of ${formatCurrency(allocation.planned)}',
                  fontSize: 11,
                  textColor: AppColors.muted,
                  maxLines: 1,
                ),
              ),
              const Spacer(),
              if (allocation.rolloverIn > 0)
                Flexible(
                  child: BaseText(
                    '+${formatCurrency(allocation.rolloverIn)} rolled over',
                    fontSize: 11,
                    textColor: AppColors.lagoon,
                    maxLines: 1,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
