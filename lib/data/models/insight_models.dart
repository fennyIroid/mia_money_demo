import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'core_models.dart';

enum FinancialStanding { broadlyOkay, needsAttention, incomplete }

extension FinancialStandingX on FinancialStanding {
  String get label {
    switch (this) {
      case FinancialStanding.broadlyOkay:
        return 'Broadly okay';
      case FinancialStanding.needsAttention:
        return 'Needs attention';
      case FinancialStanding.incomplete:
        return 'Incomplete data';
    }
  }

  Color get color {
    switch (this) {
      case FinancialStanding.broadlyOkay:
        return AppColors.positive;
      case FinancialStanding.needsAttention:
        return AppColors.ember;
      case FinancialStanding.incomplete:
        return AppColors.caution;
    }
  }
}

/// A single line in the Available After Obligations calculation.
@immutable
class ObligationLine {
  const ObligationLine({
    required this.label,
    required this.amount,
    required this.isDeduction,
    this.detail,
    this.recordCount,
  });

  final String label;
  final double amount;
  final bool isDeduction;
  final String? detail;
  final int? recordCount;
}

@immutable
class AvailableAfterObligations {
  const AvailableAfterObligations({
    required this.available,
    required this.openingBalance,
    required this.lines,
    required this.meta,
    required this.horizonLabel,
  });

  final double available;
  final double openingBalance;
  final List<ObligationLine> lines;
  final CalculationMeta meta;
  final String horizonLabel;
}

@immutable
class TrueCostComponent {
  const TrueCostComponent({
    required this.label,
    required this.monthlyAmount,
    required this.color,
    required this.itemCount,
    this.isIrregular = false,
  });

  final String label;
  final double monthlyAmount;
  final Color color;
  final int itemCount;
  final bool isIrregular;
}

@immutable
class TrueCostOfLife {
  const TrueCostOfLife({
    required this.monthlyTotal,
    required this.annualTotal,
    required this.components,
    required this.meta,
  });

  final double monthlyTotal;
  final double annualTotal;
  final List<TrueCostComponent> components;
  final CalculationMeta meta;
}

enum ChangeDirection { up, down, flat, isNew }

@immutable
class WhatChangedItem {
  const WhatChangedItem({
    required this.id,
    required this.title,
    required this.detail,
    required this.amount,
    required this.direction,
    required this.icon,
    this.percent,
    this.accent = AppColors.ember,
    this.evidence = const <EvidenceLink>[],
  });

  final String id;
  final String title;
  final String detail;
  final double amount;
  final ChangeDirection direction;
  final IconData icon;
  final double? percent;
  final Color accent;
  final List<EvidenceLink> evidence;
}

@immutable
class HandledItem {
  const HandledItem({
    required this.id,
    required this.title,
    required this.detail,
    required this.icon,
    required this.handledOn,
    this.accent = AppColors.positive,
  });

  final String id;
  final String title;
  final String detail;
  final IconData icon;
  final DateTime handledOn;
  final Color accent;
}

/// A card in a briefing or the Weekly Reset flow.
@immutable
class BriefingCard {
  const BriefingCard({
    required this.id,
    required this.overline,
    required this.title,
    required this.body,
    required this.icon,
    this.figure,
    this.accent = AppColors.ember,
    this.actionLabel,
    this.items = const <String>[],
  });

  final String id;
  final String overline;
  final String title;
  final String body;
  final IconData icon;
  final String? figure;
  final Color accent;
  final String? actionLabel;
  final List<String> items;
}

enum BudgetMode { trackingOnly, simpleFlex, categoryBudget, detailedPlanning }

extension BudgetModeX on BudgetMode {
  String get label {
    switch (this) {
      case BudgetMode.trackingOnly:
        return 'Tracking only';
      case BudgetMode.simpleFlex:
        return 'Simple flex';
      case BudgetMode.categoryBudget:
        return 'Category budget';
      case BudgetMode.detailedPlanning:
        return 'Detailed planning';
    }
  }

  String get description {
    switch (this) {
      case BudgetMode.trackingOnly:
        return 'See actuals and comparisons. No limits to maintain.';
      case BudgetMode.simpleFlex:
        return 'Fixed obligations, non-monthly commitments, one flexible number.';
      case BudgetMode.categoryBudget:
        return 'Limits per category with pace and remaining.';
      case BudgetMode.detailedPlanning:
        return 'Future periods, rollovers, sinking funds and allocations.';
    }
  }

  IconData get icon {
    switch (this) {
      case BudgetMode.trackingOnly:
        return Icons.visibility_rounded;
      case BudgetMode.simpleFlex:
        return Icons.waves_rounded;
      case BudgetMode.categoryBudget:
        return Icons.dashboard_customize_rounded;
      case BudgetMode.detailedPlanning:
        return Icons.architecture_rounded;
    }
  }
}

