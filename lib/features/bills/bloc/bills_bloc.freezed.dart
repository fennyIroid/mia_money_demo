// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bills_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BillsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BillsEvent()';
}


}

/// @nodoc
class $BillsEventCopyWith<$Res>  {
$BillsEventCopyWith(BillsEvent _, $Res Function(BillsEvent) __);
}


/// Adds pattern-matching-related methods to [BillsEvent].
extension BillsEventPatterns on BillsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BillsLoad value)?  load,TResult Function( BillsFilterChanged value)?  filterChanged,TResult Function( BillsHorizonChanged value)?  horizonChanged,TResult Function( BillsMarkPaid value)?  markPaid,TResult Function( BillsConfirmExpectedMatch value)?  confirmExpectedMatch,TResult Function( BillsChaseExpected value)?  chaseExpected,TResult Function( BillsExpectedWrittenOff value)?  expectedWrittenOff,TResult Function( BillsBillCancelled value)?  billCancelled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BillsLoad() when load != null:
return load(_that);case BillsFilterChanged() when filterChanged != null:
return filterChanged(_that);case BillsHorizonChanged() when horizonChanged != null:
return horizonChanged(_that);case BillsMarkPaid() when markPaid != null:
return markPaid(_that);case BillsConfirmExpectedMatch() when confirmExpectedMatch != null:
return confirmExpectedMatch(_that);case BillsChaseExpected() when chaseExpected != null:
return chaseExpected(_that);case BillsExpectedWrittenOff() when expectedWrittenOff != null:
return expectedWrittenOff(_that);case BillsBillCancelled() when billCancelled != null:
return billCancelled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BillsLoad value)  load,required TResult Function( BillsFilterChanged value)  filterChanged,required TResult Function( BillsHorizonChanged value)  horizonChanged,required TResult Function( BillsMarkPaid value)  markPaid,required TResult Function( BillsConfirmExpectedMatch value)  confirmExpectedMatch,required TResult Function( BillsChaseExpected value)  chaseExpected,required TResult Function( BillsExpectedWrittenOff value)  expectedWrittenOff,required TResult Function( BillsBillCancelled value)  billCancelled,}){
final _that = this;
switch (_that) {
case BillsLoad():
return load(_that);case BillsFilterChanged():
return filterChanged(_that);case BillsHorizonChanged():
return horizonChanged(_that);case BillsMarkPaid():
return markPaid(_that);case BillsConfirmExpectedMatch():
return confirmExpectedMatch(_that);case BillsChaseExpected():
return chaseExpected(_that);case BillsExpectedWrittenOff():
return expectedWrittenOff(_that);case BillsBillCancelled():
return billCancelled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BillsLoad value)?  load,TResult? Function( BillsFilterChanged value)?  filterChanged,TResult? Function( BillsHorizonChanged value)?  horizonChanged,TResult? Function( BillsMarkPaid value)?  markPaid,TResult? Function( BillsConfirmExpectedMatch value)?  confirmExpectedMatch,TResult? Function( BillsChaseExpected value)?  chaseExpected,TResult? Function( BillsExpectedWrittenOff value)?  expectedWrittenOff,TResult? Function( BillsBillCancelled value)?  billCancelled,}){
final _that = this;
switch (_that) {
case BillsLoad() when load != null:
return load(_that);case BillsFilterChanged() when filterChanged != null:
return filterChanged(_that);case BillsHorizonChanged() when horizonChanged != null:
return horizonChanged(_that);case BillsMarkPaid() when markPaid != null:
return markPaid(_that);case BillsConfirmExpectedMatch() when confirmExpectedMatch != null:
return confirmExpectedMatch(_that);case BillsChaseExpected() when chaseExpected != null:
return chaseExpected(_that);case BillsExpectedWrittenOff() when expectedWrittenOff != null:
return expectedWrittenOff(_that);case BillsBillCancelled() when billCancelled != null:
return billCancelled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( BillFilter filter)?  filterChanged,TResult Function( int days)?  horizonChanged,TResult Function( String billId)?  markPaid,TResult Function( String id)?  confirmExpectedMatch,TResult Function( String id)?  chaseExpected,TResult Function( String id)?  expectedWrittenOff,TResult Function( String billId)?  billCancelled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BillsLoad() when load != null:
return load();case BillsFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case BillsHorizonChanged() when horizonChanged != null:
return horizonChanged(_that.days);case BillsMarkPaid() when markPaid != null:
return markPaid(_that.billId);case BillsConfirmExpectedMatch() when confirmExpectedMatch != null:
return confirmExpectedMatch(_that.id);case BillsChaseExpected() when chaseExpected != null:
return chaseExpected(_that.id);case BillsExpectedWrittenOff() when expectedWrittenOff != null:
return expectedWrittenOff(_that.id);case BillsBillCancelled() when billCancelled != null:
return billCancelled(_that.billId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( BillFilter filter)  filterChanged,required TResult Function( int days)  horizonChanged,required TResult Function( String billId)  markPaid,required TResult Function( String id)  confirmExpectedMatch,required TResult Function( String id)  chaseExpected,required TResult Function( String id)  expectedWrittenOff,required TResult Function( String billId)  billCancelled,}) {final _that = this;
switch (_that) {
case BillsLoad():
return load();case BillsFilterChanged():
return filterChanged(_that.filter);case BillsHorizonChanged():
return horizonChanged(_that.days);case BillsMarkPaid():
return markPaid(_that.billId);case BillsConfirmExpectedMatch():
return confirmExpectedMatch(_that.id);case BillsChaseExpected():
return chaseExpected(_that.id);case BillsExpectedWrittenOff():
return expectedWrittenOff(_that.id);case BillsBillCancelled():
return billCancelled(_that.billId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( BillFilter filter)?  filterChanged,TResult? Function( int days)?  horizonChanged,TResult? Function( String billId)?  markPaid,TResult? Function( String id)?  confirmExpectedMatch,TResult? Function( String id)?  chaseExpected,TResult? Function( String id)?  expectedWrittenOff,TResult? Function( String billId)?  billCancelled,}) {final _that = this;
switch (_that) {
case BillsLoad() when load != null:
return load();case BillsFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case BillsHorizonChanged() when horizonChanged != null:
return horizonChanged(_that.days);case BillsMarkPaid() when markPaid != null:
return markPaid(_that.billId);case BillsConfirmExpectedMatch() when confirmExpectedMatch != null:
return confirmExpectedMatch(_that.id);case BillsChaseExpected() when chaseExpected != null:
return chaseExpected(_that.id);case BillsExpectedWrittenOff() when expectedWrittenOff != null:
return expectedWrittenOff(_that.id);case BillsBillCancelled() when billCancelled != null:
return billCancelled(_that.billId);case _:
  return null;

}
}

}

/// @nodoc


class BillsLoad implements BillsEvent {
  const BillsLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillsLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BillsEvent.load()';
}


}




