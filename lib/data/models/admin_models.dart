import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'core_models.dart';

/// Lifecycle stages of the Financial Admin Inbox.
enum InboxStage {
  newItem,
  processing,
  needsReview,
  assignedWaiting,
  confirmed,
  comingUp,
  handled,
  exception,
}

extension InboxStageX on InboxStage {
  String get label {
    switch (this) {
      case InboxStage.newItem:
        return 'New';
      case InboxStage.processing:
        return 'Processing';
      case InboxStage.needsReview:
        return 'Needs review';
      case InboxStage.assignedWaiting:
        return 'Waiting';
      case InboxStage.confirmed:
        return 'Confirmed';
      case InboxStage.comingUp:
        return 'Coming up';
      case InboxStage.handled:
        return 'Handled';
      case InboxStage.exception:
        return 'Exception';
    }
  }

  Color get color {
    switch (this) {
      case InboxStage.newItem:
        return AppColors.glacier;
      case InboxStage.processing:
        return AppColors.lagoon;
      case InboxStage.needsReview:
        return AppColors.ember;
      case InboxStage.assignedWaiting:
        return AppColors.violetHaze;
      case InboxStage.confirmed:
        return AppColors.positive;
      case InboxStage.comingUp:
        return AppColors.amberGlow;
      case InboxStage.handled:
        return AppColors.muted;
      case InboxStage.exception:
        return AppColors.negative;
    }
  }
}

enum ReviewKind {
  uncategorisedTransaction,
  possibleTransfer,
  possibleDuplicate,
  refundMatch,
  unusualAmount,
  billIncrease,
  receiptMismatch,
  newRecurring,
  cancellationWatch,
  expectedMoneyOverdue,
  documentQuestion,
  dataGap,
  warrantyExpiring,
  renewalApproaching,
  staleConnection,
  incomeClassification,
}

extension ReviewKindX on ReviewKind {
  String get label {
    switch (this) {
      case ReviewKind.uncategorisedTransaction:
        return 'Needs a category';
      case ReviewKind.possibleTransfer:
        return 'Possible internal transfer';
      case ReviewKind.possibleDuplicate:
        return 'Possible duplicate';
      case ReviewKind.refundMatch:
        return 'Refund to match';
      case ReviewKind.unusualAmount:
        return 'Unusual amount';
      case ReviewKind.billIncrease:
        return 'Bill went up';
      case ReviewKind.receiptMismatch:
        return 'Receipt total mismatch';
      case ReviewKind.newRecurring:
        return 'New recurring payment';
      case ReviewKind.cancellationWatch:
        return 'Cancelled but charged';
      case ReviewKind.expectedMoneyOverdue:
        return 'Expected money overdue';
      case ReviewKind.documentQuestion:
        return 'Document needs a decision';
      case ReviewKind.dataGap:
        return 'Data gap';
      case ReviewKind.warrantyExpiring:
        return 'Warranty ending';
      case ReviewKind.renewalApproaching:
        return 'Renewal approaching';
      case ReviewKind.staleConnection:
        return 'Connection went quiet';
      case ReviewKind.incomeClassification:
        return 'Is this really income?';
    }
  }

  IconData get icon {
    switch (this) {
      case ReviewKind.uncategorisedTransaction:
        return Icons.label_off_rounded;
      case ReviewKind.possibleTransfer:
        return Icons.sync_alt_rounded;
      case ReviewKind.possibleDuplicate:
        return Icons.copy_all_rounded;
      case ReviewKind.refundMatch:
        return Icons.replay_rounded;
      case ReviewKind.unusualAmount:
        return Icons.warning_amber_rounded;
      case ReviewKind.billIncrease:
        return Icons.trending_up_rounded;
      case ReviewKind.receiptMismatch:
        return Icons.receipt_long_rounded;
      case ReviewKind.newRecurring:
        return Icons.autorenew_rounded;
      case ReviewKind.cancellationWatch:
        return Icons.block_rounded;
      case ReviewKind.expectedMoneyOverdue:
        return Icons.hourglass_bottom_rounded;
      case ReviewKind.documentQuestion:
        return Icons.help_outline_rounded;
      case ReviewKind.dataGap:
        return Icons.grid_off_rounded;
      case ReviewKind.warrantyExpiring:
        return Icons.shield_moon_rounded;
      case ReviewKind.renewalApproaching:
        return Icons.event_repeat_rounded;
      case ReviewKind.staleConnection:
        return Icons.link_off_rounded;
      case ReviewKind.incomeClassification:
        return Icons.call_received_rounded;
    }
  }
}

