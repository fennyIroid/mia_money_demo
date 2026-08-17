import 'package:injectable/injectable.dart';

import '../dummy/dummy_insights.dart';
import '../models/insight_models.dart';
import '../store/mia_store.dart';
import 'user_repository.dart' show kDummyLatency;

abstract class InsightRepository {
  Future<FinancialStanding> fetchStanding();

  Future<AvailableAfterObligations> fetchAvailableAfterObligations();

  Future<TrueCostOfLife> fetchTrueCostOfLife();

  Future<List<WhatChangedItem>> fetchWhatChanged();

  Future<List<HandledItem>> fetchHandled();

  Future<List<BriefingCard>> fetchWeeklyReset();

  Future<List<BriefingCard>> fetchBriefings();

  Future<DateTime?> fetchWeeklyResetCompletedOn();

  /// Marks this week's reset as done. Nothing about the underlying records
  /// changes — the reset is a review, not an approval.
  Future<DateTime> completeWeeklyReset();
}

@LazySingleton(as: InsightRepository)
class DummyInsightRepository implements InsightRepository {
  DummyInsightRepository(this._store);

  final MiaStore _store;

  @override
  Future<DateTime?> fetchWeeklyResetCompletedOn() async {
    await Future<void>.delayed(kDummyLatency);
    return _store.weeklyResetCompletedOn;
  }

  @override
  Future<DateTime> completeWeeklyReset() async {
    await Future<void>.delayed(kDummyLatency);
    return _store.weeklyResetCompletedOn = DateTime.now();
  }

  @override
  Future<FinancialStanding> fetchStanding() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.standing;
  }

  @override
  Future<AvailableAfterObligations> fetchAvailableAfterObligations() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.availableAfterObligations;
  }

  @override
  Future<TrueCostOfLife> fetchTrueCostOfLife() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.trueCostOfLife;
  }

  @override
  Future<List<WhatChangedItem>> fetchWhatChanged() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.whatChanged;
  }

  @override
  Future<List<HandledItem>> fetchHandled() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.handled;
  }

  @override
  Future<List<BriefingCard>> fetchWeeklyReset() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.weeklyReset;
  }

  @override
  Future<List<BriefingCard>> fetchBriefings() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.briefings;
  }
}

abstract class BudgetRepository {
  Future<BudgetPeriod> fetchCurrentPeriod();

  Future<void> setMode(BudgetMode mode);

  Future<void> saveAllocation(String allocationId, double planned);
}

@LazySingleton(as: BudgetRepository)
class DummyBudgetRepository implements BudgetRepository {
  @override
  Future<BudgetPeriod> fetchCurrentPeriod() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.currentBudget;
  }

  @override
  Future<void> setMode(BudgetMode mode) async {
    await Future<void>.delayed(kDummyLatency);
  }

  @override
  Future<void> saveAllocation(String allocationId, double planned) async {
    await Future<void>.delayed(kDummyLatency);
  }
}

abstract class ReportRepository {
  Future<ReportSnapshot> fetchReport({String periodKey = 'month'});
}

@LazySingleton(as: ReportRepository)
class DummyReportRepository implements ReportRepository {
  @override
  Future<ReportSnapshot> fetchReport({String periodKey = 'month'}) async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.monthReport;
  }
}

abstract class GoalRepository {
  Future<List<Goal>> fetchGoals();

  Future<ScenarioResult> runScenario(Goal goal, double expense);

  Future<Goal> createGoal(Goal goal);

  /// Records an amount the user allocated to (or took back from) a goal.
  /// Nothing is moved between accounts — only the tracked figure changes.
  Future<Goal> recordMovement({
    required String goalId,
    required double amount,
    required String label,
  });
}

@LazySingleton(as: GoalRepository)
class DummyGoalRepository implements GoalRepository {
  DummyGoalRepository(this._store);

  final MiaStore _store;

  @override
  Future<List<Goal>> fetchGoals() async {
    await Future<void>.delayed(kDummyLatency);
    return List<Goal>.from(_store.goals);
  }

  @override
  Future<Goal> createGoal(Goal goal) async {
    await Future<void>.delayed(kDummyLatency);
    _store.goals.add(goal);
    return goal;
  }

  @override
  Future<Goal> recordMovement({
    required String goalId,
    required double amount,
    required String label,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final Goal? goal = _store.goalById(goalId);
    if (goal == null) {
      throw StateError('Goal $goalId no longer exists');
    }

    final double current = (goal.current + amount).clamp(0, double.infinity);
    final Goal updated = goal.copyWith(
      current: current,
      status: current >= goal.target
          ? GoalStatus.ahead
          : current >= goal.target - goal.requiredMonthlyContribution
          ? GoalStatus.onTrack
          : goal.status,
      movements: <GoalMovement>[
        ...goal.movements,
        GoalMovement(date: DateTime.now(), amount: amount, label: label),
      ],
    );
    _store.replace(_store.goals, (Goal g) => g.id == goalId, updated);
    return updated;
  }

  @override
  Future<ScenarioResult> runScenario(Goal goal, double expense) async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.scenarioFor(goal, expense);
  }
}

abstract class NetWorthRepository {
  Future<NetWorthSnapshot> fetchSnapshot();
}

@LazySingleton(as: NetWorthRepository)
class DummyNetWorthRepository implements NetWorthRepository {
  @override
  Future<NetWorthSnapshot> fetchSnapshot() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyInsights.netWorth;
  }
}
