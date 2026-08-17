import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/energy_models.dart';
import '../../../data/repositories/lens_repository.dart';

part 'power_lens_bloc.freezed.dart';
part 'power_lens_event.dart';
part 'power_lens_state.dart';

@injectable
class PowerLensBloc extends Bloc<PowerLensEvent, PowerLensState> {
  PowerLensBloc(this._repository) : super(PowerLensState.initial()) {
    on<PowerLensLoad>(_onLoad);
    on<PowerLensPropertySelected>(_onPropertySelected);
    on<PowerLensRecalculated>(_onRecalculated);
  }

  final PowerLensRepository _repository;

  Future<void> _onLoad(
    PowerLensLoad event,
    Emitter<PowerLensState> emit,
  ) async {
    final List<ServicePoint> points = await _repository.fetchServicePoints();
    final List<EnergyAccountRecord> accounts = await _repository
        .fetchEnergyAccounts();
    final List<EnergyBillRecord> bills = await _repository.fetchEnergyBills();
    emit(
      state.copyWith(
        servicePoints: points,
        accounts: accounts,
        bills: bills,
        selectedServicePointId: points.isEmpty ? null : points.first.id,
      ),
    );
    add(const PowerLensEvent.recalculated());
  }

  void _onPropertySelected(
    PowerLensPropertySelected event,
    Emitter<PowerLensState> emit,
  ) {
    emit(state.copyWith(selectedServicePointId: event.servicePointId));
    add(const PowerLensEvent.recalculated());
  }

  Future<void> _onRecalculated(
    PowerLensRecalculated event,
    Emitter<PowerLensState> emit,
  ) async {
    emit(state.copyWith(isCalculating: true));
    final PowerLensResult result = await _repository.runComparison(
      state.selectedServicePointId ?? 'sp-1',
    );
    emit(state.copyWith(isCalculating: false, result: result, isReady: true));
  }
}
