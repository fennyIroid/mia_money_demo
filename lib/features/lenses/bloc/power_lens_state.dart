part of 'power_lens_bloc.dart';

@freezed
abstract class PowerLensState with _$PowerLensState {
  const factory PowerLensState({
    required List<ServicePoint> servicePoints,
    required List<EnergyAccountRecord> accounts,
    required List<EnergyBillRecord> bills,
    required bool isCalculating,
    required bool isReady,
    String? selectedServicePointId,
    PowerLensResult? result,
  }) = _PowerLensState;

  factory PowerLensState.initial() => const PowerLensState(
    servicePoints: <ServicePoint>[],
    accounts: <EnergyAccountRecord>[],
    bills: <EnergyBillRecord>[],
    isCalculating: false,
    isReady: false,
  );
}

extension PowerLensStateX on PowerLensState {
  ServicePoint? get selectedServicePoint {
    for (final ServicePoint point in servicePoints) {
      if (point.id == selectedServicePointId) return point;
    }
    return servicePoints.isEmpty ? null : servicePoints.first;
  }
}
