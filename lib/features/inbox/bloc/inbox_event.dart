part of 'inbox_bloc.dart';

@freezed
abstract class InboxEvent with _$InboxEvent {
  const factory InboxEvent.load() = InboxLoad;

  const factory InboxEvent.stageSelected(InboxStage stage) = InboxStageSelected;

  const factory InboxEvent.scopeSelected(InboxScope scope) = InboxScopeSelected;

  const factory InboxEvent.selectionToggled(String itemId) =
      InboxSelectionToggled;

  const factory InboxEvent.selectionCleared() = InboxSelectionCleared;

  const factory InboxEvent.approve(String itemId) = InboxApprove;

  const factory InboxEvent.approveSelected() = InboxApproveSelected;

  const factory InboxEvent.dismiss(String itemId) = InboxDismiss;

  const factory InboxEvent.undoApproval(String itemId) = InboxUndoApproval;
}
