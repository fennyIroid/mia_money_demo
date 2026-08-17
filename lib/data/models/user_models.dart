import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

enum HouseholdRole { individual, owner, adultMember, limitedMember }

extension HouseholdRoleX on HouseholdRole {
  String get label {
    switch (this) {
      case HouseholdRole.individual:
        return 'Individual';
      case HouseholdRole.owner:
        return 'Household owner';
      case HouseholdRole.adultMember:
        return 'Adult member';
      case HouseholdRole.limitedMember:
        return 'Limited access';
    }
  }

  String get description {
    switch (this) {
      case HouseholdRole.individual:
        return 'Manages their own connections, records and subscription.';
      case HouseholdRole.owner:
        return 'Administers membership and the subscription. Cannot see private records.';
      case HouseholdRole.adultMember:
        return 'Own login and connections. Participates in shared reviews.';
      case HouseholdRole.limitedMember:
        return 'Sees only what has been explicitly shared with them.';
    }
  }

  Color get color {
    switch (this) {
      case HouseholdRole.individual:
        return AppColors.glacier;
      case HouseholdRole.owner:
        return AppColors.ember;
      case HouseholdRole.adultMember:
        return AppColors.lagoon;
      case HouseholdRole.limitedMember:
        return AppColors.violetHaze;
    }
  }
}

@immutable
class MiaUser {
  const MiaUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    this.emailVerified = true,
    this.biometricEnabled = true,
    this.mfaEnabled = false,
    this.joinedOn,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final HouseholdRole role;
  final bool emailVerified;
  final bool biometricEnabled;
  final bool mfaEnabled;
  final DateTime? joinedOn;

  String get fullName => '$firstName $lastName';
}

@immutable
class HouseholdMember {
  const HouseholdMember({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.joinedOn,
    this.connectedSources = 0,
    this.openReviews = 0,
    this.isYou = false,
    this.pendingInvite = false,
    this.sharesWithYou = const <String>[],
  });

  final String id;
  final String name;
  final String email;
  final HouseholdRole role;
  final DateTime joinedOn;
  final int connectedSources;
  final int openReviews;
  final bool isYou;
  final bool pendingInvite;

  /// Record groups this member has explicitly shared with the current user.
  final List<String> sharesWithYou;
}

@immutable
class DeviceSession {
  const DeviceSession({
    required this.id,
    required this.deviceName,
    required this.platform,
    required this.location,
    required this.lastActive,
    this.isCurrent = false,
    this.isSuspicious = false,
  });

  final String id;
  final String deviceName;
  final String platform;
  final String location;
  final DateTime lastActive;
  final bool isCurrent;
  final bool isSuspicious;
}

enum PayFrequency { weekly, fortnightly, monthly, irregular }

extension PayFrequencyX on PayFrequency {
  String get label {
    switch (this) {
      case PayFrequency.weekly:
        return 'Weekly';
      case PayFrequency.fortnightly:
        return 'Fortnightly';
      case PayFrequency.monthly:
        return 'Monthly';
      case PayFrequency.irregular:
        return 'Irregular';
    }
  }
}

enum ReviewCadence { weekly, fortnightly, monthly }

extension ReviewCadenceX on ReviewCadence {
  String get label {
    switch (this) {
      case ReviewCadence.weekly:
        return 'Weekly';
      case ReviewCadence.fortnightly:
        return 'Fortnightly';
      case ReviewCadence.monthly:
        return 'Monthly';
    }
  }
}

@immutable
class UserPreferences {
  const UserPreferences({
    this.currency = 'AUD',
    this.timezone = 'Australia/Sydney',
    this.dateFormat = 'd MMM yyyy',
    this.financialYearStartMonth = 7,
    this.payFrequency = PayFrequency.fortnightly,
    this.nextPayDate,
    this.reviewCadence = ReviewCadence.weekly,
    this.reducedMotion = false,
    this.largerText = false,
    this.alwaysShowStatusWords = true,
    this.detailedNotificationPreviews = false,
    this.quietHoursStart = 21,
    this.quietHoursEnd = 7,
  });

