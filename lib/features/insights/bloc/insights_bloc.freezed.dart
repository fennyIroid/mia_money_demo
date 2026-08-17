// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insights_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InsightsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsightsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InsightsEvent()';
}


}

/// @nodoc
class $InsightsEventCopyWith<$Res>  {
$InsightsEventCopyWith(InsightsEvent _, $Res Function(InsightsEvent) __);
}


/// Adds pattern-matching-related methods to [InsightsEvent].
extension InsightsEventPatterns on InsightsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InsightsLoad value)?  load,TResult Function( InsightsResetStepChanged value)?  resetStepChanged,TResult Function( InsightsWeeklyResetCompleted value)?  weeklyResetCompleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InsightsLoad() when load != null:
return load(_that);case InsightsResetStepChanged() when resetStepChanged != null:
return resetStepChanged(_that);case InsightsWeeklyResetCompleted() when weeklyResetCompleted != null:
return weeklyResetCompleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InsightsLoad value)  load,required TResult Function( InsightsResetStepChanged value)  resetStepChanged,required TResult Function( InsightsWeeklyResetCompleted value)  weeklyResetCompleted,}){
final _that = this;
switch (_that) {
case InsightsLoad():
return load(_that);case InsightsResetStepChanged():
return resetStepChanged(_that);case InsightsWeeklyResetCompleted():
return weeklyResetCompleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InsightsLoad value)?  load,TResult? Function( InsightsResetStepChanged value)?  resetStepChanged,TResult? Function( InsightsWeeklyResetCompleted value)?  weeklyResetCompleted,}){
final _that = this;
switch (_that) {
case InsightsLoad() when load != null:
return load(_that);case InsightsResetStepChanged() when resetStepChanged != null:
return resetStepChanged(_that);case InsightsWeeklyResetCompleted() when weeklyResetCompleted != null:
return weeklyResetCompleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( int step)?  resetStepChanged,TResult Function()?  weeklyResetCompleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InsightsLoad() when load != null:
return load();case InsightsResetStepChanged() when resetStepChanged != null:
return resetStepChanged(_that.step);case InsightsWeeklyResetCompleted() when weeklyResetCompleted != null:
return weeklyResetCompleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( int step)  resetStepChanged,required TResult Function()  weeklyResetCompleted,}) {final _that = this;
switch (_that) {
case InsightsLoad():
return load();case InsightsResetStepChanged():
return resetStepChanged(_that.step);case InsightsWeeklyResetCompleted():
return weeklyResetCompleted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( int step)?  resetStepChanged,TResult? Function()?  weeklyResetCompleted,}) {final _that = this;
switch (_that) {
case InsightsLoad() when load != null:
return load();case InsightsResetStepChanged() when resetStepChanged != null:
return resetStepChanged(_that.step);case InsightsWeeklyResetCompleted() when weeklyResetCompleted != null:
return weeklyResetCompleted();case _:
  return null;

}
}

}

/// @nodoc


class InsightsLoad implements InsightsEvent {
  const InsightsLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsightsLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InsightsEvent.load()';
}


}




/// @nodoc


class InsightsResetStepChanged implements InsightsEvent {
  const InsightsResetStepChanged(this.step);
  

 final  int step;

/// Create a copy of InsightsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsightsResetStepChangedCopyWith<InsightsResetStepChanged> get copyWith => _$InsightsResetStepChangedCopyWithImpl<InsightsResetStepChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsightsResetStepChanged&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'InsightsEvent.resetStepChanged(step: $step)';
}


}