/// A single unit of financial admin work.
@immutable
class ReviewItem {
  const ReviewItem({
    required this.id,
    required this.kind,
    required this.stage,
    required this.title,
    required this.detail,
    required this.reason,
    required this.confidence,
    required this.createdOn,
    required this.owner,
    this.amount,
    this.assignedTo,
    this.dueDate,
    this.calculationImpact,
    this.evidence = const <EvidenceLink>[],
    this.relatedTransactionId,
    this.relatedBillId,
    this.relatedDocumentId,
    this.visibility = RecordVisibility.private,
    this.audit = const <AuditEvent>[],
    this.comments = const <RecordComment>[],
    this.oneTapApproval = true,
    this.suggestedAction,
    this.assignmentStatus,
  });

  final String id;
  final ReviewKind kind;
  final InboxStage stage;
  final String title;
  final String detail;
  final String reason;
  final double confidence;
  final DateTime createdOn;
  final String owner;
  final double? amount;
  final String? assignedTo;
  final DateTime? dueDate;
  final String? calculationImpact;
  final List<EvidenceLink> evidence;
  final String? relatedTransactionId;
  final String? relatedBillId;
  final String? relatedDocumentId;
  final RecordVisibility visibility;
  final List<AuditEvent> audit;
  final List<RecordComment> comments;
  final bool oneTapApproval;
  final String? suggestedAction;
  final AssignmentStatus? assignmentStatus;

  ReviewItem copyWith({
    InboxStage? stage,
    String? title,
    String? detail,
    double? amount,
    String? assignedTo,
    DateTime? dueDate,
    String? calculationImpact,
    RecordVisibility? visibility,
    List<AuditEvent>? audit,
    List<RecordComment>? comments,
    AssignmentStatus? assignmentStatus,
  }) {
    return ReviewItem(
      id: id,
      kind: kind,
      stage: stage ?? this.stage,
      title: title ?? this.title,
      detail: detail ?? this.detail,
      reason: reason,
      confidence: confidence,
      createdOn: createdOn,
      owner: owner,
      amount: amount ?? this.amount,
      assignedTo: assignedTo ?? this.assignedTo,
      dueDate: dueDate ?? this.dueDate,
      calculationImpact: calculationImpact ?? this.calculationImpact,
      evidence: evidence,
      relatedTransactionId: relatedTransactionId,
      relatedBillId: relatedBillId,
      relatedDocumentId: relatedDocumentId,
      visibility: visibility ?? this.visibility,
      audit: audit ?? this.audit,
      comments: comments ?? this.comments,
      oneTapApproval: oneTapApproval,
      suggestedAction: suggestedAction,
      assignmentStatus: assignmentStatus ?? this.assignmentStatus,
    );
  }
}

enum AssignmentStatus { waiting, opened, corrected, completed }

extension AssignmentStatusX on AssignmentStatus {
  String get label {
    switch (this) {
      case AssignmentStatus.waiting:
        return 'Waiting';
      case AssignmentStatus.opened:
        return 'Opened';
      case AssignmentStatus.corrected:
        return 'Corrected';
      case AssignmentStatus.completed:
        return 'Completed';
    }
  }

  Color get color {
    switch (this) {
      case AssignmentStatus.waiting:
        return AppColors.caution;
      case AssignmentStatus.opened:
        return AppColors.glacier;
      case AssignmentStatus.corrected:
        return AppColors.lagoon;
      case AssignmentStatus.completed:
        return AppColors.positive;
    }
  }
}

enum RecurrenceFrequency {
  weekly,
  fortnightly,
  monthly,
  quarterly,
  halfYearly,
  annual,
  custom,
}

