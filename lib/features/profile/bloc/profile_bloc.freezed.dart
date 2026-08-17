// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileLoad value)?  load,TResult Function( ProfilePreferencesChanged value)?  preferencesChanged,TResult Function( ProfileSessionRevoked value)?  sessionRevoked,TResult Function( ProfileSignOutEverywhere value)?  signOutEverywhere,TResult Function( ProfileMemberRemoved value)?  memberRemoved,TResult Function( ProfileMemberInvited value)?  memberInvited,TResult Function( ProfileOwnershipTransferred value)?  ownershipTransferred,TResult Function( ProfileHouseholdLeft value)?  householdLeft,TResult Function( ProfileHouseholdDeleted value)?  householdDeleted,TResult Function( ProfileExportRequested value)?  exportRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileLoad() when load != null:
return load(_that);case ProfilePreferencesChanged() when preferencesChanged != null:
return preferencesChanged(_that);case ProfileSessionRevoked() when sessionRevoked != null:
return sessionRevoked(_that);case ProfileSignOutEverywhere() when signOutEverywhere != null:
return signOutEverywhere(_that);case ProfileMemberRemoved() when memberRemoved != null:
return memberRemoved(_that);case ProfileMemberInvited() when memberInvited != null:
return memberInvited(_that);case ProfileOwnershipTransferred() when ownershipTransferred != null:
return ownershipTransferred(_that);case ProfileHouseholdLeft() when householdLeft != null:
return householdLeft(_that);case ProfileHouseholdDeleted() when householdDeleted != null:
return householdDeleted(_that);case ProfileExportRequested() when exportRequested != null:
return exportRequested(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileLoad value)  load,required TResult Function( ProfilePreferencesChanged value)  preferencesChanged,required TResult Function( ProfileSessionRevoked value)  sessionRevoked,required TResult Function( ProfileSignOutEverywhere value)  signOutEverywhere,required TResult Function( ProfileMemberRemoved value)  memberRemoved,required TResult Function( ProfileMemberInvited value)  memberInvited,required TResult Function( ProfileOwnershipTransferred value)  ownershipTransferred,required TResult Function( ProfileHouseholdLeft value)  householdLeft,required TResult Function( ProfileHouseholdDeleted value)  householdDeleted,required TResult Function( ProfileExportRequested value)  exportRequested,}){
final _that = this;
switch (_that) {
case ProfileLoad():
return load(_that);case ProfilePreferencesChanged():
return preferencesChanged(_that);case ProfileSessionRevoked():
return sessionRevoked(_that);case ProfileSignOutEverywhere():
return signOutEverywhere(_that);case ProfileMemberRemoved():
return memberRemoved(_that);case ProfileMemberInvited():
return memberInvited(_that);case ProfileOwnershipTransferred():
return ownershipTransferred(_that);case ProfileHouseholdLeft():
return householdLeft(_that);case ProfileHouseholdDeleted():
return householdDeleted(_that);case ProfileExportRequested():
return exportRequested(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileLoad value)?  load,TResult? Function( ProfilePreferencesChanged value)?  preferencesChanged,TResult? Function( ProfileSessionRevoked value)?  sessionRevoked,TResult? Function( ProfileSignOutEverywhere value)?  signOutEverywhere,TResult? Function( ProfileMemberRemoved value)?  memberRemoved,TResult? Function( ProfileMemberInvited value)?  memberInvited,TResult? Function( ProfileOwnershipTransferred value)?  ownershipTransferred,TResult? Function( ProfileHouseholdLeft value)?  householdLeft,TResult? Function( ProfileHouseholdDeleted value)?  householdDeleted,TResult? Function( ProfileExportRequested value)?  exportRequested,}){
final _that = this;
switch (_that) {
case ProfileLoad() when load != null:
return load(_that);case ProfilePreferencesChanged() when preferencesChanged != null:
return preferencesChanged(_that);case ProfileSessionRevoked() when sessionRevoked != null:
return sessionRevoked(_that);case ProfileSignOutEverywhere() when signOutEverywhere != null:
return signOutEverywhere(_that);case ProfileMemberRemoved() when memberRemoved != null:
return memberRemoved(_that);case ProfileMemberInvited() when memberInvited != null:
return memberInvited(_that);case ProfileOwnershipTransferred() when ownershipTransferred != null:
return ownershipTransferred(_that);case ProfileHouseholdLeft() when householdLeft != null:
return householdLeft(_that);case ProfileHouseholdDeleted() when householdDeleted != null:
return householdDeleted(_that);case ProfileExportRequested() when exportRequested != null:
return exportRequested(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( UserPreferences preferences)?  preferencesChanged,TResult Function( String sessionId)?  sessionRevoked,TResult Function()?  signOutEverywhere,TResult Function( String memberId)?  memberRemoved,TResult Function( String email,  HouseholdRole role)?  memberInvited,TResult Function( String memberId)?  ownershipTransferred,TResult Function()?  householdLeft,TResult Function()?  householdDeleted,TResult Function( List<String> included)?  exportRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileLoad() when load != null:
return load();case ProfilePreferencesChanged() when preferencesChanged != null:
return preferencesChanged(_that.preferences);case ProfileSessionRevoked() when sessionRevoked != null:
return sessionRevoked(_that.sessionId);case ProfileSignOutEverywhere() when signOutEverywhere != null:
return signOutEverywhere();case ProfileMemberRemoved() when memberRemoved != null:
return memberRemoved(_that.memberId);case ProfileMemberInvited() when memberInvited != null:
return memberInvited(_that.email,_that.role);case ProfileOwnershipTransferred() when ownershipTransferred != null:
return ownershipTransferred(_that.memberId);case ProfileHouseholdLeft() when householdLeft != null:
return householdLeft();case ProfileHouseholdDeleted() when householdDeleted != null:
return householdDeleted();case ProfileExportRequested() when exportRequested != null:
return exportRequested(_that.included);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( UserPreferences preferences)  preferencesChanged,required TResult Function( String sessionId)  sessionRevoked,required TResult Function()  signOutEverywhere,required TResult Function( String memberId)  memberRemoved,required TResult Function( String email,  HouseholdRole role)  memberInvited,required TResult Function( String memberId)  ownershipTransferred,required TResult Function()  householdLeft,required TResult Function()  householdDeleted,required TResult Function( List<String> included)  exportRequested,}) {final _that = this;
switch (_that) {
case ProfileLoad():
return load();case ProfilePreferencesChanged():
return preferencesChanged(_that.preferences);case ProfileSessionRevoked():
return sessionRevoked(_that.sessionId);case ProfileSignOutEverywhere():
return signOutEverywhere();case ProfileMemberRemoved():
return memberRemoved(_that.memberId);case ProfileMemberInvited():
return memberInvited(_that.email,_that.role);case ProfileOwnershipTransferred():
return ownershipTransferred(_that.memberId);case ProfileHouseholdLeft():
return householdLeft();case ProfileHouseholdDeleted():
return householdDeleted();case ProfileExportRequested():
return exportRequested(_that.included);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( UserPreferences preferences)?  preferencesChanged,TResult? Function( String sessionId)?  sessionRevoked,TResult? Function()?  signOutEverywhere,TResult? Function( String memberId)?  memberRemoved,TResult? Function( String email,  HouseholdRole role)?  memberInvited,TResult? Function( String memberId)?  ownershipTransferred,TResult? Function()?  householdLeft,TResult? Function()?  householdDeleted,TResult? Function( List<String> included)?  exportRequested,}) {final _that = this;
switch (_that) {
case ProfileLoad() when load != null:
return load();case ProfilePreferencesChanged() when preferencesChanged != null:
return preferencesChanged(_that.preferences);case ProfileSessionRevoked() when sessionRevoked != null:
return sessionRevoked(_that.sessionId);case ProfileSignOutEverywhere() when signOutEverywhere != null:
return signOutEverywhere();case ProfileMemberRemoved() when memberRemoved != null:
return memberRemoved(_that.memberId);case ProfileMemberInvited() when memberInvited != null:
return memberInvited(_that.email,_that.role);case ProfileOwnershipTransferred() when ownershipTransferred != null:
return ownershipTransferred(_that.memberId);case ProfileHouseholdLeft() when householdLeft != null:
return householdLeft();case ProfileHouseholdDeleted() when householdDeleted != null:
return householdDeleted();case ProfileExportRequested() when exportRequested != null:
return exportRequested(_that.included);case _:
  return null;

}
}

}

