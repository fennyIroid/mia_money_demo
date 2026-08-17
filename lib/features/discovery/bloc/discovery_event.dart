part of 'discovery_bloc.dart';

@freezed
abstract class DiscoveryEvent with _$DiscoveryEvent {
  const factory DiscoveryEvent.load() = DiscoveryLoad;

  const factory DiscoveryEvent.searchChanged(String query) =
      DiscoverySearchChanged;

  const factory DiscoveryEvent.notificationsRead() = DiscoveryNotificationsRead;

  const factory DiscoveryEvent.caseSubmitted({
    required String subject,
    required bool diagnostics,
  }) = DiscoveryCaseSubmitted;
}
