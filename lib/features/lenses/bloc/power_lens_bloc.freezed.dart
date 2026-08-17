// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'power_lens_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PowerLensEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PowerLensEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PowerLensEvent()';
}


}

/// @nodoc
class $PowerLensEventCopyWith<$Res>  {
$PowerLensEventCopyWith(PowerLensEvent _, $Res Function(PowerLensEvent) __);
}


/// Adds pattern-matching-related methods to [PowerLensEvent].
extension PowerLensEventPatterns on PowerLensEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PowerLensLoad value)?  load,TResult Function( PowerLensPropertySelected value)?  propertySelected,TResult Function( PowerLensRecalculated value)?  recalculated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PowerLensLoad() when load != null:
return load(_that);case PowerLensPropertySelected() when propertySelected != null:
return propertySelected(_that);case PowerLensRecalculated() when recalculated != null:
return recalculated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PowerLensLoad value)  load,required TResult Function( PowerLensPropertySelected value)  propertySelected,required TResult Function( PowerLensRecalculated value)  recalculated,}){
final _that = this;
switch (_that) {
case PowerLensLoad():
return load(_that);case PowerLensPropertySelected():
return propertySelected(_that);case PowerLensRecalculated():
return recalculated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PowerLensLoad value)?  load,TResult? Function( PowerLensPropertySelected value)?  propertySelected,TResult? Function( PowerLensRecalculated value)?  recalculated,}){
final _that = this;
switch (_that) {
case PowerLensLoad() when load != null:
return load(_that);case PowerLensPropertySelected() when propertySelected != null:
return propertySelected(_that);case PowerLensRecalculated() when recalculated != null:
return recalculated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String servicePointId)?  propertySelected,TResult Function()?  recalculated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PowerLensLoad() when load != null:
return load();case PowerLensPropertySelected() when propertySelected != null:
return propertySelected(_that.servicePointId);case PowerLensRecalculated() when recalculated != null:
return recalculated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String servicePointId)  propertySelected,required TResult Function()  recalculated,}) {final _that = this;
switch (_that) {
case PowerLensLoad():
return load();case PowerLensPropertySelected():
return propertySelected(_that.servicePointId);case PowerLensRecalculated():
return recalculated();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String servicePointId)?  propertySelected,TResult? Function()?  recalculated,}) {final _that = this;
switch (_that) {
case PowerLensLoad() when load != null:
return load();case PowerLensPropertySelected() when propertySelected != null:
return propertySelected(_that.servicePointId);case PowerLensRecalculated() when recalculated != null:
return recalculated();case _:
  return null;

}
}

}

/// @nodoc


class PowerLensLoad implements PowerLensEvent {
  const PowerLensLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PowerLensLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PowerLensEvent.load()';
}


}




/// @nodoc


class PowerLensPropertySelected implements PowerLensEvent {
  const PowerLensPropertySelected(this.servicePointId);
  

 final  String servicePointId;

/// Create a copy of PowerLensEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PowerLensPropertySelectedCopyWith<PowerLensPropertySelected> get copyWith => _$PowerLensPropertySelectedCopyWithImpl<PowerLensPropertySelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PowerLensPropertySelected&&(identical(other.servicePointId, servicePointId) || other.servicePointId == servicePointId));
}


@override
int get hashCode => Object.hash(runtimeType,servicePointId);

@override
String toString() {
  return 'PowerLensEvent.propertySelected(servicePointId: $servicePointId)';
}


}

