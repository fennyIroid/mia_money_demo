part of 'money_bloc.dart';

@freezed
abstract class MoneyEvent with _$MoneyEvent {
  const factory MoneyEvent.load() = MoneyLoad;

  const factory MoneyEvent.periodChanged(ReportPeriod period) =
      MoneyPeriodChanged;

  const factory MoneyEvent.budgetModeChanged(BudgetMode mode) =
      MoneyBudgetModeChanged;

  const factory MoneyEvent.smallerSpendingToggled() =
      MoneySmallerSpendingToggled;

  const factory MoneyEvent.scenarioRun({
    required Goal goal,
    required double expense,
  }) = MoneyScenarioRun;

  const factory MoneyEvent.showArchivedToggled() = MoneyShowArchivedToggled;

  const factory MoneyEvent.goalDraftStarted() = MoneyGoalDraftStarted;

  const factory MoneyEvent.goalDraftChanged({
    String? name,
    GoalKind? kind,
    double? target,
    double? current,
    int? months,
    bool? sharedWithHousehold,
  }) = MoneyGoalDraftChanged;

  const factory MoneyEvent.goalDraftSubmitted() = MoneyGoalDraftSubmitted;

  const factory MoneyEvent.goalMovementRecorded({
    required String goalId,
    required double amount,
    required String label,
  }) = MoneyGoalMovementRecorded;

  const factory MoneyEvent.exportRequested({
    required String label,
    required String format,
  }) = MoneyExportRequested;

  const factory MoneyEvent.accountArchived(String accountId) =
      MoneyAccountArchived;
}