/// @nodoc


class ProfileLoad implements ProfileEvent {
  const ProfileLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.load()';
}


}




/// @nodoc


class ProfilePreferencesChanged implements ProfileEvent {
  const ProfilePreferencesChanged(this.preferences);
  

 final  UserPreferences preferences;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfilePreferencesChangedCopyWith<ProfilePreferencesChanged> get copyWith => _$ProfilePreferencesChangedCopyWithImpl<ProfilePreferencesChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfilePreferencesChanged&&(identical(other.preferences, preferences) || other.preferences == preferences));
}


@override
int get hashCode => Object.hash(runtimeType,preferences);

@override
String toString() {
  return 'ProfileEvent.preferencesChanged(preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class $ProfilePreferencesChangedCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $ProfilePreferencesChangedCopyWith(ProfilePreferencesChanged value, $Res Function(ProfilePreferencesChanged) _then) = _$ProfilePreferencesChangedCopyWithImpl;
@useResult
$Res call({
 UserPreferences preferences
});




}
/// @nodoc
class _$ProfilePreferencesChangedCopyWithImpl<$Res>
    implements $ProfilePreferencesChangedCopyWith<$Res> {
  _$ProfilePreferencesChangedCopyWithImpl(this._self, this._then);

  final ProfilePreferencesChanged _self;
  final $Res Function(ProfilePreferencesChanged) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? preferences = null,}) {
  return _then(ProfilePreferencesChanged(
null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,
  ));
}


}

