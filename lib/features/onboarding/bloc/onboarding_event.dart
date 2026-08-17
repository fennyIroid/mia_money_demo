part of 'onboarding_bloc.dart';

@freezed
abstract class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.advance() = OnboardingAdvance;

  const factory OnboardingEvent.goBack() = OnboardingGoBack;

  const factory OnboardingEvent.jumpTo(OnboardingStep step) = OnboardingJumpTo;

  const factory OnboardingEvent.nameChanged(String value) =
      OnboardingNameChanged;

  const factory OnboardingEvent.householdChosen(HouseholdShape shape) =
      OnboardingHouseholdChosen;

  const factory OnboardingEvent.painToggled(String pain) =
      OnboardingPainToggled;

  const factory OnboardingEvent.payFrequencyChosen(PayFrequency frequency) =
      OnboardingPayFrequencyChosen;

  const factory OnboardingEvent.budgetModeChosen(BudgetMode mode) =
      OnboardingBudgetModeChosen;

  const factory OnboardingEvent.cadenceChosen(ReviewCadence cadence) =
      OnboardingCadenceChosen;
}
