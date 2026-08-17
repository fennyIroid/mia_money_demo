part of 'power_lens_bloc.dart';

@freezed
abstract class PowerLensEvent with _$PowerLensEvent {
  const factory PowerLensEvent.load() = PowerLensLoad;

  const factory PowerLensEvent.propertySelected(String servicePointId) =
      PowerLensPropertySelected;

  const factory PowerLensEvent.recalculated() = PowerLensRecalculated;
}