/// @nodoc
abstract mixin class $InsightsResetStepChangedCopyWith<$Res> implements $InsightsEventCopyWith<$Res> {
  factory $InsightsResetStepChangedCopyWith(InsightsResetStepChanged value, $Res Function(InsightsResetStepChanged) _then) = _$InsightsResetStepChangedCopyWithImpl;
@useResult
$Res call({
 int step
});




}
/// @nodoc
class _$InsightsResetStepChangedCopyWithImpl<$Res>
    implements $InsightsResetStepChangedCopyWith<$Res> {
  _$InsightsResetStepChangedCopyWithImpl(this._self, this._then);

  final InsightsResetStepChanged _self;
  final $Res Function(InsightsResetStepChanged) _then;

/// Create a copy of InsightsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(InsightsResetStepChanged(
null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class InsightsWeeklyResetCompleted implements InsightsEvent {
  const InsightsWeeklyResetCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsightsWeeklyResetCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InsightsEvent.weeklyResetCompleted()';
}


}




/// @nodoc
mixin _$InsightsState {

 List<WhatChangedItem> get whatChanged; List<HandledItem> get handled; List<BriefingCard> get weeklyReset; List<BriefingCard> get briefings; int get resetStep; DateTime? get weeklyResetCompletedOn; bool get isReady; AvailableAfterObligations? get available; TrueCostOfLife? get trueCost;
/// Create a copy of InsightsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsightsStateCopyWith<InsightsState> get copyWith => _$InsightsStateCopyWithImpl<InsightsState>(this as InsightsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsightsState&&const DeepCollectionEquality().equals(other.whatChanged, whatChanged)&&const DeepCollectionEquality().equals(other.handled, handled)&&const DeepCollectionEquality().equals(other.weeklyReset, weeklyReset)&&const DeepCollectionEquality().equals(other.briefings, briefings)&&(identical(other.resetStep, resetStep) || other.resetStep == resetStep)&&(identical(other.weeklyResetCompletedOn, weeklyResetCompletedOn) || other.weeklyResetCompletedOn == weeklyResetCompletedOn)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.available, available) || other.available == available)&&(identical(other.trueCost, trueCost) || other.trueCost == trueCost));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(whatChanged),const DeepCollectionEquality().hash(handled),const DeepCollectionEquality().hash(weeklyReset),const DeepCollectionEquality().hash(briefings),resetStep,weeklyResetCompletedOn,isReady,available,trueCost);

@override
String toString() {
  return 'InsightsState(whatChanged: $whatChanged, handled: $handled, weeklyReset: $weeklyReset, briefings: $briefings, resetStep: $resetStep, weeklyResetCompletedOn: $weeklyResetCompletedOn, isReady: $isReady, available: $available, trueCost: $trueCost)';
}


}

/// @nodoc
abstract mixin class $InsightsStateCopyWith<$Res>  {
  factory $InsightsStateCopyWith(InsightsState value, $Res Function(InsightsState) _then) = _$InsightsStateCopyWithImpl;
@useResult
$Res call({
 List<WhatChangedItem> whatChanged, List<HandledItem> handled, List<BriefingCard> weeklyReset, List<BriefingCard> briefings, int resetStep, DateTime? weeklyResetCompletedOn, bool isReady, AvailableAfterObligations? available, TrueCostOfLife? trueCost
});




}
/// @nodoc
class _$InsightsStateCopyWithImpl<$Res>
    implements $InsightsStateCopyWith<$Res> {
  _$InsightsStateCopyWithImpl(this._self, this._then);

  final InsightsState _self;
  final $Res Function(InsightsState) _then;

/// Create a copy of InsightsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? whatChanged = null,Object? handled = null,Object? weeklyReset = null,Object? briefings = null,Object? resetStep = null,Object? weeklyResetCompletedOn = freezed,Object? isReady = null,Object? available = freezed,Object? trueCost = freezed,}) {
  return _then(_self.copyWith(
whatChanged: null == whatChanged ? _self.whatChanged : whatChanged // ignore: cast_nullable_to_non_nullable
as List<WhatChangedItem>,handled: null == handled ? _self.handled : handled // ignore: cast_nullable_to_non_nullable
as List<HandledItem>,weeklyReset: null == weeklyReset ? _self.weeklyReset : weeklyReset // ignore: cast_nullable_to_non_nullable
as List<BriefingCard>,briefings: null == briefings ? _self.briefings : briefings // ignore: cast_nullable_to_non_nullable
as List<BriefingCard>,resetStep: null == resetStep ? _self.resetStep : resetStep // ignore: cast_nullable_to_non_nullable
as int,weeklyResetCompletedOn: freezed == weeklyResetCompletedOn ? _self.weeklyResetCompletedOn : weeklyResetCompletedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as AvailableAfterObligations?,trueCost: freezed == trueCost ? _self.trueCost : trueCost // ignore: cast_nullable_to_non_nullable
as TrueCostOfLife?,
  ));
}

}