/// @nodoc


class ProfileSessionRevoked implements ProfileEvent {
  const ProfileSessionRevoked(this.sessionId);
  

 final  String sessionId;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSessionRevokedCopyWith<ProfileSessionRevoked> get copyWith => _$ProfileSessionRevokedCopyWithImpl<ProfileSessionRevoked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSessionRevoked&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'ProfileEvent.sessionRevoked(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $ProfileSessionRevokedCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $ProfileSessionRevokedCopyWith(ProfileSessionRevoked value, $Res Function(ProfileSessionRevoked) _then) = _$ProfileSessionRevokedCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$ProfileSessionRevokedCopyWithImpl<$Res>
    implements $ProfileSessionRevokedCopyWith<$Res> {
  _$ProfileSessionRevokedCopyWithImpl(this._self, this._then);

  final ProfileSessionRevoked _self;
  final $Res Function(ProfileSessionRevoked) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(ProfileSessionRevoked(
null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProfileSignOutEverywhere implements ProfileEvent {
  const ProfileSignOutEverywhere();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSignOutEverywhere);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.signOutEverywhere()';
}


}




/// @nodoc


class ProfileMemberRemoved implements ProfileEvent {
  const ProfileMemberRemoved(this.memberId);
  

 final  String memberId;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileMemberRemovedCopyWith<ProfileMemberRemoved> get copyWith => _$ProfileMemberRemovedCopyWithImpl<ProfileMemberRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileMemberRemoved&&(identical(other.memberId, memberId) || other.memberId == memberId));
}


@override
int get hashCode => Object.hash(runtimeType,memberId);

@override
String toString() {
  return 'ProfileEvent.memberRemoved(memberId: $memberId)';
}


}

/// @nodoc
abstract mixin class $ProfileMemberRemovedCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $ProfileMemberRemovedCopyWith(ProfileMemberRemoved value, $Res Function(ProfileMemberRemoved) _then) = _$ProfileMemberRemovedCopyWithImpl;
@useResult
$Res call({
 String memberId
});




}
/// @nodoc
class _$ProfileMemberRemovedCopyWithImpl<$Res>
    implements $ProfileMemberRemovedCopyWith<$Res> {
  _$ProfileMemberRemovedCopyWithImpl(this._self, this._then);

  final ProfileMemberRemoved _self;
  final $Res Function(ProfileMemberRemoved) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? memberId = null,}) {
  return _then(ProfileMemberRemoved(
null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProfileMemberInvited implements ProfileEvent {
  const ProfileMemberInvited({required this.email, required this.role});
  

 final  String email;
 final  HouseholdRole role;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileMemberInvitedCopyWith<ProfileMemberInvited> get copyWith => _$ProfileMemberInvitedCopyWithImpl<ProfileMemberInvited>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileMemberInvited&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,email,role);

@override
String toString() {
  return 'ProfileEvent.memberInvited(email: $email, role: $role)';
}


}

/// @nodoc
abstract mixin class $ProfileMemberInvitedCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $ProfileMemberInvitedCopyWith(ProfileMemberInvited value, $Res Function(ProfileMemberInvited) _then) = _$ProfileMemberInvitedCopyWithImpl;
@useResult
$Res call({
 String email, HouseholdRole role
});




}
/// @nodoc
class _$ProfileMemberInvitedCopyWithImpl<$Res>
    implements $ProfileMemberInvitedCopyWith<$Res> {
  _$ProfileMemberInvitedCopyWithImpl(this._self, this._then);

  final ProfileMemberInvited _self;
  final $Res Function(ProfileMemberInvited) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? role = null,}) {
  return _then(ProfileMemberInvited(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as HouseholdRole,
  ));
}


}

