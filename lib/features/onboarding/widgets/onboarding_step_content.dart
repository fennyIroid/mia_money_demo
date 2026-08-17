import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/insight_models.dart';
import '../../../data/models/user_models.dart';
import '../bloc/onboarding_bloc.dart';
import 'onboarding_question_steps.dart';
import 'onboarding_story_steps.dart';

/// Resolves the current step to its own widget. Keeping this in one place means
/// the view stays a layout, and each step remains an independent component.
class OnboardingStepContent extends StatelessWidget {
  const OnboardingStepContent({super.key, required this.state});

  final OnboardingState state;

  @override
  Widget build(BuildContext context) {
    final OnboardingBloc bloc = context.read<OnboardingBloc>();

    switch (state.step) {
      case OnboardingStep.welcome:
        return const OnboardingWelcomeStep();
      case OnboardingStep.name:
        return OnboardingNameStep(
          value: state.firstName,
          onChanged: (String value) =>
              bloc.add(OnboardingEvent.nameChanged(value)),
        );
      case OnboardingStep.household:
        return OnboardingHouseholdStep(
          selected: state.householdShape,
          onSelected: (HouseholdShape shape) =>
              bloc.add(OnboardingEvent.householdChosen(shape)),
        );
      case OnboardingStep.pains:
        return OnboardingPainsStep(
          selected: state.pains,
          onToggle: (String pain) =>
              bloc.add(OnboardingEvent.painToggled(pain)),
        );
      case OnboardingStep.payCycle:
        return OnboardingPayCycleStep(
          selected: state.payFrequency,
          onSelected: (PayFrequency frequency) =>
              bloc.add(OnboardingEvent.payFrequencyChosen(frequency)),
        );
      case OnboardingStep.budgetStyle:
        return OnboardingBudgetStyleStep(
          selected: state.budgetMode,
          onSelected: (BudgetMode mode) =>
              bloc.add(OnboardingEvent.budgetModeChosen(mode)),
        );
      case OnboardingStep.reviewCadence:
        return OnboardingCadenceStep(
          selected: state.reviewCadence,
          name: state.greetingName,
          onSelected: (ReviewCadence cadence) =>
              bloc.add(OnboardingEvent.cadenceChosen(cadence)),
        );
      case OnboardingStep.loop:
        return const OnboardingLoopStep();
      case OnboardingStep.evidence:
        return const OnboardingEvidenceStep();
      case OnboardingStep.privacy:
        return const OnboardingPrivacyStep();
      case OnboardingStep.residency:
        return const OnboardingResidencyStep();
      case OnboardingStep.sources:
        return const OnboardingSourcesStep();
      case OnboardingStep.recap:
        return OnboardingRecapStep(
          name: state.greetingName,
          pains: state.pains,
          cadenceLabel: state.reviewCadence?.label ?? 'Weekly',
          budgetLabel: state.budgetMode?.label ?? 'Tracking only',
          householdLabel:
              state.householdShape?.label.toLowerCase() ?? 'just you',
        );
      case OnboardingStep.ready:
        return OnboardingReadyStep(name: state.greetingName);
    }
  }
}