extension RecurrenceFrequencyX on RecurrenceFrequency {
  String get label {
    switch (this) {
      case RecurrenceFrequency.weekly:
        return 'Weekly';
      case RecurrenceFrequency.fortnightly:
        return 'Fortnightly';
      case RecurrenceFrequency.monthly:
        return 'Monthly';
      case RecurrenceFrequency.quarterly:
        return 'Quarterly';
      case RecurrenceFrequency.halfYearly:
        return 'Half yearly';
      case RecurrenceFrequency.annual:
        return 'Annual';
      case RecurrenceFrequency.custom:
        return 'Custom';
    }
  }

  /// Multiplier to convert one occurrence into an annual figure.
  double get perYear {
    switch (this) {
      case RecurrenceFrequency.weekly:
        return 52;
      case RecurrenceFrequency.fortnightly:
        return 26;
      case RecurrenceFrequency.monthly:
        return 12;
      case RecurrenceFrequency.quarterly:
        return 4;
      case RecurrenceFrequency.halfYearly:
        return 2;
      case RecurrenceFrequency.annual:
        return 1;
      case RecurrenceFrequency.custom:
        return 12;
    }
  }
}

enum BillStatus {
  review,
  expected,
  dueSoon,
  scheduled,
  paid,
  paidLate,
  overdue,
  amountChanged,
  disputed,
  cancelled,
}

extension BillStatusX on BillStatus {
  String get label {
    switch (this) {
      case BillStatus.review:
        return 'Needs review';
      case BillStatus.expected:
        return 'Expected';
      case BillStatus.dueSoon:
        return 'Due soon';
      case BillStatus.scheduled:
        return 'Scheduled';
      case BillStatus.paid:
        return 'Paid';
      case BillStatus.paidLate:
        return 'Paid late';
      case BillStatus.overdue:
        return 'Overdue';
      case BillStatus.amountChanged:
        return 'Amount changed';
      case BillStatus.disputed:
        return 'Disputed';
      case BillStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case BillStatus.review:
      case BillStatus.amountChanged:
        return AppColors.ember;
      case BillStatus.expected:
        return AppColors.glacier;
      case BillStatus.dueSoon:
        return AppColors.caution;
      case BillStatus.scheduled:
        return AppColors.lagoon;
      case BillStatus.paid:
        return AppColors.positive;
      case BillStatus.paidLate:
        return AppColors.caution;
      case BillStatus.overdue:
      case BillStatus.disputed:
        return AppColors.negative;
      case BillStatus.cancelled:
        return AppColors.muted;
    }
  }

  IconData get icon {
    switch (this) {
      case BillStatus.review:
        return Icons.help_outline_rounded;
      case BillStatus.expected:
        return Icons.schedule_rounded;
      case BillStatus.dueSoon:
        return Icons.notifications_active_rounded;
      case BillStatus.scheduled:
        return Icons.event_available_rounded;
      case BillStatus.paid:
        return Icons.check_circle_rounded;
      case BillStatus.paidLate:
        return Icons.running_with_errors_rounded;
      case BillStatus.overdue:
        return Icons.error_rounded;
      case BillStatus.amountChanged:
        return Icons.swap_vert_rounded;
      case BillStatus.disputed:
        return Icons.gavel_rounded;
      case BillStatus.cancelled:
        return Icons.cancel_rounded;
    }
  }
}

enum ObligationKind {
  bill,
  subscription,
  recurringPayment,
  renewal,
  insurance,
  rates,
  membership,
  expectedIncome,
}

extension ObligationKindX on ObligationKind {
  String get label {
    switch (this) {
      case ObligationKind.bill:
        return 'Bill';
      case ObligationKind.subscription:
        return 'Subscription';
      case ObligationKind.recurringPayment:
        return 'Recurring';
      case ObligationKind.renewal:
        return 'Renewal';
      case ObligationKind.insurance:
        return 'Insurance';
      case ObligationKind.rates:
        return 'Rates';
      case ObligationKind.membership:
        return 'Membership';
      case ObligationKind.expectedIncome:
        return 'Income';
    }
  }

  IconData get icon {
    switch (this) {
      case ObligationKind.bill:
        return Icons.receipt_long_rounded;
      case ObligationKind.subscription:
        return Icons.subscriptions_rounded;
      case ObligationKind.recurringPayment:
        return Icons.autorenew_rounded;
      case ObligationKind.renewal:
        return Icons.event_repeat_rounded;
      case ObligationKind.insurance:
        return Icons.shield_rounded;
      case ObligationKind.rates:
        return Icons.location_city_rounded;
      case ObligationKind.membership:
        return Icons.card_membership_rounded;
      case ObligationKind.expectedIncome:
        return Icons.payments_rounded;
    }
  }
}