/// @nodoc


class BillsFilterChanged implements BillsEvent {
  const BillsFilterChanged(this.filter);
  

 final  BillFilter filter;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillsFilterChangedCopyWith<BillsFilterChanged> get copyWith => _$BillsFilterChangedCopyWithImpl<BillsFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillsFilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'BillsEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $BillsFilterChangedCopyWith<$Res> implements $BillsEventCopyWith<$Res> {
  factory $BillsFilterChangedCopyWith(BillsFilterChanged value, $Res Function(BillsFilterChanged) _then) = _$BillsFilterChangedCopyWithImpl;
@useResult
$Res call({
 BillFilter filter
});




}
/// @nodoc
class _$BillsFilterChangedCopyWithImpl<$Res>
    implements $BillsFilterChangedCopyWith<$Res> {
  _$BillsFilterChangedCopyWithImpl(this._self, this._then);

  final BillsFilterChanged _self;
  final $Res Function(BillsFilterChanged) _then;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(BillsFilterChanged(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as BillFilter,
  ));
}


}

/// @nodoc


class BillsHorizonChanged implements BillsEvent {
  const BillsHorizonChanged(this.days);
  

 final  int days;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillsHorizonChangedCopyWith<BillsHorizonChanged> get copyWith => _$BillsHorizonChangedCopyWithImpl<BillsHorizonChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillsHorizonChanged&&(identical(other.days, days) || other.days == days));
}


@override
int get hashCode => Object.hash(runtimeType,days);

@override
String toString() {
  return 'BillsEvent.horizonChanged(days: $days)';
}


}

