import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/assistant_models.dart';
import '../../../data/repositories/assistant_repository.dart';

part 'discovery_bloc.freezed.dart';
part 'discovery_event.dart';
part 'discovery_state.dart';

/// Backs global search, the notification centre and the help centre — three
/// surfaces that all read across the product under the same permissions.
@injectable
class DiscoveryBloc extends Bloc<DiscoveryEvent, DiscoveryState> {
  DiscoveryBloc(
    this._searchRepository,
    this._notificationRepository,
    this._supportRepository,
  ) : super(DiscoveryState.initial()) {
    on<DiscoveryLoad>(_onLoad);
    on<DiscoverySearchChanged>(_onSearchChanged);
    on<DiscoveryNotificationsRead>(_onNotificationsRead);
    on<DiscoveryCaseSubmitted>(_onCaseSubmitted);
  }

  final SearchRepository _searchRepository;
  final NotificationRepository _notificationRepository;
  final SupportRepository _supportRepository;

  Future<void> _onLoad(
    DiscoveryLoad event,
    Emitter<DiscoveryState> emit,
  ) async {
    emit(
      state.copyWith(
        isReady: true,
        notifications: await _notificationRepository.fetchNotifications(),
        articles: await _supportRepository.fetchArticles(),
        cases: await _supportRepository.fetchCases(),
      ),
    );
  }

  Future<void> _onSearchChanged(
    DiscoverySearchChanged event,
    Emitter<DiscoveryState> emit,
  ) async {
    emit(state.copyWith(query: event.query, isSearching: true));
    final List<SearchResult> results = await _searchRepository.search(
      event.query,
    );
    emit(state.copyWith(results: results, isSearching: false));
  }

  Future<void> _onNotificationsRead(
    DiscoveryNotificationsRead event,
    Emitter<DiscoveryState> emit,
  ) async {
    await _notificationRepository.markAllRead();
    emit(
      state.copyWith(
        notifications: await _notificationRepository.fetchNotifications(),
      ),
    );
  }

  /// Opening a case creates it with the reference the user is shown, so the
  /// number in the confirmation leads somewhere.
  Future<void> _onCaseSubmitted(
    DiscoveryCaseSubmitted event,
    Emitter<DiscoveryState> emit,
  ) async {
    await _supportRepository.submitCase(
      event.subject,
      event.subject,
      event.diagnostics,
    );
    emit(state.copyWith(cases: await _supportRepository.fetchCases()));
  }
}
