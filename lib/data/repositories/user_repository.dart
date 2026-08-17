import 'package:injectable/injectable.dart';

import '../dummy/dummy_people.dart';
import '../models/user_models.dart';

/// Contract the future backend implementation will satisfy. Features depend only
/// on this, never on the dummy source.
abstract class UserRepository {
  Future<MiaUser> fetchCurrentUser();

  Future<UserPreferences> fetchPreferences();

  Future<UserPreferences> savePreferences(UserPreferences preferences);

  Future<List<DeviceSession>> fetchSessions();

  Future<void> revokeSession(String sessionId);

  Future<void> signOutEverywhere();

  Future<List<ConsentToggle>> fetchConsents();

  Future<List<SubscriptionPlan>> fetchPlans();

  Future<SubscriptionState> fetchSubscription();
}

const Duration kDummyLatency = Duration(milliseconds: 180);

@LazySingleton(as: UserRepository)
class DummyUserRepository implements UserRepository {
  UserPreferences _preferences = DummyPeople.preferences;
  List<DeviceSession> _sessions = DummyPeople.sessions;

  @override
  Future<MiaUser> fetchCurrentUser() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyPeople.currentUser;
  }

  @override
  Future<UserPreferences> fetchPreferences() async {
    await Future<void>.delayed(kDummyLatency);
    return _preferences;
  }

  @override
  Future<UserPreferences> savePreferences(UserPreferences preferences) async {
    await Future<void>.delayed(kDummyLatency);
    _preferences = preferences;
    return _preferences;
  }

  @override
  Future<List<DeviceSession>> fetchSessions() async {
    await Future<void>.delayed(kDummyLatency);
    return _sessions;
  }

  @override
  Future<void> revokeSession(String sessionId) async {
    await Future<void>.delayed(kDummyLatency);
    _sessions = _sessions
        .where((DeviceSession s) => s.id != sessionId)
        .toList();
  }

  @override
  Future<void> signOutEverywhere() async {
    await Future<void>.delayed(kDummyLatency);
    _sessions = _sessions.where((DeviceSession s) => s.isCurrent).toList();
  }

  @override
  Future<List<ConsentToggle>> fetchConsents() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyPeople.consents;
  }

  @override
  Future<List<SubscriptionPlan>> fetchPlans() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyPeople.plans;
  }

  @override
  Future<SubscriptionState> fetchSubscription() async {
    await Future<void>.delayed(kDummyLatency);
    return DummyPeople.subscription;
  }
}

abstract class HouseholdRepository {
  Future<List<HouseholdMember>> fetchMembers();

  Future<void> inviteMember(String email, HouseholdRole role);

  Future<void> removeMember(String memberId);

  Future<void> transferOwnership(String memberId);

  /// You stop being a member. Your own records and consents are unaffected.
  Future<void> leaveHousehold();

  /// Disbands the household. Everyone keeps their own records and consents.
  Future<void> deleteHousehold();
}

@LazySingleton(as: HouseholdRepository)
class DummyHouseholdRepository implements HouseholdRepository {
  List<HouseholdMember> _members = DummyPeople.members;

  @override
  Future<List<HouseholdMember>> fetchMembers() async {
    await Future<void>.delayed(kDummyLatency);
    return _members;
  }

  @override
  Future<void> inviteMember(String email, HouseholdRole role) async {
    await Future<void>.delayed(kDummyLatency);
    _members = <HouseholdMember>[
      ..._members,
      HouseholdMember(
        id: 'usr-${email.hashCode}',
        name: email.split('@').first,
        email: email,
        role: role,
        joinedOn: DateTime.now(),
        pendingInvite: true,
      ),
    ];
  }

  @override
  Future<void> removeMember(String memberId) async {
    await Future<void>.delayed(kDummyLatency);
    _members = _members.where((HouseholdMember m) => m.id != memberId).toList();
  }

  @override
  Future<void> transferOwnership(String memberId) async {
    await Future<void>.delayed(kDummyLatency);
    _members = _members
        .map(
          (HouseholdMember m) => HouseholdMember(
            id: m.id,
            name: m.name,
            email: m.email,
            role: m.id == memberId
                ? HouseholdRole.owner
                : m.role == HouseholdRole.owner
                ? HouseholdRole.adultMember
                : m.role,
            joinedOn: m.joinedOn,
            connectedSources: m.connectedSources,
            openReviews: m.openReviews,
            isYou: m.isYou,
            pendingInvite: m.pendingInvite,
            sharesWithYou: m.sharesWithYou,
          ),
        )
        .toList();
  }

  @override
  Future<void> leaveHousehold() async {
    await Future<void>.delayed(kDummyLatency);
    _members = _members.where((HouseholdMember m) => !m.isYou).toList();
  }

  @override
  Future<void> deleteHousehold() async {
    await Future<void>.delayed(kDummyLatency);
    _members = _members.where((HouseholdMember m) => m.isYou).toList();
  }
}
