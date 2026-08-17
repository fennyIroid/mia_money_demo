// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthEmailChanged value)?  emailChanged,TResult Function( AuthPasswordChanged value)?  passwordChanged,TResult Function( AuthConfirmPasswordChanged value)?  confirmPasswordChanged,TResult Function( AuthCodeChanged value)?  codeChanged,TResult Function( AuthSubmitted value)?  submitted,TResult Function( AuthBiometricEnabled value)?  biometricEnabled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthEmailChanged() when emailChanged != null:
return emailChanged(_that);case AuthPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case AuthConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that);case AuthCodeChanged() when codeChanged != null:
return codeChanged(_that);case AuthSubmitted() when submitted != null:
return submitted(_that);case AuthBiometricEnabled() when biometricEnabled != null:
return biometricEnabled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthEmailChanged value)  emailChanged,required TResult Function( AuthPasswordChanged value)  passwordChanged,required TResult Function( AuthConfirmPasswordChanged value)  confirmPasswordChanged,required TResult Function( AuthCodeChanged value)  codeChanged,required TResult Function( AuthSubmitted value)  submitted,required TResult Function( AuthBiometricEnabled value)  biometricEnabled,}){
final _that = this;
switch (_that) {
case AuthEmailChanged():
return emailChanged(_that);case AuthPasswordChanged():
return passwordChanged(_that);case AuthConfirmPasswordChanged():
return confirmPasswordChanged(_that);case AuthCodeChanged():
return codeChanged(_that);case AuthSubmitted():
return submitted(_that);case AuthBiometricEnabled():
return biometricEnabled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthEmailChanged value)?  emailChanged,TResult? Function( AuthPasswordChanged value)?  passwordChanged,TResult? Function( AuthConfirmPasswordChanged value)?  confirmPasswordChanged,TResult? Function( AuthCodeChanged value)?  codeChanged,TResult? Function( AuthSubmitted value)?  submitted,TResult? Function( AuthBiometricEnabled value)?  biometricEnabled,}){
final _that = this;
switch (_that) {
case AuthEmailChanged() when emailChanged != null:
return emailChanged(_that);case AuthPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case AuthConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that);case AuthCodeChanged() when codeChanged != null:
return codeChanged(_that);case AuthSubmitted() when submitted != null:
return submitted(_that);case AuthBiometricEnabled() when biometricEnabled != null:
return biometricEnabled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String value)?  emailChanged,TResult Function( String value)?  passwordChanged,TResult Function( String value)?  confirmPasswordChanged,TResult Function( String value)?  codeChanged,TResult Function()?  submitted,TResult Function()?  biometricEnabled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthEmailChanged() when emailChanged != null:
return emailChanged(_that.value);case AuthPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.value);case AuthConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that.value);case AuthCodeChanged() when codeChanged != null:
return codeChanged(_that.value);case AuthSubmitted() when submitted != null:
return submitted();case AuthBiometricEnabled() when biometricEnabled != null:
return biometricEnabled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String value)  emailChanged,required TResult Function( String value)  passwordChanged,required TResult Function( String value)  confirmPasswordChanged,required TResult Function( String value)  codeChanged,required TResult Function()  submitted,required TResult Function()  biometricEnabled,}) {final _that = this;
switch (_that) {
case AuthEmailChanged():
return emailChanged(_that.value);case AuthPasswordChanged():
return passwordChanged(_that.value);case AuthConfirmPasswordChanged():
return confirmPasswordChanged(_that.value);case AuthCodeChanged():
return codeChanged(_that.value);case AuthSubmitted():
return submitted();case AuthBiometricEnabled():
return biometricEnabled();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String value)?  emailChanged,TResult? Function( String value)?  passwordChanged,TResult? Function( String value)?  confirmPasswordChanged,TResult? Function( String value)?  codeChanged,TResult? Function()?  submitted,TResult? Function()?  biometricEnabled,}) {final _that = this;
switch (_that) {
case AuthEmailChanged() when emailChanged != null:
return emailChanged(_that.value);case AuthPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.value);case AuthConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that.value);case AuthCodeChanged() when codeChanged != null:
return codeChanged(_that.value);case AuthSubmitted() when submitted != null:
return submitted();case AuthBiometricEnabled() when biometricEnabled != null:
return biometricEnabled();case _:
  return null;

}
}

}

/// @nodoc


class AuthEmailChanged implements AuthEvent {
  const AuthEmailChanged(this.value);
  

