part of 'insights_bloc.dart';

@freezed
abstract class InsightsState with _$InsightsState {
  const factory InsightsState({
    required List<WhatChangedItem> whatChanged,
    required List<HandledItem> handled,
    required List<BriefingCard> weeklyReset,
    required List<BriefingCard> briefings,
    required int resetStep,
    DateTime? weeklyResetCompletedOn,
    required bool isReady,
    AvailableAfterObligations? available,
    TrueCostOfLife? trueCost,
  }) = _InsightsState;

  factory InsightsState.initial() => const InsightsState(
    whatChanged: <WhatChangedItem>[],
    handled: <HandledItem>[],
    weeklyReset: <BriefingCard>[],
    briefings: <BriefingCard>[],
    resetStep: 0,
    isReady: false,
  );
}

extension InsightsStateX on InsightsState {
  bool get isLastResetStep => resetStep >= weeklyReset.length - 1;

  double get resetProgress =>
      weeklyReset.isEmpty ? 0 : (resetStep + 1) / weeklyReset.length;
}
