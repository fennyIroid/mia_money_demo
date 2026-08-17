import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_orb.dart';
import '../../../data/models/insight_models.dart';
import '../../../data/models/user_models.dart';
import '../bloc/onboarding_bloc.dart';
import 'onboarding_step_frame.dart';

class OnboardingNameStep extends StatelessWidget {
  const OnboardingNameStep({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Introductions',
      title: 'What should Mia call you?',
      body: 'Only a first name. Nothing financial is collected yet.',
      heroFlex: 4,
      hero: const MiaOrb(size: 150, speed: 0.7, showSatellites: false),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MiaFormField(
            initialValue: value,
            onChanged: onChanged,
            hint: 'Your first name',
            fontSize: 22,
            textCapitalization: TextCapitalization.words,
            prefixIcon: Icons.person_outline_rounded,
          ),
          verticalSpace(14),
          Row(
            children: <Widget>[
              Icon(
                Icons.lock_outline_rounded,
                size: getFontSize(13),
                color: AppColors.faint,
              ),
              horizontalSpace(6),
              Expanded(
                child: BaseText(
                  'Stored against your account only. Never used in analytics.',
                  fontSize: 11.5,
                  textColor: AppColors.faint,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingHouseholdStep extends StatelessWidget {
  const OnboardingHouseholdStep({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final HouseholdShape? selected;
  final ValueChanged<HouseholdShape> onSelected;

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Who this is for',
      title: 'Who are you managing money for?',
      heroFlex: 0,
      contentFlex: 10,
      // The frame already owns the scroll for this pane, so the cards are laid
      // out in a plain column rather than a nested viewport.
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int i = 0; i < HouseholdShape.values.length; i++) ...<Widget>[
            if (i > 0) verticalSpace(10),
            MiaChoiceCard(
              title: HouseholdShape.values[i].label,
              description: HouseholdShape.values[i].detail,
              selected: selected == HouseholdShape.values[i],
              onTap: () => onSelected(HouseholdShape.values[i]),
              icon: <IconData>[
                Icons.person_rounded,
                Icons.favorite_rounded,
                Icons.family_restroom_rounded,
                Icons.groups_rounded,
              ][i],
            ),
          ],
        ],
      ),
    );
  }
}

class OnboardingPainsStep extends StatelessWidget {
  const OnboardingPainsStep({
    super.key,
    required this.selected,
    required this.onToggle,
  });

  final Set<String> selected;
  final ValueChanged<String> onToggle;

  static const List<String> options = <String>[
    'Chasing bills and due dates',
    'Fixing wrong categories',
    'Losing receipts and warranties',
    'Being surprised by annual costs',
    'Wondering if I overpay for power',
    'Never comparing my loan again',
    'Splitting costs in the household',
    'Money I am still owed',
  ];

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'What hurts',
      title: 'What eats your time today?',
      body: 'Pick as many as you like. Mia puts these first on your Home.',
      heroFlex: 0,
      contentFlex: 10,
      content: MiaToggleChips(
        labels: options,
        selected: selected,
        onToggle: onToggle,
        accent: AppColors.ember,
      ),
    );
  }
}

class OnboardingPayCycleStep extends StatelessWidget {
  const OnboardingPayCycleStep({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final PayFrequency? selected;
  final ValueChanged<PayFrequency> onSelected;

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Rhythm',
      title: 'When does money land?',
      body: 'Your pay cycle sets the boundaries every figure is calculated on.',
      heroFlex: 0,
      contentFlex: 10,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List<Widget>.generate(PayFrequency.values.length, (int i) {
          final PayFrequency frequency = PayFrequency.values[i];
          return Padding(
            padding: EdgeInsets.only(bottom: getSize(10)),
            child: MiaChoiceCard(
              title: frequency.label,
              description: <String>[
                'Every week, same weekday',
                'Every second week',
                'Once a month',
                'It varies — Mia will infer it from your evidence',
              ][i],
              selected: selected == frequency,
              onTap: () => onSelected(frequency),
              accent: AppColors.glacier,
            ),
          );
        }),
      ),
    );
  }
}

class OnboardingBudgetStyleStep extends StatelessWidget {
  const OnboardingBudgetStyleStep({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final BudgetMode? selected;
  final ValueChanged<BudgetMode> onSelected;

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Structure',
      title: 'How much structure do you want?',
      body: 'Budgeting is optional in Mia. You can change this whenever.',
      heroFlex: 0,
      contentFlex: 10,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: BudgetMode.values.map((BudgetMode mode) {
          return Padding(
            padding: EdgeInsets.only(bottom: getSize(10)),
            child: MiaChoiceCard(
              title: mode.label,
              description: mode.description,
              icon: mode.icon,
              selected: selected == mode,
              onTap: () => onSelected(mode),
              accent: AppColors.lagoon,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class OnboardingCadenceStep extends StatelessWidget {
  const OnboardingCadenceStep({
    super.key,
    required this.selected,
    required this.onSelected,
    required this.name,
  });

  final ReviewCadence? selected;
  final ValueChanged<ReviewCadence> onSelected;
  final String name;

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Cadence',
      title: 'How often should Mia bring you a review?',
      body:
          'A short reset covering what changed, what is coming and what only you can decide.',
      heroFlex: 0,
      contentFlex: 10,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...List<Widget>.generate(ReviewCadence.values.length, (int i) {
            final ReviewCadence cadence = ReviewCadence.values[i];
            return Padding(
              padding: EdgeInsets.only(bottom: getSize(10)),
              child: MiaChoiceCard(
                title: cadence.label,
                description: <String>[
                  'Two to five minutes, once a week',
                  'A slightly longer reset every fortnight',
                  'One consolidated review each month',
                ][i],
                selected: selected == cadence,
                onTap: () => onSelected(cadence),
                accent: AppColors.violetHaze,
                badge: i == 0 ? 'Most chosen' : null,
              ),
            );
          }),
          verticalSpace(6),
          BaseText(
            'No streaks, no points, no notifications sent just to pull you back, $name.',
            fontSize: 12,
            textColor: withCustomOpacity(AppColors.mist, 0.6),
            height: 1.5,
          ),
        ],
      ),
    );
  }
}
