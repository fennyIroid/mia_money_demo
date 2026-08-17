import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'core_models.dart';

enum AccountType {
  transaction,
  savings,
  offset,
  creditCard,
  homeLoan,
  personalLoan,
  superannuation,
  investment,
  property,
  vehicle,
  cash,
  otherAsset,
  otherLiability,
}

extension AccountTypeX on AccountType {
  String get label {
    switch (this) {
      case AccountType.transaction:
        return 'Transaction';
      case AccountType.savings:
        return 'Savings';
      case AccountType.offset:
        return 'Offset';
      case AccountType.creditCard:
        return 'Credit card';
      case AccountType.homeLoan:
        return 'Home loan';
      case AccountType.personalLoan:
        return 'Personal loan';
      case AccountType.superannuation:
        return 'Superannuation';
      case AccountType.investment:
        return 'Investments';
      case AccountType.property:
        return 'Property';
      case AccountType.vehicle:
        return 'Vehicle';
      case AccountType.cash:
        return 'Cash';
      case AccountType.otherAsset:
        return 'Other asset';
      case AccountType.otherLiability:
        return 'Other liability';
    }
  }

  IconData get icon {
    switch (this) {
      case AccountType.transaction:
        return Icons.account_balance_wallet_rounded;
      case AccountType.savings:
        return Icons.savings_rounded;
      case AccountType.offset:
        return Icons.compare_arrows_rounded;
      case AccountType.creditCard:
        return Icons.credit_card_rounded;
      case AccountType.homeLoan:
        return Icons.house_rounded;
      case AccountType.personalLoan:
        return Icons.request_quote_rounded;
      case AccountType.superannuation:
        return Icons.elderly_rounded;
      case AccountType.investment:
        return Icons.trending_up_rounded;
      case AccountType.property:
        return Icons.apartment_rounded;
      case AccountType.vehicle:
        return Icons.directions_car_rounded;
      case AccountType.cash:
        return Icons.payments_rounded;
      case AccountType.otherAsset:
        return Icons.category_rounded;
      case AccountType.otherLiability:
        return Icons.money_off_rounded;
    }
  }

  bool get isLiability =>
      this == AccountType.creditCard ||
      this == AccountType.homeLoan ||
      this == AccountType.personalLoan ||
      this == AccountType.otherLiability;
}

@immutable
class BalanceSnapshot {
  const BalanceSnapshot({
    required this.date,
    required this.amount,
    required this.source,
  });

  final DateTime date;
  final double amount;
  final ValueSource source;
}

@immutable
class FinancialAccount {
  const FinancialAccount({
    required this.id,
    required this.name,
    required this.institution,
    required this.type,
    required this.balance,
    required this.owner,
    required this.source,
    required this.freshness,
    this.availableBalance,
    this.accountNumberMasked,
    this.visibility = RecordVisibility.private,
    this.balanceAsOf,
    this.history = const <BalanceSnapshot>[],
    this.isArchived = false,
    this.creditLimit,
    this.interestRate,
    this.coverageNote,
    this.isConnected = true,
  });

  final String id;
  final String name;
  final String institution;
  final AccountType type;
  final double balance;
  final String owner;
  final ValueSource source;
  final DataFreshness freshness;
  final double? availableBalance;
  final String? accountNumberMasked;
  final RecordVisibility visibility;
  final DateTime? balanceAsOf;
  final List<BalanceSnapshot> history;
  final bool isArchived;
  final double? creditLimit;
  final double? interestRate;
  final String? coverageNote;
  final bool isConnected;

  bool get isLiability => type.isLiability;

  FinancialAccount copyWith({
    String? name,
    String? institution,
    AccountType? type,
    double? balance,
    double? availableBalance,
    ValueSource? source,
    DataFreshness? freshness,
    DateTime? balanceAsOf,
    List<BalanceSnapshot>? history,
    bool? isArchived,
    RecordVisibility? visibility,
    String? coverageNote,
    bool? isConnected,
  }) {
    return FinancialAccount(
      id: id,
      name: name ?? this.name,
      institution: institution ?? this.institution,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      owner: owner,
      source: source ?? this.source,
      freshness: freshness ?? this.freshness,
      availableBalance: availableBalance ?? this.availableBalance,
      accountNumberMasked: accountNumberMasked,
      visibility: visibility ?? this.visibility,
      balanceAsOf: balanceAsOf ?? this.balanceAsOf,
      history: history ?? this.history,
      isArchived: isArchived ?? this.isArchived,
      creditLimit: creditLimit,
      interestRate: interestRate,
      coverageNote: coverageNote ?? this.coverageNote,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}

@immutable
class MiaCategory {
  const MiaCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.parentId,
    this.isArchived = false,
    this.isUserCreated = false,
    this.transactionCount = 0,
    this.monthTotal = 0,
  });

  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final String? parentId;
  final bool isArchived;
  final bool isUserCreated;
  final int transactionCount;
  final double monthTotal;