/// @nodoc
abstract mixin class $PowerLensPropertySelectedCopyWith<$Res> implements $PowerLensEventCopyWith<$Res> {
  factory $PowerLensPropertySelectedCopyWith(PowerLensPropertySelected value, $Res Function(PowerLensPropertySelected) _then) = _$PowerLensPropertySelectedCopyWithImpl;
@useResult
$Res call({
 String servicePointId
});




}
/// @nodoc
class _$PowerLensPropertySelectedCopyWithImpl<$Res>
    implements $PowerLensPropertySelectedCopyWith<$Res> {
  _$PowerLensPropertySelectedCopyWithImpl(this._self, this._then);

  final PowerLensPropertySelected _self;
  final $Res Function(PowerLensPropertySelected) _then;

/// Create a copy of PowerLensEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? servicePointId = null,}) {
  return _then(PowerLensPropertySelected(
null == servicePointId ? _self.servicePointId : servicePointId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PowerLensRecalculated implements PowerLensEvent {
  const PowerLensRecalculated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PowerLensRecalculated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PowerLensEvent.recalculated()';
}


}




/// @nodoc
mixin _$PowerLensState {

 List<ServicePoint> get servicePoints; List<EnergyAccountRecord> get accounts; List<EnergyBillRecord> get bills; bool get isCalculating; bool get isReady; String? get selectedServicePointId; PowerLensResult? get result;
/// Create a copy of PowerLensState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PowerLensStateCopyWith<PowerLensState> get copyWith => _$PowerLensStateCopyWithImpl<PowerLensState>(this as PowerLensState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PowerLensState&&const DeepCollectionEquality().equals(other.servicePoints, servicePoints)&&const DeepCollectionEquality().equals(other.accounts, accounts)&&const DeepCollectionEquality().equals(other.bills, bills)&&(identical(other.isCalculating, isCalculating) || other.isCalculating == isCalculating)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.selectedServicePointId, selectedServicePointId) || other.selectedServicePointId == selectedServicePointId)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(servicePoints),const DeepCollectionEquality().hash(accounts),const DeepCollectionEquality().hash(bills),isCalculating,isReady,selectedServicePointId,result);

@override
String toString() {
  return 'PowerLensState(servicePoints: $servicePoints, accounts: $accounts, bills: $bills, isCalculating: $isCalculating, isReady: $isReady, selectedServicePointId: $selectedServicePointId, result: $result)';
}


}

/// @nodoc
abstract mixin class $PowerLensStateCopyWith<$Res>  {
  factory $PowerLensStateCopyWith(PowerLensState value, $Res Function(PowerLensState) _then) = _$PowerLensStateCopyWithImpl;
@useResult
$Res call({
 List<ServicePoint> servicePoints, List<EnergyAccountRecord> accounts, List<EnergyBillRecord> bills, bool isCalculating, bool isReady, String? selectedServicePointId, PowerLensResult? result
});




}
/// @nodoc
class _$PowerLensStateCopyWithImpl<$Res>
    implements $PowerLensStateCopyWith<$Res> {
  _$PowerLensStateCopyWithImpl(this._self, this._then);

  final PowerLensState _self;
  final $Res Function(PowerLensState) _then;

/// Create a copy of PowerLensState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? servicePoints = null,Object? accounts = null,Object? bills = null,Object? isCalculating = null,Object? isReady = null,Object? selectedServicePointId = freezed,Object? result = freezed,}) {
  return _then(_self.copyWith(
servicePoints: null == servicePoints ? _self.servicePoints : servicePoints // ignore: cast_nullable_to_non_nullable
as List<ServicePoint>,accounts: null == accounts ? _self.accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<EnergyAccountRecord>,bills: null == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as List<EnergyBillRecord>,isCalculating: null == isCalculating ? _self.isCalculating : isCalculating // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,selectedServicePointId: freezed == selectedServicePointId ? _self.selectedServicePointId : selectedServicePointId // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as PowerLensResult?,
  ));
}

}


/// Adds pattern-matching-related methods to [PowerLensState].
extension PowerLensStatePatterns on PowerLensState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PowerLensState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PowerLensState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PowerLensState value)  $default,){
final _that = this;
switch (_that) {
case _PowerLensState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PowerLensState value)?  $default,){
final _that = this;
switch (_that) {
case _PowerLensState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ServicePoint> servicePoints,  List<EnergyAccountRecord> accounts,  List<EnergyBillRecord> bills,  bool isCalculating,  bool isReady,  String? selectedServicePointId,  PowerLensResult? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PowerLensState() when $default != null:
return $default(_that.servicePoints,_that.accounts,_that.bills,_that.isCalculating,_that.isReady,_that.selectedServicePointId,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ServicePoint> servicePoints,  List<EnergyAccountRecord> accounts,  List<EnergyBillRecord> bills,  bool isCalculating,  bool isReady,  String? selectedServicePointId,  PowerLensResult? result)  $default,) {final _that = this;
switch (_that) {
case _PowerLensState():
return $default(_that.servicePoints,_that.accounts,_that.bills,_that.isCalculating,_that.isReady,_that.selectedServicePointId,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ServicePoint> servicePoints,  List<EnergyAccountRecord> accounts,  List<EnergyBillRecord> bills,  bool isCalculating,  bool isReady,  String? selectedServicePointId,  PowerLensResult? result)?  $default,) {final _that = this;
switch (_that) {
case _PowerLensState() when $default != null:
return $default(_that.servicePoints,_that.accounts,_that.bills,_that.isCalculating,_that.isReady,_that.selectedServicePointId,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _PowerLensState implements PowerLensState {
  const _PowerLensState({required final  List<ServicePoint> servicePoints, required final  List<EnergyAccountRecord> accounts, required final  List<EnergyBillRecord> bills, required this.isCalculating, required this.isReady, this.selectedServicePointId, this.result}): _servicePoints = servicePoints,_accounts = accounts,_bills = bills;
  

 final  List<ServicePoint> _servicePoints;
@override List<ServicePoint> get servicePoints {
  if (_servicePoints is EqualUnmodifiableListView) return _servicePoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_servicePoints);
}

 final  List<EnergyAccountRecord> _accounts;
@override List<EnergyAccountRecord> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

 final  List<EnergyBillRecord> _bills;
@override List<EnergyBillRecord> get bills {
  if (_bills is EqualUnmodifiableListView) return _bills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bills);
}

@override final  bool isCalculating;
@override final  bool isReady;
@override final  String? selectedServicePointId;
@override final  PowerLensResult? result;

/// Create a copy of PowerLensState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PowerLensStateCopyWith<_PowerLensState> get copyWith => __$PowerLensStateCopyWithImpl<_PowerLensState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PowerLensState&&const DeepCollectionEquality().equals(other._servicePoints, _servicePoints)&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&const DeepCollectionEquality().equals(other._bills, _bills)&&(identical(other.isCalculating, isCalculating) || other.isCalculating == isCalculating)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.selectedServicePointId, selectedServicePointId) || other.selectedServicePointId == selectedServicePointId)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_servicePoints),const DeepCollectionEquality().hash(_accounts),const DeepCollectionEquality().hash(_bills),isCalculating,isReady,selectedServicePointId,result);

@override
String toString() {
  return 'PowerLensState(servicePoints: $servicePoints, accounts: $accounts, bills: $bills, isCalculating: $isCalculating, isReady: $isReady, selectedServicePointId: $selectedServicePointId, result: $result)';
}


}

/// @nodoc
abstract mixin class _$PowerLensStateCopyWith<$Res> implements $PowerLensStateCopyWith<$Res> {
  factory _$PowerLensStateCopyWith(_PowerLensState value, $Res Function(_PowerLensState) _then) = __$PowerLensStateCopyWithImpl;
@override @useResult
$Res call({
 List<ServicePoint> servicePoints, List<EnergyAccountRecord> accounts, List<EnergyBillRecord> bills, bool isCalculating, bool isReady, String? selectedServicePointId, PowerLensResult? result
});




}
/// @nodoc
class __$PowerLensStateCopyWithImpl<$Res>
    implements _$PowerLensStateCopyWith<$Res> {
  __$PowerLensStateCopyWithImpl(this._self, this._then);

  final _PowerLensState _self;
  final $Res Function(_PowerLensState) _then;

/// Create a copy of PowerLensState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? servicePoints = null,Object? accounts = null,Object? bills = null,Object? isCalculating = null,Object? isReady = null,Object? selectedServicePointId = freezed,Object? result = freezed,}) {
  return _then(_PowerLensState(
servicePoints: null == servicePoints ? _self._servicePoints : servicePoints // ignore: cast_nullable_to_non_nullable
as List<ServicePoint>,accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<EnergyAccountRecord>,bills: null == bills ? _self._bills : bills // ignore: cast_nullable_to_non_nullable
as List<EnergyBillRecord>,isCalculating: null == isCalculating ? _self.isCalculating : isCalculating // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,selectedServicePointId: freezed == selectedServicePointId ? _self.selectedServicePointId : selectedServicePointId // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as PowerLensResult?,
  ));
}


}

// dart format on
