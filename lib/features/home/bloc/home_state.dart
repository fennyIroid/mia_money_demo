part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required bool isReady,
    required FinancialStanding standing,
    required List<ReviewItem> priorityItems,
    required List<WhatChangedItem> whatChanged,
    required List<TimelineItem> comingUp,
    required List<HandledItem> handled,
    AvailableAfterObligations? available,
    TrueCostOfLife? trueCost,
    MiaUser? user,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    isReady: false,
    standing: FinancialStanding.incomplete,
    priorityItems: <ReviewItem>[],
    whatChanged: <WhatChangedItem>[],
    comingUp: <TimelineItem>[],
    handled: <HandledItem>[],
  );
}

extension HomeStateX on HomeState {
  bool get isCaughtUp => isReady && priorityItems.isEmpty;

  int get openReviewCount => priorityItems.length;

  double get comingUpTotal => comingUp
      .where((TimelineItem i) => !i.isIncome && i.isConfirmed)
      .fold<double>(0, (double sum, TimelineItem i) => sum + i.amount.abs());
}