@immutable
class PriceChange {
  const PriceChange({
    required this.date,
    required this.previousAmount,
    required this.newAmount,
  });

  final DateTime date;
  final double previousAmount;
  final double newAmount;

  double get delta => newAmount - previousAmount;

  double? get percent => previousAmount == 0
      ? null
      : ((newAmount - previousAmount) / previousAmount) * 100;
}

@immutable
class Bill {
  const Bill({
    required this.id,
    required this.provider,
    required this.kind,
    required this.status,
    required this.amount,
    required this.dueDate,
    required this.frequency,
    required this.owner,
    required this.source,
    this.serviceName,
    this.issueDate,
    this.servicePeriodStart,
    this.servicePeriodEnd,
    this.expectedMin,
    this.expectedMax,
    this.statementBalance,
    this.minimumDue,
    this.paymentAccountName,
    this.isAutopay = false,
    this.visibility = RecordVisibility.private,
    this.propertyName,
    this.priceHistory = const <PriceChange>[],
    this.linkedTransactionId,
    this.documentId,
    this.benefitEndDate,
    this.isVariableAmount = false,
    this.assignedTo,
    this.evidence = const <EvidenceLink>[],
    this.audit = const <AuditEvent>[],
    this.cancelledOn,
  });

  final String id;
  final String provider;
  final ObligationKind kind;
  final BillStatus status;
  final double amount;
  final DateTime dueDate;
  final RecurrenceFrequency frequency;
  final String owner;
  final ValueSource source;
  final String? serviceName;
  final DateTime? issueDate;
  final DateTime? servicePeriodStart;
  final DateTime? servicePeriodEnd;
  final double? expectedMin;
  final double? expectedMax;
  final double? statementBalance;
  final double? minimumDue;
  final String? paymentAccountName;
  final bool isAutopay;
  final RecordVisibility visibility;
  final String? propertyName;
  final List<PriceChange> priceHistory;
  final String? linkedTransactionId;
  final String? documentId;
  final DateTime? benefitEndDate;
  final bool isVariableAmount;
  final String? assignedTo;
  final List<EvidenceLink> evidence;
  final List<AuditEvent> audit;
  final DateTime? cancelledOn;

  double get annualEquivalent => amount * frequency.perYear;

  double get monthlyEquivalent => annualEquivalent / 12;

  double get fortnightlyEquivalent => annualEquivalent / 26;

  PriceChange? get latestPriceChange =>
      priceHistory.isEmpty ? null : priceHistory.last;

  Bill copyWith({
    String? provider,
    BillStatus? status,
    double? amount,
    DateTime? dueDate,
    RecurrenceFrequency? frequency,
    String? serviceName,
    String? paymentAccountName,
    bool? isAutopay,
    RecordVisibility? visibility,
    List<PriceChange>? priceHistory,
    String? linkedTransactionId,
    String? documentId,
    String? assignedTo,
    List<AuditEvent>? audit,
    DateTime? cancelledOn,
  }) {
    return Bill(
      id: id,
      provider: provider ?? this.provider,
      kind: kind,
      status: status ?? this.status,
      amount: amount ?? this.amount,
      dueDate: dueDate ?? this.dueDate,
      frequency: frequency ?? this.frequency,
      owner: owner,
      source: source,
      serviceName: serviceName ?? this.serviceName,
      issueDate: issueDate,
      servicePeriodStart: servicePeriodStart,
      servicePeriodEnd: servicePeriodEnd,
      expectedMin: expectedMin,
      expectedMax: expectedMax,
      statementBalance: statementBalance,
      minimumDue: minimumDue,
      paymentAccountName: paymentAccountName ?? this.paymentAccountName,
      isAutopay: isAutopay ?? this.isAutopay,
      visibility: visibility ?? this.visibility,
      propertyName: propertyName,
      priceHistory: priceHistory ?? this.priceHistory,
      linkedTransactionId: linkedTransactionId ?? this.linkedTransactionId,
      documentId: documentId ?? this.documentId,
      benefitEndDate: benefitEndDate,
      isVariableAmount: isVariableAmount,
      assignedTo: assignedTo ?? this.assignedTo,
      evidence: evidence,
      audit: audit ?? this.audit,
      cancelledOn: cancelledOn ?? this.cancelledOn,
    );
  }
}