 final  String value;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEmailChangedCopyWith<AuthEmailChanged> get copyWith => _$AuthEmailChangedCopyWithImpl<AuthEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEmailChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AuthEvent.emailChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $AuthEmailChangedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthEmailChangedCopyWith(AuthEmailChanged value, $Res Function(AuthEmailChanged) _then) = _$AuthEmailChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$AuthEmailChangedCopyWithImpl<$Res>
    implements $AuthEmailChangedCopyWith<$Res> {
  _$AuthEmailChangedCopyWithImpl(this._self, this._then);

  final AuthEmailChanged _self;
  final $Res Function(AuthEmailChanged) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(AuthEmailChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthPasswordChanged implements AuthEvent {
  const AuthPasswordChanged(this.value);
  

 final  String value;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthPasswordChangedCopyWith<AuthPasswordChanged> get copyWith => _$AuthPasswordChangedCopyWithImpl<AuthPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthPasswordChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AuthEvent.passwordChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $AuthPasswordChangedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthPasswordChangedCopyWith(AuthPasswordChanged value, $Res Function(AuthPasswordChanged) _then) = _$AuthPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$AuthPasswordChangedCopyWithImpl<$Res>
    implements $AuthPasswordChangedCopyWith<$Res> {
  _$AuthPasswordChangedCopyWithImpl(this._self, this._then);

  final AuthPasswordChanged _self;
  final $Res Function(AuthPasswordChanged) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(AuthPasswordChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthConfirmPasswordChanged implements AuthEvent {
  const AuthConfirmPasswordChanged(this.value);
  

 final  String value;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthConfirmPasswordChangedCopyWith<AuthConfirmPasswordChanged> get copyWith => _$AuthConfirmPasswordChangedCopyWithImpl<AuthConfirmPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthConfirmPasswordChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AuthEvent.confirmPasswordChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $AuthConfirmPasswordChangedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthConfirmPasswordChangedCopyWith(AuthConfirmPasswordChanged value, $Res Function(AuthConfirmPasswordChanged) _then) = _$AuthConfirmPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$AuthConfirmPasswordChangedCopyWithImpl<$Res>
    implements $AuthConfirmPasswordChangedCopyWith<$Res> {
  _$AuthConfirmPasswordChangedCopyWithImpl(this._self, this._then);

  final AuthConfirmPasswordChanged _self;
  final $Res Function(AuthConfirmPasswordChanged) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(AuthConfirmPasswordChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthCodeChanged implements AuthEvent {
  const AuthCodeChanged(this.value);
  

 final  String value;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCodeChangedCopyWith<AuthCodeChanged> get copyWith => _$AuthCodeChangedCopyWithImpl<AuthCodeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCodeChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AuthEvent.codeChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $AuthCodeChangedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthCodeChangedCopyWith(AuthCodeChanged value, $Res Function(AuthCodeChanged) _then) = _$AuthCodeChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$AuthCodeChangedCopyWithImpl<$Res>
    implements $AuthCodeChangedCopyWith<$Res> {
  _$AuthCodeChangedCopyWithImpl(this._self, this._then);

  final AuthCodeChanged _self;
  final $Res Function(AuthCodeChanged) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(AuthCodeChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthSubmitted implements AuthEvent {
  const AuthSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.submitted()';
}


}




/// @nodoc


class AuthBiometricEnabled implements AuthEvent {
  const AuthBiometricEnabled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthBiometricEnabled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.biometricEnabled()';
}


}




/// @nodoc
mixin _$AuthState {

 String get email; String get password; String get confirmPassword; String get code; bool get isSubmitting; bool get isAuthenticated; bool get biometricEnabled; String? get failure;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.code, code) || other.code == code)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.biometricEnabled, biometricEnabled) || other.biometricEnabled == biometricEnabled)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,confirmPassword,code,isSubmitting,isAuthenticated,biometricEnabled,failure);

@override
String toString() {
  return 'AuthState(email: $email, password: $password, confirmPassword: $confirmPassword, code: $code, isSubmitting: $isSubmitting, isAuthenticated: $isAuthenticated, biometricEnabled: $biometricEnabled, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 String email, String password, String confirmPassword, String code, bool isSubmitting, bool isAuthenticated, bool biometricEnabled, String? failure
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? confirmPassword = null,Object? code = null,Object? isSubmitting = null,Object? isAuthenticated = null,Object? biometricEnabled = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,biometricEnabled: null == biometricEnabled ? _self.biometricEnabled : biometricEnabled // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String confirmPassword,  String code,  bool isSubmitting,  bool isAuthenticated,  bool biometricEnabled,  String? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.email,_that.password,_that.confirmPassword,_that.code,_that.isSubmitting,_that.isAuthenticated,_that.biometricEnabled,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String confirmPassword,  String code,  bool isSubmitting,  bool isAuthenticated,  bool biometricEnabled,  String? failure)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.email,_that.password,_that.confirmPassword,_that.code,_that.isSubmitting,_that.isAuthenticated,_that.biometricEnabled,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String confirmPassword,  String code,  bool isSubmitting,  bool isAuthenticated,  bool biometricEnabled,  String? failure)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.email,_that.password,_that.confirmPassword,_that.code,_that.isSubmitting,_that.isAuthenticated,_that.biometricEnabled,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({required this.email, required this.password, required this.confirmPassword, required this.code, required this.isSubmitting, required this.isAuthenticated, required this.biometricEnabled, this.failure});
  

@override final  String email;
@override final  String password;
@override final  String confirmPassword;
@override final  String code;
@override final  bool isSubmitting;
@override final  bool isAuthenticated;
@override final  bool biometricEnabled;
@override final  String? failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.code, code) || other.code == code)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.biometricEnabled, biometricEnabled) || other.biometricEnabled == biometricEnabled)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,confirmPassword,code,isSubmitting,isAuthenticated,biometricEnabled,failure);

@override
String toString() {
  return 'AuthState(email: $email, password: $password, confirmPassword: $confirmPassword, code: $code, isSubmitting: $isSubmitting, isAuthenticated: $isAuthenticated, biometricEnabled: $biometricEnabled, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String confirmPassword, String code, bool isSubmitting, bool isAuthenticated, bool biometricEnabled, String? failure
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? confirmPassword = null,Object? code = null,Object? isSubmitting = null,Object? isAuthenticated = null,Object? biometricEnabled = null,Object? failure = freezed,}) {
  return _then(_AuthState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,biometricEnabled: null == biometricEnabled ? _self.biometricEnabled : biometricEnabled // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
