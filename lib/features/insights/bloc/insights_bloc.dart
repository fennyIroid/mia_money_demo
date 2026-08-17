import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/insight_models.dart';
import '../../../data/repositories/insight_repository.dart';

part 'insights_bloc.freezed.dart';
part 'insights_event.dart';
part 'insights_state.dart';

/// Backs the deep-dive surfaces: Available After Obligations, True Cost of Life,
/// What Changed, Mia Handled This, the Weekly Reset and briefings.
@injectable
class InsightsBloc extends Bloc<InsightsEvent, InsightsState> {
  InsightsBloc(this._repository) : super(InsightsState.initial()) {
    on<InsightsLoad>(_onLoad);
    on<InsightsResetStepChanged>(_onResetStepChanged);
    on<InsightsWeeklyResetCompleted>(_onWeeklyResetCompleted);
  }

  final InsightRepository _repository;

  Future<void> _onLoad(InsightsLoad event, Emitter<InsightsState> emit) async {
    emit(
      state.copyWith(
        isReady: true,
        available: await _repository.fetchAvailableAfterObligations(),
        trueCost: await _repository.fetchTrueCostOfLife(),
        whatChanged: await _repository.fetchWhatChanged(),
        handled: await _repository.fetchHandled(),
        weeklyReset: await _repository.fetchWeeklyReset(),
        weeklyResetCompletedOn: await _repository.fetchWeeklyResetCompletedOn(),
        briefings: await _repository.fetchBriefings(),
      ),
    );
  }

  void _onResetStepChanged(
    InsightsResetStepChanged event,
    Emitter<InsightsState> emit,
  ) {
    emit(state.copyWith(resetStep: event.step));
  }

  Future<void> _onWeeklyResetCompleted(
    InsightsWeeklyResetCompleted event,
    Emitter<InsightsState> emit,
  ) async {
    final DateTime completedOn = await _repository.completeWeeklyReset();
    emit(state.copyWith(weeklyResetCompletedOn: completedOn, resetStep: 0));
  }
}