  bool get isSubcategory => parentId != null;

  MiaCategory copyWith({
    String? name,
    IconData? icon,
    Color? color,
    String? parentId,
    bool? isArchived,
    bool? isUserCreated,
    int? transactionCount,
    double? monthTotal,
  }) {
    return MiaCategory(
      id: id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      parentId: parentId ?? this.parentId,
      isArchived: isArchived ?? this.isArchived,
      isUserCreated: isUserCreated ?? this.isUserCreated,
      transactionCount: transactionCount ?? this.transactionCount,
      monthTotal: monthTotal ?? this.monthTotal,
    );
  }
}

enum TransactionStatus { pending, posted, reversed, disputed }

extension TransactionStatusX on TransactionStatus {
  String get label {
    switch (this) {
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.posted:
        return 'Posted';
      case TransactionStatus.reversed:
        return 'Reversed';
      case TransactionStatus.disputed:
        return 'Disputed';
    }
  }

  Color get color {
    switch (this) {
      case TransactionStatus.pending:
        return AppColors.caution;
      case TransactionStatus.posted:
        return AppColors.positive;
      case TransactionStatus.reversed:
        return AppColors.violetHaze;
      case TransactionStatus.disputed:
        return AppColors.negative;
    }
  }
}

/// Special financial treatments the deterministic engine must respect.
enum TransactionTreatment {
  normal,
  internalTransfer,
  creditCardPayment,
  refund,
  reimbursement,
  loanProceeds,
  cashAdvance,
  investmentProceeds,
  duplicate,
  excluded,
}

extension TransactionTreatmentX on TransactionTreatment {
  String get label {
    switch (this) {
      case TransactionTreatment.normal:
        return 'Counted normally';
      case TransactionTreatment.internalTransfer:
        return 'Internal transfer';
      case TransactionTreatment.creditCardPayment:
        return 'Card repayment';
      case TransactionTreatment.refund:
        return 'Refund';
      case TransactionTreatment.reimbursement:
        return 'Reimbursement';
      case TransactionTreatment.loanProceeds:
        return 'Loan proceeds';
      case TransactionTreatment.cashAdvance:
        return 'Cash advance';
      case TransactionTreatment.investmentProceeds:
        return 'Investment proceeds';
      case TransactionTreatment.duplicate:
        return 'Duplicate';
      case TransactionTreatment.excluded:
        return 'Excluded by you';
    }
  }

  bool get excludedFromSpending =>
      this == TransactionTreatment.internalTransfer ||
      this == TransactionTreatment.creditCardPayment ||
      this == TransactionTreatment.duplicate ||
      this == TransactionTreatment.excluded;

  bool get excludedFromIncome =>
      this == TransactionTreatment.internalTransfer ||
      this == TransactionTreatment.refund ||
      this == TransactionTreatment.reimbursement ||
      this == TransactionTreatment.loanProceeds ||
      this == TransactionTreatment.cashAdvance ||
      this == TransactionTreatment.investmentProceeds ||
      this == TransactionTreatment.duplicate;
}

@immutable
class TransactionSplit {
  const TransactionSplit({
    required this.id,
    required this.amount,
    required this.categoryId,
    this.tags = const <String>[],
    this.note,
    this.owner,
    this.linkedGoalId,
    this.isReimbursable = false,
  });

  final String id;
  final double amount;
  final String categoryId;
  final List<String> tags;
  final String? note;
  final String? owner;
  final String? linkedGoalId;
  final bool isReimbursable;
}

/// The three-layer classification model from the brief: provider evidence, Mia's
/// mapping, and the user's confirmed value — all retained side by side.
@immutable
class ClassificationLayers {
  const ClassificationLayers({
    required this.providerCategory,
    required this.providerSubcategory,
    required this.miaCategoryId,
    this.miaSubcategoryId,
    this.userCategoryId,
    this.providerMerchant,
    this.normalisedMerchant,
    this.userMerchantAlias,
    this.mappingVersion = 'map-2026.05.1',
    this.providerConfidence,
  });

  final String providerCategory;
  final String providerSubcategory;
  final String miaCategoryId;
  final String? miaSubcategoryId;
  final String? userCategoryId;
  final String? providerMerchant;
  final String? normalisedMerchant;
  final String? userMerchantAlias;
  final String mappingVersion;
  final double? providerConfidence;

