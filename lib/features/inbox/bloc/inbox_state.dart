part of 'inbox_bloc.dart';

/// Mine, theirs or ours — the permission-aware filter that applies everywhere.
enum InboxScope { mine, household, all }

extension InboxScopeX on InboxScope {
  String get label {
    switch (this) {
      case InboxScope.mine:
        return 'My reviews';
      case InboxScope.household:
        return 'Household';
      case InboxScope.all:
        return 'Everything';
    }
  }
}

@freezed
abstract class InboxState with _$InboxState {
  const factory InboxState({
    required List<ReviewItem> items,
    required InboxStage stage,
    required InboxScope scope,
    required Set<String> selectedIds,
    required bool isReady,
  }) = _InboxState;

  factory InboxState.initial() => const InboxState(
    items: <ReviewItem>[],
    stage: InboxStage.needsReview,
    scope: InboxScope.all,
    selectedIds: <String>{},
    isReady: false,
  );
}

extension InboxStateX on InboxState {
  static const List<InboxStage> visibleStages = <InboxStage>[
    InboxStage.needsReview,
    InboxStage.newItem,
    InboxStage.assignedWaiting,
    InboxStage.comingUp,
    InboxStage.exception,
    InboxStage.handled,
  ];

  List<ReviewItem> get scoped {
    switch (scope) {
      case InboxScope.mine:
        return items.where((ReviewItem i) => i.owner == 'Amara').toList();
      case InboxScope.household:
        return items
            .where((ReviewItem i) => i.visibility != RecordVisibility.private)
            .toList();
      case InboxScope.all:
        return items;
    }
  }

  List<ReviewItem> get filtered =>
      scoped.where((ReviewItem i) => i.stage == stage).toList();

  int countFor(InboxStage value) =>
      scoped.where((ReviewItem i) => i.stage == value).length;

  bool get hasSelection => selectedIds.isNotEmpty;

  List<ReviewItem> get approvable =>
      filtered.where((ReviewItem i) => i.oneTapApproval).toList();
}
