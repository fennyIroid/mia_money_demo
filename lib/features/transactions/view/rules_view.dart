import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../data/models/money_models.dart';
import '../bloc/transactions_bloc.dart';
import '../widgets/rule_builder_sheet.dart';

@RoutePage()
class RulesView extends StatelessWidget {
  const RulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionsBloc>(
      create: (BuildContext context) =>
          getIt<TransactionsBloc>()..add(const TransactionsEvent.load()),
      child: const RulesScaffold(),
    );
  }
}

class RulesScaffold extends StatelessWidget {
  const RulesScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (BuildContext context, TransactionsState state) {
        final TransactionsBloc bloc = context.read<TransactionsBloc>();

        return MiaScaffold(
          title: 'Rules centre',
          overline: 'Corrections, reused transparently',
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'New rule',
              leadingIcon: Icons.add_rounded,
              onTap: () async {
                final MiaRule? rule = await showMiaSheet<MiaRule>(
                  context: context,
                  title: 'New rule',
                  overline: 'Nothing is created without your approval',
                  expand: true,
                  child: const RuleBuilderSheet(),
                );
                if (rule == null || !context.mounted) return;

                bloc.add(TransactionsEvent.ruleCreated(rule));
                showMiaToast(
                  context,
                  message:
                      '${rule.name} added. It applies from now on, not backwards.',
                  icon: Icons.rule_rounded,
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
                      'Rules are visible, editable, pausable and reversible. Reprocessing never erases what already happened.',
                  icon: Icons.rule_rounded,
                  accent: AppColors.lagoon,
                ),
              ),
              verticalSpace(16),
              if (!state.isReady)
                const SkeletonTileList(count: 4, tileHeight: 120)
              else if (state.rules.isEmpty)
                const MiaStateView(
                  kind: MiaStateKind.empty,
                  title: 'No rules yet',
                  message:
                      'When you correct something, Mia will offer to turn it into a rule.',
                )
              else
                ...List<Widget>.generate(state.rules.length, (int i) {
                  final MiaRule rule = state.rules[i];
                  return Padding(
                    padding: EdgeInsets.only(bottom: getSize(10)),
                    child: Reveal(
                      index: i,
                      child: RuleCard(
                        rule: rule,
                        onTogglePaused: () => bloc.add(
                          TransactionsEvent.ruleTogglePaused(
                            ruleId: rule.id,
                            paused: !rule.isPaused,
                          ),
                        ),
                        onDelete: () async {
                          final bool confirmed = await confirmDestructive(
                            context: context,
                            title: 'Delete this rule?',
                            message:
                                'It stops applying from now on. Everything it already did to your records stays as it is.',
                            confirmLabel: 'Delete rule',
                            consequences: <String>[
                              'Past corrections it made are kept',
                              'Nothing is reprocessed',
                            ],
                          );
                          if (!confirmed || !context.mounted) return;
                          bloc.add(TransactionsEvent.ruleDeleted(rule.id));
                          showMiaToast(
                            context,
                            message:
                                '${rule.name} deleted. What it already did is untouched.',
                            icon: Icons.rule_rounded,
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

class RuleCard extends StatelessWidget {
  const RuleCard({
    super.key,
    required this.rule,
    required this.onTogglePaused,
    required this.onDelete,
  });

  final MiaRule rule;
  final VoidCallback onTogglePaused;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: rule.isPaused ? GlassTone.soft : GlassTone.standard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(30),
                height: getSize(30),
                decoration: BoxDecoration(
                  color: withCustomOpacity(
                    rule.isPaused ? AppColors.muted : AppColors.ember,
                    0.14,
                  ),
                  borderRadius: AppRadii.rXs,
                ),
                alignment: Alignment.center,
                child: BaseText(
                  '${rule.priority}',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  textColor: rule.isPaused ? AppColors.muted : AppColors.ember,
                  textAlign: TextAlign.center,
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: BaseText(
                  rule.name,
                  fontSize: 14.5,
                  textStyle: AppTypography.titleSmall,
                  maxLines: 2,
                ),
              ),
              StatusPill(
                label: rule.isPaused ? 'Paused' : 'Active',
                color: rule.isPaused ? AppColors.muted : AppColors.positive,
                dense: true,
              ),
            ],
          ),
          verticalSpace(12),
          ...rule.criteria.map((RuleCriterion c) {
            return Padding(
              padding: EdgeInsets.only(bottom: getSize(5)),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.filter_alt_rounded,
                    size: getFontSize(12),
                    color: AppColors.glacier,
                  ),
                  horizontalSpace(8),
                  Expanded(
                    child: BaseText(
                      c.display,
                      fontSize: 12,
                      textColor: AppColors.mist,
                    ),
                  ),
                ],
              ),
            );
          }),
          verticalSpace(6),
          ...rule.actions.map((RuleAction a) {
            return Padding(
              padding: EdgeInsets.only(bottom: getSize(5)),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.bolt_rounded,
                    size: getFontSize(12),
                    color: AppColors.amberGlow,
                  ),
                  horizontalSpace(8),
                  Expanded(
                    child: BaseText(
                      a.display,
                      fontSize: 12,
                      textColor: AppColors.mist,
                    ),
                  ),
                ],
              ),
            );
          }),
          verticalSpace(12),
          Row(
            children: <Widget>[
              Flexible(
                child: BaseText(
                  '${rule.matchCount} matches',
                  fontSize: 11,
                  textColor: AppColors.faint,
                  maxLines: 1,
                ),
              ),
              horizontalSpace(10),
              if (rule.lastAppliedOn != null)
                Flexible(
                  child: BaseText(
                    'last applied ${relativeLabel(rule.lastAppliedOn!)}',
                    fontSize: 11,
                    textColor: AppColors.faint,
                    maxLines: 1,
                  ),
                ),
              const Spacer(),
              MiaTextAction(
                label: rule.isPaused ? 'Resume' : 'Pause',
                onTap: onTogglePaused,
                fontSize: 12.5,
                color: AppColors.glacier,
              ),
              horizontalSpace(4),
              MiaTextAction(
                label: 'Delete',
                onTap: onDelete,
                fontSize: 12.5,
                color: AppColors.muted,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
