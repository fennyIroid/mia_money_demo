import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/money_models.dart';
import '../../../data/repositories/money_repository.dart';

part 'split_bloc.freezed.dart';
part 'split_event.dart';
part 'split_state.dart';

@injectable
class SplitBloc extends Bloc<SplitEvent, SplitState> {
  SplitBloc(this._transactionRepository) : super(SplitState.initial()) {
    on<SplitStarted>(_onStarted);
    on<SplitMethodChanged>(_onMethodChanged);
    on<SplitLineAdded>(_onLineAdded);
    on<SplitLineRemoved>(_onLineRemoved);
    on<SplitLineAmountChanged>(_onLineAmountChanged);
    on<SplitLineCategoryChanged>(_onLineCategoryChanged);
    on<SplitSaved>(_onSaved);
  }

  final TransactionRepository _transactionRepository;

  void _onStarted(SplitStarted event, Emitter<SplitState> emit) {
    final List<TransactionSplit> existing = event.transaction.splits;
    emit(
      state.copyWith(
        parentAmount: event.transaction.amount,
        transactionId: event.transaction.id,
        lines: existing.isNotEmpty
            ? existing
            : <TransactionSplit>[
                TransactionSplit(
                  id: 'new-1',
                  amount: event.transaction.amount,
                  categoryId: event.transaction.layers.effectiveCategoryId,
                ),
              ],
      ),
    );
  }

  void _onMethodChanged(SplitMethodChanged event, Emitter<SplitState> emit) {
    final SplitMethod method = event.method;
    List<TransactionSplit> lines = state.lines;

    if (method == SplitMethod.equalShares && lines.isNotEmpty) {
      final double share = state.parentAmount / lines.length;
      lines = lines
          .map(
            (TransactionSplit l) => TransactionSplit(
              id: l.id,
              amount: double.parse(share.toStringAsFixed(2)),
              categoryId: l.categoryId,
              note: l.note,
              tags: l.tags,
            ),
          )
          .toList();
    }

    emit(state.copyWith(method: method, lines: lines));
  }

  void _onLineAdded(SplitLineAdded event, Emitter<SplitState> emit) {
    emit(
      state.copyWith(
        lines: <TransactionSplit>[
          ...state.lines,
          TransactionSplit(
            id: 'new-${state.lines.length + 1}',
            amount: 0,
            categoryId: event.categoryId,
          ),
        ],
      ),
    );
  }

  void _onLineRemoved(SplitLineRemoved event, Emitter<SplitState> emit) {
    emit(
      state.copyWith(
        lines: state.lines
            .where((TransactionSplit l) => l.id != event.lineId)
            .toList(),
      ),
    );
  }

  void _onLineAmountChanged(
    SplitLineAmountChanged event,
    Emitter<SplitState> emit,
  ) {
    emit(
      state.copyWith(
        lines: state.lines
            .map(
              (TransactionSplit l) => l.id == event.lineId
                  ? TransactionSplit(
                      id: l.id,
                      amount: event.amount,
                      categoryId: l.categoryId,
                      note: l.note,
                      tags: l.tags,
                    )
                  : l,
            )
            .toList(),
      ),
    );
  }

  void _onLineCategoryChanged(
    SplitLineCategoryChanged event,
    Emitter<SplitState> emit,
  ) {
    emit(
      state.copyWith(
        lines: state.lines
            .map(
              (TransactionSplit l) => l.id == event.lineId
                  ? TransactionSplit(
                      id: l.id,
                      amount: l.amount,
                      categoryId: event.categoryId,
                      note: l.note,
                      tags: l.tags,
                    )
                  : l,
            )
            .toList(),
      ),
    );
  }

  Future<void> _onSaved(SplitSaved event, Emitter<SplitState> emit) async {
    if (!state.balances) return;
    await _transactionRepository.saveSplits(state.transactionId, state.lines);
    emit(state.copyWith(isSaved: true));
  }
}
