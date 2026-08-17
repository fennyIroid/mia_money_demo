part of 'connections_bloc.dart';

@freezed
abstract class ConnectionsEvent with _$ConnectionsEvent {
  const factory ConnectionsEvent.load() = ConnectionsLoad;

  const factory ConnectionsEvent.revoke(String connectionId) =
      ConnectionsRevoke;

  const factory ConnectionsEvent.reconnect(String connectionId) =
      ConnectionsReconnect;

  const factory ConnectionsEvent.rotateAddress() = ConnectionsRotateAddress;

  const factory ConnectionsEvent.connectionStarted({
    required ConnectionKind kind,
    required String institution,
  }) = ConnectionsConnectionStarted;
}
