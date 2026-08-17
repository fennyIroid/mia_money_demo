part of 'discovery_bloc.dart';

@freezed
abstract class DiscoveryState with _$DiscoveryState {
  const factory DiscoveryState({
    required List<SearchResult> results,
    required List<MiaNotification> notifications,
    required List<HelpArticle> articles,
    required List<SupportCase> cases,
    required String query,
    required bool isSearching,
    required bool isReady,
  }) = _DiscoveryState;

  factory DiscoveryState.initial() => const DiscoveryState(
    results: <SearchResult>[],
    notifications: <MiaNotification>[],
    articles: <HelpArticle>[],
    cases: <SupportCase>[],
    query: '',
    isSearching: false,
    isReady: false,
  );
}

extension DiscoveryStateX on DiscoveryState {
  int get unreadCount =>
      notifications.where((MiaNotification n) => !n.isRead).length;

  List<MiaNotification> get criticalNotifications =>
      notifications.where((MiaNotification n) => n.isCritical).toList();
}
