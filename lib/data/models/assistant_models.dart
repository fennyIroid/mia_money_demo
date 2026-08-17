import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'core_models.dart';

enum AnswerNature { fact, calculation, estimate, refusal, clarification }

extension AnswerNatureX on AnswerNature {
  String get label {
    switch (this) {
      case AnswerNature.fact:
        return 'Fact';
      case AnswerNature.calculation:
        return 'Calculation';
      case AnswerNature.estimate:
        return 'Estimate';
      case AnswerNature.refusal:
        return 'Boundary';
      case AnswerNature.clarification:
        return 'Needs detail';
    }
  }

  Color get color {
    switch (this) {
      case AnswerNature.fact:
        return AppColors.glacier;
      case AnswerNature.calculation:
        return AppColors.lagoon;
      case AnswerNature.estimate:
        return AppColors.caution;
      case AnswerNature.refusal:
        return AppColors.violetHaze;
      case AnswerNature.clarification:
        return AppColors.ember;
    }
  }
}

@immutable
class AskMiaMessage {
  const AskMiaMessage({
    required this.id,
    required this.body,
    required this.isFromUser,
    required this.timestamp,
    this.nature,
    this.figure,
    this.coveredDates,
    this.includedAccounts = const <String>[],
    this.freshness,
    this.evidence = const <EvidenceLink>[],
    this.missingInformation = const <String>[],
    this.followUps = const <String>[],
    this.calculationVersion,
    this.clarificationOptions = const <String>[],
  });

  final String id;
  final String body;
  final bool isFromUser;
  final DateTime timestamp;
  final AnswerNature? nature;

  /// Headline figure, already formatted by the deterministic layer.
  final String? figure;
  final String? coveredDates;
  final List<String> includedAccounts;
  final DataFreshness? freshness;
  final List<EvidenceLink> evidence;
  final List<String> missingInformation;
  final List<String> followUps;
  final String? calculationVersion;
  final List<String> clarificationOptions;
}

@immutable
class AskMiaConversation {
  const AskMiaConversation({
    required this.id,
    required this.title,
    required this.updatedOn,
    required this.messages,
  });

  final String id;
  final String title;
  final DateTime updatedOn;
  final List<AskMiaMessage> messages;
}

enum NotificationCategory {
  review,
  bill,
  renewal,
  warranty,
  expectedMoney,
  dataSource,
  security,
  billing,
  budget,
  goal,
  household,
  processing,
}

extension NotificationCategoryX on NotificationCategory {
  String get label {
    switch (this) {
      case NotificationCategory.review:
        return 'Reviews';
      case NotificationCategory.bill:
        return 'Bills';
      case NotificationCategory.renewal:
        return 'Renewals';
      case NotificationCategory.warranty:
        return 'Warranties';
      case NotificationCategory.expectedMoney:
        return 'Expected money';
      case NotificationCategory.dataSource:
        return 'Data sources';
      case NotificationCategory.security:
        return 'Security';
      case NotificationCategory.billing:
        return 'Billing';
      case NotificationCategory.budget:
        return 'Budget risk';
      case NotificationCategory.goal:
        return 'Goal risk';
      case NotificationCategory.household:
        return 'Household';
      case NotificationCategory.processing:
        return 'Processing';
    }
  }

  IconData get icon {
    switch (this) {
      case NotificationCategory.review:
        return Icons.rate_review_rounded;
      case NotificationCategory.bill:
        return Icons.receipt_long_rounded;
      case NotificationCategory.renewal:
        return Icons.event_repeat_rounded;
      case NotificationCategory.warranty:
        return Icons.shield_rounded;
      case NotificationCategory.expectedMoney:
        return Icons.hourglass_bottom_rounded;
      case NotificationCategory.dataSource:
        return Icons.link_rounded;
      case NotificationCategory.security:
        return Icons.security_rounded;
      case NotificationCategory.billing:
        return Icons.credit_card_rounded;
      case NotificationCategory.budget:
        return Icons.pie_chart_rounded;
      case NotificationCategory.goal:
        return Icons.flag_rounded;
      case NotificationCategory.household:
        return Icons.groups_rounded;
      case NotificationCategory.processing:
        return Icons.settings_suggest_rounded;
    }
  }

