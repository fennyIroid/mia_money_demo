import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/admin_models.dart';
import '../../../data/models/insight_models.dart';
import '../../../data/models/money_models.dart';
import '../../../data/models/user_models.dart';
import '../../../data/repositories/admin_repository.dart';
import '../../../data/repositories/insight_repository.dart';
import '../../../data/repositories/money_repository.dart';
import '../../../data/repositories/user_repository.dart';

part 'log_bloc.freezed.dart';
part 'log_event.dart';
part 'log_state.dart';

/// Everything a person can put into Mia by hand.
///
/// The connected data set is only ever part of the picture — cash spending, a
/// bill that has not arrived yet, money someone owes them, an asset no provider
/// reports. One bloc backs all of those forms so the pickers (accounts,
/// categories, the person's own name) are loaded once and behave the same way
/// on every one of them.
@injectable
class LogBloc extends Bloc<LogEvent, LogState> {
  LogBloc(
    this._transactionRepository,
    this._accountRepository,
    this._categoryRepository,
    this._billRepository,
    this._expectedMoneyRepository,
    this._documentRepository,
    this._vaultRepository,
    this._goalRepository,
    this._userRepository,
  ) : super(LogState.initial()) {
    on<LogStarted>(_onStarted);
    on<LogTransactionDraftChanged>(_onTransactionDraftChanged);
    on<LogTransactionSubmitted>(_onTransactionSubmitted);
    on<LogBillDraftChanged>(_onBillDraftChanged);
    on<LogBillSubmitted>(_onBillSubmitted);
    on<LogExpectedDraftChanged>(_onExpectedDraftChanged);
    on<LogExpectedSubmitted>(_onExpectedSubmitted);
    on<LogAccountDraftChanged>(_onAccountDraftChanged);
    on<LogAccountSubmitted>(_onAccountSubmitted);
    on<LogReceiptDraftChanged>(_onReceiptDraftChanged);
    on<LogReceiptSubmitted>(_onReceiptSubmitted);
    on<LogPurchaseDraftChanged>(_onPurchaseDraftChanged);
    on<LogPurchaseSubmitted>(_onPurchaseSubmitted);
    on<LogDocumentDraftChanged>(_onDocumentDraftChanged);
    on<LogDocumentSubmitted>(_onDocumentSubmitted);
    on<LogGoalMovementSubmitted>(_onGoalMovementSubmitted);
  }

  final TransactionRepository _transactionRepository;
  final AccountRepository _accountRepository;
  final CategoryRepository _categoryRepository;
  final BillRepository _billRepository;
  final ExpectedMoneyRepository _expectedMoneyRepository;
  final DocumentRepository _documentRepository;
  final VaultRepository _vaultRepository;
  final GoalRepository _goalRepository;
  final UserRepository _userRepository;

  Future<void> _onStarted(LogStarted event, Emitter<LogState> emit) async {
    emit(LogState.initial().copyWith(isSaving: false));

    final List<FinancialAccount> accounts = await _accountRepository
        .fetchAccounts();
    final List<MiaCategory> categories = await _categoryRepository
        .fetchCategories();
    final List<Goal> goals = await _goalRepository.fetchGoals();
    final List<MiaTransaction> transactions = await _transactionRepository
        .fetchTransactions(perPage: 30);
    final MiaUser user = await _userRepository.fetchCurrentUser();

    emit(
      state.copyWith(
        isReady: true,
        accounts: accounts,
        categories: categories,
        goals: goals,
        transactions: transactions,
        owner: user.firstName,
        transactionAccountId: accounts.isEmpty ? null : accounts.first.id,
        transactionToAccountId: accounts.length < 2 ? null : accounts[1].id,
        transactionCategoryId: categories.isEmpty ? null : categories.first.id,
        billPaymentAccountName: accounts.isEmpty ? null : accounts.first.name,
      ),
    );
  }

