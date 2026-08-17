part of 'log_bloc.dart';

@freezed
abstract class LogEvent with _$LogEvent {
  /// Loads the pickers every form needs and clears any previous draft.
  const factory LogEvent.started() = LogStarted;

  const factory LogEvent.transactionDraftChanged({
    LoggedMoneyKind? kind,
    double? amount,
    String? description,
    DateTime? date,
    String? accountId,
    String? toAccountId,
    String? categoryId,
    String? note,
    bool? shared,
    bool? business,
    bool? reimbursable,
  }) = LogTransactionDraftChanged;

  const factory LogEvent.transactionSubmitted() = LogTransactionSubmitted;

  const factory LogEvent.billDraftChanged({
    String? provider,
    ObligationKind? kind,
    double? amount,
    DateTime? dueDate,
    RecurrenceFrequency? frequency,
    String? paymentAccountName,
    bool? autopay,
    bool? shared,
  }) = LogBillDraftChanged;

  const factory LogEvent.billSubmitted() = LogBillSubmitted;

  const factory LogEvent.expectedDraftChanged({
    ExpectedMoneyKind? kind,
    String? counterparty,
    double? amount,
    DateTime? expectedDate,
    String? note,
    bool? shared,
  }) = LogExpectedDraftChanged;

  const factory LogEvent.expectedSubmitted() = LogExpectedSubmitted;

  const factory LogEvent.accountDraftChanged({
    String? name,
    String? institution,
    AccountType? type,
    double? balance,
    bool? shared,
  }) = LogAccountDraftChanged;

  const factory LogEvent.accountSubmitted() = LogAccountSubmitted;

  const factory LogEvent.receiptDraftChanged({
    String? merchant,
    double? total,
    double? gst,
    DateTime? date,
    String? number,
    String? transactionId,
  }) = LogReceiptDraftChanged;

  const factory LogEvent.receiptSubmitted() = LogReceiptSubmitted;

  const factory LogEvent.purchaseDraftChanged({
    String? itemName,
    String? retailer,
    double? amount,
    DateTime? date,
    int? warrantyMonths,
    String? serialNumber,
    String? note,
  }) = LogPurchaseDraftChanged;

  const factory LogEvent.purchaseSubmitted() = LogPurchaseSubmitted;

  const factory LogEvent.documentDraftChanged({
    String? name,
    DocumentKind? kind,
    String? fileType,
    int? sizeKb,
    String? coveragePeriod,
  }) = LogDocumentDraftChanged;

  const factory LogEvent.documentSubmitted() = LogDocumentSubmitted;

  const factory LogEvent.goalMovementSubmitted({
    required String goalId,
    required double amount,
    required String label,
  }) = LogGoalMovementSubmitted;
}