/// Adds pattern-matching-related methods to [InsightsState].
extension InsightsStatePatterns on InsightsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InsightsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InsightsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InsightsState value)  $default,){
final _that = this;
switch (_that) {
case _InsightsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InsightsState value)?  $default,){
final _that = this;
switch (_that) {
case _InsightsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WhatChangedItem> whatChanged,  List<HandledItem> handled,  List<BriefingCard> weeklyReset,  List<BriefingCard> briefings,  int resetStep,  DateTime? weeklyResetCompletedOn,  bool isReady,  AvailableAfterObligations? available,  TrueCostOfLife? trueCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InsightsState() when $default != null:
return $default(_that.whatChanged,_that.handled,_that.weeklyReset,_that.briefings,_that.resetStep,_that.weeklyResetCompletedOn,_that.isReady,_that.available,_that.trueCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WhatChangedItem> whatChanged,  List<HandledItem> handled,  List<BriefingCard> weeklyReset,  List<BriefingCard> briefings,  int resetStep,  DateTime? weeklyResetCompletedOn,  bool isReady,  AvailableAfterObligations? available,  TrueCostOfLife? trueCost)  $default,) {final _that = this;
switch (_that) {
case _InsightsState():
return $default(_that.whatChanged,_that.handled,_that.weeklyReset,_that.briefings,_that.resetStep,_that.weeklyResetCompletedOn,_that.isReady,_that.available,_that.trueCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WhatChangedItem> whatChanged,  List<HandledItem> handled,  List<BriefingCard> weeklyReset,  List<BriefingCard> briefings,  int resetStep,  DateTime? weeklyResetCompletedOn,  bool isReady,  AvailableAfterObligations? available,  TrueCostOfLife? trueCost)?  $default,) {final _that = this;
switch (_that) {
case _InsightsState() when $default != null:
return $default(_that.whatChanged,_that.handled,_that.weeklyReset,_that.briefings,_that.resetStep,_that.weeklyResetCompletedOn,_that.isReady,_that.available,_that.trueCost);case _:
  return null;

}
}

}

/// @nodoc


class _InsightsState implements InsightsState {
  const _InsightsState({required final  List<WhatChangedItem> whatChanged, required final  List<HandledItem> handled, required final  List<BriefingCard> weeklyReset, required final  List<BriefingCard> briefings, required this.resetStep, this.weeklyResetCompletedOn, required this.isReady, this.available, this.trueCost}): _whatChanged = whatChanged,_handled = handled,_weeklyReset = weeklyReset,_briefings = briefings;
  

 final  List<WhatChangedItem> _whatChanged;
@override List<WhatChangedItem> get whatChanged {
  if (_whatChanged is EqualUnmodifiableListView) return _whatChanged;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_whatChanged);
}

 final  List<HandledItem> _handled;
@override List<HandledItem> get handled {
  if (_handled is EqualUnmodifiableListView) return _handled;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_handled);
}

 final  List<BriefingCard> _weeklyReset;
@override List<BriefingCard> get weeklyReset {
  if (_weeklyReset is EqualUnmodifiableListView) return _weeklyReset;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weeklyReset);
}

 final  List<BriefingCard> _briefings;
@override List<BriefingCard> get briefings {
  if (_briefings is EqualUnmodifiableListView) return _briefings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_briefings);
}

