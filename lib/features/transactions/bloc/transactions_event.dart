part of 'transactions_bloc.dart';

@freezed
abstract class TransactionsEvent with _$TransactionsEvent {
  const factory TransactionsEvent.load({@Default(false) bool isRefresh}) =
      TransactionsLoad;

  const factory TransactionsEvent.searchChanged(String query) =
      TransactionsSearchChanged;

  const factory TransactionsEvent.filterChanged(TransactionFilter filter) =
      TransactionsFilterChanged;

  const factory TransactionsEvent.selectionToggled(String id) =
      TransactionsSelectionToggled;

  const factory TransactionsEvent.correctionApplied({
    required String transactionId,
    String? categoryId,
    TransactionTreatment? treatment,
  }) = TransactionsCorrectionApplied;

  const factory TransactionsEvent.bulkCorrectionApplied({
    String? categoryId,
    TransactionTreatment? treatment,
  }) = TransactionsBulkCorrectionApplied;

  const factory TransactionsEvent.reconciliationConfirmed(String candidateId) =
      TransactionsReconciliationConfirmed;

  const factory TransactionsEvent.reconciliationDismissed(String candidateId) =
      TransactionsReconciliationDismissed;

  const factory TransactionsEvent.ruleCreated(MiaRule rule) =
      TransactionsRuleCreated;

  const factory TransactionsEvent.ruleDeleted(String ruleId) =
      TransactionsRuleDeleted;

  const factory TransactionsEvent.ruleTogglePaused({
    required String ruleId,
    required bool paused,
  }) = TransactionsRuleTogglePaused;

  const factory TransactionsEvent.categoryDraftStarted() =
      TransactionsCategoryDraftStarted;

  const factory TransactionsEvent.categoryDraftChanged({
    String? name,
    int? colourIndex,
    int? iconIndex,
    String? parentId,
    @Default(false) bool clearParent,
  }) = TransactionsCategoryDraftChanged;

  const factory TransactionsEvent.categoryDraftSubmitted() =
      TransactionsCategoryDraftSubmitted;

  const factory TransactionsEvent.categoriesMerged({
    required String fromId,
    required String intoId,
  }) = TransactionsCategoriesMerged;

  const factory TransactionsEvent.subcategoryMoved({
    required String categoryId,
    required String parentId,
  }) = TransactionsSubcategoryMoved;

  const factory TransactionsEvent.categoryArchived(String categoryId) =
      TransactionsCategoryArchived;
}
