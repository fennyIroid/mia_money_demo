import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/admin_models.dart';
import '../../../data/models/core_models.dart';
import '../../../data/repositories/admin_repository.dart';

part 'inbox_bloc.freezed.dart';
part 'inbox_event.dart';
part 'inbox_state.dart';

@injectable
class InboxBloc extends Bloc<InboxEvent, InboxState> {
  InboxBloc(this._reviewRepository) : super(InboxState.initial()) {
    on<InboxLoad>(_onLoad);
    on<InboxStageSelected>(_onStageSelected);
    on<InboxScopeSelected>(_onScopeSelected);
    on<InboxSelectionToggled>(_onSelectionToggled);
    on<InboxSelectionCleared>(_onSelectionCleared);
    on<InboxApprove>(_onApprove);
    on<InboxApproveSelected>(_onApproveSelected);
    on<InboxDismiss>(_onDismiss);
    on<InboxUndoApproval>(_onUndoApproval);
  }

  final ReviewRepository _reviewRepository;

  Future<void> _onLoad(InboxLoad event, Emitter<InboxState> emit) async {
    final List<ReviewItem> items = await _reviewRepository.fetchReviewItems();
    emit(state.copyWith(items: items, isReady: true));
  }

  void _onStageSelected(InboxStageSelected event, Emitter<InboxState> emit) {
    emit(state.copyWith(stage: event.stage, selectedIds: const <String>{}));
  }

  void _onScopeSelected(InboxScopeSelected event, Emitter<InboxState> emit) {
    emit(state.copyWith(scope: event.scope));
  }

  void _onSelectionToggled(
    InboxSelectionToggled event,
    Emitter<InboxState> emit,
  ) {
    final Set<String> next = <String>{...state.selectedIds};
    if (!next.remove(event.itemId)) {
      next.add(event.itemId);
    }
    emit(state.copyWith(selectedIds: next));
  }

  void _onSelectionCleared(
    InboxSelectionCleared event,
    Emitter<InboxState> emit,
  ) {
    emit(state.copyWith(selectedIds: const <String>{}));
  }

  Future<void> _onApprove(InboxApprove event, Emitter<InboxState> emit) async {
    await _reviewRepository.approve(event.itemId);
    add(const InboxEvent.load());
  }

  Future<void> _onApproveSelected(
    InboxApproveSelected event,
    Emitter<InboxState> emit,
  ) async {
    await _reviewRepository.approveMany(state.selectedIds.toList());
    emit(state.copyWith(selectedIds: const <String>{}));
    add(const InboxEvent.load());
  }

  Future<void> _onDismiss(InboxDismiss event, Emitter<InboxState> emit) async {
    await _reviewRepository.dismiss(event.itemId);
    add(const InboxEvent.load());
  }

  Future<void> _onUndoApproval(
    InboxUndoApproval event,
    Emitter<InboxState> emit,
  ) async {
    await _reviewRepository.undoApproval(event.itemId);
    add(const InboxEvent.load());
  }
}