  void _onTransactionDraftChanged(
    LogTransactionDraftChanged event,
    Emitter<LogState> emit,
  ) {
    emit(
      state.copyWith(
        transactionKind: event.kind ?? state.transactionKind,
        transactionAmount: event.amount ?? state.transactionAmount,
        transactionDescription:
            event.description ?? state.transactionDescription,
        transactionDate: event.date ?? state.transactionDate,
        transactionAccountId: event.accountId ?? state.transactionAccountId,
        transactionToAccountId:
            event.toAccountId ?? state.transactionToAccountId,
        transactionCategoryId: event.categoryId ?? state.transactionCategoryId,
        transactionNote: event.note ?? state.transactionNote,
        transactionShared: event.shared ?? state.transactionShared,
        transactionBusiness: event.business ?? state.transactionBusiness,
        transactionReimbursable:
            event.reimbursable ?? state.transactionReimbursable,
      ),
    );
  }

  Future<void> _onTransactionSubmitted(
    LogTransactionSubmitted event,
    Emitter<LogState> emit,
  ) async {
    if (!state.canSaveTransaction || state.isSaving) {
      return;
    }
    emit(state.copyWith(isSaving: true));

    final bool isTransfer = state.transactionKind == LoggedMoneyKind.transfer;
    final double magnitude = state.transactionAmount.abs();
    final String description = state.transactionDescription.trim();

    if (isTransfer) {
      // A transfer is two records, both excluded from spending and income, so
      // moving money between your own accounts never reads as either.
      final FinancialAccount to = state.accounts.firstWhere(
        (FinancialAccount a) => a.id == state.transactionToAccountId,
      );
      final FinancialAccount from = state.accounts.firstWhere(
        (FinancialAccount a) => a.id == state.transactionAccountId,
      );

      final MiaTransaction out = await _transactionRepository.createTransaction(
        description: description.isEmpty
            ? 'Transfer to ${to.name}'
            : description,
        amount: -magnitude,
        date: state.transactionDate,
        accountId: from.id,
        categoryId: state.transactionCategoryId!,
        owner: state.owner,
        treatment: TransactionTreatment.internalTransfer,
        note: state.transactionNote,
        sharedWithHousehold: state.transactionShared,
      );
      await _transactionRepository.createTransaction(
        description: description.isEmpty
            ? 'Transfer from ${from.name}'
            : description,
        amount: magnitude,
        date: state.transactionDate,
        accountId: to.id,
        categoryId: state.transactionCategoryId!,
        owner: state.owner,
        treatment: TransactionTreatment.internalTransfer,
        note: state.transactionNote,
        sharedWithHousehold: state.transactionShared,
      );

      emit(state.copyWith(isSaving: false, createdTransaction: out));
      return;
    }

    final MiaTransaction created = await _transactionRepository
        .createTransaction(
          description: description,
          amount: state.transactionKind == LoggedMoneyKind.income
              ? magnitude
              : -magnitude,
          date: state.transactionDate,
          accountId: state.transactionAccountId!,
          categoryId: state.transactionCategoryId!,
          owner: state.owner,
          note: state.transactionNote,
          sharedWithHousehold: state.transactionShared,
          isBusiness: state.transactionBusiness,
          isReimbursable: state.transactionReimbursable,
        );

    emit(state.copyWith(isSaving: false, createdTransaction: created));
  }

  void _onBillDraftChanged(LogBillDraftChanged event, Emitter<LogState> emit) {
    emit(
      state.copyWith(
        billProvider: event.provider ?? state.billProvider,
        billKind: event.kind ?? state.billKind,
        billAmount: event.amount ?? state.billAmount,
        billDueDate: event.dueDate ?? state.billDueDate,
        billFrequency: event.frequency ?? state.billFrequency,
        billPaymentAccountName:
            event.paymentAccountName ?? state.billPaymentAccountName,
        billAutopay: event.autopay ?? state.billAutopay,
        billShared: event.shared ?? state.billShared,
      ),
    );
  }

