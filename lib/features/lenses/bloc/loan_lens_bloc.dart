import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/loan_models.dart';
import '../../../data/repositories/lens_repository.dart';

part 'loan_lens_bloc.freezed.dart';
part 'loan_lens_event.dart';
part 'loan_lens_state.dart';

@injectable
class LoanLensBloc extends Bloc<LoanLensEvent, LoanLensState> {
  LoanLensBloc(this._repository) : super(LoanLensState.initial()) {
    on<LoanLensLoad>(_onLoad);
    on<LoanLensObjectiveChanged>(_onObjectiveChanged);
    on<LoanLensProductTypeChanged>(_onProductTypeChanged);
    on<LoanLensGroupToggled>(_onGroupToggled);
    on<LoanLensAmountChanged>(_onAmountChanged);
    on<LoanLensFeatureToggled>(_onFeatureToggled);
    on<LoanLensRecalculated>(_onRecalculated);
  }

  final LoanLensRepository _repository;

  Future<void> _onLoad(LoanLensEvent event, Emitter<LoanLensState> emit) async {
    final List<Lender> lenders = await _repository.fetchLenders();
    emit(state.copyWith(lenders: lenders));
    add(const LoanLensEvent.recalculated());
  }

  void _onObjectiveChanged(
    LoanLensObjectiveChanged event,
    Emitter<LoanLensState> emit,
  ) {
    emit(
      state.copyWith(
        filters: state.filters.copyWith(objective: event.objective),
      ),
    );
    add(const LoanLensEvent.recalculated());
  }

  void _onProductTypeChanged(
    LoanLensProductTypeChanged event,
    Emitter<LoanLensState> emit,
  ) {
    emit(
      state.copyWith(
        filters: state.filters.copyWith(
          productType: event.type,
          loanAmount: event.type == LoanProductType.homeLoan ? 620000 : 25000,
          termYears: event.type == LoanProductType.homeLoan ? 27 : 5,
        ),
      ),
    );
    add(const LoanLensEvent.recalculated());
  }

  void _onGroupToggled(
    LoanLensGroupToggled event,
    Emitter<LoanLensState> emit,
  ) {
    final Set<LenderGroup> next = <LenderGroup>{...state.filters.groups};
    if (!next.remove(event.group)) {
      next.add(event.group);
    }
    emit(state.copyWith(filters: state.filters.copyWith(groups: next)));
    add(const LoanLensEvent.recalculated());
  }

  void _onAmountChanged(
    LoanLensAmountChanged event,
    Emitter<LoanLensState> emit,
  ) {
    emit(
      state.copyWith(filters: state.filters.copyWith(loanAmount: event.amount)),
    );
  }

  void _onFeatureToggled(
    LoanLensFeatureToggled event,
    Emitter<LoanLensState> emit,
  ) {
    final Set<String> next = <String>{...state.filters.requiredFeatures};
    if (!next.remove(event.feature)) {
      next.add(event.feature);
    }
    emit(
      state.copyWith(filters: state.filters.copyWith(requiredFeatures: next)),
    );
    add(const LoanLensEvent.recalculated());
  }

  Future<void> _onRecalculated(
    LoanLensRecalculated event,
    Emitter<LoanLensState> emit,
  ) async {
    emit(state.copyWith(isCalculating: true));
    final LoanLensResult result = await _repository.runComparison(
      state.filters,
    );
    emit(state.copyWith(isCalculating: false, isReady: true, result: result));
  }
}