  Color get color {
    switch (this) {
      case NotificationCategory.security:
      case NotificationCategory.billing:
        return AppColors.negative;
      case NotificationCategory.review:
      case NotificationCategory.bill:
        return AppColors.ember;
      case NotificationCategory.renewal:
      case NotificationCategory.warranty:
        return AppColors.caution;
      case NotificationCategory.expectedMoney:
      case NotificationCategory.goal:
        return AppColors.lagoon;
      case NotificationCategory.dataSource:
      case NotificationCategory.processing:
        return AppColors.glacier;
      case NotificationCategory.budget:
        return AppColors.violetHaze;
      case NotificationCategory.household:
        return AppColors.positive;
    }
  }
}

@immutable
class MiaNotification {
  const MiaNotification({
    required this.id,
    required this.category,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
    this.deepLinkLabel,
    this.isCritical = false,
  });

  final String id;
  final NotificationCategory category;
  final String title;
  final String body;
  final DateTime timestamp;
  final bool isRead;
  final String? deepLinkLabel;
  final bool isCritical;
}

enum SearchResultKind {
  transaction,
  merchant,
  category,
  tag,
  bill,
  subscription,
  expectedMoney,
  purchase,
  warranty,
  receipt,
  document,
  note,
  energyPlan,
  servicePoint,
  householdTask,
}

extension SearchResultKindX on SearchResultKind {
  String get label {
    switch (this) {
      case SearchResultKind.transaction:
        return 'Transaction';
      case SearchResultKind.merchant:
        return 'Merchant';
      case SearchResultKind.category:
        return 'Category';
      case SearchResultKind.tag:
        return 'Tag';
      case SearchResultKind.bill:
        return 'Bill';
      case SearchResultKind.subscription:
        return 'Subscription';
      case SearchResultKind.expectedMoney:
        return 'Expected money';
      case SearchResultKind.purchase:
        return 'Purchase';
      case SearchResultKind.warranty:
        return 'Warranty';
      case SearchResultKind.receipt:
        return 'Receipt';
      case SearchResultKind.document:
        return 'Document';
      case SearchResultKind.note:
        return 'Note';
      case SearchResultKind.energyPlan:
        return 'Energy plan';
      case SearchResultKind.servicePoint:
        return 'Property';
      case SearchResultKind.householdTask:
        return 'Household task';
    }
  }

  IconData get icon {
    switch (this) {
      case SearchResultKind.transaction:
        return Icons.swap_horiz_rounded;
      case SearchResultKind.merchant:
        return Icons.storefront_rounded;
      case SearchResultKind.category:
        return Icons.label_rounded;
      case SearchResultKind.tag:
        return Icons.sell_rounded;
      case SearchResultKind.bill:
        return Icons.receipt_long_rounded;
      case SearchResultKind.subscription:
        return Icons.subscriptions_rounded;
      case SearchResultKind.expectedMoney:
        return Icons.hourglass_bottom_rounded;
      case SearchResultKind.purchase:
        return Icons.shopping_bag_rounded;
      case SearchResultKind.warranty:
        return Icons.shield_rounded;
      case SearchResultKind.receipt:
        return Icons.receipt_rounded;
      case SearchResultKind.document:
        return Icons.description_rounded;
      case SearchResultKind.note:
        return Icons.sticky_note_2_rounded;
      case SearchResultKind.energyPlan:
        return Icons.bolt_rounded;
      case SearchResultKind.servicePoint:
        return Icons.home_work_rounded;
      case SearchResultKind.householdTask:
        return Icons.checklist_rounded;
    }
  }
}

@immutable
class SearchResult {
  const SearchResult({
    required this.id,
    required this.kind,
    required this.title,
    required this.subtitle,
    this.amount,
    this.date,
    this.owner = 'You',
    this.visibility = RecordVisibility.private,
  });

  final String id;
  final SearchResultKind kind;
  final String title;
  final String subtitle;
  final double? amount;
  final DateTime? date;
  final String owner;
  final RecordVisibility visibility;
}

enum ConnectionKind { banking, energy, email }

enum ConsentStatus {
  active,
  expiringSoon,
  expired,
  revoked,
  pending,
  failed,
  reconnectRequired,
}

