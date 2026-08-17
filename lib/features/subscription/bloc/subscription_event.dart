part of 'subscription_bloc.dart';

@freezed
abstract class SubscriptionEvent with _$SubscriptionEvent {
  const factory SubscriptionEvent.loadPlans() = SubscriptionLoadPlans;

  const factory SubscriptionEvent.kindSelected(PlanKind kind) =
      SubscriptionKindSelected;

  const factory SubscriptionEvent.termSelected(PlanTerm term) =
      SubscriptionTermSelected;

  const factory SubscriptionEvent.purchase() = SubscriptionPurchase;

  const factory SubscriptionEvent.restore() = SubscriptionRestore;
}
