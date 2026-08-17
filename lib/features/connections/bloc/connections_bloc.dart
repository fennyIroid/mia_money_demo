import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/assistant_models.dart';
import '../../../data/repositories/assistant_repository.dart';

part 'connections_bloc.freezed.dart';
part 'connections_event.dart';
part 'connections_state.dart';

@injectable
class ConnectionsBloc extends Bloc<ConnectionsEvent, ConnectionsState> {
  ConnectionsBloc(this._repository) : super(ConnectionsState.initial()) {
    on<ConnectionsLoad>(_onLoad);
    on<ConnectionsRevoke>(_onRevoke);
    on<ConnectionsReconnect>(_onReconnect);
    on<ConnectionsRotateAddress>(_onRotateAddress);
    on<ConnectionsConnectionStarted>(_onConnectionStarted);
  }

  final ConnectionRepository _repository;

  Future<void> _onLoad(
    ConnectionsEvent event,
    Emitter<ConnectionsState> emit,
  ) async {
    emit(
      state.copyWith(
        isReady: true,
        connections: await _repository.fetchConnections(),
        emails: await _repository.fetchEmailConnections(),
      ),
    );
  }

  Future<void> _onRevoke(
    ConnectionsRevoke event,
    Emitter<ConnectionsState> emit,
  ) async {
    await _repository.revokeConsent(event.connectionId);
    add(const ConnectionsEvent.load());
  }

  Future<void> _onReconnect(
    ConnectionsReconnect event,
    Emitter<ConnectionsState> emit,
  ) async {
    emit(state.copyWith(isBusy: true));
    await _repository.reconnect(event.connectionId);
    emit(state.copyWith(isBusy: false));
    add(const ConnectionsEvent.load());
  }

  Future<void> _onRotateAddress(
    ConnectionsRotateAddress event,
    Emitter<ConnectionsState> emit,
  ) async {
    await _repository.rotateForwardingAddress();
    add(const ConnectionsEvent.load());
  }

  Future<void> _onConnectionStarted(
    ConnectionsConnectionStarted event,
    Emitter<ConnectionsState> emit,
  ) async {
    emit(state.copyWith(isBusy: true));
    await _repository.startConnection(
      kind: event.kind,
      institution: event.institution,
      owner: 'You',
    );
    emit(state.copyWith(isBusy: false));
    add(const ConnectionsEvent.load());
  }
}