/// @nodoc


class ProfileOwnershipTransferred implements ProfileEvent {
  const ProfileOwnershipTransferred(this.memberId);
  

 final  String memberId;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileOwnershipTransferredCopyWith<ProfileOwnershipTransferred> get copyWith => _$ProfileOwnershipTransferredCopyWithImpl<ProfileOwnershipTransferred>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileOwnershipTransferred&&(identical(other.memberId, memberId) || other.memberId == memberId));
}


@override
int get hashCode => Object.hash(runtimeType,memberId);

@override
String toString() {
  return 'ProfileEvent.ownershipTransferred(memberId: $memberId)';
}


}

/// @nodoc
abstract mixin class $ProfileOwnershipTransferredCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $ProfileOwnershipTransferredCopyWith(ProfileOwnershipTransferred value, $Res Function(ProfileOwnershipTransferred) _then) = _$ProfileOwnershipTransferredCopyWithImpl;
@useResult
$Res call({
 String memberId
});




}
/// @nodoc
class _$ProfileOwnershipTransferredCopyWithImpl<$Res>
    implements $ProfileOwnershipTransferredCopyWith<$Res> {
  _$ProfileOwnershipTransferredCopyWithImpl(this._self, this._then);

  final ProfileOwnershipTransferred _self;
  final $Res Function(ProfileOwnershipTransferred) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? memberId = null,}) {
  return _then(ProfileOwnershipTransferred(
null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProfileHouseholdLeft implements ProfileEvent {
  const ProfileHouseholdLeft();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileHouseholdLeft);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.householdLeft()';
}


}




/// @nodoc


class ProfileHouseholdDeleted implements ProfileEvent {
  const ProfileHouseholdDeleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileHouseholdDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.householdDeleted()';
}


}




/// @nodoc


class ProfileExportRequested implements ProfileEvent {
  const ProfileExportRequested(final  List<String> included): _included = included;
  

 final  List<String> _included;
 List<String> get included {
  if (_included is EqualUnmodifiableListView) return _included;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_included);
}


/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileExportRequestedCopyWith<ProfileExportRequested> get copyWith => _$ProfileExportRequestedCopyWithImpl<ProfileExportRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileExportRequested&&const DeepCollectionEquality().equals(other._included, _included));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_included));

@override
String toString() {
  return 'ProfileEvent.exportRequested(included: $included)';
}


}

/// @nodoc
abstract mixin class $ProfileExportRequestedCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $ProfileExportRequestedCopyWith(ProfileExportRequested value, $Res Function(ProfileExportRequested) _then) = _$ProfileExportRequestedCopyWithImpl;
@useResult
$Res call({
 List<String> included
});




}
/// @nodoc
class _$ProfileExportRequestedCopyWithImpl<$Res>
    implements $ProfileExportRequestedCopyWith<$Res> {
  _$ProfileExportRequestedCopyWithImpl(this._self, this._then);

  final ProfileExportRequested _self;
  final $Res Function(ProfileExportRequested) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? included = null,}) {
  return _then(ProfileExportRequested(
null == included ? _self._included : included // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$ProfileState {

 List<DeviceSession> get sessions; List<ConsentToggle> get consents; List<HouseholdMember> get members; List<ExportJob> get exports; bool get isReady; MiaUser? get user; UserPreferences? get preferences; SubscriptionState? get subscription;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&const DeepCollectionEquality().equals(other.sessions, sessions)&&const DeepCollectionEquality().equals(other.consents, consents)&&const DeepCollectionEquality().equals(other.members, members)&&const DeepCollectionEquality().equals(other.exports, exports)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.user, user) || other.user == user)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.subscription, subscription) || other.subscription == subscription));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessions),const DeepCollectionEquality().hash(consents),const DeepCollectionEquality().hash(members),const DeepCollectionEquality().hash(exports),isReady,user,preferences,subscription);

