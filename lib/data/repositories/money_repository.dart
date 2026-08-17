import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../models/core_models.dart';
import '../models/money_models.dart';
import '../store/mia_store.dart';
import 'user_repository.dart' show kDummyLatency;

abstract class AccountRepository {
  Future<List<FinancialAccount>> fetchAccounts({bool includeArchived = false});

  Future<FinancialAccount> fetchAccount(String id);

  Future<void> archiveAccount(String id);

  /// Adds an account the user keeps themselves — cash, an asset, a loan a
  /// provider does not report. Its balance is manual and says so.
  Future<FinancialAccount> createAccount({
    required String name,
    required String institution,
    required AccountType type,
    required double balance,
    required String owner,
    bool sharedWithHousehold = false,
    String? coverageNote,
  });
}

@LazySingleton(as: AccountRepository)
class DummyAccountRepository implements AccountRepository {
  DummyAccountRepository(this._store);

  final MiaStore _store;

  @override
  Future<List<FinancialAccount>> fetchAccounts({
    bool includeArchived = false,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    return _store.accounts
        .where((FinancialAccount a) => includeArchived || !a.isArchived)
        .toList();
  }

  @override
  Future<FinancialAccount> fetchAccount(String id) async {
    await Future<void>.delayed(kDummyLatency);
    return _store.accountById(id)!;
  }

  @override
  Future<void> archiveAccount(String id) async {
    await Future<void>.delayed(kDummyLatency);
    final FinancialAccount? account = _store.accountById(id);
    if (account == null) return;
    _store.replace(
      _store.accounts,
      (FinancialAccount a) => a.id == id,
      account.copyWith(isArchived: true),
    );
  }

  @override
  Future<FinancialAccount> createAccount({
    required String name,
    required String institution,
    required AccountType type,
    required double balance,
    required String owner,
    bool sharedWithHousehold = false,
    String? coverageNote,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final DateTime now = DateTime.now();
    final FinancialAccount created = FinancialAccount(
      id: _store.nextId('acc'),
      name: name,
      institution: institution,
      type: type,
      balance: type.isLiability ? -balance.abs() : balance,
      owner: owner,
      source: ValueSource.manual,
      freshness: DataFreshness.recent,
      balanceAsOf: now,
      visibility: sharedWithHousehold
          ? RecordVisibility.household
          : RecordVisibility.private,
      coverageNote:
          coverageNote ??
          'You keep this balance up to date. Mia never treats it as provider supplied.',
      isConnected: false,
      history: <BalanceSnapshot>[
        BalanceSnapshot(
          date: now,
          amount: type.isLiability ? -balance.abs() : balance,
          source: ValueSource.manual,
        ),
      ],
    );
    _store.accounts.insert(0, created);
    return created;
  }
}

abstract class CategoryRepository {
  Future<List<MiaCategory>> fetchCategories({bool includeArchived = false});

  Future<MiaCategory> createCategory({
    required String name,
    required IconData icon,
    required Color color,
    String? parentId,
  });

  /// Moves every transaction off [fromId] and onto [intoId], then retires the
  /// emptied category. Nothing is deleted from the transaction history.
  Future<void> mergeCategories({
    required String fromId,
    required String intoId,
  });

  Future<void> moveSubcategory({
    required String categoryId,
    required String parentId,
  });

  Future<void> setArchived({required String categoryId, required bool value});
}

@LazySingleton(as: CategoryRepository)
class DummyCategoryRepository implements CategoryRepository {
  DummyCategoryRepository(this._store);

  final MiaStore _store;

  @override
  Future<List<MiaCategory>> fetchCategories({
    bool includeArchived = false,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    return _store.categories
        .where((MiaCategory c) => includeArchived || !c.isArchived)
        .toList();
  }

  @override
  Future<MiaCategory> createCategory({
    required String name,
    required IconData icon,
    required Color color,
    String? parentId,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final MiaCategory created = MiaCategory(
      id: _store.nextId('cat'),
      name: name,
      icon: icon,
      color: color,
      parentId: parentId,
      isUserCreated: true,
    );
    _store.categories.add(created);
    return created;
  }

  @override
  Future<void> mergeCategories({
    required String fromId,
    required String intoId,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final MiaCategory? from = _store.categoryById(fromId);
    final MiaCategory? into = _store.categoryById(intoId);
    if (from == null || into == null) return;

    // Transactions keep their history; only the category they point at moves.
    for (int i = 0; i < _store.transactions.length; i++) {
      final MiaTransaction t = _store.transactions[i];
      if (t.layers.effectiveCategoryId != fromId) continue;
      _store.transactions[i] = t.copyWith(
        layers: ClassificationLayers(
          providerCategory: t.layers.providerCategory,
          providerSubcategory: t.layers.providerSubcategory,
          miaCategoryId: t.layers.miaCategoryId,
          miaSubcategoryId: t.layers.miaSubcategoryId,
          userCategoryId: intoId,
          providerMerchant: t.layers.providerMerchant,
          normalisedMerchant: t.layers.normalisedMerchant,
          userMerchantAlias: t.layers.userMerchantAlias,
          mappingVersion: t.layers.mappingVersion,
          providerConfidence: t.layers.providerConfidence,
        ),
      );
    }

    _store.replace(
      _store.categories,
      (MiaCategory c) => c.id == intoId,
      into.copyWith(
        transactionCount: into.transactionCount + from.transactionCount,
        monthTotal: into.monthTotal + from.monthTotal,
      ),
    );
    _store.categories.removeWhere((MiaCategory c) => c.id == fromId);
  }

  @override
  Future<void> moveSubcategory({
    required String categoryId,
    required String parentId,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final MiaCategory? category = _store.categoryById(categoryId);
    if (category == null) return;
    _store.replace(
      _store.categories,
      (MiaCategory c) => c.id == categoryId,
      category.copyWith(parentId: parentId),
    );
  }

  @override
  Future<void> setArchived({
    required String categoryId,
    required bool value,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final MiaCategory? category = _store.categoryById(categoryId);
    if (category == null) return;
    _store.replace(
      _store.categories,
      (MiaCategory c) => c.id == categoryId,
      category.copyWith(isArchived: value),
    );
  }
}

abstract class TransactionRepository {
  Future<List<MiaTransaction>> fetchTransactions({
    int page = 1,
    int perPage = 20,
  });

  Future<MiaTransaction> fetchTransaction(String id);

  Future<List<ReconciliationCandidate>> fetchReconciliationCandidates();

  Future<void> applyCorrection({
    required String transactionId,
    String? categoryId,
    String? merchantAlias,
    TransactionTreatment? treatment,
    List<String>? tags,
  });

  Future<void> saveSplits(String transactionId, List<TransactionSplit> splits);

  /// Records money the user entered themselves. Negative [amount] is money out.
  Future<MiaTransaction> createTransaction({
    required String description,
    required double amount,
    required DateTime date,
    required String accountId,
    required String categoryId,
    required String owner,
    TransactionTreatment treatment = TransactionTreatment.normal,
    List<String> tags = const <String>[],
    String? note,
    String? billId,
    String? receiptId,
    bool sharedWithHousehold = false,
    bool isBusiness = false,
    bool isReimbursable = false,
  });

  /// Confirms a pair Mia proposed: both sides are marked with the treatment the
  /// pairing implies so neither is double counted.
  Future<void> confirmReconciliation(String candidateId);

  Future<void> dismissReconciliation(String candidateId);

  Future<void> linkReceipt({
    required String transactionId,
    required String receiptId,
  });
}

@LazySingleton(as: TransactionRepository)
class DummyTransactionRepository implements TransactionRepository {
  DummyTransactionRepository(this._store);

  final MiaStore _store;

  List<MiaTransaction> get _sorted => _store.transactions
    ..sort((MiaTransaction a, MiaTransaction b) => b.date.compareTo(a.date));

  @override
  Future<List<MiaTransaction>> fetchTransactions({
    int page = 1,
    int perPage = 20,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final List<MiaTransaction> all = _sorted;
    final int start = (page - 1) * perPage;
    if (start >= all.length) return <MiaTransaction>[];
    return all.skip(start).take(perPage).toList();
  }

  @override
  Future<MiaTransaction> fetchTransaction(String id) async {
    await Future<void>.delayed(kDummyLatency);
    return _store.transactionById(id)!;
  }

  @override
  Future<List<ReconciliationCandidate>> fetchReconciliationCandidates() async {
    await Future<void>.delayed(kDummyLatency);
    return List<ReconciliationCandidate>.from(_store.reconciliationCandidates);
  }

  @override
  Future<void> applyCorrection({
    required String transactionId,
    String? categoryId,
    String? merchantAlias,
    TransactionTreatment? treatment,
    List<String>? tags,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final MiaTransaction? transaction = _store.transactionById(transactionId);
    if (transaction == null) return;

    // Provider evidence and Mia's mapping stay underneath; the correction is
    // recorded as the user layer on top of them.
    final ClassificationLayers layers = ClassificationLayers(
      providerCategory: transaction.layers.providerCategory,
      providerSubcategory: transaction.layers.providerSubcategory,
      miaCategoryId: transaction.layers.miaCategoryId,
      miaSubcategoryId: transaction.layers.miaSubcategoryId,
      userCategoryId: categoryId ?? transaction.layers.userCategoryId,
      providerMerchant: transaction.layers.providerMerchant,
      normalisedMerchant: transaction.layers.normalisedMerchant,
      userMerchantAlias: merchantAlias ?? transaction.layers.userMerchantAlias,
      mappingVersion: transaction.layers.mappingVersion,
      providerConfidence: transaction.layers.providerConfidence,
    );

    _store.applyTransactionToTotals(transaction, sign: -1);
    final MiaTransaction updated = transaction.copyWith(
      layers: layers,
      treatment: treatment ?? transaction.treatment,
      tags: tags ?? transaction.tags,
      audit: <AuditEvent>[
        ...transaction.audit,
        AuditEvent(
          id: _store.nextId('aud'),
          actor: 'You',
          action: 'Corrected this transaction',
          timestamp: DateTime.now(),
          canUndo: true,
        ),
      ],
    );
    _store.replace(
      _store.transactions,
      (MiaTransaction t) => t.id == transactionId,
      updated,
    );
    _store.applyTransactionToTotals(updated);
  }

  @override
  Future<void> saveSplits(
    String transactionId,
    List<TransactionSplit> splits,
  ) async {
    await Future<void>.delayed(kDummyLatency);
    final MiaTransaction? transaction = _store.transactionById(transactionId);
    if (transaction == null) return;
    _store.replace(
      _store.transactions,
      (MiaTransaction t) => t.id == transactionId,
      transaction.copyWith(
        splits: splits,
        audit: <AuditEvent>[
          ...transaction.audit,
          AuditEvent(
            id: _store.nextId('aud'),
            actor: 'You',
            action: 'Split across ${splits.length} categories',
            timestamp: DateTime.now(),
            canUndo: true,
          ),
        ],
      ),
    );
  }

  @override
  Future<MiaTransaction> createTransaction({
    required String description,
    required double amount,
    required DateTime date,
    required String accountId,
    required String categoryId,
    required String owner,
    TransactionTreatment treatment = TransactionTreatment.normal,
    List<String> tags = const <String>[],
    String? note,
    String? billId,
    String? receiptId,
    bool sharedWithHousehold = false,
    bool isBusiness = false,
    bool isReimbursable = false,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final FinancialAccount? account = _store.accountById(accountId);
    final DateTime now = DateTime.now();

    final MiaTransaction created = MiaTransaction(
      id: _store.nextId('txn'),
      description: description,
      amount: amount,
      date: date,
      accountId: accountId,
      accountName: account?.name ?? 'Manual entry',
      // A record the user typed is posted the moment they save it; there is no
      // provider settlement to wait for.
      status: TransactionStatus.posted,
      layers: ClassificationLayers(
        providerCategory: 'Manual entry',
        providerSubcategory: 'Entered by you',
        miaCategoryId: categoryId,
        userCategoryId: categoryId,
        providerMerchant: description,
        // Nothing was mapped: the user chose the category outright.
        mappingVersion: 'manual-entry',
      ),
      owner: owner,
      treatment: treatment,
      tags: tags,
      note: note,
      billId: billId,
      receiptId: receiptId,
      visibility: sharedWithHousehold
          ? RecordVisibility.household
          : RecordVisibility.private,
      isBusiness: isBusiness,
      isReimbursable: isReimbursable,
      audit: <AuditEvent>[
        AuditEvent(
          id: _store.nextId('aud'),
          actor: owner,
          action: 'Logged this transaction by hand',
          timestamp: now,
        ),
      ],
    );

    _store.transactions.insert(0, created);
    _store.applyTransactionToTotals(created);
    return created;
  }

  @override
  Future<void> confirmReconciliation(String candidateId) async {
    await Future<void>.delayed(kDummyLatency);
    final ReconciliationCandidate? candidate = _store.reconciliationCandidates
        .firstWhereOrNull((ReconciliationCandidate c) => c.id == candidateId);
    if (candidate == null) return;

    final TransactionTreatment treatment = switch (candidate.kind) {
      ReconciliationKind.internalTransfer =>
        TransactionTreatment.internalTransfer,
      ReconciliationKind.creditCardPayment =>
        TransactionTreatment.creditCardPayment,
      ReconciliationKind.refund => TransactionTreatment.refund,
      ReconciliationKind.duplicate => TransactionTreatment.duplicate,
      ReconciliationKind.reversal => TransactionTreatment.excluded,
      ReconciliationKind.pendingToPosted => TransactionTreatment.duplicate,
    };

    for (final String id in <String>[
      candidate.primaryTransactionId,
      candidate.matchTransactionId,
    ]) {
      final MiaTransaction? transaction = _store.transactionById(id);
      if (transaction == null) continue;
      _store.applyTransactionToTotals(transaction, sign: -1);
      final MiaTransaction updated = transaction.copyWith(
        treatment: treatment,
        transferPairId: id == candidate.primaryTransactionId
            ? candidate.matchTransactionId
            : candidate.primaryTransactionId,
        audit: <AuditEvent>[
          ...transaction.audit,
          AuditEvent(
            id: _store.nextId('aud'),
            actor: 'You',
            action: 'Confirmed ${candidate.kind.label.toLowerCase()}',
            timestamp: DateTime.now(),
            canUndo: true,
          ),
        ],
      );
      _store.replace(
        _store.transactions,
        (MiaTransaction t) => t.id == id,
        updated,
      );
      _store.applyTransactionToTotals(updated);
    }

    _store.reconciliationCandidates.removeWhere(
      (ReconciliationCandidate c) => c.id == candidateId,
    );
  }

  @override
  Future<void> dismissReconciliation(String candidateId) async {
    await Future<void>.delayed(kDummyLatency);
    _store.reconciliationCandidates.removeWhere(
      (ReconciliationCandidate c) => c.id == candidateId,
    );
  }

  @override
  Future<void> linkReceipt({
    required String transactionId,
    required String receiptId,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final MiaTransaction? transaction = _store.transactionById(transactionId);
    if (transaction == null) return;
    _store.replace(
      _store.transactions,
      (MiaTransaction t) => t.id == transactionId,
      transaction.copyWith(receiptId: receiptId),
    );
  }
}

abstract class RuleRepository {
  Future<List<MiaRule>> fetchRules();

  Future<void> setPaused(String ruleId, bool paused);

  Future<void> deleteRule(String ruleId);

  Future<void> createRule(MiaRule rule);
}

@LazySingleton(as: RuleRepository)
class DummyRuleRepository implements RuleRepository {
  DummyRuleRepository(this._store);

  final MiaStore _store;

  @override
  Future<List<MiaRule>> fetchRules() async {
    await Future<void>.delayed(kDummyLatency);
    return List<MiaRule>.from(_store.rules);
  }

  @override
  Future<void> setPaused(String ruleId, bool paused) async {
    await Future<void>.delayed(kDummyLatency);
    final int index = _store.rules.indexWhere((MiaRule r) => r.id == ruleId);
    if (index == -1) return;
    final MiaRule rule = _store.rules[index];
    _store.rules[index] = MiaRule(
      id: rule.id,
      name: rule.name,
      criteria: rule.criteria,
      actions: rule.actions,
      priority: rule.priority,
      createdOn: rule.createdOn,
      matchCount: rule.matchCount,
      isPaused: paused,
      createdFromCorrection: rule.createdFromCorrection,
      lastAppliedOn: rule.lastAppliedOn,
      audit: rule.audit,
    );
  }

  @override
  Future<void> deleteRule(String ruleId) async {
    await Future<void>.delayed(kDummyLatency);
    _store.rules.removeWhere((MiaRule r) => r.id == ruleId);
  }

  @override
  Future<void> createRule(MiaRule rule) async {
    await Future<void>.delayed(kDummyLatency);
    _store.rules.add(rule);
  }
}
