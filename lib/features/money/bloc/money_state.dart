part of 'money_bloc.dart';

enum ReportPeriod { month, quarter, yearToDate, financialYear, custom }

extension ReportPeriodX on ReportPeriod {
  String get label {
    switch (this) {
      case ReportPeriod.month:
        return 'Month';
      case ReportPeriod.quarter:
        return 'Quarter';
      case ReportPeriod.yearToDate:
        return 'YTD';
      case ReportPeriod.financialYear:
        return 'FY';
      case ReportPeriod.custom:
        return 'Custom';
    }
  }
}

@freezed
abstract class MoneyState with _$MoneyState {
  const factory MoneyState({
    required List<FinancialAccount> accounts,
    required List<Goal> goals,
    required List<ExportJob> exports,
    required ReportPeriod period,
    required BudgetMode budgetMode,
    required bool groupSmallerSpending,
    required bool showArchived,
    required bool isReady,
    required String goalDraftName,
    required GoalKind goalDraftKind,
    required double goalDraftTarget,
    required double goalDraftCurrent,
    required int goalDraftMonths,
    required bool goalDraftShared,
    NetWorthSnapshot? netWorth,
    BudgetPeriod? budget,
    ReportSnapshot? report,
    ScenarioResult? scenario,
    Goal? createdGoal,
  }) = _MoneyState;

  factory MoneyState.initial() => const MoneyState(
    accounts: <FinancialAccount>[],
    goals: <Goal>[],
    exports: <ExportJob>[],
    period: ReportPeriod.month,
    budgetMode: BudgetMode.categoryBudget,
    groupSmallerSpending: true,
    showArchived: false,
    isReady: false,
    goalDraftName: '',
    goalDraftKind: GoalKind.savings,
    goalDraftTarget: 5000,
    goalDraftCurrent: 0,
    goalDraftMonths: 12,
    goalDraftShared: false,
  );
}

extension MoneyStateX on MoneyState {
  /// A goal needs a name and something to aim at before it can be created.
  bool get canCreateGoal =>
      goalDraftName.trim().isNotEmpty &&
      goalDraftTarget > 0 &&
      goalDraftCurrent <= goalDraftTarget;

  DateTime get goalDraftTargetDate =>
      DateTime.now().add(Duration(days: goalDraftMonths * 30));

  double get goalDraftMonthlyContribution => goalDraftMonths == 0
      ? goalDraftTarget - goalDraftCurrent
      : (goalDraftTarget - goalDraftCurrent) / goalDraftMonths;

  List<FinancialAccount> get assets =>
      accounts.where((FinancialAccount a) => !a.isLiability).toList();

  List<FinancialAccount> get liabilities =>
      accounts.where((FinancialAccount a) => a.isLiability).toList();

  double get cashOnHand => accounts
      .where(
        (FinancialAccount a) =>
            a.type == AccountType.transaction ||
            a.type == AccountType.savings ||
            a.type == AccountType.cash,
      )
      .fold<double>(0, (double sum, FinancialAccount a) => sum + a.balance);

  double get goalsTotal =>
      goals.fold<double>(0, (double sum, Goal g) => sum + g.current);

  double get goalsTarget =>
      goals.fold<double>(0, (double sum, Goal g) => sum + g.target);

  /// Report categories with the sub-0.5% group folded in for display only.
  List<CategoryTotal> get displayedCategories {
    if (report == null) return <CategoryTotal>[];
    if (!groupSmallerSpending) return report!.categories;
    return report!.majorCategories;
  }

  double get smallerSpendingTotal => report == null
      ? 0
      : report!.smallerSpending.fold<double>(
          0,
          (double s, CategoryTotal c) => s + c.amount,
        );
}
