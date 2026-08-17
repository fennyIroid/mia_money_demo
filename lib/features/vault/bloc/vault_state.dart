part of 'vault_bloc.dart';

@freezed
abstract class VaultState with _$VaultState {
  const factory VaultState({
    required List<MiaDocument> documents,
    required List<Receipt> receipts,
    required List<PurchaseRecord> purchases,
    required List<ImportBatch> imports,
    required String query,
    required bool isReady,
    WarrantyStatus? warrantyFilter,
    DocumentKind? documentFilter,
  }) = _VaultState;

  factory VaultState.initial() => const VaultState(
    documents: <MiaDocument>[],
    receipts: <Receipt>[],
    purchases: <PurchaseRecord>[],
    imports: <ImportBatch>[],
    query: '',
    isReady: false,
  );
}

extension VaultStateX on VaultState {
  List<PurchaseRecord> get visiblePurchases {
    Iterable<PurchaseRecord> list = purchases;
    if (warrantyFilter != null) {
      list = list.where((PurchaseRecord p) => p.status == warrantyFilter);
    }
    if (query.trim().isNotEmpty) {
      final String q = query.toLowerCase();
      list = list.where(
        (PurchaseRecord p) =>
            p.itemName.toLowerCase().contains(q) ||
            p.retailer.toLowerCase().contains(q) ||
            (p.brand ?? '').toLowerCase().contains(q) ||
            (p.model ?? '').toLowerCase().contains(q) ||
            (p.serialNumber ?? '').toLowerCase().contains(q),
      );
    }
    return list.toList();
  }

  List<MiaDocument> get visibleDocuments {
    Iterable<MiaDocument> list = documents;
    if (documentFilter != null) {
      list = list.where((MiaDocument d) => d.kind == documentFilter);
    }
    if (query.trim().isNotEmpty) {
      final String q = query.toLowerCase();
      list = list.where((MiaDocument d) => d.name.toLowerCase().contains(q));
    }
    return list.toList();
  }

  int get expiringSoonCount => purchases
      .where((PurchaseRecord p) => p.status == WarrantyStatus.expiring)
      .length;

  int get activeWarrantyCount => purchases
      .where((PurchaseRecord p) => p.status == WarrantyStatus.active)
      .length;

  double get vaultValue => purchases.fold<double>(
    0,
    (double sum, PurchaseRecord p) => sum + (p.amount ?? 0),
  );

  List<Receipt> get mismatchedReceipts =>
      receipts.where((Receipt r) => r.hasMismatch).toList();
}