/// An item on the Coming Up timeline.
@immutable
class TimelineItem {
  const TimelineItem({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.kind,
    required this.confidence,
    required this.source,
    this.isConfirmed = true,
    this.isPredicted = false,
    this.owner,
    this.accountName,
    this.frequency,
    this.freshness = DataFreshness.recent,
    this.isIncome = false,
    this.note,
  });

  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final ObligationKind kind;
  final double confidence;
  final ValueSource source;
  final bool isConfirmed;
  final bool isPredicted;
  final String? owner;
  final String? accountName;
  final RecurrenceFrequency? frequency;
  final DataFreshness freshness;
  final bool isIncome;
  final String? note;
}

enum ExpectedMoneyKind {
  refund,
  reimbursement,
  healthClaim,
  insuranceClaim,
  deposit,
  sharedExpense,
}

extension ExpectedMoneyKindX on ExpectedMoneyKind {
  String get label {
    switch (this) {
      case ExpectedMoneyKind.refund:
        return 'Refund';
      case ExpectedMoneyKind.reimbursement:
        return 'Reimbursement';
      case ExpectedMoneyKind.healthClaim:
        return 'Health claim';
      case ExpectedMoneyKind.insuranceClaim:
        return 'Insurance claim';
      case ExpectedMoneyKind.deposit:
        return 'Deposit';
      case ExpectedMoneyKind.sharedExpense:
        return 'Shared expense';
    }
  }

  IconData get icon {
    switch (this) {
      case ExpectedMoneyKind.refund:
        return Icons.replay_rounded;
      case ExpectedMoneyKind.reimbursement:
        return Icons.work_history_rounded;
      case ExpectedMoneyKind.healthClaim:
        return Icons.medical_services_rounded;
      case ExpectedMoneyKind.insuranceClaim:
        return Icons.shield_rounded;
      case ExpectedMoneyKind.deposit:
        return Icons.savings_rounded;
      case ExpectedMoneyKind.sharedExpense:
        return Icons.group_rounded;
    }
  }
}

enum ExpectedMoneyStatus { waiting, overdue, possibleMatch, handled }

@immutable
class ExpectedMoney {
  const ExpectedMoney({
    required this.id,
    required this.kind,
    required this.counterparty,
    required this.amount,
    required this.expectedDate,
    required this.createdOn,
    required this.status,
    required this.owner,
    this.amountMax,
    this.note,
    this.visibility = RecordVisibility.private,
    this.possibleMatchTransactionId,
    this.possibleMatchConfidence,
  });

  final String id;
  final ExpectedMoneyKind kind;
  final String counterparty;
  final double amount;
  final DateTime expectedDate;
  final DateTime createdOn;
  final ExpectedMoneyStatus status;
  final String owner;
  final double? amountMax;
  final String? note;
  final RecordVisibility visibility;
  final String? possibleMatchTransactionId;
  final double? possibleMatchConfidence;

  int get waitingDays => DateTime.now().difference(createdOn).inDays;

  bool get isOverdue =>
      DateTime.now().isAfter(expectedDate) &&
      status != ExpectedMoneyStatus.handled;

  ExpectedMoney copyWith({
    ExpectedMoneyKind? kind,
    String? counterparty,
    double? amount,
    DateTime? expectedDate,
    ExpectedMoneyStatus? status,
    double? amountMax,
    String? note,
    RecordVisibility? visibility,
    String? possibleMatchTransactionId,
    double? possibleMatchConfidence,
  }) {
    return ExpectedMoney(
      id: id,
      kind: kind ?? this.kind,
      counterparty: counterparty ?? this.counterparty,
      amount: amount ?? this.amount,
      expectedDate: expectedDate ?? this.expectedDate,
      createdOn: createdOn,
      status: status ?? this.status,
      owner: owner,
      amountMax: amountMax ?? this.amountMax,
      note: note ?? this.note,
      visibility: visibility ?? this.visibility,
      possibleMatchTransactionId:
          possibleMatchTransactionId ?? this.possibleMatchTransactionId,
      possibleMatchConfidence:
          possibleMatchConfidence ?? this.possibleMatchConfidence,
    );
  }
}

