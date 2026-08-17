part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    required List<DeviceSession> sessions,
    required List<ConsentToggle> consents,
    required List<HouseholdMember> members,
    required List<ExportJob> exports,
    required bool isReady,
    MiaUser? user,
    UserPreferences? preferences,
    SubscriptionState? subscription,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState(
    sessions: <DeviceSession>[],
    consents: <ConsentToggle>[],
    members: <HouseholdMember>[],
    exports: <ExportJob>[],
    isReady: false,
  );
}

extension ProfileStateX on ProfileState {
  int get activeMemberCount =>
      members.where((HouseholdMember m) => !m.pendingInvite).length;

  int get pendingInviteCount =>
      members.where((HouseholdMember m) => m.pendingInvite).length;

  bool get hasSuspiciousSession =>
      sessions.any((DeviceSession s) => s.isSuspicious);
}
