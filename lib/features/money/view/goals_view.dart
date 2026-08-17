import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/insight_models.dart';
import '../bloc/money_bloc.dart';

@RoutePage()
class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoneyBloc>(
      create: (BuildContext context) =>
          getIt<MoneyBloc>()..add(const MoneyEvent.load()),
      child: const GoalsScaffold(),
    );
  }
}

class GoalsScaffold extends StatelessWidget {
  const GoalsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (BuildContext context, MoneyState state) {
        final MoneyBloc bloc = context.read<MoneyBloc>();

        return MiaScaffold(
          title: 'Goals',
          overline: 'Savings, sinking funds and scenarios',
          mood: AuroraMood.ember,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'New goal',
              leadingIcon: Icons.add_rounded,
              onTap: () async {
                final Goal? created = await context.router.push<Goal>(
                  const GoalEditorRoute(),
                );
                if (!context.mounted || created == null) {
                  return;
                }
                bloc.add(const MoneyEvent.load());
                showMiaToast(
                  context,
                  message: '${created.name} is now tracked.',
                  icon: Icons.flag_rounded,
                );
              },
            ),
          ),
          child: !state.isReady
              ? const SkeletonTileList(count: 4, tileHeight: 150)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ...List<Widget>.generate(state.goals.length, (int i) {
                      final Goal goal = state.goals[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: getSize(10)),
                        child: Reveal(
                          index: i,
                          child: GoalCard(
                            goal: goal,
                            onContribute: () async {
                              final double? amount = await showMiaSheet<double>(
                                context: context,
                                title: 'Put money towards it',
                                overline: goal.name,
                                child: GoalContributionSheet(goal: goal),
                              );
                              if (amount == null || !context.mounted) return;
                              bloc.add(
                                MoneyEvent.goalMovementRecorded(
                                  goalId: goal.id,
                                  amount: amount,
                                  label: amount < 0
                                      ? 'Taken back by you'
                                      : 'Allocated by you',
                                ),
                              );
                              showMiaToast(
                                context,
                                message: amount < 0
                                    ? '${formatCurrency(amount.abs())} taken back off ${goal.name}.'
                                    : '${formatCurrency(amount)} allocated to ${goal.name}. Nothing was moved between accounts.',
                                icon: Icons.savings_rounded,
                              );
                            },
                            onScenario: () {
                              bloc.add(
                                MoneyEvent.scenarioRun(
                                  goal: goal,
                                  expense: 4500,
                                ),
                              );
                              showMiaSheet<void>(
                                context: context,
                                title: 'Scenario',
                                overline: 'Your live data is untouched',
                                child: ScenarioSheet(goal: goal),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                    verticalSpace(12),
                    Reveal(
                      index: 6,
                      child: MiaNoticeStrip(
                        message:
                            'Linked balances are not physically or legally set aside. Mia only tracks the amount you have allocated.',
                        icon: Icons.info_outline_rounded,
                        accent: AppColors.glacier,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
    required this.goal,
    required this.onScenario,
    required this.onContribute,
  });

  final Goal goal;
  final VoidCallback onScenario;
  final VoidCallback onContribute;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ProgressRing(
                value: goal.fraction,
                color: goal.accent,
                size: 62,
                strokeWidth: 6,
                child: BaseText(
                  '${(goal.fraction * 100).round()}%',
                  fontSize: 14,
                  textStyle: AppTypography.figureMedium,
                ),
              ),
              horizontalSpace(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      goal.name,
                      fontSize: 16,
                      textStyle: AppTypography.titleSmall,
                    ),
                    verticalSpace(4),
                    BaseText(
                      '${formatCurrency(goal.current, decimals: 0)} of ${formatCurrency(goal.target, decimals: 0)}',
                      fontSize: 12.5,
                      textColor: AppColors.mist,
                    ),
                    verticalSpace(6),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: StatusPill(
                            label: goal.status.label,
                            color: goal.status.color,
                            dense: true,
                          ),
                        ),
                        horizontalSpace(6),
                        Flexible(
                          child: StatusPill(
                            label: 'by ${formatDayMonth(goal.targetDate)}',
                            color: AppColors.muted,
                            icon: Icons.event_rounded,
                            dense: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(14),
          EvidenceRow(
            label: 'Required contribution',
            value:
                '${formatCurrency(goal.requiredMonthlyContribution)} a month',
          ),
          if (goal.linkedAccountName != null)
            EvidenceRow(
              label: 'Linked balance',
              value: goal.linkedAccountName!,
            ),
          EvidenceRow(label: 'Owner', value: goal.owner),
          verticalSpace(10),
          Row(
            children: <Widget>[
              Expanded(
                child: MiaButton(
                  label: 'Add to it',
                  size: MiaButtonSize.small,
                  variant: MiaButtonVariant.frost,
                  onTap: onContribute,
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: MiaButton(
                  label: 'Run a scenario',
                  size: MiaButtonSize.small,
                  variant: MiaButtonVariant.ghost,
                  onTap: onScenario,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ScenarioSheet extends StatelessWidget {
  const ScenarioSheet({super.key, required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (BuildContext context, MoneyState state) {
        final ScenarioResult? scenario = state.scenario;
        if (scenario == null) {
          return const MiaStateView(kind: MiaStateKind.loading, compact: true);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BaseText(
              scenario.description,
              fontSize: 16,
              textStyle: AppTypography.titleSmall,
            ),
            verticalSpace(16),
            EvidenceRow(
              label: 'Target date now',
              value: formatFullDate(scenario.beforeCompletionDate),
            ),
            EvidenceRow(
              label: 'Target date after',
              value: formatFullDate(scenario.afterCompletionDate),
              valueColor: AppColors.caution,
            ),
            EvidenceRow(
              label: 'Delay',
              value: '${scenario.monthsDelayed} months',
              valueColor: AppColors.negative,
            ),
            EvidenceRow(
              label: 'New required contribution',
              value: formatCurrency(scenario.newRequiredContribution),
            ),
            verticalSpace(14),
            BaseText(
              'Assumptions',
              fontSize: 10,
              textStyle: AppTypography.overline,
            ),
            verticalSpace(8),
            ...scenario.assumptions.map(
              (String line) => Padding(
                padding: EdgeInsets.only(bottom: getSize(6)),
                child: BaseText(
                  '· $line',
                  fontSize: 12,
                  textColor: AppColors.muted,
                  height: 1.45,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Records an amount allocated to a goal, or taken back off it. Mia never moves
/// money between accounts — this only changes the figure being tracked.
class GoalContributionSheet extends StatelessWidget {
  const GoalContributionSheet({super.key, required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    double amount = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MiaFormField(
          label: 'Amount',
          hint: '0.00',
          autofocus: true,
          fontSize: 26,
          textAlign: TextAlign.center,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d{0,9}(\.\d{0,2})?')),
          ],
          onChanged: (String value) => amount = double.tryParse(value) ?? 0,
        ),
        verticalSpace(16),
        MiaGroupedCard(
          title: 'Where it stands now',
          footnote:
              'Linked balances are not physically or legally set aside. This is a tracked figure only.',
          children: <Widget>[
            EvidenceRow(
              label: 'Put aside so far',
              value: formatCurrency(goal.current),
            ),
            EvidenceRow(label: 'Target', value: formatCurrency(goal.target)),
            EvidenceRow(
              label: 'Still to go',
              value: formatCurrency(
                (goal.target - goal.current).clamp(0, double.infinity),
              ),
            ),
          ],
        ),
        verticalSpace(16),
        MiaButton(
          label: 'Add to the goal',
          leadingIcon: Icons.savings_rounded,
          onTap: () {
            if (amount > 0) Navigator.of(context).pop(amount);
          },
        ),
        verticalSpace(6),
        Center(
          child: MiaTextAction(
            label: 'Take it back off instead',
            color: AppColors.muted,
            onTap: () {
              if (amount > 0) Navigator.of(context).pop(-amount);
            },
          ),
        ),
      ],
    );
  }
}
