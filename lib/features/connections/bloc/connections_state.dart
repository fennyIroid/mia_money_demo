part of 'connections_bloc.dart';

@freezed
abstract class ConnectionsState with _$ConnectionsState {
  const factory ConnectionsState({
    required List<ConnectionRecord> connections,
    required List<EmailIntakeConnection> emails,
    required bool isReady,
    required bool isBusy,
  }) = _ConnectionsState;

  factory ConnectionsState.initial() => const ConnectionsState(
    connections: <ConnectionRecord>[],
    emails: <EmailIntakeConnection>[],
    isReady: false,
    isBusy: false,
  );
}

extension ConnectionsStateX on ConnectionsState {
  List<ConnectionRecord> get banking => connections
      .where((ConnectionRecord c) => c.kind == ConnectionKind.banking)
      .toList();

  List<ConnectionRecord> get energy => connections
      .where((ConnectionRecord c) => c.kind == ConnectionKind.energy)
      .toList();

  bool get hasAttention => connections.any(
    (ConnectionRecord c) =>
        c.status == ConsentStatus.reconnectRequired ||
        c.status == ConsentStatus.expiringSoon,
  );
}