enum DocumentKind {
  statement,
  bill,
  receipt,
  policy,
  contract,
  warranty,
  loanDocument,
  energyDocument,
  other,
}

extension DocumentKindX on DocumentKind {
  String get label {
    switch (this) {
      case DocumentKind.statement:
        return 'Statement';
      case DocumentKind.bill:
        return 'Bill';
      case DocumentKind.receipt:
        return 'Receipt';
      case DocumentKind.policy:
        return 'Policy';
      case DocumentKind.contract:
        return 'Contract';
      case DocumentKind.warranty:
        return 'Warranty';
      case DocumentKind.loanDocument:
        return 'Loan document';
      case DocumentKind.energyDocument:
        return 'Energy document';
      case DocumentKind.other:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case DocumentKind.statement:
        return Icons.article_rounded;
      case DocumentKind.bill:
        return Icons.receipt_long_rounded;
      case DocumentKind.receipt:
        return Icons.receipt_rounded;
      case DocumentKind.policy:
        return Icons.policy_rounded;
      case DocumentKind.contract:
        return Icons.handshake_rounded;
      case DocumentKind.warranty:
        return Icons.shield_rounded;
      case DocumentKind.loanDocument:
        return Icons.account_balance_rounded;
      case DocumentKind.energyDocument:
        return Icons.bolt_rounded;
      case DocumentKind.other:
        return Icons.insert_drive_file_rounded;
    }
  }
}

enum ProcessingState {
  queued,
  processing,
  complete,
  partial,
  failed,
  duplicate,
  retrying,
}

extension ProcessingStateX on ProcessingState {
  String get label {
    switch (this) {
      case ProcessingState.queued:
        return 'Queued';
      case ProcessingState.processing:
        return 'Processing';
      case ProcessingState.complete:
        return 'Complete';
      case ProcessingState.partial:
        return 'Partial';
      case ProcessingState.failed:
        return 'Failed';
      case ProcessingState.duplicate:
        return 'Duplicate';
      case ProcessingState.retrying:
        return 'Retrying';
    }
  }

  Color get color {
    switch (this) {
      case ProcessingState.queued:
        return AppColors.glacier;
      case ProcessingState.processing:
      case ProcessingState.retrying:
        return AppColors.lagoon;
      case ProcessingState.complete:
        return AppColors.positive;
      case ProcessingState.partial:
        return AppColors.caution;
      case ProcessingState.failed:
        return AppColors.negative;
      case ProcessingState.duplicate:
        return AppColors.violetHaze;
    }
  }
}

@immutable
class ExtractedField {
  const ExtractedField({
    required this.label,
    required this.value,
    required this.confidence,
    this.sourcePage,
    this.needsConfirmation = false,
  });

  final String label;
  final String value;
  final double confidence;
  final int? sourcePage;
  final bool needsConfirmation;
}

@immutable
class MiaDocument {
  const MiaDocument({
    required this.id,
    required this.name,
    required this.kind,
    required this.uploadedOn,
    required this.owner,
    required this.state,
    required this.source,
    this.sizeKb = 0,
    this.pages = 1,
    this.coveragePeriod,
    this.visibility = RecordVisibility.private,
    this.fields = const <ExtractedField>[],
    this.linkedRecordLabels = const <String>[],
    this.retentionNote,
    this.fileType = 'PDF',
  });

  final String id;
  final String name;
  final DocumentKind kind;
  final DateTime uploadedOn;
  final String owner;
  final ProcessingState state;
  final ValueSource source;
  final int sizeKb;
  final int pages;
  final String? coveragePeriod;
  final RecordVisibility visibility;
  final List<ExtractedField> fields;
  final List<String> linkedRecordLabels;
  final String? retentionNote;
  final String fileType;