@override final  int resetStep;
@override final  DateTime? weeklyResetCompletedOn;
@override final  bool isReady;
@override final  AvailableAfterObligations? available;
@override final  TrueCostOfLife? trueCost;

/// Create a copy of InsightsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsightsStateCopyWith<_InsightsState> get copyWith => __$InsightsStateCopyWithImpl<_InsightsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsightsState&&const DeepCollectionEquality().equals(other._whatChanged, _whatChanged)&&const DeepCollectionEquality().equals(other._handled, _handled)&&const DeepCollectionEquality().equals(other._weeklyReset, _weeklyReset)&&const DeepCollectionEquality().equals(other._briefings, _briefings)&&(identical(other.resetStep, resetStep) || other.resetStep == resetStep)&&(identical(other.weeklyResetCompletedOn, weeklyResetCompletedOn) || other.weeklyResetCompletedOn == weeklyResetCompletedOn)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.available, available) || other.available == available)&&(identical(other.trueCost, trueCost) || other.trueCost == trueCost));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_whatChanged),const DeepCollectionEquality().hash(_handled),const DeepCollectionEquality().hash(_weeklyReset),const DeepCollectionEquality().hash(_briefings),resetStep,weeklyResetCompletedOn,isReady,available,trueCost);

@override
String toString() {
  return 'InsightsState(whatChanged: $whatChanged, handled: $handled, weeklyReset: $weeklyReset, briefings: $briefings, resetStep: $resetStep, weeklyResetCompletedOn: $weeklyResetCompletedOn, isReady: $isReady, available: $available, trueCost: $trueCost)';
}


}

/// @nodoc
abstract mixin class _$InsightsStateCopyWith<$Res> implements $InsightsStateCopyWith<$Res> {
  factory _$InsightsStateCopyWith(_InsightsState value, $Res Function(_InsightsState) _then) = __$InsightsStateCopyWithImpl;
@override @useResult
$Res call({
 List<WhatChangedItem> whatChanged, List<HandledItem> handled, List<BriefingCard> weeklyReset, List<BriefingCard> briefings, int resetStep, DateTime? weeklyResetCompletedOn, bool isReady, AvailableAfterObligations? available, TrueCostOfLife? trueCost
});




}
/// @nodoc
class __$InsightsStateCopyWithImpl<$Res>
    implements _$InsightsStateCopyWith<$Res> {
  __$InsightsStateCopyWithImpl(this._self, this._then);

  final _InsightsState _self;
  final $Res Function(_InsightsState) _then;

/// Create a copy of InsightsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? whatChanged = null,Object? handled = null,Object? weeklyReset = null,Object? briefings = null,Object? resetStep = null,Object? weeklyResetCompletedOn = freezed,Object? isReady = null,Object? available = freezed,Object? trueCost = freezed,}) {
  return _then(_InsightsState(
whatChanged: null == whatChanged ? _self._whatChanged : whatChanged // ignore: cast_nullable_to_non_nullable
as List<WhatChangedItem>,handled: null == handled ? _self._handled : handled // ignore: cast_nullable_to_non_nullable
as List<HandledItem>,weeklyReset: null == weeklyReset ? _self._weeklyReset : weeklyReset // ignore: cast_nullable_to_non_nullable
as List<BriefingCard>,briefings: null == briefings ? _self._briefings : briefings // ignore: cast_nullable_to_non_nullable
as List<BriefingCard>,resetStep: null == resetStep ? _self.resetStep : resetStep // ignore: cast_nullable_to_non_nullable
as int,weeklyResetCompletedOn: freezed == weeklyResetCompletedOn ? _self.weeklyResetCompletedOn : weeklyResetCompletedOn // ignore: cast_nullable_to_non_nullable
as DateTime?,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as AvailableAfterObligations?,trueCost: freezed == trueCost ? _self.trueCost : trueCost // ignore: cast_nullable_to_non_nullable
as TrueCostOfLife?,
  ));
}


}

// dart format on