@immutable
class BudgetAllocation {
  const BudgetAllocation({
    required this.id,
    required this.categoryName,
    required this.icon,
    required this.color,
    required this.planned,
    required this.actual,
    this.parentId,
    this.rolloverIn = 0,
    this.isSinkingFund = false,
    this.owner = 'Ours',
  });

  final String id;
  final String categoryName;
  final IconData icon;
  final Color color;
  final double planned;
  final double actual;
  final String? parentId;
  final double rolloverIn;
  final bool isSinkingFund;
  final String owner;

  double get remaining => planned + rolloverIn - actual;

  double get usedFraction =>
      planned + rolloverIn == 0 ? 0 : actual / (planned + rolloverIn);
}

@immutable
class BudgetPeriod {
  const BudgetPeriod({
    required this.id,
    required this.mode,
    required this.label,
    required this.start,
    required this.end,
    required this.allocations,
    required this.meta,
    this.flexibleAmount,
    this.income = 0,
  });

  final String id;
  final BudgetMode mode;
  final String label;
  final DateTime start;
  final DateTime end;
  final List<BudgetAllocation> allocations;
  final CalculationMeta meta;
  final double? flexibleAmount;
  final double income;

  double get totalPlanned => allocations.fold<double>(
    0,
    (double s, BudgetAllocation a) => s + a.planned,
  );

  double get totalActual => allocations.fold<double>(
    0,
    (double s, BudgetAllocation a) => s + a.actual,
  );

  /// Fraction of the period elapsed — the expected pace marker.
  double get elapsedFraction {
    final int total = end.difference(start).inDays;
    if (total <= 0) return 1;
    final int done = DateTime.now().difference(start).inDays;
    return (done / total).clamp(0.0, 1.0);
  }
}

@immutable
class CategoryTotal {
  const CategoryTotal({
    required this.id,
    required this.name,
    required this.amount,
    required this.color,
    required this.icon,
    this.previousAmount,
    this.transactionCount = 0,
    this.children = const <CategoryTotal>[],
  });

  final String id;
  final String name;
  final double amount;
  final Color color;
  final IconData icon;
  final double? previousAmount;
  final int transactionCount;
  final List<CategoryTotal> children;

  double? get percentChange => previousAmount == null || previousAmount == 0
      ? null
      : ((amount - previousAmount!) / previousAmount!.abs()) * 100;
}

@immutable
class MerchantTotal {
  const MerchantTotal({
    required this.name,
    required this.amount,
    required this.count,
    this.categoryName,
  });

  final String name;
  final double amount;
  final int count;
  final String? categoryName;
}

@immutable
class CashFlowPoint {
  const CashFlowPoint({
    required this.label,
    required this.income,
    required this.spending,
  });

  final String label;
  final double income;
  final double spending;

  double get net => income - spending;
}

@immutable
class ReportSnapshot {
  const ReportSnapshot({
    required this.id,
    required this.title,
    required this.periodLabel,
    required this.eligibleSpending,
    required this.genuineIncome,
    required this.categories,
    required this.merchants,
    required this.cashFlow,
    required this.meta,
    this.previousSpending,
    this.previousIncome,
  });

  final String id;
  final String title;
  final String periodLabel;
  final double eligibleSpending;
  final double genuineIncome;
  final List<CategoryTotal> categories;
  final List<MerchantTotal> merchants;
  final List<CashFlowPoint> cashFlow;
  final CalculationMeta meta;
  final double? previousSpending;
  final double? previousIncome;

  double get net => genuineIncome - eligibleSpending;

  /// Categories strictly below the 0.5% share threshold, grouped for display
  /// only — the underlying records keep their real categories.
  List<CategoryTotal> get smallerSpending => categories
      .where(
        (CategoryTotal c) =>
            eligibleSpending > 0 && (c.amount / eligibleSpending) * 100 < 0.5,
      )
      .toList();

  List<CategoryTotal> get majorCategories => categories
      .where(
        (CategoryTotal c) =>
            eligibleSpending <= 0 || (c.amount / eligibleSpending) * 100 >= 0.5,
      )
      .toList();
}

enum GoalKind {
  savings,
  emergencyFund,
  holiday,
  school,
  christmas,
  annualBill,
  homeDeposit,
  purchase,
  debtRepayment,
}

extension GoalKindX on GoalKind {
  String get label {
    switch (this) {
      case GoalKind.savings:
        return 'Savings';
      case GoalKind.emergencyFund:
        return 'Emergency fund';
      case GoalKind.holiday:
        return 'Holiday';
      case GoalKind.school:
        return 'School';
      case GoalKind.christmas:
        return 'Christmas';
      case GoalKind.annualBill:
        return 'Annual bill';
      case GoalKind.homeDeposit:
        return 'Home deposit';
      case GoalKind.purchase:
        return 'Purchase';
      case GoalKind.debtRepayment:
        return 'Debt repayment';
    }
  }

