// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connections_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionsEvent()';
}


}

/// @nodoc
class $ConnectionsEventCopyWith<$Res>  {
$ConnectionsEventCopyWith(ConnectionsEvent _, $Res Function(ConnectionsEvent) __);
}


/// Adds pattern-matching-related methods to [ConnectionsEvent].
extension ConnectionsEventPatterns on ConnectionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConnectionsLoad value)?  load,TResult Function( ConnectionsRevoke value)?  revoke,TResult Function( ConnectionsReconnect value)?  reconnect,TResult Function( ConnectionsRotateAddress value)?  rotateAddress,TResult Function( ConnectionsConnectionStarted value)?  connectionStarted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConnectionsLoad() when load != null:
return load(_that);case ConnectionsRevoke() when revoke != null:
return revoke(_that);case ConnectionsReconnect() when reconnect != null:
return reconnect(_that);case ConnectionsRotateAddress() when rotateAddress != null:
return rotateAddress(_that);case ConnectionsConnectionStarted() when connectionStarted != null:
return connectionStarted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConnectionsLoad value)  load,required TResult Function( ConnectionsRevoke value)  revoke,required TResult Function( ConnectionsReconnect value)  reconnect,required TResult Function( ConnectionsRotateAddress value)  rotateAddress,required TResult Function( ConnectionsConnectionStarted value)  connectionStarted,}){
final _that = this;
switch (_that) {
case ConnectionsLoad():
return load(_that);case ConnectionsRevoke():
return revoke(_that);case ConnectionsReconnect():
return reconnect(_that);case ConnectionsRotateAddress():
return rotateAddress(_that);case ConnectionsConnectionStarted():
return connectionStarted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConnectionsLoad value)?  load,TResult? Function( ConnectionsRevoke value)?  revoke,TResult? Function( ConnectionsReconnect value)?  reconnect,TResult? Function( ConnectionsRotateAddress value)?  rotateAddress,TResult? Function( ConnectionsConnectionStarted value)?  connectionStarted,}){
final _that = this;
switch (_that) {
case ConnectionsLoad() when load != null:
return load(_that);case ConnectionsRevoke() when revoke != null:
return revoke(_that);case ConnectionsReconnect() when reconnect != null:
return reconnect(_that);case ConnectionsRotateAddress() when rotateAddress != null:
return rotateAddress(_that);case ConnectionsConnectionStarted() when connectionStarted != null:
return connectionStarted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String connectionId)?  revoke,TResult Function( String connectionId)?  reconnect,TResult Function()?  rotateAddress,TResult Function( ConnectionKind kind,  String institution)?  connectionStarted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConnectionsLoad() when load != null:
return load();case ConnectionsRevoke() when revoke != null:
return revoke(_that.connectionId);case ConnectionsReconnect() when reconnect != null:
return reconnect(_that.connectionId);case ConnectionsRotateAddress() when rotateAddress != null:
return rotateAddress();case ConnectionsConnectionStarted() when connectionStarted != null:
return connectionStarted(_that.kind,_that.institution);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String connectionId)  revoke,required TResult Function( String connectionId)  reconnect,required TResult Function()  rotateAddress,required TResult Function( ConnectionKind kind,  String institution)  connectionStarted,}) {final _that = this;
switch (_that) {
case ConnectionsLoad():
return load();case ConnectionsRevoke():
return revoke(_that.connectionId);case ConnectionsReconnect():
return reconnect(_that.connectionId);case ConnectionsRotateAddress():
return rotateAddress();case ConnectionsConnectionStarted():
return connectionStarted(_that.kind,_that.institution);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String connectionId)?  revoke,TResult? Function( String connectionId)?  reconnect,TResult? Function()?  rotateAddress,TResult? Function( ConnectionKind kind,  String institution)?  connectionStarted,}) {final _that = this;
switch (_that) {
case ConnectionsLoad() when load != null:
return load();case ConnectionsRevoke() when revoke != null:
return revoke(_that.connectionId);case ConnectionsReconnect() when reconnect != null:
return reconnect(_that.connectionId);case ConnectionsRotateAddress() when rotateAddress != null:
return rotateAddress();case ConnectionsConnectionStarted() when connectionStarted != null:
return connectionStarted(_that.kind,_that.institution);case _:
  return null;

}
}

}

/// @nodoc


class ConnectionsLoad implements ConnectionsEvent {
  const ConnectionsLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionsLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionsEvent.load()';
}


}




/// @nodoc


class ConnectionsRevoke implements ConnectionsEvent {
  const ConnectionsRevoke(this.connectionId);
  

 final  String connectionId;

/// Create a copy of ConnectionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionsRevokeCopyWith<ConnectionsRevoke> get copyWith => _$ConnectionsRevokeCopyWithImpl<ConnectionsRevoke>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionsRevoke&&(identical(other.connectionId, connectionId) || other.connectionId == connectionId));
}