  final String currency;
  final String timezone;
  final String dateFormat;
  final int financialYearStartMonth;
  final PayFrequency payFrequency;
  final DateTime? nextPayDate;
  final ReviewCadence reviewCadence;
  final bool reducedMotion;
  final bool largerText;
  final bool alwaysShowStatusWords;
  final bool detailedNotificationPreviews;
  final int quietHoursStart;
  final int quietHoursEnd;

  UserPreferences copyWith({
    String? currency,
    String? timezone,
    String? dateFormat,
    int? financialYearStartMonth,
    PayFrequency? payFrequency,
    DateTime? nextPayDate,
    ReviewCadence? reviewCadence,
    bool? reducedMotion,
    bool? largerText,
    bool? alwaysShowStatusWords,
    bool? detailedNotificationPreviews,
    int? quietHoursStart,
    int? quietHoursEnd,
  }) {
    return UserPreferences(
      currency: currency ?? this.currency,
      timezone: timezone ?? this.timezone,
      dateFormat: dateFormat ?? this.dateFormat,
      financialYearStartMonth:
          financialYearStartMonth ?? this.financialYearStartMonth,
      payFrequency: payFrequency ?? this.payFrequency,
      nextPayDate: nextPayDate ?? this.nextPayDate,
      reviewCadence: reviewCadence ?? this.reviewCadence,
      reducedMotion: reducedMotion ?? this.reducedMotion,
      largerText: largerText ?? this.largerText,
      alwaysShowStatusWords:
          alwaysShowStatusWords ?? this.alwaysShowStatusWords,
      detailedNotificationPreviews:
          detailedNotificationPreviews ?? this.detailedNotificationPreviews,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
    );
  }
}

enum PlanKind { individual, household }

enum PlanTerm { monthly, annual }

@immutable
class SubscriptionPlan {
  const SubscriptionPlan({
    required this.id,
    required this.kind,
    required this.term,
    required this.priceAud,
    required this.memberLimit,
    this.trialDays = 7,
    this.isBestValue = false,
    this.savingPercent,
  });

  final String id;
  final PlanKind kind;
  final PlanTerm term;
  final double priceAud;
  final int memberLimit;
  final int trialDays;
  final bool isBestValue;
  final int? savingPercent;

  String get title => kind == PlanKind.individual ? 'Individual' : 'Household';

  String get termLabel => term == PlanTerm.monthly ? 'per month' : 'per year';

  double get effectiveMonthly =>
      term == PlanTerm.monthly ? priceAud : priceAud / 12;
}

enum SubscriptionStatus {
  none,
  trialing,
  active,
  gracePeriod,
  billingRetry,
  expired,
  cancelled,
}

extension SubscriptionStatusX on SubscriptionStatus {
  String get label {
    switch (this) {
      case SubscriptionStatus.none:
        return 'No subscription';
      case SubscriptionStatus.trialing:
        return 'Trial';
      case SubscriptionStatus.active:
        return 'Active';
      case SubscriptionStatus.gracePeriod:
        return 'Grace period';
      case SubscriptionStatus.billingRetry:
        return 'Billing retry';
      case SubscriptionStatus.expired:
        return 'Expired';
      case SubscriptionStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case SubscriptionStatus.active:
      case SubscriptionStatus.trialing:
        return AppColors.positive;
      case SubscriptionStatus.gracePeriod:
      case SubscriptionStatus.billingRetry:
        return AppColors.caution;
      case SubscriptionStatus.expired:
      case SubscriptionStatus.cancelled:
        return AppColors.negative;
      case SubscriptionStatus.none:
        return AppColors.muted;
    }
  }
}

@immutable
class SubscriptionState {
  const SubscriptionState({
    required this.plan,
    required this.status,
    required this.renewsOn,
    this.store = 'Apple App Store',
    this.serverValidated = true,
    this.activeMembers = 1,
  });

  final SubscriptionPlan plan;
  final SubscriptionStatus status;
  final DateTime renewsOn;
  final String store;
  final bool serverValidated;
  final int activeMembers;
}

/// A granular consent the user has explicitly recorded.
@immutable
class ConsentToggle {
  const ConsentToggle({
    required this.id,
    required this.title,
    required this.description,
    required this.granted,
    this.required_ = false,
  });

  final String id;
  final String title;
  final String description;
  final bool granted;
  final bool required_;
}
