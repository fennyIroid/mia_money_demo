import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/insight_models.dart';
import '../bloc/money_bloc.dart';

/// Creates a savings or sinking-fund goal. The goal is the user's own number,
/// so nothing here is pre-filled from their accounts.
@RoutePage()
class GoalEditorView extends StatelessWidget {
  const GoalEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoneyBloc>(
      create: (BuildContext context) =>
          getIt<MoneyBloc>()..add(const MoneyEvent.goalDraftStarted()),
      child: const GoalEditorScaffold(),
    );
  }
}

class GoalEditorScaffold extends StatelessWidget {
  const GoalEditorScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoneyBloc, MoneyState>(
      listenWhen: (MoneyState p, MoneyState c) =>
          p.createdGoal != c.createdGoal,
      listener: (BuildContext context, MoneyState state) {
        final Goal? created = state.createdGoal;
        if (created != null) {
          context.router.maybePop<Goal>(created);
        }
      },
      builder: (BuildContext context, MoneyState state) {
        final MoneyBloc bloc = context.read<MoneyBloc>();

        return MiaScaffold(
          title: 'New goal',
          overline: 'Nothing is set aside, only tracked',
          mood: AuroraMood.ember,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Create goal',
              leadingIcon: Icons.flag_rounded,
              isEnabled: state.canCreateGoal,
              onTap: () => bloc.add(const MoneyEvent.goalDraftSubmitted()),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: MiaFormField(
                  label: 'Goal name',
                  hint: 'Emergency fund',
                  autofocus: true,
                  prefixIcon: Icons.flag_outlined,
                  onChanged: (String value) =>
                      bloc.add(MoneyEvent.goalDraftChanged(name: value)),
                ),
              ),
              verticalSpace(18),
              Reveal(
                index: 1,
                child: GoalKindPicker(
                  selected: state.goalDraftKind,
                  onChanged: (GoalKind kind) =>
                      bloc.add(MoneyEvent.goalDraftChanged(kind: kind)),
                ),
              ),
              verticalSpace(18),
              Reveal(
                index: 2,
                child: MiaFormField(
                  label: 'Target amount',
                  hint: '5000',
                  initialValue: state.goalDraftTarget.toStringAsFixed(0),
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.savings_outlined,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (String value) => bloc.add(
                    MoneyEvent.goalDraftChanged(
                      target: double.tryParse(value) ?? 0,
                    ),
                  ),
                ),
              ),
              verticalSpace(14),
              Reveal(
                index: 3,
                child: MiaFormField(
                  label: 'Already put aside',
                  hint: '0',
                  initialValue: state.goalDraftCurrent.toStringAsFixed(0),
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.account_balance_wallet_outlined,
                  errorText: state.goalDraftCurrent > state.goalDraftTarget
                      ? 'That is more than the target'
                      : null,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (String value) => bloc.add(
                    MoneyEvent.goalDraftChanged(
                      current: double.tryParse(value) ?? 0,
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              Reveal(
                index: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      'Months to reach it',
                      fontSize: 10,
                      textStyle: AppTypography.overline,
                      textColor: AppColors.muted,
                    ),
                    verticalSpace(10),
                    MiaStepper(
                      value: state.goalDraftMonths.toDouble(),
                      min: 1,
                      max: 120,
                      formatter: (double v) => '${v.round()} months',
                      onChanged: (double value) => bloc.add(
                        MoneyEvent.goalDraftChanged(months: value.round()),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(18),
              Reveal(
                index: 5,
                child: MiaSwitchRow(
                  title: 'Share with the household',
                  icon: Icons.group_rounded,
                  description:
                      'Members see the goal and its progress, never the accounts behind it',
                  value: state.goalDraftShared,
                  onChanged: (bool value) => bloc.add(
                    MoneyEvent.goalDraftChanged(sharedWithHousehold: value),
                  ),
                ),
              ),
              verticalSpace(20),
              Reveal(
                index: 6,
                child: MiaGroupedCard(
                  title: 'What this works out to',
                  footnote:
                      'Mia only tracks what you allocate. Money is not moved or reserved anywhere.',
                  children: <Widget>[
                    EvidenceRow(
                      label: 'Target date',
                      value: formatFullDate(state.goalDraftTargetDate),
                    ),
                    EvidenceRow(
                      label: 'Required contribution',
                      value:
                          '${formatCurrency(state.goalDraftMonthlyContribution)} a month',
                    ),
                    EvidenceRow(
                      label: 'Visibility',
                      value: state.goalDraftShared ? 'Household' : 'Private',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Kind decides the glyph and the language Mia uses about the goal later.
class GoalKindPicker extends StatelessWidget {
  const GoalKindPicker({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final GoalKind selected;
  final ValueChanged<GoalKind> onChanged;

  @override
  Widget build(BuildContext context) {
    const List<GoalKind> kinds = GoalKind.values;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          'Kind',
          fontSize: 10,
          textStyle: AppTypography.overline,
          textColor: AppColors.muted,
        ),
        verticalSpace(10),
        MiaChipRow(
          padding: EdgeInsets.zero,
          labels: kinds.map((GoalKind k) => k.label).toList(),
          selectedIndex: kinds.indexOf(selected),
          onChanged: (int index) => onChanged(kinds[index]),
        ),
      ],
    );
  }
}