/// @nodoc
abstract mixin class $BillsHorizonChangedCopyWith<$Res> implements $BillsEventCopyWith<$Res> {
  factory $BillsHorizonChangedCopyWith(BillsHorizonChanged value, $Res Function(BillsHorizonChanged) _then) = _$BillsHorizonChangedCopyWithImpl;
@useResult
$Res call({
 int days
});




}
/// @nodoc
class _$BillsHorizonChangedCopyWithImpl<$Res>
    implements $BillsHorizonChangedCopyWith<$Res> {
  _$BillsHorizonChangedCopyWithImpl(this._self, this._then);

  final BillsHorizonChanged _self;
  final $Res Function(BillsHorizonChanged) _then;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? days = null,}) {
  return _then(BillsHorizonChanged(
null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class BillsMarkPaid implements BillsEvent {
  const BillsMarkPaid(this.billId);
  

 final  String billId;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillsMarkPaidCopyWith<BillsMarkPaid> get copyWith => _$BillsMarkPaidCopyWithImpl<BillsMarkPaid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillsMarkPaid&&(identical(other.billId, billId) || other.billId == billId));
}


@override
int get hashCode => Object.hash(runtimeType,billId);

@override
String toString() {
  return 'BillsEvent.markPaid(billId: $billId)';
}


}

/// @nodoc
abstract mixin class $BillsMarkPaidCopyWith<$Res> implements $BillsEventCopyWith<$Res> {
  factory $BillsMarkPaidCopyWith(BillsMarkPaid value, $Res Function(BillsMarkPaid) _then) = _$BillsMarkPaidCopyWithImpl;
@useResult
$Res call({
 String billId
});




}
/// @nodoc
class _$BillsMarkPaidCopyWithImpl<$Res>
    implements $BillsMarkPaidCopyWith<$Res> {
  _$BillsMarkPaidCopyWithImpl(this._self, this._then);

  final BillsMarkPaid _self;
  final $Res Function(BillsMarkPaid) _then;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? billId = null,}) {
  return _then(BillsMarkPaid(
null == billId ? _self.billId : billId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BillsConfirmExpectedMatch implements BillsEvent {
  const BillsConfirmExpectedMatch(this.id);
  

 final  String id;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillsConfirmExpectedMatchCopyWith<BillsConfirmExpectedMatch> get copyWith => _$BillsConfirmExpectedMatchCopyWithImpl<BillsConfirmExpectedMatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillsConfirmExpectedMatch&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'BillsEvent.confirmExpectedMatch(id: $id)';
}


}

/// @nodoc
abstract mixin class $BillsConfirmExpectedMatchCopyWith<$Res> implements $BillsEventCopyWith<$Res> {
  factory $BillsConfirmExpectedMatchCopyWith(BillsConfirmExpectedMatch value, $Res Function(BillsConfirmExpectedMatch) _then) = _$BillsConfirmExpectedMatchCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$BillsConfirmExpectedMatchCopyWithImpl<$Res>
    implements $BillsConfirmExpectedMatchCopyWith<$Res> {
  _$BillsConfirmExpectedMatchCopyWithImpl(this._self, this._then);

  final BillsConfirmExpectedMatch _self;
  final $Res Function(BillsConfirmExpectedMatch) _then;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(BillsConfirmExpectedMatch(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BillsChaseExpected implements BillsEvent {
  const BillsChaseExpected(this.id);
  

 final  String id;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillsChaseExpectedCopyWith<BillsChaseExpected> get copyWith => _$BillsChaseExpectedCopyWithImpl<BillsChaseExpected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillsChaseExpected&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'BillsEvent.chaseExpected(id: $id)';
}


}

/// @nodoc
abstract mixin class $BillsChaseExpectedCopyWith<$Res> implements $BillsEventCopyWith<$Res> {
  factory $BillsChaseExpectedCopyWith(BillsChaseExpected value, $Res Function(BillsChaseExpected) _then) = _$BillsChaseExpectedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$BillsChaseExpectedCopyWithImpl<$Res>
    implements $BillsChaseExpectedCopyWith<$Res> {
  _$BillsChaseExpectedCopyWithImpl(this._self, this._then);

  final BillsChaseExpected _self;
  final $Res Function(BillsChaseExpected) _then;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(BillsChaseExpected(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BillsExpectedWrittenOff implements BillsEvent {
  const BillsExpectedWrittenOff(this.id);
  

 final  String id;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillsExpectedWrittenOffCopyWith<BillsExpectedWrittenOff> get copyWith => _$BillsExpectedWrittenOffCopyWithImpl<BillsExpectedWrittenOff>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillsExpectedWrittenOff&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'BillsEvent.expectedWrittenOff(id: $id)';
}


}

/// @nodoc
abstract mixin class $BillsExpectedWrittenOffCopyWith<$Res> implements $BillsEventCopyWith<$Res> {
  factory $BillsExpectedWrittenOffCopyWith(BillsExpectedWrittenOff value, $Res Function(BillsExpectedWrittenOff) _then) = _$BillsExpectedWrittenOffCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$BillsExpectedWrittenOffCopyWithImpl<$Res>
    implements $BillsExpectedWrittenOffCopyWith<$Res> {
  _$BillsExpectedWrittenOffCopyWithImpl(this._self, this._then);

  final BillsExpectedWrittenOff _self;
  final $Res Function(BillsExpectedWrittenOff) _then;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(BillsExpectedWrittenOff(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BillsBillCancelled implements BillsEvent {
  const BillsBillCancelled(this.billId);
  

 final  String billId;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillsBillCancelledCopyWith<BillsBillCancelled> get copyWith => _$BillsBillCancelledCopyWithImpl<BillsBillCancelled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillsBillCancelled&&(identical(other.billId, billId) || other.billId == billId));
}


@override
int get hashCode => Object.hash(runtimeType,billId);

@override
String toString() {
  return 'BillsEvent.billCancelled(billId: $billId)';
}


}

/// @nodoc
abstract mixin class $BillsBillCancelledCopyWith<$Res> implements $BillsEventCopyWith<$Res> {
  factory $BillsBillCancelledCopyWith(BillsBillCancelled value, $Res Function(BillsBillCancelled) _then) = _$BillsBillCancelledCopyWithImpl;
@useResult
$Res call({
 String billId
});




}
/// @nodoc
class _$BillsBillCancelledCopyWithImpl<$Res>
    implements $BillsBillCancelledCopyWith<$Res> {
  _$BillsBillCancelledCopyWithImpl(this._self, this._then);

  final BillsBillCancelled _self;
  final $Res Function(BillsBillCancelled) _then;

/// Create a copy of BillsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? billId = null,}) {
  return _then(BillsBillCancelled(
null == billId ? _self.billId : billId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BillsState {

 List<Bill> get bills; List<TimelineItem> get timeline; List<ExpectedMoney> get expected; BillFilter get filter; int get horizonDays; bool get isReady;
/// Create a copy of BillsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillsStateCopyWith<BillsState> get copyWith => _$BillsStateCopyWithImpl<BillsState>(this as BillsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillsState&&const DeepCollectionEquality().equals(other.bills, bills)&&const DeepCollectionEquality().equals(other.timeline, timeline)&&const DeepCollectionEquality().equals(other.expected, expected)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.horizonDays, horizonDays) || other.horizonDays == horizonDays)&&(identical(other.isReady, isReady) || other.isReady == isReady));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bills),const DeepCollectionEquality().hash(timeline),const DeepCollectionEquality().hash(expected),filter,horizonDays,isReady);

@override
String toString() {
  return 'BillsState(bills: $bills, timeline: $timeline, expected: $expected, filter: $filter, horizonDays: $horizonDays, isReady: $isReady)';
}


}

/// @nodoc
abstract mixin class $BillsStateCopyWith<$Res>  {
  factory $BillsStateCopyWith(BillsState value, $Res Function(BillsState) _then) = _$BillsStateCopyWithImpl;
@useResult
$Res call({
 List<Bill> bills, List<TimelineItem> timeline, List<ExpectedMoney> expected, BillFilter filter, int horizonDays, bool isReady
});




}
/// @nodoc
class _$BillsStateCopyWithImpl<$Res>
    implements $BillsStateCopyWith<$Res> {
  _$BillsStateCopyWithImpl(this._self, this._then);

  final BillsState _self;
  final $Res Function(BillsState) _then;

/// Create a copy of BillsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bills = null,Object? timeline = null,Object? expected = null,Object? filter = null,Object? horizonDays = null,Object? isReady = null,}) {
  return _then(_self.copyWith(
bills: null == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as List<Bill>,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<TimelineItem>,expected: null == expected ? _self.expected : expected // ignore: cast_nullable_to_non_nullable
as List<ExpectedMoney>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as BillFilter,horizonDays: null == horizonDays ? _self.horizonDays : horizonDays // ignore: cast_nullable_to_non_nullable
as int,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BillsState].
extension BillsStatePatterns on BillsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillsState value)  $default,){
final _that = this;
switch (_that) {
case _BillsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillsState value)?  $default,){
final _that = this;
switch (_that) {
case _BillsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Bill> bills,  List<TimelineItem> timeline,  List<ExpectedMoney> expected,  BillFilter filter,  int horizonDays,  bool isReady)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillsState() when $default != null:
return $default(_that.bills,_that.timeline,_that.expected,_that.filter,_that.horizonDays,_that.isReady);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Bill> bills,  List<TimelineItem> timeline,  List<ExpectedMoney> expected,  BillFilter filter,  int horizonDays,  bool isReady)  $default,) {final _that = this;
switch (_that) {
case _BillsState():
return $default(_that.bills,_that.timeline,_that.expected,_that.filter,_that.horizonDays,_that.isReady);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Bill> bills,  List<TimelineItem> timeline,  List<ExpectedMoney> expected,  BillFilter filter,  int horizonDays,  bool isReady)?  $default,) {final _that = this;
switch (_that) {
case _BillsState() when $default != null:
return $default(_that.bills,_that.timeline,_that.expected,_that.filter,_that.horizonDays,_that.isReady);case _:
  return null;

}
}

}

/// @nodoc


class _BillsState implements BillsState {
  const _BillsState({required final  List<Bill> bills, required final  List<TimelineItem> timeline, required final  List<ExpectedMoney> expected, required this.filter, required this.horizonDays, required this.isReady}): _bills = bills,_timeline = timeline,_expected = expected;
  

 final  List<Bill> _bills;
@override List<Bill> get bills {
  if (_bills is EqualUnmodifiableListView) return _bills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bills);
}

 final  List<TimelineItem> _timeline;
@override List<TimelineItem> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

 final  List<ExpectedMoney> _expected;
@override List<ExpectedMoney> get expected {
  if (_expected is EqualUnmodifiableListView) return _expected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expected);
}

@override final  BillFilter filter;
@override final  int horizonDays;
@override final  bool isReady;

/// Create a copy of BillsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillsStateCopyWith<_BillsState> get copyWith => __$BillsStateCopyWithImpl<_BillsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillsState&&const DeepCollectionEquality().equals(other._bills, _bills)&&const DeepCollectionEquality().equals(other._timeline, _timeline)&&const DeepCollectionEquality().equals(other._expected, _expected)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.horizonDays, horizonDays) || other.horizonDays == horizonDays)&&(identical(other.isReady, isReady) || other.isReady == isReady));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bills),const DeepCollectionEquality().hash(_timeline),const DeepCollectionEquality().hash(_expected),filter,horizonDays,isReady);

@override
String toString() {
  return 'BillsState(bills: $bills, timeline: $timeline, expected: $expected, filter: $filter, horizonDays: $horizonDays, isReady: $isReady)';
}


}

/// @nodoc
abstract mixin class _$BillsStateCopyWith<$Res> implements $BillsStateCopyWith<$Res> {
  factory _$BillsStateCopyWith(_BillsState value, $Res Function(_BillsState) _then) = __$BillsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Bill> bills, List<TimelineItem> timeline, List<ExpectedMoney> expected, BillFilter filter, int horizonDays, bool isReady
});




}
/// @nodoc
class __$BillsStateCopyWithImpl<$Res>
    implements _$BillsStateCopyWith<$Res> {
  __$BillsStateCopyWithImpl(this._self, this._then);

  final _BillsState _self;
  final $Res Function(_BillsState) _then;

/// Create a copy of BillsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bills = null,Object? timeline = null,Object? expected = null,Object? filter = null,Object? horizonDays = null,Object? isReady = null,}) {
  return _then(_BillsState(
bills: null == bills ? _self._bills : bills // ignore: cast_nullable_to_non_nullable
as List<Bill>,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<TimelineItem>,expected: null == expected ? _self._expected : expected // ignore: cast_nullable_to_non_nullable
as List<ExpectedMoney>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as BillFilter,horizonDays: null == horizonDays ? _self.horizonDays : horizonDays // ignore: cast_nullable_to_non_nullable
as int,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
