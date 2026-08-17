import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_pickers.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../data/models/money_models.dart';

/// Builds a rule from one condition and one action. Anything Mia would apply
/// automatically has to be written down here first, in the user's own words.
class RuleBuilderSheet extends StatelessWidget {
  const RuleBuilderSheet({super.key});

  static const List<RuleCriterionField> fields = <RuleCriterionField>[
    RuleCriterionField.normalisedMerchant,
    RuleCriterionField.keyword,
    RuleCriterionField.amount,
    RuleCriterionField.account,
    RuleCriterionField.transactionType,
  ];

  static const List<RuleActionKind> actions = <RuleActionKind>[
    RuleActionKind.categorise,
    RuleActionKind.renameMerchant,
    RuleActionKind.addTags,
    RuleActionKind.markTransfer,
    RuleActionKind.exclude,
    RuleActionKind.flagForAttention,
  ];

  /// Actions that stand on their own and need no value typed after them.
  static const Set<RuleActionKind> valuelessActions = <RuleActionKind>{
    RuleActionKind.markTransfer,
    RuleActionKind.exclude,
    RuleActionKind.flagForAttention,
  };

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<RuleCriterionField> field =
        ValueNotifier<RuleCriterionField>(fields.first);
    final ValueNotifier<RuleActionKind> action = ValueNotifier<RuleActionKind>(
      actions.first,
    );
    String criterionValue = '';
    String actionValue = '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        BaseText(
          'When',
          fontSize: 10,
          textStyle: AppTypography.overline,
          textColor: AppColors.muted,
        ),
        verticalSpace(10),
        ValueListenableBuilder<RuleCriterionField>(
          valueListenable: field,
          builder: (BuildContext context, RuleCriterionField selected, _) {
            return MiaPickerField(
              label: 'Match on',
              value: selected.label,
              icon: Icons.filter_alt_outlined,
              accent: AppColors.glacier,
              onTap: () => showMiaSheet<void>(
                context: context,
                title: 'Match on',
                child: OptionPickerSheet<RuleCriterionField>(
                  options: fields,
                  selected: selected,
                  accent: AppColors.glacier,
                  labelOf: (RuleCriterionField f) => f.label,
                  onSelected: (RuleCriterionField f) => field.value = f,
                ),
              ),
            );
          },
        ),
        verticalSpace(14),
        MiaFormField(
          label: 'Is',
          hint: 'Woolworths',
          onChanged: (String value) => criterionValue = value,
        ),
        verticalSpace(20),
        BaseText(
          'Then',
          fontSize: 10,
          textStyle: AppTypography.overline,
          textColor: AppColors.muted,
        ),
        verticalSpace(10),
        ValueListenableBuilder<RuleActionKind>(
          valueListenable: action,
          builder: (BuildContext context, RuleActionKind selected, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MiaPickerField(
                  label: 'Do this',
                  value: selected.label,
                  icon: Icons.bolt_outlined,
                  onTap: () => showMiaSheet<void>(
                    context: context,
                    title: 'Do this',
                    child: OptionPickerSheet<RuleActionKind>(
                      options: actions,
                      selected: selected,
                      labelOf: (RuleActionKind a) => a.label,
                      onSelected: (RuleActionKind a) => action.value = a,
                    ),
                  ),
                ),
                if (!valuelessActions.contains(selected)) ...<Widget>[
                  verticalSpace(14),
                  MiaFormField(
                    label: 'With',
                    hint: selected == RuleActionKind.categorise
                        ? 'Groceries'
                        : 'Value',
                    onChanged: (String value) => actionValue = value,
                  ),
                ],
                verticalSpace(20),
                MiaButton(
                  label: 'Create the rule',
                  leadingIcon: Icons.rule_rounded,
                  onTap: () {
                    if (criterionValue.trim().isEmpty) return;
                    if (!valuelessActions.contains(selected) &&
                        actionValue.trim().isEmpty) {
                      return;
                    }

                    Navigator.of(context).pop(
                      MiaRule(
                        id: 'rule-${DateTime.now().microsecondsSinceEpoch}',
                        name:
                            '${field.value.label} is ${criterionValue.trim()}',
                        criteria: <RuleCriterion>[
                          RuleCriterion(
                            field: field.value,
                            value: criterionValue.trim(),
                          ),
                        ],
                        actions: <RuleAction>[
                          RuleAction(
                            kind: selected,
                            value: valuelessActions.contains(selected)
                                ? 'Yes'
                                : actionValue.trim(),
                          ),
                        ],
                        priority: 1,
                        createdOn: DateTime.now(),
                        matchCount: 0,
                        createdFromCorrection: false,
                      ),
                    );
                  },
                ),
                verticalSpace(10),
                BaseText(
                  'A new rule applies from now on. Nothing already recorded is rewritten by it.',
                  fontSize: 11.5,
                  textColor: AppColors.faint,
                  height: 1.45,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
