part of 'log_bloc.dart';

/// What a hand-entered money record is: money out, money in, or a move between
/// the person's own accounts.
enum LoggedMoneyKind { expense, income, transfer }

extension LoggedMoneyKindX on LoggedMoneyKind {
  String get label {
    switch (this) {
      case LoggedMoneyKind.expense:
        return 'Money out';
      case LoggedMoneyKind.income:
        return 'Money in';
      case LoggedMoneyKind.transfer:
        return 'Transfer';
    }
  }

  IconData get icon {
    switch (this) {
      case LoggedMoneyKind.expense:
        return Icons.call_made_rounded;
      case LoggedMoneyKind.income:
        return Icons.call_received_rounded;
      case LoggedMoneyKind.transfer:
        return Icons.sync_alt_rounded;
    }
  }
}

@freezed
abstract class LogState with _$LogState {
  const factory LogState({
    required bool isReady,
    required bool isSaving,
    required String owner,
    required List<FinancialAccount> accounts,
    required List<MiaCategory> categories,
    required List<Goal> goals,

    /// Recent ledger rows, so a receipt can be attached to what it pays for.
    required List<MiaTransaction> transactions,

    // Transaction draft
    required LoggedMoneyKind transactionKind,
    required double transactionAmount,
    required String transactionDescription,
    required DateTime transactionDate,
    required bool transactionShared,
    required bool transactionBusiness,
    required bool transactionReimbursable,
    String? transactionAccountId,
    String? transactionToAccountId,
    String? transactionCategoryId,
    String? transactionNote,

    // Bill draft
    required String billProvider,
    required ObligationKind billKind,
    required double billAmount,
    required DateTime billDueDate,
    required RecurrenceFrequency billFrequency,
    required bool billAutopay,
    required bool billShared,
    String? billPaymentAccountName,

    // Expected money draft
    required ExpectedMoneyKind expectedKind,
    required String expectedCounterparty,
    required double expectedAmount,
    required DateTime expectedDate,
    required bool expectedShared,
    String? expectedNote,

    // Account draft
    required String accountName,
    required String accountInstitution,
    required AccountType accountType,
    required double accountBalance,
    required bool accountShared,

    // Receipt draft
    required String receiptMerchant,
    required double receiptTotal,
    required double receiptGst,
    required DateTime receiptDate,
    String? receiptNumber,
    String? receiptTransactionId,

    // Purchase draft
    required String purchaseItemName,
    required String purchaseRetailer,
    required double purchaseAmount,
    required DateTime purchaseDate,
    int? purchaseWarrantyMonths,
    String? purchaseSerial,
    String? purchaseNote,

    // Document draft
    required String documentName,
    required DocumentKind documentKind,
    required String documentFileType,
    required int documentSizeKb,
    required String documentCoverage,

    // Results
    MiaTransaction? createdTransaction,
    Bill? createdBill,
    ExpectedMoney? createdExpected,
    FinancialAccount? createdAccount,
    Receipt? createdReceipt,
    PurchaseRecord? createdPurchase,
    MiaDocument? createdDocument,
    Goal? updatedGoal,
  }) = _LogState;

  factory LogState.initial() {
    final DateTime now = DateTime.now();
    return LogState(
      isReady: false,
      isSaving: false,
      owner: 'You',
      accounts: const <FinancialAccount>[],
      categories: const <MiaCategory>[],
      goals: const <Goal>[],
      transactions: const <MiaTransaction>[],
      transactionKind: LoggedMoneyKind.expense,
      transactionAmount: 0,
      transactionDescription: '',
      transactionDate: now,
      transactionShared: false,
      transactionBusiness: false,
      transactionReimbursable: false,
      billProvider: '',
      billKind: ObligationKind.bill,
      billAmount: 0,
      billDueDate: now.add(const Duration(days: 14)),
      billFrequency: RecurrenceFrequency.monthly,
      billAutopay: false,
      billShared: false,
      expectedKind: ExpectedMoneyKind.reimbursement,
      expectedCounterparty: '',
      expectedAmount: 0,
      expectedDate: now.add(const Duration(days: 21)),
      expectedShared: false,
      accountName: '',
      accountInstitution: '',
      accountType: AccountType.cash,
      accountBalance: 0,
      accountShared: false,
      receiptMerchant: '',
      receiptTotal: 0,
      receiptGst: 0,
      receiptDate: now,
      purchaseItemName: '',
      purchaseRetailer: '',
      purchaseAmount: 0,
      purchaseDate: now,
      documentName: '',
      documentKind: DocumentKind.statement,
      documentFileType: 'PDF',
      documentSizeKb: 0,
      documentCoverage: '',
    );
  }
}

extension LogStateX on LogState {
  bool get isTransfer => transactionKind == LoggedMoneyKind.transfer;

  bool get canSaveTransaction =>
      transactionAmount > 0 &&
      transactionAccountId != null &&
      transactionCategoryId != null &&
      (isTransfer
          ? transactionToAccountId != null &&
                transactionToAccountId != transactionAccountId
          : transactionDescription.trim().isNotEmpty);

  bool get canSaveBill => billProvider.trim().isNotEmpty && billAmount > 0;

  bool get canSaveExpected =>
      expectedCounterparty.trim().isNotEmpty && expectedAmount > 0;

  bool get canSaveAccount => accountName.trim().isNotEmpty;

  bool get canSaveReceipt =>
      receiptMerchant.trim().isNotEmpty && receiptTotal > 0;

  bool get canSavePurchase =>
      purchaseItemName.trim().isNotEmpty && purchaseRetailer.trim().isNotEmpty;

  bool get canSaveDocument => documentName.trim().isNotEmpty;

  List<MiaCategory> get selectableCategories =>
      categories.where((MiaCategory c) => !c.isArchived).toList();

  FinancialAccount? get transactionAccount =>
      _accountById(transactionAccountId);

  FinancialAccount? get transactionToAccount =>
      _accountById(transactionToAccountId);

  MiaCategory? get transactionCategory {
    for (final MiaCategory category in categories) {
      if (category.id == transactionCategoryId) return category;
    }
    return null;
  }

  FinancialAccount? _accountById(String? id) {
    if (id == null) return null;
    for (final FinancialAccount account in accounts) {
      if (account.id == id) return account;
    }
    return null;
  }

  /// What the account balance becomes once this entry is saved. Shown on the
  /// form so a manual entry is never a blind write.
  double? get projectedBalance {
    final FinancialAccount? account = transactionAccount;
    if (account == null || transactionAmount <= 0) return null;
    final double signed = transactionKind == LoggedMoneyKind.income
        ? transactionAmount
        : -transactionAmount;
    return account.balance + signed;
  }

  double get billMonthlyEquivalent => billAmount * billFrequency.perYear / 12;
}
