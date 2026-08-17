import 'package:injectable/injectable.dart';

import '../models/admin_models.dart';
import '../models/core_models.dart';
import '../models/money_models.dart';
import '../store/mia_store.dart';
import 'user_repository.dart' show kDummyLatency;

abstract class ReviewRepository {
  Future<List<ReviewItem>> fetchReviewItems();

  Future<void> approve(String itemId);

  Future<void> approveMany(List<String> itemIds);

  Future<void> dismiss(String itemId);

  Future<void> assign(String itemId, String memberName);

  Future<void> comment(String itemId, String body);

  /// Moves an item out of the way until [returnsOn], when it comes back to the
  /// same place in the inbox rather than being lost.
  Future<void> defer(String itemId, DateTime returnsOn);

  /// Puts an approved item back in front of the user. The approval is not
  /// erased from the audit trail — undoing it is its own event.
  Future<void> undoApproval(String itemId);
}

@LazySingleton(as: ReviewRepository)
class DummyReviewRepository implements ReviewRepository {
  DummyReviewRepository(this._store);

  final MiaStore _store;

  AuditEvent _event(String action) => AuditEvent(
    id: _store.nextId('aud'),
    actor: 'You',
    action: action,
    timestamp: DateTime.now(),
    canUndo: true,
  );

  void _update(String itemId, ReviewItem Function(ReviewItem) transform) {
    final int index = _store.reviewItems.indexWhere(
      (ReviewItem i) => i.id == itemId,
    );
    if (index == -1) return;
    _store.reviewItems[index] = transform(_store.reviewItems[index]);
  }

  @override
  Future<List<ReviewItem>> fetchReviewItems() async {
    await Future<void>.delayed(kDummyLatency);
    return List<ReviewItem>.from(_store.reviewItems);
  }

  @override
  Future<void> approve(String itemId) async {
    await Future<void>.delayed(kDummyLatency);
    _update(
      itemId,
      (ReviewItem i) => i.copyWith(
        stage: InboxStage.handled,
        audit: <AuditEvent>[...i.audit, _event('Approved Mia\'s suggestion')],
      ),
    );
  }

  @override
  Future<void> approveMany(List<String> itemIds) async {
    await Future<void>.delayed(kDummyLatency);
    for (final String id in itemIds) {
      _update(
        id,
        (ReviewItem i) => i.copyWith(
          stage: InboxStage.handled,
          audit: <AuditEvent>[...i.audit, _event('Approved in a batch')],
        ),
      );
    }
  }

  @override
  Future<void> dismiss(String itemId) async {
    await Future<void>.delayed(kDummyLatency);
    _store.reviewItems.removeWhere((ReviewItem i) => i.id == itemId);
  }

  @override
  Future<void> assign(String itemId, String memberName) async {
    await Future<void>.delayed(kDummyLatency);
    _update(
      itemId,
      (ReviewItem i) => i.copyWith(
        stage: InboxStage.assignedWaiting,
        assignedTo: memberName,
        assignmentStatus: AssignmentStatus.waiting,
        audit: <AuditEvent>[...i.audit, _event('Assigned to $memberName')],
      ),
    );
  }

