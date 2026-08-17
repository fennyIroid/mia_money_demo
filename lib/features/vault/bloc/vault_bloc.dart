import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/admin_models.dart';
import '../../../data/repositories/admin_repository.dart';

part 'vault_bloc.freezed.dart';
part 'vault_event.dart';
part 'vault_state.dart';

@injectable
class VaultBloc extends Bloc<VaultEvent, VaultState> {
  VaultBloc(this._documentRepository, this._vaultRepository)
    : super(VaultState.initial()) {
    on<VaultLoad>(_onLoad);
    on<VaultQueryChanged>(_onQueryChanged);
    on<VaultWarrantyFilterChanged>(_onWarrantyFilterChanged);
    on<VaultDocumentFilterChanged>(_onDocumentFilterChanged);
    on<VaultReminderToggled>(_onReminderToggled);
    on<VaultDocumentDeleted>(_onDocumentDeleted);
    on<VaultDocumentReprocessed>(_onDocumentReprocessed);
    on<VaultReceiptMatchAccepted>(_onReceiptMatchAccepted);
    on<VaultReceiptMatchRejected>(_onReceiptMatchRejected);
    on<VaultImportRolledBack>(_onImportRolledBack);
    on<VaultPurchaseIssueNoted>(_onPurchaseIssueNoted);
  }

  final DocumentRepository _documentRepository;
  final VaultRepository _vaultRepository;

  Future<void> _onLoad(VaultLoad event, Emitter<VaultState> emit) async {
    final List<MiaDocument> documents = await _documentRepository
        .fetchDocuments();
    final List<Receipt> receipts = await _documentRepository.fetchReceipts();
    final List<ImportBatch> imports = await _documentRepository.fetchImports();
    final List<PurchaseRecord> purchases = await _vaultRepository
        .fetchPurchases();

    emit(
      state.copyWith(
        isReady: true,
        documents: documents,
        receipts: receipts,
        imports: imports,
        purchases: purchases,
      ),
    );
  }

  void _onQueryChanged(VaultQueryChanged event, Emitter<VaultState> emit) {
    emit(state.copyWith(query: event.query));
  }

  void _onWarrantyFilterChanged(
    VaultWarrantyFilterChanged event,
    Emitter<VaultState> emit,
  ) {
    emit(state.copyWith(warrantyFilter: event.status));
  }

  void _onDocumentFilterChanged(
    VaultDocumentFilterChanged event,
    Emitter<VaultState> emit,
  ) {
    emit(state.copyWith(documentFilter: event.kind));
  }

  Future<void> _onReminderToggled(
    VaultReminderToggled event,
    Emitter<VaultState> emit,
  ) async {
    await _vaultRepository.setReminders(event.purchaseId, event.enabled);
    add(const VaultEvent.load());
  }

  Future<void> _onDocumentReprocessed(
    VaultDocumentReprocessed event,
    Emitter<VaultState> emit,
  ) async {
    await _documentRepository.reprocess(event.documentId);
    add(const VaultEvent.load());
  }

  Future<void> _onReceiptMatchAccepted(
    VaultReceiptMatchAccepted event,
    Emitter<VaultState> emit,
  ) async {
    await _documentRepository.attachReceipt(
      receiptId: event.receiptId,
      transactionId: event.transactionId,
    );
    add(const VaultEvent.load());
  }

  Future<void> _onReceiptMatchRejected(
    VaultReceiptMatchRejected event,
    Emitter<VaultState> emit,
  ) async {
    await _documentRepository.detachReceipt(event.receiptId);
    add(const VaultEvent.load());
  }

  Future<void> _onImportRolledBack(
    VaultImportRolledBack event,
    Emitter<VaultState> emit,
  ) async {
    await _documentRepository.rollbackImport(event.batchId);
    add(const VaultEvent.load());
  }

  Future<void> _onPurchaseIssueNoted(
    VaultPurchaseIssueNoted event,
    Emitter<VaultState> emit,
  ) async {
    await _vaultRepository.noteIssue(event.purchaseId, event.note);
    add(const VaultEvent.load());
  }

  Future<void> _onDocumentDeleted(
    VaultDocumentDeleted event,
    Emitter<VaultState> emit,
  ) async {
    await _documentRepository.deleteDocument(event.documentId);
    add(const VaultEvent.load());
  }
}