  Future<void> _onBillSubmitted(
    LogBillSubmitted event,
    Emitter<LogState> emit,
  ) async {
    if (!state.canSaveBill || state.isSaving) {
      return;
    }
    emit(state.copyWith(isSaving: true));

    final Bill created = await _billRepository.createBill(
      provider: state.billProvider.trim(),
      kind: state.billKind,
      amount: state.billAmount,
      dueDate: state.billDueDate,
      frequency: state.billFrequency,
      owner: state.owner,
      paymentAccountName: state.billPaymentAccountName,
      isAutopay: state.billAutopay,
      sharedWithHousehold: state.billShared,
    );

    emit(state.copyWith(isSaving: false, createdBill: created));
  }

  void _onExpectedDraftChanged(
    LogExpectedDraftChanged event,
    Emitter<LogState> emit,
  ) {
    emit(
      state.copyWith(
        expectedKind: event.kind ?? state.expectedKind,
        expectedCounterparty: event.counterparty ?? state.expectedCounterparty,
        expectedAmount: event.amount ?? state.expectedAmount,
        expectedDate: event.expectedDate ?? state.expectedDate,
        expectedNote: event.note ?? state.expectedNote,
        expectedShared: event.shared ?? state.expectedShared,
      ),
    );
  }

  Future<void> _onExpectedSubmitted(
    LogExpectedSubmitted event,
    Emitter<LogState> emit,
  ) async {
    if (!state.canSaveExpected || state.isSaving) {
      return;
    }
    emit(state.copyWith(isSaving: true));

    final ExpectedMoney created = await _expectedMoneyRepository
        .createExpectedMoney(
          kind: state.expectedKind,
          counterparty: state.expectedCounterparty.trim(),
          amount: state.expectedAmount,
          expectedDate: state.expectedDate,
          owner: state.owner,
          note: state.expectedNote,
          sharedWithHousehold: state.expectedShared,
        );

    emit(state.copyWith(isSaving: false, createdExpected: created));
  }

  void _onAccountDraftChanged(
    LogAccountDraftChanged event,
    Emitter<LogState> emit,
  ) {
    emit(
      state.copyWith(
        accountName: event.name ?? state.accountName,
        accountInstitution: event.institution ?? state.accountInstitution,
        accountType: event.type ?? state.accountType,
        accountBalance: event.balance ?? state.accountBalance,
        accountShared: event.shared ?? state.accountShared,
      ),
    );
  }

  Future<void> _onAccountSubmitted(
    LogAccountSubmitted event,
    Emitter<LogState> emit,
  ) async {
    if (!state.canSaveAccount || state.isSaving) {
      return;
    }
    emit(state.copyWith(isSaving: true));

    final FinancialAccount created = await _accountRepository.createAccount(
      name: state.accountName.trim(),
      institution: state.accountInstitution.trim().isEmpty
          ? 'Kept by you'
          : state.accountInstitution.trim(),
      type: state.accountType,
      balance: state.accountBalance,
      owner: state.owner,
      sharedWithHousehold: state.accountShared,
    );

    emit(state.copyWith(isSaving: false, createdAccount: created));
  }

  void _onReceiptDraftChanged(
    LogReceiptDraftChanged event,
    Emitter<LogState> emit,
  ) {
    emit(
      state.copyWith(
        receiptMerchant: event.merchant ?? state.receiptMerchant,
        receiptTotal: event.total ?? state.receiptTotal,
        receiptGst: event.gst ?? state.receiptGst,
        receiptDate: event.date ?? state.receiptDate,
        receiptNumber: event.number ?? state.receiptNumber,
        receiptTransactionId: event.transactionId ?? state.receiptTransactionId,
      ),
    );
  }

