import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../dummy/dummy_assistant.dart';
import '../models/assistant_models.dart';
import '../models/core_models.dart';
import '../store/mia_store.dart';
import 'user_repository.dart' show kDummyLatency;

abstract class AskMiaRepository {
  Future<List<AskMiaConversation>> fetchConversations();

  Future<List<String>> fetchSuggestedQuestions();

  Future<List<AskMiaMessage>> ask(String question);
}

@LazySingleton(as: AskMiaRepository)
class DummyAskMiaRepository implements AskMiaRepository {
  @override
  Future<List<AskMiaConversation>> fetchConversations() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyAssistant.conversations;
  }

  @override
  Future<List<String>> fetchSuggestedQuestions() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyAssistant.suggestedQuestions;
  }

  @override
  Future<List<AskMiaMessage>> ask(String question) async {
    // Deliberately slower: the answer is composed from deterministic results.
    await Future<void>.delayed(const Duration(milliseconds: 900));
    return DummyAssistant.answersFor(question);
  }
}

abstract class ConnectionRepository {
  Future<List<ConnectionRecord>> fetchConnections();

  Future<List<EmailIntakeConnection>> fetchEmailConnections();

  Future<void> revokeConsent(String connectionId);

  Future<void> reconnect(String connectionId);

  Future<void> rotateForwardingAddress();

  /// Starts a consent. It is pending until the provider confirms it, and Mia
  /// shows it that way rather than pretending data is already flowing.
  Future<ConnectionRecord> startConnection({
    required ConnectionKind kind,
    required String institution,
    required String owner,
  });
}

@LazySingleton(as: ConnectionRepository)
class DummyConnectionRepository implements ConnectionRepository {
  DummyConnectionRepository(this._store);

  final MiaStore _store;

  void _update(
    String connectionId,
    ConnectionRecord Function(ConnectionRecord) transform,
  ) {
    final int index = _store.connections.indexWhere(
      (ConnectionRecord c) => c.id == connectionId,
    );
    if (index == -1) return;
    _store.connections[index] = transform(_store.connections[index]);
  }

  @override
  Future<List<ConnectionRecord>> fetchConnections() async {
    await Future<void>.delayed(kDummyLatency);
    return List<ConnectionRecord>.from(_store.connections);
  }

  @override
  Future<List<EmailIntakeConnection>> fetchEmailConnections() async {
    await Future<void>.delayed(kDummyLatency);
    return List<EmailIntakeConnection>.from(_store.emailConnections);
  }