  @override
  Future<void> comment(String itemId, String body) async {
    await Future<void>.delayed(kDummyLatency);
    _update(
      itemId,
      (ReviewItem i) => i.copyWith(
        comments: <RecordComment>[
          ...i.comments,
          RecordComment(
            id: _store.nextId('cmt'),
            author: 'You',
            body: body,
            timestamp: DateTime.now(),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> defer(String itemId, DateTime returnsOn) async {
    await Future<void>.delayed(kDummyLatency);
    _update(
      itemId,
      (ReviewItem i) => i.copyWith(
        stage: InboxStage.comingUp,
        dueDate: returnsOn,
        audit: <AuditEvent>[...i.audit, _event('Deferred to a later date')],
      ),
    );
  }

  @override
  Future<void> undoApproval(String itemId) async {
    await Future<void>.delayed(kDummyLatency);
    _update(
      itemId,
      (ReviewItem i) => i.copyWith(
        stage: InboxStage.needsReview,
        audit: <AuditEvent>[...i.audit, _event('Undid the approval')],
      ),
    );
  }
}

abstract class BillRepository {
  Future<List<Bill>> fetchBills();

  Future<List<TimelineItem>> fetchTimeline();

  Future<void> markPaid(String billId);

  /// Adds an obligation the user knows about before any provider tells Mia.
  Future<Bill> createBill({
    required String provider,
    required ObligationKind kind,
    required double amount,
    required DateTime dueDate,
    required RecurrenceFrequency frequency,
    required String owner,
    String? serviceName,
    String? paymentAccountName,
    bool isAutopay = false,
    bool sharedWithHousehold = false,
  });

  Future<void> cancelBill(String billId);
}

@LazySingleton(as: BillRepository)
class DummyBillRepository implements BillRepository {
  DummyBillRepository(this._store);

  final MiaStore _store;

  @override
  Future<List<Bill>> fetchBills() async {
    await Future<void>.delayed(kDummyLatency);
    return List<Bill>.from(_store.bills);
  }

  @override
  Future<List<TimelineItem>> fetchTimeline() async {
    await Future<void>.delayed(kDummyLatency);
    return List<TimelineItem>.from(_store.timeline)
      ..sort((TimelineItem a, TimelineItem b) => a.date.compareTo(b.date));
  }

  @override
  Future<void> markPaid(String billId) async {
    await Future<void>.delayed(kDummyLatency);
    final Bill? bill = _store.billById(billId);
    if (bill == null) return;

    final bool late = DateTime.now().isAfter(bill.dueDate);
    _store.replace(
      _store.bills,
      (Bill b) => b.id == billId,
      bill.copyWith(
        status: late ? BillStatus.paidLate : BillStatus.paid,
        audit: <AuditEvent>[
          ...bill.audit,
          AuditEvent(
            id: _store.nextId('aud'),
            actor: 'You',
            action: 'Marked paid',
            timestamp: DateTime.now(),
            canUndo: true,
          ),
        ],
      ),
    );
    // A paid bill is no longer money still to leave the account.
    _store.timeline.removeWhere(
      (TimelineItem t) => t.id == 'tl-$billId' || t.title == bill.provider,
    );
  }

  @override
  Future<Bill> createBill({
    required String provider,
    required ObligationKind kind,
    required double amount,
    required DateTime dueDate,
    required RecurrenceFrequency frequency,
    required String owner,
    String? serviceName,
    String? paymentAccountName,
    bool isAutopay = false,
    bool sharedWithHousehold = false,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final String id = _store.nextId('bill');
    final Bill created = Bill(
      id: id,
      provider: provider,
      kind: kind,
      status: dueDate.difference(DateTime.now()).inDays <= 7
          ? BillStatus.dueSoon
          : BillStatus.expected,
      amount: amount,
      dueDate: dueDate,
      frequency: frequency,
      owner: owner,
      source: ValueSource.manual,
      serviceName: serviceName,
      paymentAccountName: paymentAccountName,
      isAutopay: isAutopay,
      visibility: sharedWithHousehold
          ? RecordVisibility.household
          : RecordVisibility.private,
      audit: <AuditEvent>[
        AuditEvent(
          id: _store.nextId('aud'),
          actor: owner,
          action: 'Added this bill by hand',
          timestamp: DateTime.now(),
        ),
      ],
    );

    _store.bills.insert(0, created);
    // Anything with a due date belongs on the Coming Up timeline as well.
    _store.timeline.add(
      TimelineItem(
        id: 'tl-$id',
        title: provider,
        date: dueDate,
        amount: amount,
        kind: kind,
        confidence: 1,
        source: ValueSource.manual,
        owner: owner,
        accountName: paymentAccountName,
        frequency: frequency,
        isIncome: kind == ObligationKind.expectedIncome,
        note: 'Entered by you',
      ),
    );
    return created;
  }

  @override
  Future<void> cancelBill(String billId) async {
    await Future<void>.delayed(kDummyLatency);
    final Bill? bill = _store.billById(billId);
    if (bill == null) return;
    _store.replace(
      _store.bills,
      (Bill b) => b.id == billId,
      bill.copyWith(status: BillStatus.cancelled, cancelledOn: DateTime.now()),
    );
    _store.timeline.removeWhere((TimelineItem t) => t.id == 'tl-$billId');
  }
}

abstract class ExpectedMoneyRepository {
  Future<List<ExpectedMoney>> fetchExpectedMoney();

  Future<void> confirmMatch(String id);

  Future<void> markHandled(String id);

  Future<ExpectedMoney> createExpectedMoney({
    required ExpectedMoneyKind kind,
    required String counterparty,
    required double amount,
    required DateTime expectedDate,
    required String owner,
    String? note,
    bool sharedWithHousehold = false,
  });

  Future<void> chase(String id);
}

@LazySingleton(as: ExpectedMoneyRepository)
class DummyExpectedMoneyRepository implements ExpectedMoneyRepository {
  DummyExpectedMoneyRepository(this._store);

  final MiaStore _store;

  ExpectedMoney? _byId(String id) {
    final int index = _store.expectedMoney.indexWhere(
      (ExpectedMoney e) => e.id == id,
    );
    return index == -1 ? null : _store.expectedMoney[index];
  }

  @override
  Future<List<ExpectedMoney>> fetchExpectedMoney() async {
    await Future<void>.delayed(kDummyLatency);
    return List<ExpectedMoney>.from(_store.expectedMoney);
  }

  @override
  Future<void> confirmMatch(String id) async {
    await Future<void>.delayed(kDummyLatency);
    final ExpectedMoney? record = _byId(id);
    if (record == null) return;

    // Confirming the match is what closes the record, and the matched credit
    // stops being counted as ordinary income.
    final String? matchId = record.possibleMatchTransactionId;
    if (matchId != null) {
      final MiaTransaction? transaction = _store.transactionById(matchId);
      if (transaction != null) {
        _store.replace(
          _store.transactions,
          (MiaTransaction t) => t.id == matchId,
          transaction.copyWith(
            treatment: record.kind == ExpectedMoneyKind.refund
                ? TransactionTreatment.refund
                : TransactionTreatment.reimbursement,
          ),
        );
      }
    }

    _store.replace(
      _store.expectedMoney,
      (ExpectedMoney e) => e.id == id,
      record.copyWith(status: ExpectedMoneyStatus.handled),
    );
  }

  @override
  Future<void> markHandled(String id) async {
    await Future<void>.delayed(kDummyLatency);
    final ExpectedMoney? record = _byId(id);
    if (record == null) return;
    _store.replace(
      _store.expectedMoney,
      (ExpectedMoney e) => e.id == id,
      record.copyWith(status: ExpectedMoneyStatus.handled),
    );
  }

  @override
  Future<ExpectedMoney> createExpectedMoney({
    required ExpectedMoneyKind kind,
    required String counterparty,
    required double amount,
    required DateTime expectedDate,
    required String owner,
    String? note,
    bool sharedWithHousehold = false,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final ExpectedMoney created = ExpectedMoney(
      id: _store.nextId('exp'),
      kind: kind,
      counterparty: counterparty,
      amount: amount,
      expectedDate: expectedDate,
      createdOn: DateTime.now(),
      status: DateTime.now().isAfter(expectedDate)
          ? ExpectedMoneyStatus.overdue
          : ExpectedMoneyStatus.waiting,
      owner: owner,
      note: note,
      visibility: sharedWithHousehold
          ? RecordVisibility.household
          : RecordVisibility.private,
    );
    _store.expectedMoney.insert(0, created);
    return created;
  }

  @override
  Future<void> chase(String id) async {
    await Future<void>.delayed(kDummyLatency);
    final ExpectedMoney? record = _byId(id);
    if (record == null) return;
    // Chasing does not close the record; it moves the date it is measured from.
    _store.replace(
      _store.expectedMoney,
      (ExpectedMoney e) => e.id == id,
      record.copyWith(
        expectedDate: DateTime.now().add(const Duration(days: 14)),
        status: ExpectedMoneyStatus.waiting,
        note: 'Chased on ${DateTime.now().day}/${DateTime.now().month}',
      ),
    );
  }
}

abstract class DocumentRepository {
  Future<List<MiaDocument>> fetchDocuments();

  Future<List<Receipt>> fetchReceipts();

  Future<List<ImportBatch>> fetchImports();

  Future<void> reprocess(String documentId);

  Future<void> deleteDocument(String documentId);

  Future<void> rollbackImport(String batchId);

  Future<MiaDocument> createDocument({
    required String name,
    required DocumentKind kind,
    required String owner,
    String fileType = 'PDF',
    int sizeKb = 0,
    String? coveragePeriod,
  });

  Future<Receipt> createReceipt({
    required String merchant,
    required DateTime purchaseDate,
    required double total,
    required String owner,
    double? gst,
    String? receiptNumber,
  });

  /// Attaches a receipt to a transaction from both sides.
  Future<void> attachReceipt({
    required String receiptId,
    required String transactionId,
  });

  /// Rejects a match Mia proposed. The receipt stays, unattached.
  Future<void> detachReceipt(String receiptId);

  Future<ImportBatch> createImport({
    required String fileName,
    required String kind,
    required int rowCount,
  });
}

@LazySingleton(as: DocumentRepository)
class DummyDocumentRepository implements DocumentRepository {
  DummyDocumentRepository(this._store);

  final MiaStore _store;

  @override
  Future<List<MiaDocument>> fetchDocuments() async {
    await Future<void>.delayed(kDummyLatency);
    return List<MiaDocument>.from(_store.documents);
  }

  @override
  Future<List<Receipt>> fetchReceipts() async {
    await Future<void>.delayed(kDummyLatency);
    return List<Receipt>.from(_store.receipts);
  }

  @override
  Future<List<ImportBatch>> fetchImports() async {
    await Future<void>.delayed(kDummyLatency);
    return List<ImportBatch>.from(_store.imports);
  }

  @override
  Future<void> reprocess(String documentId) async {
    await Future<void>.delayed(kDummyLatency);
    final int index = _store.documents.indexWhere(
      (MiaDocument d) => d.id == documentId,
    );
    if (index == -1) return;
    _store.documents[index] = _store.documents[index].copyWith(
      state: ProcessingState.complete,
      source: ValueSource.miaMapped,
    );
  }

  @override
  Future<void> deleteDocument(String documentId) async {
    await Future<void>.delayed(kDummyLatency);
    _store.documents.removeWhere((MiaDocument d) => d.id == documentId);
  }

  @override
  Future<void> rollbackImport(String batchId) async {
    await Future<void>.delayed(kDummyLatency);
    final int index = _store.imports.indexWhere(
      (ImportBatch b) => b.id == batchId,
    );
    if (index == -1) return;

    // Rolling back means the rows that batch created leave the ledger, and the
    // totals they moved are put back.
    final List<MiaTransaction> imported = _store.transactions
        .where((MiaTransaction t) => t.importBatchId == batchId)
        .toList();
    for (final MiaTransaction transaction in imported) {
      _store.applyTransactionToTotals(transaction, sign: -1);
    }
    _store.transactions.removeWhere(
      (MiaTransaction t) => t.importBatchId == batchId,
    );

    _store.imports[index] = _store.imports[index].copyWith(
      state: ProcessingState.failed,
      importedCount: 0,
      canRollback: false,
    );
  }

  @override
  Future<MiaDocument> createDocument({
    required String name,
    required DocumentKind kind,
    required String owner,
    String fileType = 'PDF',
    int sizeKb = 0,
    String? coveragePeriod,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final MiaDocument created = MiaDocument(
      id: _store.nextId('doc'),
      name: name,
      kind: kind,
      uploadedOn: DateTime.now(),
      owner: owner,
      state: ProcessingState.complete,
      source: ValueSource.manual,
      sizeKb: sizeKb,
      coveragePeriod: coveragePeriod,
      fileType: fileType,
      retentionNote: 'Kept until you delete it.',
    );
    _store.documents.insert(0, created);
    return created;
  }

  @override
  Future<Receipt> createReceipt({
    required String merchant,
    required DateTime purchaseDate,
    required double total,
    required String owner,
    double? gst,
    String? receiptNumber,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final Receipt created = Receipt(
      id: _store.nextId('rcp'),
      merchant: merchant,
      purchaseDate: purchaseDate,
      total: total,
      state: ProcessingState.complete,
      receiptNumber: receiptNumber,
      gst: gst,
      subtotal: gst == null ? null : total - gst,
      owner: owner,
    );
    _store.receipts.insert(0, created);
    return created;
  }

  @override
  Future<void> attachReceipt({
    required String receiptId,
    required String transactionId,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final Receipt? receipt = _store.receiptById(receiptId);
    final MiaTransaction? transaction = _store.transactionById(transactionId);
    if (receipt == null || transaction == null) return;

    _store.replace(
      _store.receipts,
      (Receipt r) => r.id == receiptId,
      receipt.copyWith(
        matchedTransactionId: transactionId,
        matchedAmount: transaction.amount.abs(),
        matchConfidence: 1,
        state: ProcessingState.complete,
      ),
    );
    _store.replace(
      _store.transactions,
      (MiaTransaction t) => t.id == transactionId,
      transaction.copyWith(receiptId: receiptId),
    );
  }

  @override
  Future<void> detachReceipt(String receiptId) async {
    await Future<void>.delayed(kDummyLatency);
    final Receipt? receipt = _store.receiptById(receiptId);
    if (receipt == null) return;

    final String? previousId = receipt.matchedTransactionId;
    if (previousId != null) {
      final MiaTransaction? transaction = _store.transactionById(previousId);
      if (transaction != null) {
        _store.replace(
          _store.transactions,
          (MiaTransaction t) => t.id == previousId,
          MiaTransaction(
            id: transaction.id,
            description: transaction.description,
            amount: transaction.amount,
            date: transaction.date,
            accountId: transaction.accountId,
            accountName: transaction.accountName,
            status: transaction.status,
            layers: transaction.layers,
            owner: transaction.owner,
            treatment: transaction.treatment,
            splits: transaction.splits,
            tags: transaction.tags,
            note: transaction.note,
            billId: transaction.billId,
            recurringId: transaction.recurringId,
            transferPairId: transaction.transferPairId,
            refundPairId: transaction.refundPairId,
            assignedTo: transaction.assignedTo,
            reviewStatus: transaction.reviewStatus,
            visibility: transaction.visibility,
            isBusiness: transaction.isBusiness,
            isReimbursable: transaction.isReimbursable,
            possibleDuplicateOf: transaction.possibleDuplicateOf,
            audit: transaction.audit,
            comments: transaction.comments,
            importBatchId: transaction.importBatchId,
          ),
        );
      }
    }

    _store.replace(
      _store.receipts,
      (Receipt r) => r.id == receiptId,
      Receipt(
        id: receipt.id,
        merchant: receipt.merchant,
        purchaseDate: receipt.purchaseDate,
        total: receipt.total,
        state: receipt.state,
        receiptNumber: receipt.receiptNumber,
        subtotal: receipt.subtotal,
        gst: receipt.gst,
        feesOrTip: receipt.feesOrTip,
        isDuplicate: receipt.isDuplicate,
        duplicateOfId: receipt.duplicateOfId,
        documentId: receipt.documentId,
        owner: receipt.owner,
        fields: receipt.fields,
      ),
    );
  }

  @override
  Future<ImportBatch> createImport({
    required String fileName,
    required String kind,
    required int rowCount,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final ImportBatch created = ImportBatch(
      id: _store.nextId('imp'),
      fileName: fileName,
      kind: kind,
      state: ProcessingState.queued,
      startedOn: DateTime.now(),
      rowCount: rowCount,
    );
    _store.imports.insert(0, created);
    return created;
  }
}

abstract class VaultRepository {
  Future<List<PurchaseRecord>> fetchPurchases();

  Future<void> setReminders(String purchaseId, bool enabled);

  Future<PurchaseRecord> createPurchase({
    required String itemName,
    required String retailer,
    required DateTime purchaseDate,
    required String owner,
    double? amount,
    int? warrantyMonths,
    String? serialNumber,
    String? note,
    String? receiptId,
  });

  /// Records that the user looked at the item and found a problem with it.
  Future<void> noteIssue(String purchaseId, String note);
}

@LazySingleton(as: VaultRepository)
class DummyVaultRepository implements VaultRepository {
  DummyVaultRepository(this._store);

  final MiaStore _store;

  int _indexOf(String id) =>
      _store.purchases.indexWhere((PurchaseRecord p) => p.id == id);

  @override
  Future<List<PurchaseRecord>> fetchPurchases() async {
    await Future<void>.delayed(kDummyLatency);
    return List<PurchaseRecord>.from(_store.purchases);
  }

  @override
  Future<void> setReminders(String purchaseId, bool enabled) async {
    await Future<void>.delayed(kDummyLatency);
    final int index = _indexOf(purchaseId);
    if (index == -1) return;
    _store.purchases[index] = _store.purchases[index].copyWith(
      remindersEnabled: enabled,
    );
  }

  @override
  Future<PurchaseRecord> createPurchase({
    required String itemName,
    required String retailer,
    required DateTime purchaseDate,
    required String owner,
    double? amount,
    int? warrantyMonths,
    String? serialNumber,
    String? note,
    String? receiptId,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final DateTime? warrantyEnd = warrantyMonths == null
        ? null
        : DateTime(
            purchaseDate.year,
            purchaseDate.month + warrantyMonths,
            purchaseDate.day,
          );
    final int? daysLeft = warrantyEnd?.difference(DateTime.now()).inDays;

    final PurchaseRecord created = PurchaseRecord(
      id: _store.nextId('pur'),
      itemName: itemName,
      retailer: retailer,
      purchaseDate: purchaseDate,
      status: warrantyEnd == null
          ? WarrantyStatus.active
          : daysLeft! <= 0
          ? WarrantyStatus.expired
          : daysLeft <= 60
          ? WarrantyStatus.expiring
          : WarrantyStatus.active,
      owner: owner,
      amount: amount,
      serialNumber: serialNumber,
      warrantyMonths: warrantyMonths,
      warrantyEnd: warrantyEnd,
      note: note,
      receiptId: receiptId,
    );
    _store.purchases.insert(0, created);
    return created;
  }

  @override
  Future<void> noteIssue(String purchaseId, String note) async {
    await Future<void>.delayed(kDummyLatency);
    final int index = _indexOf(purchaseId);
    if (index == -1) return;
    _store.purchases[index] = _store.purchases[index].copyWith(
      status: WarrantyStatus.issueNoted,
      note: note,
    );
  }
}

abstract class ExportRepository {
  Future<List<ExportJob>> fetchExports();

  Future<ExportJob> requestExport({
    required String label,
    required String format,
    required String coveragePeriod,
    required int recordCount,
  });
}

@LazySingleton(as: ExportRepository)
class DummyExportRepository implements ExportRepository {
  DummyExportRepository(this._store);

  final MiaStore _store;

  @override
  Future<List<ExportJob>> fetchExports() async {
    await Future<void>.delayed(kDummyLatency);
    return List<ExportJob>.from(_store.exports);
  }

  @override
  Future<ExportJob> requestExport({
    required String label,
    required String format,
    required String coveragePeriod,
    required int recordCount,
  }) async {
    await Future<void>.delayed(kDummyLatency);
    final ExportJob created = ExportJob(
      id: _store.nextId('exp-job'),
      label: label,
      format: format,
      requestedOn: DateTime.now(),
      state: ProcessingState.complete,
      coveragePeriod: coveragePeriod,
      recordCount: recordCount,
      sizeKb: (recordCount * 0.4).round() + 12,
      note: 'Carries the coverage period it was built from.',
    );
    _store.exports.insert(0, created);
    return created;
  }
}
