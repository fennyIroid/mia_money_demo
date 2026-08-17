part of 'profile_bloc.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.load() = ProfileLoad;

  const factory ProfileEvent.preferencesChanged(UserPreferences preferences) =
      ProfilePreferencesChanged;

  const factory ProfileEvent.sessionRevoked(String sessionId) =
      ProfileSessionRevoked;

  const factory ProfileEvent.signOutEverywhere() = ProfileSignOutEverywhere;

  const factory ProfileEvent.memberRemoved(String memberId) =
      ProfileMemberRemoved;

  const factory ProfileEvent.memberInvited({
    required String email,
    required HouseholdRole role,
  }) = ProfileMemberInvited;

  const factory ProfileEvent.ownershipTransferred(String memberId) =
      ProfileOwnershipTransferred;

  const factory ProfileEvent.householdLeft() = ProfileHouseholdLeft;

  const factory ProfileEvent.householdDeleted() = ProfileHouseholdDeleted;

  const factory ProfileEvent.exportRequested(List<String> included) =
      ProfileExportRequested;
}
