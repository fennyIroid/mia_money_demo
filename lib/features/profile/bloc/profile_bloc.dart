import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/admin_models.dart';
import '../../../data/models/user_models.dart';
import '../../../data/repositories/admin_repository.dart';
import '../../../data/repositories/user_repository.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._userRepository,
    this._householdRepository,
    this._exportRepository,
  ) : super(ProfileState.initial()) {
    on<ProfileLoad>(_onLoad);
    on<ProfilePreferencesChanged>(_onPreferencesChanged);
    on<ProfileSessionRevoked>(_onSessionRevoked);
    on<ProfileSignOutEverywhere>(_onSignOutEverywhere);
    on<ProfileMemberRemoved>(_onMemberRemoved);
    on<ProfileMemberInvited>(_onMemberInvited);
    on<ProfileOwnershipTransferred>(_onOwnershipTransferred);
    on<ProfileHouseholdLeft>(_onHouseholdLeft);
    on<ProfileHouseholdDeleted>(_onHouseholdDeleted);
    on<ProfileExportRequested>(_onExportRequested);
  }

  final UserRepository _userRepository;
  final HouseholdRepository _householdRepository;
  final ExportRepository _exportRepository;

  Future<void> _onLoad(ProfileLoad event, Emitter<ProfileState> emit) async {
    emit(
      state.copyWith(
        isReady: true,
        user: await _userRepository.fetchCurrentUser(),
        preferences: await _userRepository.fetchPreferences(),
        sessions: await _userRepository.fetchSessions(),
        consents: await _userRepository.fetchConsents(),
        subscription: await _userRepository.fetchSubscription(),
        members: await _householdRepository.fetchMembers(),
        exports: await _exportRepository.fetchExports(),
      ),
    );
  }

  Future<void> _onPreferencesChanged(
    ProfilePreferencesChanged event,
    Emitter<ProfileState> emit,
  ) async {
    final UserPreferences saved = await _userRepository.savePreferences(
      event.preferences,
    );
    emit(state.copyWith(preferences: saved));
  }

  Future<void> _onSessionRevoked(
    ProfileSessionRevoked event,
    Emitter<ProfileState> emit,
  ) async {
    await _userRepository.revokeSession(event.sessionId);
    emit(state.copyWith(sessions: await _userRepository.fetchSessions()));
  }

  Future<void> _onSignOutEverywhere(
    ProfileSignOutEverywhere event,
    Emitter<ProfileState> emit,
  ) async {
    await _userRepository.signOutEverywhere();
    emit(state.copyWith(sessions: await _userRepository.fetchSessions()));
  }

  Future<void> _onMemberRemoved(
    ProfileMemberRemoved event,
    Emitter<ProfileState> emit,
  ) async {
    await _householdRepository.removeMember(event.memberId);
    emit(state.copyWith(members: await _householdRepository.fetchMembers()));
  }

  Future<void> _onMemberInvited(
    ProfileMemberInvited event,
    Emitter<ProfileState> emit,
  ) async {
    await _householdRepository.inviteMember(event.email, event.role);
    emit(state.copyWith(members: await _householdRepository.fetchMembers()));
  }

  Future<void> _onOwnershipTransferred(
    ProfileOwnershipTransferred event,
    Emitter<ProfileState> emit,
  ) async {
    await _householdRepository.transferOwnership(event.memberId);
    add(const ProfileEvent.load());
  }

  Future<void> _onHouseholdLeft(
    ProfileHouseholdLeft event,
    Emitter<ProfileState> emit,
  ) async {
    await _householdRepository.leaveHousehold();
    add(const ProfileEvent.load());
  }

  Future<void> _onHouseholdDeleted(
    ProfileHouseholdDeleted event,
    Emitter<ProfileState> emit,
  ) async {
    await _householdRepository.deleteHousehold();
    add(const ProfileEvent.load());
  }

  /// The export is filed as a record so the user can see what was built and
  /// which parts of their data it covers.
  Future<void> _onExportRequested(
    ProfileExportRequested event,
    Emitter<ProfileState> emit,
  ) async {
    await _exportRepository.requestExport(
      label: 'Your data',
      format: 'ZIP',
      coveragePeriod: event.included.join(', '),
      recordCount: event.included.length,
    );
    emit(state.copyWith(exports: await _exportRepository.fetchExports()));
  }
}
