part of 'bills_bloc.dart';

enum BillFilter { all, bills, subscriptions, renewals, needsReview, overdue }

extension BillFilterX on BillFilter {
  String get label {
    switch (this) {
      case BillFilter.all:
        return 'All';
      case BillFilter.bills:
        return 'Bills';
      case BillFilter.subscriptions:
        return 'Subscriptions';
      case BillFilter.renewals:
        return 'Renewals';
      case BillFilter.needsReview:
        return 'Needs review';
      case BillFilter.overdue:
        return 'Overdue';
    }
  }
}

@freezed
abstract class BillsState with _$BillsState {
  const factory BillsState({
    required List<Bill> bills,
    required List<TimelineItem> timeline,
    required List<ExpectedMoney> expected,
    required BillFilter filter,
    required int horizonDays,
    required bool isReady,
  }) = _BillsState;

  factory BillsState.initial() => const BillsState(
    bills: <Bill>[],
    timeline: <TimelineItem>[],
    expected: <ExpectedMoney>[],
    filter: BillFilter.all,
    horizonDays: 14,
    isReady: false,
  );
}

extension BillsStateX on BillsState {
  List<Bill> get visibleBills {
    switch (filter) {
      case BillFilter.all:
        return bills;
      case BillFilter.bills:
        return bills.where((Bill b) => b.kind == ObligationKind.bill).toList();
      case BillFilter.subscriptions:
        return bills
            .where((Bill b) => b.kind == ObligationKind.subscription)
            .toList();
      case BillFilter.renewals:
        return bills
            .where(
              (Bill b) =>
                  b.kind == ObligationKind.renewal ||
                  b.kind == ObligationKind.insurance ||
                  b.kind == ObligationKind.membership,
            )
            .toList();
      case BillFilter.needsReview:
        return bills
            .where(
              (Bill b) =>
                  b.status == BillStatus.review ||
                  b.status == BillStatus.amountChanged ||
                  b.status == BillStatus.disputed,
            )
            .toList();
      case BillFilter.overdue:
        return bills
            .where(
              (Bill b) =>
                  b.status == BillStatus.overdue ||
                  b.status == BillStatus.paidLate,
            )
            .toList();
    }
  }

  List<TimelineItem> get horizonItems {
    final DateTime cutoff = DateTime.now().add(Duration(days: horizonDays));
    return timeline.where((TimelineItem i) => i.date.isBefore(cutoff)).toList();
  }

  double get horizonOutflow => horizonItems
      .where((TimelineItem i) => !i.isIncome)
      .fold<double>(0, (double s, TimelineItem i) => s + i.amount.abs());

  double get horizonInflow => horizonItems
      .where((TimelineItem i) => i.isIncome)
      .fold<double>(0, (double s, TimelineItem i) => s + i.amount);

  double get monthlyCommitment => bills
      .where((Bill b) => b.status != BillStatus.cancelled)
      .fold<double>(0, (double s, Bill b) => s + b.monthlyEquivalent);

  double get expectedTotal => expected
      .where((ExpectedMoney e) => e.status != ExpectedMoneyStatus.handled)
      .fold<double>(0, (double s, ExpectedMoney e) => s + e.amount);

  List<ExpectedMoney> get expectedOpen => expected
      .where((ExpectedMoney e) => e.status != ExpectedMoneyStatus.handled)
      .toList();

  /// Irregular commitments annualised into a comparable monthly figure.
  List<Bill> get irregularCommitments => bills
      .where(
        (Bill b) =>
            b.frequency == RecurrenceFrequency.annual ||
            b.frequency == RecurrenceFrequency.quarterly ||
            b.frequency == RecurrenceFrequency.halfYearly,
      )
      .toList();
}