  /// User confirmation always wins for display and calculation.
  String get effectiveCategoryId => userCategoryId ?? miaCategoryId;

  ValueSource get effectiveSource => userCategoryId != null
      ? ValueSource.userConfirmed
      : ValueSource.miaMapped;
}

@immutable
class MiaTransaction {
  const MiaTransaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.accountId,
    required this.accountName,
    required this.status,
    required this.layers,
    required this.owner,
    this.treatment = TransactionTreatment.normal,
    this.splits = const <TransactionSplit>[],
    this.tags = const <String>[],
    this.note,
    this.receiptId,
    this.billId,
    this.recurringId,
    this.transferPairId,
    this.refundPairId,
    this.assignedTo,
    this.reviewStatus,
    this.visibility = RecordVisibility.private,
    this.isBusiness = false,
    this.isReimbursable = false,
    this.possibleDuplicateOf,
    this.audit = const <AuditEvent>[],
    this.comments = const <RecordComment>[],
    this.importBatchId,
  });

  final String id;
  final String description;

  /// Negative for money out, positive for money in.
  final double amount;
  final DateTime date;
  final String accountId;
  final String accountName;
  final TransactionStatus status;
  final ClassificationLayers layers;
  final String owner;
  final TransactionTreatment treatment;
  final List<TransactionSplit> splits;
  final List<String> tags;
  final String? note;
  final String? receiptId;
  final String? billId;
  final String? recurringId;
  final String? transferPairId;
  final String? refundPairId;
  final String? assignedTo;
  final String? reviewStatus;
  final RecordVisibility visibility;
  final bool isBusiness;
  final bool isReimbursable;
  final String? possibleDuplicateOf;
  final List<AuditEvent> audit;
  final List<RecordComment> comments;
  final String? importBatchId;

  bool get isCredit => amount > 0;

  bool get isSplit => splits.isNotEmpty;

  String get merchantDisplay =>
      layers.userMerchantAlias ??
      layers.normalisedMerchant ??
      layers.providerMerchant ??
      description;

  bool get countsAsSpending => !isCredit && !treatment.excludedFromSpending;

  bool get countsAsIncome => isCredit && !treatment.excludedFromIncome;

  MiaTransaction copyWith({
    String? description,
    double? amount,
    DateTime? date,
    TransactionStatus? status,
    ClassificationLayers? layers,
    TransactionTreatment? treatment,
    List<TransactionSplit>? splits,
    List<String>? tags,
    String? note,
    String? receiptId,
    String? billId,
    String? transferPairId,
    String? refundPairId,
    String? assignedTo,
    RecordVisibility? visibility,
    bool? isBusiness,
    bool? isReimbursable,
    List<AuditEvent>? audit,
    List<RecordComment>? comments,
  }) {
    return MiaTransaction(
      id: id,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      accountId: accountId,
      accountName: accountName,
      status: status ?? this.status,
      layers: layers ?? this.layers,
      owner: owner,
      treatment: treatment ?? this.treatment,
      splits: splits ?? this.splits,
      tags: tags ?? this.tags,
      note: note ?? this.note,
      receiptId: receiptId ?? this.receiptId,
      billId: billId ?? this.billId,
      recurringId: recurringId,
      transferPairId: transferPairId ?? this.transferPairId,
      refundPairId: refundPairId ?? this.refundPairId,
      assignedTo: assignedTo ?? this.assignedTo,
      reviewStatus: reviewStatus,
      visibility: visibility ?? this.visibility,
      isBusiness: isBusiness ?? this.isBusiness,
      isReimbursable: isReimbursable ?? this.isReimbursable,
      possibleDuplicateOf: possibleDuplicateOf,
      audit: audit ?? this.audit,
      comments: comments ?? this.comments,
      importBatchId: importBatchId,
    );
  }
}

/// A candidate pair Mia found but has not had confirmed.
@immutable
class ReconciliationCandidate {
  const ReconciliationCandidate({
    required this.id,
    required this.kind,
    required this.primaryTransactionId,
    required this.matchTransactionId,
    required this.confidence,
    required this.reason,
    this.calculationImpact,
  });

  final String id;
  final ReconciliationKind kind;
  final String primaryTransactionId;
  final String matchTransactionId;
  final double confidence;
  final String reason;
  final String? calculationImpact;
}

enum ReconciliationKind {
  internalTransfer,
  refund,
  duplicate,
  pendingToPosted,
  creditCardPayment,
  reversal,
}