  Future<void> _onReceiptSubmitted(
    LogReceiptSubmitted event,
    Emitter<LogState> emit,
  ) async {
    if (!state.canSaveReceipt || state.isSaving) {
      return;
    }
    emit(state.copyWith(isSaving: true));

    final Receipt created = await _documentRepository.createReceipt(
      merchant: state.receiptMerchant.trim(),
      purchaseDate: state.receiptDate,
      total: state.receiptTotal,
      owner: state.owner,
      gst: state.receiptGst == 0 ? null : state.receiptGst,
      receiptNumber: state.receiptNumber,
    );

    // Attaching on save is what makes the receipt evidence for a figure rather
    // than a loose file.
    if (state.receiptTransactionId != null) {
      await _documentRepository.attachReceipt(
        receiptId: created.id,
        transactionId: state.receiptTransactionId!,
      );
    }

    emit(state.copyWith(isSaving: false, createdReceipt: created));
  }

  void _onPurchaseDraftChanged(
    LogPurchaseDraftChanged event,
    Emitter<LogState> emit,
  ) {
    emit(
      state.copyWith(
        purchaseItemName: event.itemName ?? state.purchaseItemName,
        purchaseRetailer: event.retailer ?? state.purchaseRetailer,
        purchaseAmount: event.amount ?? state.purchaseAmount,
        purchaseDate: event.date ?? state.purchaseDate,
        purchaseWarrantyMonths:
            event.warrantyMonths ?? state.purchaseWarrantyMonths,
        purchaseSerial: event.serialNumber ?? state.purchaseSerial,
        purchaseNote: event.note ?? state.purchaseNote,
      ),
    );
  }

  Future<void> _onPurchaseSubmitted(
    LogPurchaseSubmitted event,
    Emitter<LogState> emit,
  ) async {
    if (!state.canSavePurchase || state.isSaving) {
      return;
    }
    emit(state.copyWith(isSaving: true));

    final PurchaseRecord created = await _vaultRepository.createPurchase(
      itemName: state.purchaseItemName.trim(),
      retailer: state.purchaseRetailer.trim(),
      purchaseDate: state.purchaseDate,
      owner: state.owner,
      amount: state.purchaseAmount == 0 ? null : state.purchaseAmount,
      warrantyMonths: state.purchaseWarrantyMonths,
      serialNumber: state.purchaseSerial,
      note: state.purchaseNote,
    );

    emit(state.copyWith(isSaving: false, createdPurchase: created));
  }

  void _onDocumentDraftChanged(
    LogDocumentDraftChanged event,
    Emitter<LogState> emit,
  ) {
    emit(
      state.copyWith(
        documentName: event.name ?? state.documentName,
        documentKind: event.kind ?? state.documentKind,
        documentFileType: event.fileType ?? state.documentFileType,
        documentSizeKb: event.sizeKb ?? state.documentSizeKb,
        documentCoverage: event.coveragePeriod ?? state.documentCoverage,
      ),
    );
  }

  Future<void> _onDocumentSubmitted(
    LogDocumentSubmitted event,
    Emitter<LogState> emit,
  ) async {
    if (!state.canSaveDocument || state.isSaving) {
      return;
    }
    emit(state.copyWith(isSaving: true));

    final MiaDocument created = await _documentRepository.createDocument(
      name: state.documentName.trim(),
      kind: state.documentKind,
      owner: state.owner,
      fileType: state.documentFileType,
      sizeKb: state.documentSizeKb,
      coveragePeriod: state.documentCoverage.trim().isEmpty
          ? null
          : state.documentCoverage,
    );

    emit(state.copyWith(isSaving: false, createdDocument: created));
  }

  Future<void> _onGoalMovementSubmitted(
    LogGoalMovementSubmitted event,
    Emitter<LogState> emit,
  ) async {
    if (state.isSaving) {
      return;
    }
    emit(state.copyWith(isSaving: true));

    final Goal updated = await _goalRepository.recordMovement(
      goalId: event.goalId,
      amount: event.amount,
      label: event.label,
    );

    emit(
      state.copyWith(
        isSaving: false,
        goals: await _goalRepository.fetchGoals(),
        updatedGoal: updated,
      ),
    );
  }
}