@override
String toString() {
  return 'ProfileState(sessions: $sessions, consents: $consents, members: $members, exports: $exports, isReady: $isReady, user: $user, preferences: $preferences, subscription: $subscription)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 List<DeviceSession> sessions, List<ConsentToggle> consents, List<HouseholdMember> members, List<ExportJob> exports, bool isReady, MiaUser? user, UserPreferences? preferences, SubscriptionState? subscription
});




}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,Object? consents = null,Object? members = null,Object? exports = null,Object? isReady = null,Object? user = freezed,Object? preferences = freezed,Object? subscription = freezed,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<DeviceSession>,consents: null == consents ? _self.consents : consents // ignore: cast_nullable_to_non_nullable
as List<ConsentToggle>,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<HouseholdMember>,exports: null == exports ? _self.exports : exports // ignore: cast_nullable_to_non_nullable
as List<ExportJob>,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as MiaUser?,preferences: freezed == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences?,subscription: freezed == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as SubscriptionState?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DeviceSession> sessions,  List<ConsentToggle> consents,  List<HouseholdMember> members,  List<ExportJob> exports,  bool isReady,  MiaUser? user,  UserPreferences? preferences,  SubscriptionState? subscription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.sessions,_that.consents,_that.members,_that.exports,_that.isReady,_that.user,_that.preferences,_that.subscription);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DeviceSession> sessions,  List<ConsentToggle> consents,  List<HouseholdMember> members,  List<ExportJob> exports,  bool isReady,  MiaUser? user,  UserPreferences? preferences,  SubscriptionState? subscription)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.sessions,_that.consents,_that.members,_that.exports,_that.isReady,_that.user,_that.preferences,_that.subscription);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DeviceSession> sessions,  List<ConsentToggle> consents,  List<HouseholdMember> members,  List<ExportJob> exports,  bool isReady,  MiaUser? user,  UserPreferences? preferences,  SubscriptionState? subscription)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.sessions,_that.consents,_that.members,_that.exports,_that.isReady,_that.user,_that.preferences,_that.subscription);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({required final  List<DeviceSession> sessions, required final  List<ConsentToggle> consents, required final  List<HouseholdMember> members, required final  List<ExportJob> exports, required this.isReady, this.user, this.preferences, this.subscription}): _sessions = sessions,_consents = consents,_members = members,_exports = exports;
  

 final  List<DeviceSession> _sessions;
@override List<DeviceSession> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

 final  List<ConsentToggle> _consents;
@override List<ConsentToggle> get consents {
  if (_consents is EqualUnmodifiableListView) return _consents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_consents);
}

 final  List<HouseholdMember> _members;
@override List<HouseholdMember> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

 final  List<ExportJob> _exports;
@override List<ExportJob> get exports {
  if (_exports is EqualUnmodifiableListView) return _exports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exports);
}

@override final  bool isReady;
@override final  MiaUser? user;
@override final  UserPreferences? preferences;
@override final  SubscriptionState? subscription;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&const DeepCollectionEquality().equals(other._consents, _consents)&&const DeepCollectionEquality().equals(other._members, _members)&&const DeepCollectionEquality().equals(other._exports, _exports)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.user, user) || other.user == user)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.subscription, subscription) || other.subscription == subscription));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions),const DeepCollectionEquality().hash(_consents),const DeepCollectionEquality().hash(_members),const DeepCollectionEquality().hash(_exports),isReady,user,preferences,subscription);

@override
String toString() {
  return 'ProfileState(sessions: $sessions, consents: $consents, members: $members, exports: $exports, isReady: $isReady, user: $user, preferences: $preferences, subscription: $subscription)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 List<DeviceSession> sessions, List<ConsentToggle> consents, List<HouseholdMember> members, List<ExportJob> exports, bool isReady, MiaUser? user, UserPreferences? preferences, SubscriptionState? subscription
});




}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,Object? consents = null,Object? members = null,Object? exports = null,Object? isReady = null,Object? user = freezed,Object? preferences = freezed,Object? subscription = freezed,}) {
  return _then(_ProfileState(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<DeviceSession>,consents: null == consents ? _self._consents : consents // ignore: cast_nullable_to_non_nullable
as List<ConsentToggle>,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<HouseholdMember>,exports: null == exports ? _self._exports : exports // ignore: cast_nullable_to_non_nullable
as List<ExportJob>,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as MiaUser?,preferences: freezed == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences?,subscription: freezed == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as SubscriptionState?,
  ));
}


}

// dart format on
