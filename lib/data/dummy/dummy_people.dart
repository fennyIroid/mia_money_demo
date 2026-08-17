import '../models/user_models.dart';

/// Static demo household. Amara owns the household; Dev is an adult member with
/// his own consents; Tilly has limited access.
abstract class DummyPeople {
  static DateTime get _now => DateTime.now();

  static MiaUser get currentUser => MiaUser(
    id: 'usr-amara',
    firstName: 'Amara',
    lastName: 'Whitfield',
    email: 'amara.w@example.com.au',
    role: HouseholdRole.owner,
    joinedOn: _now.subtract(const Duration(days: 214)),
    mfaEnabled: true,
  );

  static List<HouseholdMember> get members => <HouseholdMember>[
    HouseholdMember(
      id: 'usr-amara',
      name: 'Amara Whitfield',
      email: 'amara.w@example.com.au',
      role: HouseholdRole.owner,
      joinedOn: _now.subtract(const Duration(days: 214)),
      connectedSources: 4,
      openReviews: 5,
      isYou: true,
    ),
    HouseholdMember(
      id: 'usr-dev',
      name: 'Dev Whitfield',
      email: 'dev.w@example.com.au',
      role: HouseholdRole.adultMember,
      joinedOn: _now.subtract(const Duration(days: 198)),
      connectedSources: 2,
      openReviews: 2,
      sharesWithYou: <String>[
        'Shared bills',
        'Household budget',
        'Ours transactions',
      ],
    ),
    HouseholdMember(
      id: 'usr-tilly',
      name: 'Tilly Whitfield',
      email: 'tilly.w@example.com.au',
      role: HouseholdRole.limitedMember,
      joinedOn: _now.subtract(const Duration(days: 61)),
      connectedSources: 0,
      openReviews: 1,
      sharesWithYou: <String>['Phone plan bill'],
    ),
    HouseholdMember(
      id: 'usr-pending',
      name: 'Rowan Pike',
      email: 'rowan.p@example.com.au',
      role: HouseholdRole.adultMember,
      joinedOn: _now.subtract(const Duration(days: 2)),
      pendingInvite: true,
    ),
  ];

  static List<DeviceSession> get sessions => <DeviceSession>[
    DeviceSession(
      id: 'ses-1',
      deviceName: 'iPhone 15 Pro',
      platform: 'iOS 19.2 · Mia 1.0.4',
      location: 'Sydney, NSW',
      lastActive: _now,
      isCurrent: true,
    ),
    DeviceSession(
      id: 'ses-2',
      deviceName: 'iPad Air',
      platform: 'iPadOS 19.1 · Mia 1.0.3',
      location: 'Sydney, NSW',
      lastActive: _now.subtract(const Duration(hours: 20)),
    ),
    DeviceSession(
      id: 'ses-3',
      deviceName: 'Pixel 9',
      platform: 'Android 17 · Mia 1.0.4',
      location: 'Melbourne, VIC',
      lastActive: _now.subtract(const Duration(days: 3)),
      isSuspicious: true,
    ),
  ];

  static List<SubscriptionPlan> get plans => const <SubscriptionPlan>[
    SubscriptionPlan(
      id: 'plan-ind-monthly',
      kind: PlanKind.individual,
      term: PlanTerm.monthly,
      priceAud: 14.99,
      memberLimit: 1,
    ),
    SubscriptionPlan(
      id: 'plan-ind-annual',
      kind: PlanKind.individual,
      term: PlanTerm.annual,
      priceAud: 134.99,
      memberLimit: 1,
      savingPercent: 25,
    ),
    SubscriptionPlan(
      id: 'plan-hh-monthly',
      kind: PlanKind.household,
      term: PlanTerm.monthly,
      priceAud: 19.99,
      memberLimit: 5,
    ),
    SubscriptionPlan(
      id: 'plan-hh-annual',
      kind: PlanKind.household,
      term: PlanTerm.annual,
      priceAud: 179.99,
      memberLimit: 5,
      isBestValue: true,
      savingPercent: 25,
    ),
  ];

  static SubscriptionState get subscription => SubscriptionState(
    plan: plans.last,
    status: SubscriptionStatus.active,
    renewsOn: _now.add(const Duration(days: 151)),
    activeMembers: 3,
  );

  static UserPreferences get preferences =>
      UserPreferences(nextPayDate: _now.add(const Duration(days: 4)));

  static List<ConsentToggle> get consents => const <ConsentToggle>[
    ConsentToggle(
      id: 'consent-core',
      title: 'Core financial processing',
      description:
          'Mia stores and organises the financial evidence you provide so it can calculate your results.',
      granted: true,
      required_: true,
    ),
    ConsentToggle(
      id: 'consent-ai',
      title: 'AI explanation of your data',
      description:
          'Ask Mia may send the minimum structured records needed to answer a question. No general model training.',
      granted: true,
    ),
    ConsentToggle(
      id: 'consent-ocr',
      title: 'Document and receipt reading',
      description:
          'Uploaded documents are processed to extract fields such as totals, dates and due dates.',
      granted: true,
    ),
    ConsentToggle(
      id: 'consent-email',
      title: 'Bill email intake',
      description:
          'Read-only access to the labels you nominate, used only to collect financial documents.',
      granted: false,
    ),
    ConsentToggle(
      id: 'consent-analytics',
      title: 'Privacy-safe product analytics',
      description:
          'Reliability and usage events only. Never transaction text, amounts or document content.',
      granted: true,
    ),
  ];
}
