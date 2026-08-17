part of 'onboarding_bloc.dart';

/// The 14 steps of the psychological onboarding journey. Order matters: nothing
/// is collected and no consent is asked for until the value recap has landed.
enum OnboardingStep {
  welcome,
  name,
  household,
  pains,
  payCycle,
  budgetStyle,
  reviewCadence,
  loop,
  evidence,
  privacy,
  residency,
  sources,
  recap,
  ready,
}

extension OnboardingStepX on OnboardingStep {
  int get number => index + 1;

  bool get isAnswerStep =>
      this == OnboardingStep.name ||
      this == OnboardingStep.household ||
      this == OnboardingStep.pains ||
      this == OnboardingStep.payCycle ||
      this == OnboardingStep.budgetStyle ||
      this == OnboardingStep.reviewCadence;
}

enum HouseholdShape { solo, couple, family, shareHouse }

extension HouseholdShapeX on HouseholdShape {
  String get label {
    switch (this) {
      case HouseholdShape.solo:
        return 'Just me';
      case HouseholdShape.couple:
        return 'Me and a partner';
      case HouseholdShape.family:
        return 'A whole household';
      case HouseholdShape.shareHouse:
        return 'A share house';
    }
  }

  String get detail {
    switch (this) {
      case HouseholdShape.solo:
        return 'One identity, one set of consents.';
      case HouseholdShape.couple:
        return 'Two logins, private by default, shared where you say so.';
      case HouseholdShape.family:
        return 'Up to five members with their own permissions.';
      case HouseholdShape.shareHouse:
        return 'Shared bills without exposing personal accounts.';
    }
  }
}

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    required OnboardingStep step,
    required String firstName,
    required Set<String> pains,
    required bool isForward,
    HouseholdShape? householdShape,
    PayFrequency? payFrequency,
    BudgetMode? budgetMode,
    ReviewCadence? reviewCadence,
  }) = _OnboardingState;

  factory OnboardingState.initial() => const OnboardingState(
    step: OnboardingStep.welcome,
    firstName: '',
    pains: <String>{},
    isForward: true,
  );
}

extension OnboardingStateX on OnboardingState {
  double get progress => (step.index + 1) / OnboardingStep.values.length;

  String get greetingName =>
      firstName.trim().isEmpty ? 'there' : firstName.trim();

  bool get canAdvance {
    switch (step) {
      case OnboardingStep.name:
        return firstName.trim().length >= 2;
      case OnboardingStep.household:
        return householdShape != null;
      case OnboardingStep.pains:
        return pains.isNotEmpty;
      case OnboardingStep.payCycle:
        return payFrequency != null;
      case OnboardingStep.budgetStyle:
        return budgetMode != null;
      case OnboardingStep.reviewCadence:
        return reviewCadence != null;
      case OnboardingStep.welcome:
      case OnboardingStep.loop:
      case OnboardingStep.evidence:
      case OnboardingStep.privacy:
      case OnboardingStep.residency:
      case OnboardingStep.sources:
      case OnboardingStep.recap:
      case OnboardingStep.ready:
        return true;
    }
  }
}
