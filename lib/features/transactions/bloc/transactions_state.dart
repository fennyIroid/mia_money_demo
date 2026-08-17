part of 'transactions_bloc.dart';

enum TransactionFilter {
  all,
  needsReview,
  income,
  spending,
  transfers,
  duplicates,
  reimbursable,
  household,
}

extension TransactionFilterX on TransactionFilter {
  String get label {
    switch (this) {
      case TransactionFilter.all:
        return 'All';
      case TransactionFilter.needsReview:
        return 'Needs review';
      case TransactionFilter.income:
        return 'Income';
      case TransactionFilter.spending:
        return 'Spending';
      case TransactionFilter.transfers:
        return 'Transfers';
      case TransactionFilter.duplicates:
        return 'Duplicates';
      case TransactionFilter.reimbursable:
        return 'Reimbursable';
      case TransactionFilter.household:
        return 'Shared';
    }
  }
}

@freezed
abstract class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    required List<MiaTransaction> transactions,
    required List<MiaCategory> categories,
    required List<MiaRule> rules,
    required List<ReconciliationCandidate> candidates,
    required String query,
    required TransactionFilter filter,
    required Set<String> selectedIds,
    required int currentPage,
    required int lastPage,
    required bool isReady,
    required RefreshController refreshController,
    required String categoryDraftName,
    required int categoryDraftColourIndex,
    required int categoryDraftIconIndex,
    String? categoryDraftParentId,
    String? lastCorrectionId,
    MiaCategory? createdCategory,
  }) = _TransactionsState;

  factory TransactionsState.initial() => TransactionsState(
    transactions: const <MiaTransaction>[],
    categories: const <MiaCategory>[],
    rules: const <MiaRule>[],
    candidates: const <ReconciliationCandidate>[],
    query: '',
    filter: TransactionFilter.all,
    selectedIds: const <String>{},
    currentPage: 1,
    lastPage: 0,
    isReady: false,
    refreshController: RefreshController(),
    categoryDraftName: '',
    categoryDraftColourIndex: 0,
    categoryDraftIconIndex: 0,
  );
}

extension TransactionsStateX on TransactionsState {
  List<MiaCategory> get parentCategories =>
      categories.where((MiaCategory c) => !c.isSubcategory).toList();

  List<MiaCategory> get subcategories =>
      categories.where((MiaCategory c) => c.isSubcategory).toList();

  bool get canCreateCategory => categoryDraftName.trim().isNotEmpty;

  MiaCategory? categoryById(String id) {
    for (final MiaCategory category in categories) {
      if (category.id == id) return category;
    }
    return null;
  }

  List<MiaTransaction> get visible {
    Iterable<MiaTransaction> list = transactions;

    switch (filter) {
      case TransactionFilter.all:
        break;
      case TransactionFilter.needsReview:
        list = list.where((MiaTransaction t) => t.reviewStatus != null);
      case TransactionFilter.income:
        list = list.where((MiaTransaction t) => t.countsAsIncome);
      case TransactionFilter.spending:
        list = list.where((MiaTransaction t) => t.countsAsSpending);
      case TransactionFilter.transfers:
        list = list.where(
          (MiaTransaction t) =>
              t.treatment == TransactionTreatment.internalTransfer ||
              t.treatment == TransactionTreatment.creditCardPayment,
        );
      case TransactionFilter.duplicates:
        list = list.where(
          (MiaTransaction t) =>
              t.possibleDuplicateOf != null ||
              t.treatment == TransactionTreatment.duplicate,
        );
      case TransactionFilter.reimbursable:
        list = list.where((MiaTransaction t) => t.isReimbursable);
      case TransactionFilter.household:
        list = list.where(
          (MiaTransaction t) => t.visibility != RecordVisibility.private,
        );
    }

    if (query.trim().isNotEmpty) {
      final String q = query.toLowerCase();
      list = list.where(
        (MiaTransaction t) =>
            t.description.toLowerCase().contains(q) ||
            t.merchantDisplay.toLowerCase().contains(q) ||
            t.accountName.toLowerCase().contains(q) ||
            t.amount.abs().toStringAsFixed(2).contains(q),
      );
    }

    return list.toList();
  }

  double get selectedTotal => transactions
      .where((MiaTransaction t) => selectedIds.contains(t.id))
      .fold<double>(0, (double sum, MiaTransaction t) => sum + t.amount);

  MiaCategory? categoryFor(MiaTransaction transaction) {
    for (final MiaCategory category in categories) {
      if (category.id == transaction.layers.effectiveCategoryId) {
        return category;
      }
    }
    return null;
  }

  /// Groups the visible list by calendar day for sectioned rendering.
  Map<String, List<MiaTransaction>> get grouped {
    final Map<String, List<MiaTransaction>> map =
        <String, List<MiaTransaction>>{};
    for (final MiaTransaction t in visible) {
      final String key =
          '${t.date.year}-${t.date.month.toString().padLeft(2, '0')}-${t.date.day.toString().padLeft(2, '0')}';
      map.putIfAbsent(key, () => <MiaTransaction>[]).add(t);
    }
    return map;
  }
}