  MiaDocument copyWith({
    String? name,
    DocumentKind? kind,
    ProcessingState? state,
    ValueSource? source,
    String? coveragePeriod,
    RecordVisibility? visibility,
    List<ExtractedField>? fields,
    List<String>? linkedRecordLabels,
  }) {
    return MiaDocument(
      id: id,
      name: name ?? this.name,
      kind: kind ?? this.kind,
      uploadedOn: uploadedOn,
      owner: owner,
      state: state ?? this.state,
      source: source ?? this.source,
      sizeKb: sizeKb,
      pages: pages,
      coveragePeriod: coveragePeriod ?? this.coveragePeriod,
      visibility: visibility ?? this.visibility,
      fields: fields ?? this.fields,
      linkedRecordLabels: linkedRecordLabels ?? this.linkedRecordLabels,
      retentionNote: retentionNote,
      fileType: fileType,
    );
  }
}

@immutable
class Receipt {
  const Receipt({
    required this.id,
    required this.merchant,
    required this.purchaseDate,
    required this.total,
    required this.state,
    this.receiptNumber,
    this.subtotal,
    this.gst,
    this.feesOrTip,
    this.matchedTransactionId,
    this.matchConfidence,
    this.matchedAmount,
    this.isDuplicate = false,
    this.duplicateOfId,
    this.documentId,
    this.owner = 'You',
    this.fields = const <ExtractedField>[],
  });

  final String id;
  final String merchant;
  final DateTime purchaseDate;
  final double total;
  final ProcessingState state;
  final String? receiptNumber;
  final double? subtotal;
  final double? gst;
  final double? feesOrTip;
  final String? matchedTransactionId;
  final double? matchConfidence;
  final double? matchedAmount;
  final bool isDuplicate;
  final String? duplicateOfId;
  final String? documentId;
  final String owner;
  final List<ExtractedField> fields;

  bool get hasMismatch =>
      matchedAmount != null && (matchedAmount! - total).abs() > 0.01;

  Receipt copyWith({
    String? merchant,
    DateTime? purchaseDate,
    double? total,
    ProcessingState? state,
    String? matchedTransactionId,
    double? matchConfidence,
    double? matchedAmount,
    String? documentId,
    List<ExtractedField>? fields,
  }) {
    return Receipt(
      id: id,
      merchant: merchant ?? this.merchant,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      total: total ?? this.total,
      state: state ?? this.state,
      receiptNumber: receiptNumber,
      subtotal: subtotal,
      gst: gst,
      feesOrTip: feesOrTip,
      matchedTransactionId: matchedTransactionId ?? this.matchedTransactionId,
      matchConfidence: matchConfidence ?? this.matchConfidence,
      matchedAmount: matchedAmount ?? this.matchedAmount,
      isDuplicate: isDuplicate,
      duplicateOfId: duplicateOfId,
      documentId: documentId ?? this.documentId,
      owner: owner,
      fields: fields ?? this.fields,
    );
  }
}

enum WarrantyStatus {
  active,
  expiring,
  expired,
  issueNoted,
  disposed,
  archived,
}

extension WarrantyStatusX on WarrantyStatus {
  String get label {
    switch (this) {
      case WarrantyStatus.active:
        return 'Active';
      case WarrantyStatus.expiring:
        return 'Expiring';
      case WarrantyStatus.expired:
        return 'Written warranty ended';
      case WarrantyStatus.issueNoted:
        return 'Issue noted';
      case WarrantyStatus.disposed:
        return 'Sold or disposed';
      case WarrantyStatus.archived:
        return 'Archived';
    }
  }

  Color get color {
    switch (this) {
      case WarrantyStatus.active:
        return AppColors.positive;
      case WarrantyStatus.expiring:
        return AppColors.caution;
      case WarrantyStatus.expired:
        return AppColors.negative;
      case WarrantyStatus.issueNoted:
        return AppColors.ember;
      case WarrantyStatus.disposed:
      case WarrantyStatus.archived:
        return AppColors.muted;
    }
  }
}

@immutable
class PurchaseRecord {
  const PurchaseRecord({
    required this.id,
    required this.itemName,
    required this.retailer,
    required this.purchaseDate,
    required this.status,
    required this.owner,
    this.brand,
    this.model,
    this.serialNumber,
    this.amount,
    this.itemType,
    this.categoryLabel,
    this.warrantyMonths,
    this.warrantyEnd,
    this.extendedWarrantyEnd,
    this.location,
    this.note,
    this.visibility = RecordVisibility.private,
    this.receiptId,
    this.documentIds = const <String>[],
    this.remindersEnabled = true,
    this.accent = AppColors.glacier,
  });

