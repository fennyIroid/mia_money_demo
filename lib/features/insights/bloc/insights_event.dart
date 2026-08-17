part of 'insights_bloc.dart';

@freezed
abstract class InsightsEvent with _$InsightsEvent {
  const factory InsightsEvent.load() = InsightsLoad;

  const factory InsightsEvent.resetStepChanged(int step) =
      InsightsResetStepChanged;

  const factory InsightsEvent.weeklyResetCompleted() =
      InsightsWeeklyResetCompleted;
}