  IconData get icon {
    switch (this) {
      case GoalKind.savings:
        return Icons.savings_rounded;
      case GoalKind.emergencyFund:
        return Icons.health_and_safety_rounded;
      case GoalKind.holiday:
        return Icons.beach_access_rounded;
      case GoalKind.school:
        return Icons.school_rounded;
      case GoalKind.christmas:
        return Icons.card_giftcard_rounded;
      case GoalKind.annualBill:
        return Icons.event_repeat_rounded;
      case GoalKind.homeDeposit:
        return Icons.house_rounded;
      case GoalKind.purchase:
        return Icons.shopping_bag_rounded;
      case GoalKind.debtRepayment:
        return Icons.trending_down_rounded;
    }
  }
}

enum GoalStatus { ahead, onTrack, behind }

extension GoalStatusX on GoalStatus {
  String get label {
    switch (this) {
      case GoalStatus.ahead:
        return 'Ahead';
      case GoalStatus.onTrack:
        return 'On track';
      case GoalStatus.behind:
        return 'Behind';
    }
  }

  Color get color {
    switch (this) {
      case GoalStatus.ahead:
        return AppColors.positive;
      case GoalStatus.onTrack:
        return AppColors.glacier;
      case GoalStatus.behind:
        return AppColors.negative;
    }
  }
}

@immutable
class GoalMovement {
  const GoalMovement({
    required this.date,
    required this.amount,
    required this.label,
  });

  final DateTime date;
  final double amount;
  final String label;

  bool get isWithdrawal => amount < 0;
}

@immutable
class Goal {
  const Goal({
    required this.id,
    required this.name,
    required this.kind,
    required this.target,
    required this.current,
    required this.targetDate,
    required this.status,
    required this.owner,
    required this.meta,
    this.linkedAccountName,
    this.visibility = RecordVisibility.private,
    this.movements = const <GoalMovement>[],
    this.accent = AppColors.ember,
  });

  final String id;
  final String name;
  final GoalKind kind;
  final double target;
  final double current;
  final DateTime targetDate;
  final GoalStatus status;
  final String owner;
  final CalculationMeta meta;
  final String? linkedAccountName;
  final RecordVisibility visibility;
  final List<GoalMovement> movements;
  final Color accent;

  double get fraction => target == 0 ? 0 : (current / target).clamp(0.0, 1.0);

  int get monthsRemaining {
    final int days = targetDate.difference(DateTime.now()).inDays;
    return days <= 0 ? 0 : (days / 30).ceil();
  }

  double get requiredMonthlyContribution {
    final int months = monthsRemaining;
    if (months == 0) return (target - current).clamp(0, double.infinity);
    return ((target - current) / months).clamp(0, double.infinity);
  }

  Goal copyWith({
    String? name,
    double? target,
    double? current,
    DateTime? targetDate,
    GoalStatus? status,
    CalculationMeta? meta,
    String? linkedAccountName,
    RecordVisibility? visibility,
    List<GoalMovement>? movements,
  }) {
    return Goal(
      id: id,
      name: name ?? this.name,
      kind: kind,
      target: target ?? this.target,
      current: current ?? this.current,
      targetDate: targetDate ?? this.targetDate,
      status: status ?? this.status,
      owner: owner,
      meta: meta ?? this.meta,
      linkedAccountName: linkedAccountName ?? this.linkedAccountName,
      visibility: visibility ?? this.visibility,
      movements: movements ?? this.movements,
      accent: accent,
    );
  }
}

@immutable
class ScenarioResult {
  const ScenarioResult({
    required this.description,
    required this.beforeCompletionDate,
    required this.afterCompletionDate,
    required this.monthsDelayed,
    required this.newRequiredContribution,
    required this.assumptions,
  });

  final String description;
  final DateTime beforeCompletionDate;
  final DateTime afterCompletionDate;
  final int monthsDelayed;
  final double newRequiredContribution;
  final List<String> assumptions;
}

@immutable
class NetWorthEntry {
  const NetWorthEntry({
    required this.label,
    required this.amount,
    required this.source,
    required this.asOf,
    required this.freshness,
    required this.icon,
    this.isLiability = false,
  });

  final String label;
  final double amount;
  final ValueSource source;
  final DateTime asOf;
  final DataFreshness freshness;
  final IconData icon;
  final bool isLiability;
}

@immutable
class NetWorthSnapshot {
  const NetWorthSnapshot({
    required this.asAt,
    required this.assets,
    required this.liabilities,
    required this.meta,
    this.history = const <double>[],
  });

  final DateTime asAt;
  final List<NetWorthEntry> assets;
  final List<NetWorthEntry> liabilities;
  final CalculationMeta meta;
  final List<double> history;

  double get totalAssets =>
      assets.fold<double>(0, (double s, NetWorthEntry e) => s + e.amount);

  double get totalLiabilities =>
      liabilities.fold<double>(0, (double s, NetWorthEntry e) => s + e.amount);

  double get netWorth => totalAssets - totalLiabilities;
}