extension ReconciliationKindX on ReconciliationKind {
  String get label {
    switch (this) {
      case ReconciliationKind.internalTransfer:
        return 'Internal transfer pair';
      case ReconciliationKind.refund:
        return 'Refund match';
      case ReconciliationKind.duplicate:
        return 'Duplicate';
      case ReconciliationKind.pendingToPosted:
        return 'Pending became posted';
      case ReconciliationKind.creditCardPayment:
        return 'Card repayment';
      case ReconciliationKind.reversal:
        return 'Reversal';
    }
  }

  IconData get icon {
    switch (this) {
      case ReconciliationKind.internalTransfer:
        return Icons.sync_alt_rounded;
      case ReconciliationKind.refund:
        return Icons.replay_rounded;
      case ReconciliationKind.duplicate:
        return Icons.copy_all_rounded;
      case ReconciliationKind.pendingToPosted:
        return Icons.published_with_changes_rounded;
      case ReconciliationKind.creditCardPayment:
        return Icons.credit_score_rounded;
      case ReconciliationKind.reversal:
        return Icons.undo_rounded;
    }
  }
}

enum RuleCriterionField {
  originalMerchant,
  normalisedMerchant,
  keyword,
  amount,
  amountRange,
  account,
  category,
  dayOfWeek,
  member,
  frequency,
  transactionType,
}

extension RuleCriterionFieldX on RuleCriterionField {
  String get label {
    switch (this) {
      case RuleCriterionField.originalMerchant:
        return 'Original merchant';
      case RuleCriterionField.normalisedMerchant:
        return 'Normalised merchant';
      case RuleCriterionField.keyword:
        return 'Description keyword';
      case RuleCriterionField.amount:
        return 'Amount';
      case RuleCriterionField.amountRange:
        return 'Amount range';
      case RuleCriterionField.account:
        return 'Account';
      case RuleCriterionField.category:
        return 'Category';
      case RuleCriterionField.dayOfWeek:
        return 'Day';
      case RuleCriterionField.member:
        return 'Member';
      case RuleCriterionField.frequency:
        return 'Frequency';
      case RuleCriterionField.transactionType:
        return 'Type';
    }
  }
}

enum RuleActionKind {
  renameMerchant,
  categorise,
  subcategorise,
  addTags,
  assignOwner,
  assignReviewer,
  markTransfer,
  markRecurring,
  exclude,
  split,
  linkBill,
  flagForAttention,
}

extension RuleActionKindX on RuleActionKind {
  String get label {
    switch (this) {
      case RuleActionKind.renameMerchant:
        return 'Rename merchant';
      case RuleActionKind.categorise:
        return 'Set category';
      case RuleActionKind.subcategorise:
        return 'Set subcategory';
      case RuleActionKind.addTags:
        return 'Add tags';
      case RuleActionKind.assignOwner:
        return 'Assign owner';
      case RuleActionKind.assignReviewer:
        return 'Assign reviewer';
      case RuleActionKind.markTransfer:
        return 'Mark as transfer';
      case RuleActionKind.markRecurring:
        return 'Mark recurring';
      case RuleActionKind.exclude:
        return 'Exclude from spending';
      case RuleActionKind.split:
        return 'Split transaction';
      case RuleActionKind.linkBill:
        return 'Link a bill';
      case RuleActionKind.flagForAttention:
        return 'Flag for attention';
    }
  }
}

@immutable
class RuleCriterion {
  const RuleCriterion({
    required this.field,
    required this.value,
    this.secondValue,
  });

  final RuleCriterionField field;
  final String value;
  final String? secondValue;

  String get display => secondValue == null
      ? '${field.label} is $value'
      : '${field.label} $value – $secondValue';
}

@immutable
class RuleAction {
  const RuleAction({required this.kind, required this.value});

  final RuleActionKind kind;
  final String value;

  String get display => '${kind.label} → $value';
}

@immutable
class MiaRule {
  const MiaRule({
    required this.id,
    required this.name,
    required this.criteria,
    required this.actions,
    required this.priority,
    required this.createdOn,
    required this.matchCount,
    this.isPaused = false,
    this.createdFromCorrection = true,
    this.lastAppliedOn,
    this.audit = const <AuditEvent>[],
  });

  final String id;
  final String name;
  final List<RuleCriterion> criteria;
  final List<RuleAction> actions;
  final int priority;
  final DateTime createdOn;
  final int matchCount;
  final bool isPaused;
  final bool createdFromCorrection;
  final DateTime? lastAppliedOn;
  final List<AuditEvent> audit;
}