  final String id;
  final String itemName;
  final String retailer;
  final DateTime purchaseDate;
  final WarrantyStatus status;
  final String owner;
  final String? brand;
  final String? model;
  final String? serialNumber;
  final double? amount;
  final String? itemType;
  final String? categoryLabel;
  final int? warrantyMonths;
  final DateTime? warrantyEnd;
  final DateTime? extendedWarrantyEnd;
  final String? location;
  final String? note;
  final RecordVisibility visibility;
  final String? receiptId;
  final List<String> documentIds;
  final bool remindersEnabled;
  final Color accent;

  int? get daysRemaining => warrantyEnd?.difference(DateTime.now()).inDays;

  PurchaseRecord copyWith({
    String? itemName,
    String? retailer,
    WarrantyStatus? status,
    double? amount,
    DateTime? warrantyEnd,
    DateTime? extendedWarrantyEnd,
    String? note,
    String? receiptId,
    List<String>? documentIds,
    bool? remindersEnabled,
  }) {
    return PurchaseRecord(
      id: id,
      itemName: itemName ?? this.itemName,
      retailer: retailer ?? this.retailer,
      purchaseDate: purchaseDate,
      status: status ?? this.status,
      owner: owner,
      brand: brand,
      model: model,
      serialNumber: serialNumber,
      amount: amount ?? this.amount,
      itemType: itemType,
      categoryLabel: categoryLabel,
      warrantyMonths: warrantyMonths,
      warrantyEnd: warrantyEnd ?? this.warrantyEnd,
      extendedWarrantyEnd: extendedWarrantyEnd ?? this.extendedWarrantyEnd,
      location: location,
      note: note ?? this.note,
      visibility: visibility,
      receiptId: receiptId ?? this.receiptId,
      documentIds: documentIds ?? this.documentIds,
      remindersEnabled: remindersEnabled ?? this.remindersEnabled,
      accent: accent,
    );
  }
}

@immutable
class ImportBatch {
  const ImportBatch({
    required this.id,
    required this.fileName,
    required this.kind,
    required this.state,
    required this.startedOn,
    required this.rowCount,
    this.importedCount = 0,
    this.duplicateCount = 0,
    this.failedCount = 0,
    this.coveragePeriod,
    this.canRollback = true,
  });

  final String id;
  final String fileName;
  final String kind;
  final ProcessingState state;
  final DateTime startedOn;
  final int rowCount;
  final int importedCount;
  final int duplicateCount;
  final int failedCount;
  final String? coveragePeriod;
  final bool canRollback;

  ImportBatch copyWith({
    ProcessingState? state,
    int? importedCount,
    int? duplicateCount,
    int? failedCount,
    bool? canRollback,
  }) {
    return ImportBatch(
      id: id,
      fileName: fileName,
      kind: kind,
      state: state ?? this.state,
      startedOn: startedOn,
      rowCount: rowCount,
      importedCount: importedCount ?? this.importedCount,
      duplicateCount: duplicateCount ?? this.duplicateCount,
      failedCount: failedCount ?? this.failedCount,
      coveragePeriod: coveragePeriod,
      canRollback: canRollback ?? this.canRollback,
    );
  }
}

/// A file the user asked Mia to produce. Kept as a record so an export is
/// something they can see the status and coverage of, not a message that
/// disappeared.
@immutable
class ExportJob {
  const ExportJob({
    required this.id,
    required this.label,
    required this.format,
    required this.requestedOn,
    required this.state,
    required this.coveragePeriod,
    this.recordCount = 0,
    this.sizeKb = 0,
    this.note,
  });

  final String id;
  final String label;
  final String format;
  final DateTime requestedOn;
  final ProcessingState state;
  final String coveragePeriod;
  final int recordCount;
  final int sizeKb;
  final String? note;

  ExportJob copyWith({ProcessingState? state, int? sizeKb, String? note}) {
    return ExportJob(
      id: id,
      label: label,
      format: format,
      requestedOn: requestedOn,
      state: state ?? this.state,
      coveragePeriod: coveragePeriod,
      recordCount: recordCount,
      sizeKb: sizeKb ?? this.sizeKb,
      note: note ?? this.note,
    );
  }
}