extension ConsentStatusX on ConsentStatus {
  String get label {
    switch (this) {
      case ConsentStatus.active:
        return 'Active';
      case ConsentStatus.expiringSoon:
        return 'Expiring soon';
      case ConsentStatus.expired:
        return 'Expired';
      case ConsentStatus.revoked:
        return 'Revoked';
      case ConsentStatus.pending:
        return 'Pending';
      case ConsentStatus.failed:
        return 'Failed';
      case ConsentStatus.reconnectRequired:
        return 'Reconnect needed';
    }
  }

  Color get color {
    switch (this) {
      case ConsentStatus.active:
        return AppColors.positive;
      case ConsentStatus.expiringSoon:
      case ConsentStatus.pending:
        return AppColors.caution;
      case ConsentStatus.expired:
      case ConsentStatus.revoked:
      case ConsentStatus.failed:
      case ConsentStatus.reconnectRequired:
        return AppColors.negative;
    }
  }
}

@immutable
class ConnectionRecord {
  const ConnectionRecord({
    required this.id,
    required this.kind,
    required this.institution,
    required this.status,
    required this.consentGrantedOn,
    required this.consentExpiresOn,
    required this.scopes,
    required this.purpose,
    required this.owner,
    required this.freshness,
    this.accountCount = 0,
    this.lastRefreshed,
    this.dataCurrentTo,
    this.historyProcessingMonthsRemaining = 0,
    this.logoGlyph = Icons.account_balance_rounded,
    this.accent = AppColors.glacier,
    this.consentHistory = const <AuditEvent>[],
  });

  final String id;
  final ConnectionKind kind;
  final String institution;
  final ConsentStatus status;
  final DateTime consentGrantedOn;
  final DateTime consentExpiresOn;
  final List<String> scopes;
  final String purpose;
  final String owner;
  final DataFreshness freshness;
  final int accountCount;
  final DateTime? lastRefreshed;
  final DateTime? dataCurrentTo;
  final int historyProcessingMonthsRemaining;
  final IconData logoGlyph;
  final Color accent;
  final List<AuditEvent> consentHistory;

  int get daysUntilExpiry => consentExpiresOn.difference(DateTime.now()).inDays;

  ConnectionRecord copyWith({
    ConsentStatus? status,
    DateTime? consentExpiresOn,
    DataFreshness? freshness,
    int? accountCount,
    DateTime? lastRefreshed,
    DateTime? dataCurrentTo,
    List<AuditEvent>? consentHistory,
  }) {
    return ConnectionRecord(
      id: id,
      kind: kind,
      institution: institution,
      status: status ?? this.status,
      consentGrantedOn: consentGrantedOn,
      consentExpiresOn: consentExpiresOn ?? this.consentExpiresOn,
      scopes: scopes,
      purpose: purpose,
      owner: owner,
      freshness: freshness ?? this.freshness,
      accountCount: accountCount ?? this.accountCount,
      lastRefreshed: lastRefreshed ?? this.lastRefreshed,
      dataCurrentTo: dataCurrentTo ?? this.dataCurrentTo,
      historyProcessingMonthsRemaining: historyProcessingMonthsRemaining,
      logoGlyph: logoGlyph,
      accent: accent,
      consentHistory: consentHistory ?? this.consentHistory,
    );
  }
}

@immutable
class EmailIntakeConnection {
  const EmailIntakeConnection({
    required this.id,
    required this.provider,
    required this.address,
    required this.isConnected,
    required this.selectedLabels,
    this.lastSync,
    this.pendingItems = 0,
    this.isPaused = false,
    this.forwardingAddress,
  });

  final String id;
  final String provider;
  final String address;
  final bool isConnected;
  final List<String> selectedLabels;
  final DateTime? lastSync;
  final int pendingItems;
  final bool isPaused;
  final String? forwardingAddress;
}

@immutable
class HelpArticle {
  const HelpArticle({
    required this.id,
    required this.title,
    required this.category,
    required this.body,
    this.icon = Icons.help_outline_rounded,
  });

  final String id;
  final String title;
  final String category;
  final String body;
  final IconData icon;
}

@immutable
class SupportCase {
  const SupportCase({
    required this.id,
    required this.reference,
    required this.subject,
    required this.status,
    required this.openedOn,
    this.lastUpdate,
    this.diagnosticsAttached = false,
  });

  final String id;
  final String reference;
  final String subject;
  final String status;
  final DateTime openedOn;
  final DateTime? lastUpdate;
  final bool diagnosticsAttached;
}
