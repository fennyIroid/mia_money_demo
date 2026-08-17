import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Where a displayed value came from. The brief requires this to be visible on
/// any value a user might question.
enum ValueSource {
  provider,
  miaMapped,
  aiSuggested,
  userConfirmed,
  manual,
  calculated,
}

extension ValueSourceX on ValueSource {
  String get label {
    switch (this) {
      case ValueSource.provider:
        return 'Provider supplied';
      case ValueSource.miaMapped:
        return 'Mia mapped';
      case ValueSource.aiSuggested:
        return 'AI suggested';
      case ValueSource.userConfirmed:
        return 'You confirmed';
      case ValueSource.manual:
        return 'Manual entry';
      case ValueSource.calculated:
        return 'Calculated';
    }
  }

  IconData get icon {
    switch (this) {
      case ValueSource.provider:
        return Icons.account_balance_rounded;
      case ValueSource.miaMapped:
        return Icons.auto_fix_high_rounded;
      case ValueSource.aiSuggested:
        return Icons.auto_awesome_rounded;
      case ValueSource.userConfirmed:
        return Icons.verified_rounded;
      case ValueSource.manual:
        return Icons.edit_rounded;
      case ValueSource.calculated:
        return Icons.functions_rounded;
    }
  }

  Color get color {
    switch (this) {
      case ValueSource.provider:
        return AppColors.glacier;
      case ValueSource.miaMapped:
        return AppColors.violetHaze;
      case ValueSource.aiSuggested:
        return AppColors.amberGlow;
      case ValueSource.userConfirmed:
        return AppColors.positive;
      case ValueSource.manual:
        return AppColors.mist;
      case ValueSource.calculated:
        return AppColors.lagoon;
    }
  }
}

/// How trustworthy the underlying data is right now.
enum DataFreshness { live, recent, delayed, stale, processing, missing }

extension DataFreshnessX on DataFreshness {
  String get label {
    switch (this) {
      case DataFreshness.live:
        return 'Live';
      case DataFreshness.recent:
        return 'Recent';
      case DataFreshness.delayed:
        return 'Delayed';
      case DataFreshness.stale:
        return 'Stale';
      case DataFreshness.processing:
        return 'Processing';
      case DataFreshness.missing:
        return 'Missing';
    }
  }

  Color get color {
    switch (this) {
      case DataFreshness.live:
        return AppColors.positive;
      case DataFreshness.recent:
        return AppColors.lagoon;
      case DataFreshness.delayed:
        return AppColors.caution;
      case DataFreshness.stale:
        return AppColors.negative;
      case DataFreshness.processing:
        return AppColors.glacier;
      case DataFreshness.missing:
        return AppColors.muted;
    }
  }
}

enum Completeness { complete, mostlyComplete, partial, insufficient }

extension CompletenessX on Completeness {
  String get label {
    switch (this) {
      case Completeness.complete:
        return 'Complete';
      case Completeness.mostlyComplete:
        return 'Mostly complete';
      case Completeness.partial:
        return 'Partial';
      case Completeness.insufficient:
        return 'Insufficient';
    }
  }

  double get coverage {
    switch (this) {
      case Completeness.complete:
        return 1.0;
      case Completeness.mostlyComplete:
        return 0.92;
      case Completeness.partial:
        return 0.68;
      case Completeness.insufficient:
        return 0.31;
    }
  }
}

/// Every material figure in the product carries one of these. It is what makes a
/// number inspectable rather than merely displayed.
@immutable
class CalculationMeta {
  const CalculationMeta({
    required this.version,
    required this.asOf,
    required this.rangeLabel,
    this.recordCount = 0,
    this.exclusions = const <String>[],
    this.missingData = const <String>[],
    this.completeness = Completeness.complete,
    this.sources = const <String>[],
    this.assumptions = const <String>[],
  });

  final String version;
  final DateTime asOf;
  final String rangeLabel;
  final int recordCount;
  final List<String> exclusions;
  final List<String> missingData;
  final Completeness completeness;
  final List<String> sources;
  final List<String> assumptions;
}

/// Household visibility of a record.
enum RecordVisibility { private, household, selectedMembers }

extension RecordVisibilityX on RecordVisibility {
  String get label {
    switch (this) {
      case RecordVisibility.private:
        return 'Private';
      case RecordVisibility.household:
        return 'Shared with household';
      case RecordVisibility.selectedMembers:
        return 'Selected members';
    }
  }

  IconData get icon {
    switch (this) {
      case RecordVisibility.private:
        return Icons.lock_rounded;
      case RecordVisibility.household:
        return Icons.groups_rounded;
      case RecordVisibility.selectedMembers:
        return Icons.group_add_rounded;
    }
  }
}

/// An entry in a record's audit history.
@immutable
class AuditEvent {
  const AuditEvent({
    required this.id,
    required this.actor,
    required this.action,
    required this.timestamp,
    this.reason,
    this.evidence,
    this.canUndo = false,
  });

  final String id;
  final String actor;
  final String action;
  final DateTime timestamp;
  final String? reason;
  final String? evidence;
  final bool canUndo;
}

@immutable
class RecordComment {
  const RecordComment({
    required this.id,
    required this.author,
    required this.body,
    required this.timestamp,
  });

  final String id;
  final String author;
  final String body;
  final DateTime timestamp;
}

/// A named piece of supporting evidence a figure or answer relies on.
@immutable
class EvidenceLink {
  const EvidenceLink({
    required this.id,
    required this.label,
    required this.kind,
    this.detail,
  });

  final String id;
  final String label;
  final EvidenceKind kind;
  final String? detail;
}

enum EvidenceKind {
  transaction,
  document,
  bill,
  usage,
  plan,
  balance,
  receipt,
  calculation,
  consent,
}

extension EvidenceKindX on EvidenceKind {
  IconData get icon {
    switch (this) {
      case EvidenceKind.transaction:
        return Icons.swap_horiz_rounded;
      case EvidenceKind.document:
        return Icons.description_rounded;
      case EvidenceKind.bill:
        return Icons.receipt_long_rounded;
      case EvidenceKind.usage:
        return Icons.bolt_rounded;
      case EvidenceKind.plan:
        return Icons.list_alt_rounded;
      case EvidenceKind.balance:
        return Icons.account_balance_wallet_rounded;
      case EvidenceKind.receipt:
        return Icons.receipt_rounded;
      case EvidenceKind.calculation:
        return Icons.functions_rounded;
      case EvidenceKind.consent:
        return Icons.verified_user_rounded;
    }
  }
}