  @override
  Future<void> revokeConsent(String connectionId) async {
    await Future<void>.delayed(kDummyLatency);
    // Revoking stops the feed but keeps the records it already brought in.
    _update(
      connectionId,
      (ConnectionRecord c) => c.copyWith(
        status: ConsentStatus.revoked,
        freshness: DataFreshness.stale,
        consentHistory: <AuditEvent>[
          ...c.consentHistory,
          AuditEvent(
            id: _store.nextId('aud'),
            actor: 'You',
            action: 'Revoked the consent',
            timestamp: DateTime.now(),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> reconnect(String connectionId) async {
    await Future<void>.delayed(const Duration(milliseconds: 700));
    final DateTime now = DateTime.now();
    _update(
      connectionId,
      (ConnectionRecord c) => c.copyWith(
        status: ConsentStatus.active,
        freshness: DataFreshness.live,
        lastRefreshed: now,
        dataCurrentTo: now,
        consentExpiresOn: now.add(const Duration(days: 365)),
        consentHistory: <AuditEvent>[
          ...c.consentHistory,
          AuditEvent(
            id: _store.nextId('aud'),
            actor: 'You',
            action: 'Reconnected and re-consented',
            timestamp: now,
          ),
        ],
      ),
    );
  }

  @override
  Future<void> rotateForwardingAddress() async {
    await Future<void>.delayed(kDummyLatency);
    for (int i = 0; i < _store.emailConnections.length; i++) {
      final EmailIntakeConnection e = _store.emailConnections[i];
      if (e.forwardingAddress == null) continue;
      final String suffix = _store
          .nextId('fw')
          .substring(3, 7)
          .replaceAll('-', '');
      _store.emailConnections[i] = EmailIntakeConnection(
        id: e.id,
        provider: e.provider,
        address: e.address,
        isConnected: e.isConnected,
        selectedLabels: e.selectedLabels,
        lastSync: e.lastSync,
        pendingItems: e.pendingItems,
        isPaused: e.isPaused,
        forwardingAddress: e.forwardingAddress!.replaceFirst(
          RegExp(r'^[^@]+'),
          'amara.$suffix',
        ),
      );
    }
  }

  @override
  Future<ConnectionRecord> startConnection({
    required ConnectionKind kind,
    required String institution,
    required String owner,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 620));
    final DateTime now = DateTime.now();
    final ConnectionRecord created = ConnectionRecord(
      id: _store.nextId('conn'),
      kind: kind,
      institution: institution,
      status: ConsentStatus.pending,
      consentGrantedOn: now,
      consentExpiresOn: now.add(const Duration(days: 365)),
      scopes: kind == ConnectionKind.energy
          ? const <String>['Usage data', 'Billing data', 'Plan details']
          : const <String>[
              'Account balances',
              'Transactions',
              'Account details',
            ],
      purpose: 'Only what Mia needs to do the admin you asked for.',
      owner: owner,
      freshness: DataFreshness.processing,
      logoGlyph: kind == ConnectionKind.energy
          ? Icons.bolt_rounded
          : Icons.account_balance_rounded,
      consentHistory: <AuditEvent>[
        AuditEvent(
          id: _store.nextId('aud'),
          actor: owner,
          action: 'Started the consent',
          timestamp: now,
        ),
      ],
    );
    _store.connections.insert(0, created);
    return created;
  }
}

abstract class NotificationRepository {
  Future<List<MiaNotification>> fetchNotifications();

  Future<void> markAllRead();
}

@LazySingleton(as: NotificationRepository)
class DummyNotificationRepository implements NotificationRepository {
  List<MiaNotification> _items = DummyAssistant.notifications;

  @override
  Future<List<MiaNotification>> fetchNotifications() async {
    await Future<void>.delayed(kDummyLatency);
    return _items;
  }

  @override
  Future<void> markAllRead() async {
    await Future<void>.delayed(kDummyLatency);
    _items = _items
        .map(
          (MiaNotification n) => MiaNotification(
            id: n.id,
            category: n.category,
            title: n.title,
            body: n.body,
            timestamp: n.timestamp,
            isRead: true,
            deepLinkLabel: n.deepLinkLabel,
            isCritical: n.isCritical,
          ),
        )
        .toList();
  }
}

abstract class SearchRepository {
  Future<List<SearchResult>> search(String query);
}

@LazySingleton(as: SearchRepository)
class DummySearchRepository implements SearchRepository {
  @override
  Future<List<SearchResult>> search(String query) async {
    await Future<void>.delayed(const Duration(milliseconds: 140));
    if (query.trim().isEmpty) return <SearchResult>[];
    final String q = query.toLowerCase();
    return DummyAssistant.searchCorpus
        .where(
          (SearchResult r) =>
              r.title.toLowerCase().contains(q) ||
              r.subtitle.toLowerCase().contains(q) ||
              r.kind.label.toLowerCase().contains(q),
        )
        .toList();
  }
}

abstract class SupportRepository {
  Future<List<HelpArticle>> fetchArticles();

  Future<List<SupportCase>> fetchCases();

  Future<SupportCase> submitCase(String subject, String body, bool diagnostics);
}

@LazySingleton(as: SupportRepository)
class DummySupportRepository implements SupportRepository {
  DummySupportRepository(this._store);

  final MiaStore _store;

  @override
  Future<List<HelpArticle>> fetchArticles() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyAssistant.helpArticles;
  }

  @override
  Future<List<SupportCase>> fetchCases() async {
    await Future<void>.delayed(kDummyLatency);
    return List<SupportCase>.from(_store.supportCases);
  }

  @override
  Future<SupportCase> submitCase(
    String subject,
    String body,
    bool diagnostics,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 520));
    // The reference is what the user is told, so the case has to exist with it.
    final SupportCase created = SupportCase(
      id: _store.nextId('case'),
      reference: 'MIA-${48215 + _store.supportCases.length}',
      subject: subject,
      status: 'Received',
      openedOn: DateTime.now(),
      diagnosticsAttached: diagnostics,
    );
    _store.supportCases.insert(0, created);
    return created;
  }
}