@override
int get hashCode => Object.hash(runtimeType,connectionId);

@override
String toString() {
  return 'ConnectionsEvent.revoke(connectionId: $connectionId)';
}


}

/// @nodoc
abstract mixin class $ConnectionsRevokeCopyWith<$Res> implements $ConnectionsEventCopyWith<$Res> {
  factory $ConnectionsRevokeCopyWith(ConnectionsRevoke value, $Res Function(ConnectionsRevoke) _then) = _$ConnectionsRevokeCopyWithImpl;
@useResult
$Res call({
 String connectionId
});




}
/// @nodoc
class _$ConnectionsRevokeCopyWithImpl<$Res>
    implements $ConnectionsRevokeCopyWith<$Res> {
  _$ConnectionsRevokeCopyWithImpl(this._self, this._then);

  final ConnectionsRevoke _self;
  final $Res Function(ConnectionsRevoke) _then;

/// Create a copy of ConnectionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? connectionId = null,}) {
  return _then(ConnectionsRevoke(
null == connectionId ? _self.connectionId : connectionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConnectionsReconnect implements ConnectionsEvent {
  const ConnectionsReconnect(this.connectionId);
  

 final  String connectionId;

/// Create a copy of ConnectionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionsReconnectCopyWith<ConnectionsReconnect> get copyWith => _$ConnectionsReconnectCopyWithImpl<ConnectionsReconnect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionsReconnect&&(identical(other.connectionId, connectionId) || other.connectionId == connectionId));
}


@override
int get hashCode => Object.hash(runtimeType,connectionId);

@override
String toString() {
  return 'ConnectionsEvent.reconnect(connectionId: $connectionId)';
}


}

/// @nodoc
abstract mixin class $ConnectionsReconnectCopyWith<$Res> implements $ConnectionsEventCopyWith<$Res> {
  factory $ConnectionsReconnectCopyWith(ConnectionsReconnect value, $Res Function(ConnectionsReconnect) _then) = _$ConnectionsReconnectCopyWithImpl;
@useResult
$Res call({
 String connectionId
});




}
/// @nodoc
class _$ConnectionsReconnectCopyWithImpl<$Res>
    implements $ConnectionsReconnectCopyWith<$Res> {
  _$ConnectionsReconnectCopyWithImpl(this._self, this._then);

  final ConnectionsReconnect _self;
  final $Res Function(ConnectionsReconnect) _then;

/// Create a copy of ConnectionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? connectionId = null,}) {
  return _then(ConnectionsReconnect(
null == connectionId ? _self.connectionId : connectionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConnectionsRotateAddress implements ConnectionsEvent {
  const ConnectionsRotateAddress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionsRotateAddress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConnectionsEvent.rotateAddress()';
}


}




/// @nodoc


class ConnectionsConnectionStarted implements ConnectionsEvent {
  const ConnectionsConnectionStarted({required this.kind, required this.institution});
  

 final  ConnectionKind kind;
 final  String institution;

/// Create a copy of ConnectionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionsConnectionStartedCopyWith<ConnectionsConnectionStarted> get copyWith => _$ConnectionsConnectionStartedCopyWithImpl<ConnectionsConnectionStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionsConnectionStarted&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.institution, institution) || other.institution == institution));
}


@override
int get hashCode => Object.hash(runtimeType,kind,institution);

@override
String toString() {
  return 'ConnectionsEvent.connectionStarted(kind: $kind, institution: $institution)';
}


}

/// @nodoc
abstract mixin class $ConnectionsConnectionStartedCopyWith<$Res> implements $ConnectionsEventCopyWith<$Res> {
  factory $ConnectionsConnectionStartedCopyWith(ConnectionsConnectionStarted value, $Res Function(ConnectionsConnectionStarted) _then) = _$ConnectionsConnectionStartedCopyWithImpl;
@useResult
$Res call({
 ConnectionKind kind, String institution
});




}
/// @nodoc
class _$ConnectionsConnectionStartedCopyWithImpl<$Res>
    implements $ConnectionsConnectionStartedCopyWith<$Res> {
  _$ConnectionsConnectionStartedCopyWithImpl(this._self, this._then);

  final ConnectionsConnectionStarted _self;
  final $Res Function(ConnectionsConnectionStarted) _then;

/// Create a copy of ConnectionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? institution = null,}) {
  return _then(ConnectionsConnectionStarted(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ConnectionKind,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ConnectionsState {

 List<ConnectionRecord> get connections; List<EmailIntakeConnection> get emails; bool get isReady; bool get isBusy;
/// Create a copy of ConnectionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionsStateCopyWith<ConnectionsState> get copyWith => _$ConnectionsStateCopyWithImpl<ConnectionsState>(this as ConnectionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionsState&&const DeepCollectionEquality().equals(other.connections, connections)&&const DeepCollectionEquality().equals(other.emails, emails)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.isBusy, isBusy) || other.isBusy == isBusy));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(connections),const DeepCollectionEquality().hash(emails),isReady,isBusy);

@override
String toString() {
  return 'ConnectionsState(connections: $connections, emails: $emails, isReady: $isReady, isBusy: $isBusy)';
}


}

/// @nodoc
abstract mixin class $ConnectionsStateCopyWith<$Res>  {
  factory $ConnectionsStateCopyWith(ConnectionsState value, $Res Function(ConnectionsState) _then) = _$ConnectionsStateCopyWithImpl;
@useResult
$Res call({
 List<ConnectionRecord> connections, List<EmailIntakeConnection> emails, bool isReady, bool isBusy
});




}
/// @nodoc
class _$ConnectionsStateCopyWithImpl<$Res>
    implements $ConnectionsStateCopyWith<$Res> {
  _$ConnectionsStateCopyWithImpl(this._self, this._then);

  final ConnectionsState _self;
  final $Res Function(ConnectionsState) _then;

/// Create a copy of ConnectionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connections = null,Object? emails = null,Object? isReady = null,Object? isBusy = null,}) {
  return _then(_self.copyWith(
connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as List<ConnectionRecord>,emails: null == emails ? _self.emails : emails // ignore: cast_nullable_to_non_nullable
as List<EmailIntakeConnection>,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectionsState].
extension ConnectionsStatePatterns on ConnectionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionsState value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionsState value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ConnectionRecord> connections,  List<EmailIntakeConnection> emails,  bool isReady,  bool isBusy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionsState() when $default != null:
return $default(_that.connections,_that.emails,_that.isReady,_that.isBusy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ConnectionRecord> connections,  List<EmailIntakeConnection> emails,  bool isReady,  bool isBusy)  $default,) {final _that = this;
switch (_that) {
case _ConnectionsState():
return $default(_that.connections,_that.emails,_that.isReady,_that.isBusy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ConnectionRecord> connections,  List<EmailIntakeConnection> emails,  bool isReady,  bool isBusy)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionsState() when $default != null:
return $default(_that.connections,_that.emails,_that.isReady,_that.isBusy);case _:
  return null;

}
}

}

/// @nodoc


class _ConnectionsState implements ConnectionsState {
  const _ConnectionsState({required final  List<ConnectionRecord> connections, required final  List<EmailIntakeConnection> emails, required this.isReady, required this.isBusy}): _connections = connections,_emails = emails;
  

 final  List<ConnectionRecord> _connections;
@override List<ConnectionRecord> get connections {
  if (_connections is EqualUnmodifiableListView) return _connections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connections);
}

 final  List<EmailIntakeConnection> _emails;
@override List<EmailIntakeConnection> get emails {
  if (_emails is EqualUnmodifiableListView) return _emails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emails);
}

@override final  bool isReady;
@override final  bool isBusy;

/// Create a copy of ConnectionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionsStateCopyWith<_ConnectionsState> get copyWith => __$ConnectionsStateCopyWithImpl<_ConnectionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionsState&&const DeepCollectionEquality().equals(other._connections, _connections)&&const DeepCollectionEquality().equals(other._emails, _emails)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.isBusy, isBusy) || other.isBusy == isBusy));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_connections),const DeepCollectionEquality().hash(_emails),isReady,isBusy);

@override
String toString() {
  return 'ConnectionsState(connections: $connections, emails: $emails, isReady: $isReady, isBusy: $isBusy)';
}


}

/// @nodoc
abstract mixin class _$ConnectionsStateCopyWith<$Res> implements $ConnectionsStateCopyWith<$Res> {
  factory _$ConnectionsStateCopyWith(_ConnectionsState value, $Res Function(_ConnectionsState) _then) = __$ConnectionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<ConnectionRecord> connections, List<EmailIntakeConnection> emails, bool isReady, bool isBusy
});




}
/// @nodoc
class __$ConnectionsStateCopyWithImpl<$Res>
    implements _$ConnectionsStateCopyWith<$Res> {
  __$ConnectionsStateCopyWithImpl(this._self, this._then);

  final _ConnectionsState _self;
  final $Res Function(_ConnectionsState) _then;

/// Create a copy of ConnectionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connections = null,Object? emails = null,Object? isReady = null,Object? isBusy = null,}) {
  return _then(_ConnectionsState(
connections: null == connections ? _self._connections : connections // ignore: cast_nullable_to_non_nullable
as List<ConnectionRecord>,emails: null == emails ? _self._emails : emails // ignore: cast_nullable_to_non_nullable
as List<EmailIntakeConnection>,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
