part of 'vault_bloc.dart';

@freezed
abstract class VaultEvent with _$VaultEvent {
  const factory VaultEvent.load() = VaultLoad;

  const factory VaultEvent.queryChanged(String query) = VaultQueryChanged;

  const factory VaultEvent.warrantyFilterChanged(WarrantyStatus? status) =
      VaultWarrantyFilterChanged;

  const factory VaultEvent.documentFilterChanged(DocumentKind? kind) =
      VaultDocumentFilterChanged;

  const factory VaultEvent.reminderToggled({
    required String purchaseId,
    required bool enabled,
  }) = VaultReminderToggled;

  const factory VaultEvent.documentDeleted(String documentId) =
      VaultDocumentDeleted;

  const factory VaultEvent.documentReprocessed(String documentId) =
      VaultDocumentReprocessed;

  const factory VaultEvent.receiptMatchAccepted({
    required String receiptId,
    required String transactionId,
  }) = VaultReceiptMatchAccepted;

  const factory VaultEvent.receiptMatchRejected(String receiptId) =
      VaultReceiptMatchRejected;

  const factory VaultEvent.importRolledBack(String batchId) =
      VaultImportRolledBack;

  const factory VaultEvent.purchaseIssueNoted({
    required String purchaseId,
    required String note,
  }) = VaultPurchaseIssueNoted;
}
