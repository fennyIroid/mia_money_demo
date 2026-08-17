part of 'subscription_bloc.dart';

@freezed
abstract class SubscriptionScreenState with _$SubscriptionScreenState {
  const factory SubscriptionScreenState({
    required List<SubscriptionPlan> plans,
    required PlanKind selectedKind,
    required PlanTerm selectedTerm,
    required bool isRestoring,
    required bool isPurchased,
    SubscriptionState? current,
    String? failureMessage,
  }) = _SubscriptionScreenState;

  factory SubscriptionScreenState.initial() => const SubscriptionScreenState(
    plans: <SubscriptionPlan>[],
    selectedKind: PlanKind.household,
    selectedTerm: PlanTerm.annual,
    isRestoring: false,
    isPurchased: false,
  );
}

extension SubscriptionScreenStateX on SubscriptionScreenState {
  SubscriptionPlan? get selectedPlan {
    for (final SubscriptionPlan plan in plans) {
      if (plan.kind == selectedKind && plan.term == selectedTerm) return plan;
    }
    return plans.isEmpty ? null : plans.first;
  }

  List<SubscriptionPlan> get plansForKind =>
      plans.where((SubscriptionPlan p) => p.kind == selectedKind).toList();
}
