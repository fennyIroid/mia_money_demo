// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubscriptionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscriptionEvent()';
}


}

/// @nodoc
class $SubscriptionEventCopyWith<$Res>  {
$SubscriptionEventCopyWith(SubscriptionEvent _, $Res Function(SubscriptionEvent) __);
}


/// Adds pattern-matching-related methods to [SubscriptionEvent].
extension SubscriptionEventPatterns on SubscriptionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscriptionLoadPlans value)?  loadPlans,TResult Function( SubscriptionKindSelected value)?  kindSelected,TResult Function( SubscriptionTermSelected value)?  termSelected,TResult Function( SubscriptionPurchase value)?  purchase,TResult Function( SubscriptionRestore value)?  restore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscriptionLoadPlans() when loadPlans != null:
return loadPlans(_that);case SubscriptionKindSelected() when kindSelected != null:
return kindSelected(_that);case SubscriptionTermSelected() when termSelected != null:
return termSelected(_that);case SubscriptionPurchase() when purchase != null:
return purchase(_that);case SubscriptionRestore() when restore != null:
return restore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscriptionLoadPlans value)  loadPlans,required TResult Function( SubscriptionKindSelected value)  kindSelected,required TResult Function( SubscriptionTermSelected value)  termSelected,required TResult Function( SubscriptionPurchase value)  purchase,required TResult Function( SubscriptionRestore value)  restore,}){
final _that = this;
switch (_that) {
case SubscriptionLoadPlans():
return loadPlans(_that);case SubscriptionKindSelected():
return kindSelected(_that);case SubscriptionTermSelected():
return termSelected(_that);case SubscriptionPurchase():
return purchase(_that);case SubscriptionRestore():
return restore(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscriptionLoadPlans value)?  loadPlans,TResult? Function( SubscriptionKindSelected value)?  kindSelected,TResult? Function( SubscriptionTermSelected value)?  termSelected,TResult? Function( SubscriptionPurchase value)?  purchase,TResult? Function( SubscriptionRestore value)?  restore,}){
final _that = this;
switch (_that) {
case SubscriptionLoadPlans() when loadPlans != null:
return loadPlans(_that);case SubscriptionKindSelected() when kindSelected != null:
return kindSelected(_that);case SubscriptionTermSelected() when termSelected != null:
return termSelected(_that);case SubscriptionPurchase() when purchase != null:
return purchase(_that);case SubscriptionRestore() when restore != null:
return restore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadPlans,TResult Function( PlanKind kind)?  kindSelected,TResult Function( PlanTerm term)?  termSelected,TResult Function()?  purchase,TResult Function()?  restore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscriptionLoadPlans() when loadPlans != null:
return loadPlans();case SubscriptionKindSelected() when kindSelected != null:
return kindSelected(_that.kind);case SubscriptionTermSelected() when termSelected != null:
return termSelected(_that.term);case SubscriptionPurchase() when purchase != null:
return purchase();case SubscriptionRestore() when restore != null:
return restore();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadPlans,required TResult Function( PlanKind kind)  kindSelected,required TResult Function( PlanTerm term)  termSelected,required TResult Function()  purchase,required TResult Function()  restore,}) {final _that = this;
switch (_that) {
case SubscriptionLoadPlans():
return loadPlans();case SubscriptionKindSelected():
return kindSelected(_that.kind);case SubscriptionTermSelected():
return termSelected(_that.term);case SubscriptionPurchase():
return purchase();case SubscriptionRestore():
return restore();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadPlans,TResult? Function( PlanKind kind)?  kindSelected,TResult? Function( PlanTerm term)?  termSelected,TResult? Function()?  purchase,TResult? Function()?  restore,}) {final _that = this;
switch (_that) {
case SubscriptionLoadPlans() when loadPlans != null:
return loadPlans();case SubscriptionKindSelected() when kindSelected != null:
return kindSelected(_that.kind);case SubscriptionTermSelected() when termSelected != null:
return termSelected(_that.term);case SubscriptionPurchase() when purchase != null:
return purchase();case SubscriptionRestore() when restore != null:
return restore();case _:
  return null;

}
}

}

/// @nodoc


class SubscriptionLoadPlans implements SubscriptionEvent {
  const SubscriptionLoadPlans();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionLoadPlans);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscriptionEvent.loadPlans()';
}


}




/// @nodoc


class SubscriptionKindSelected implements SubscriptionEvent {
  const SubscriptionKindSelected(this.kind);
  

 final  PlanKind kind;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionKindSelectedCopyWith<SubscriptionKindSelected> get copyWith => _$SubscriptionKindSelectedCopyWithImpl<SubscriptionKindSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionKindSelected&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'SubscriptionEvent.kindSelected(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $SubscriptionKindSelectedCopyWith<$Res> implements $SubscriptionEventCopyWith<$Res> {
  factory $SubscriptionKindSelectedCopyWith(SubscriptionKindSelected value, $Res Function(SubscriptionKindSelected) _then) = _$SubscriptionKindSelectedCopyWithImpl;
@useResult
$Res call({
 PlanKind kind
});




}
/// @nodoc
class _$SubscriptionKindSelectedCopyWithImpl<$Res>
    implements $SubscriptionKindSelectedCopyWith<$Res> {
  _$SubscriptionKindSelectedCopyWithImpl(this._self, this._then);

  final SubscriptionKindSelected _self;
  final $Res Function(SubscriptionKindSelected) _then;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = null,}) {
  return _then(SubscriptionKindSelected(
null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PlanKind,
  ));
}


}

/// @nodoc


class SubscriptionTermSelected implements SubscriptionEvent {
  const SubscriptionTermSelected(this.term);
  

 final  PlanTerm term;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionTermSelectedCopyWith<SubscriptionTermSelected> get copyWith => _$SubscriptionTermSelectedCopyWithImpl<SubscriptionTermSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionTermSelected&&(identical(other.term, term) || other.term == term));
}


@override
int get hashCode => Object.hash(runtimeType,term);

@override
String toString() {
  return 'SubscriptionEvent.termSelected(term: $term)';
}


}

/// @nodoc
abstract mixin class $SubscriptionTermSelectedCopyWith<$Res> implements $SubscriptionEventCopyWith<$Res> {
  factory $SubscriptionTermSelectedCopyWith(SubscriptionTermSelected value, $Res Function(SubscriptionTermSelected) _then) = _$SubscriptionTermSelectedCopyWithImpl;
@useResult
$Res call({
 PlanTerm term
});




}
/// @nodoc
class _$SubscriptionTermSelectedCopyWithImpl<$Res>
    implements $SubscriptionTermSelectedCopyWith<$Res> {
  _$SubscriptionTermSelectedCopyWithImpl(this._self, this._then);

  final SubscriptionTermSelected _self;
  final $Res Function(SubscriptionTermSelected) _then;

/// Create a copy of SubscriptionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? term = null,}) {
  return _then(SubscriptionTermSelected(
null == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as PlanTerm,
  ));
}


}

/// @nodoc


class SubscriptionPurchase implements SubscriptionEvent {
  const SubscriptionPurchase();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionPurchase);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscriptionEvent.purchase()';
}


}




/// @nodoc


class SubscriptionRestore implements SubscriptionEvent {
  const SubscriptionRestore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionRestore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscriptionEvent.restore()';
}


}




/// @nodoc
mixin _$SubscriptionScreenState {

 List<SubscriptionPlan> get plans; PlanKind get selectedKind; PlanTerm get selectedTerm; bool get isRestoring; bool get isPurchased; SubscriptionState? get current; String? get failureMessage;
/// Create a copy of SubscriptionScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionScreenStateCopyWith<SubscriptionScreenState> get copyWith => _$SubscriptionScreenStateCopyWithImpl<SubscriptionScreenState>(this as SubscriptionScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionScreenState&&const DeepCollectionEquality().equals(other.plans, plans)&&(identical(other.selectedKind, selectedKind) || other.selectedKind == selectedKind)&&(identical(other.selectedTerm, selectedTerm) || other.selectedTerm == selectedTerm)&&(identical(other.isRestoring, isRestoring) || other.isRestoring == isRestoring)&&(identical(other.isPurchased, isPurchased) || other.isPurchased == isPurchased)&&(identical(other.current, current) || other.current == current)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(plans),selectedKind,selectedTerm,isRestoring,isPurchased,current,failureMessage);

@override
String toString() {
  return 'SubscriptionScreenState(plans: $plans, selectedKind: $selectedKind, selectedTerm: $selectedTerm, isRestoring: $isRestoring, isPurchased: $isPurchased, current: $current, failureMessage: $failureMessage)';
}


}

/// @nodoc
abstract mixin class $SubscriptionScreenStateCopyWith<$Res>  {
  factory $SubscriptionScreenStateCopyWith(SubscriptionScreenState value, $Res Function(SubscriptionScreenState) _then) = _$SubscriptionScreenStateCopyWithImpl;
@useResult
$Res call({
 List<SubscriptionPlan> plans, PlanKind selectedKind, PlanTerm selectedTerm, bool isRestoring, bool isPurchased, SubscriptionState? current, String? failureMessage
});




}
/// @nodoc
class _$SubscriptionScreenStateCopyWithImpl<$Res>
    implements $SubscriptionScreenStateCopyWith<$Res> {
  _$SubscriptionScreenStateCopyWithImpl(this._self, this._then);

  final SubscriptionScreenState _self;
  final $Res Function(SubscriptionScreenState) _then;

/// Create a copy of SubscriptionScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plans = null,Object? selectedKind = null,Object? selectedTerm = null,Object? isRestoring = null,Object? isPurchased = null,Object? current = freezed,Object? failureMessage = freezed,}) {
  return _then(_self.copyWith(
plans: null == plans ? _self.plans : plans // ignore: cast_nullable_to_non_nullable
as List<SubscriptionPlan>,selectedKind: null == selectedKind ? _self.selectedKind : selectedKind // ignore: cast_nullable_to_non_nullable
as PlanKind,selectedTerm: null == selectedTerm ? _self.selectedTerm : selectedTerm // ignore: cast_nullable_to_non_nullable
as PlanTerm,isRestoring: null == isRestoring ? _self.isRestoring : isRestoring // ignore: cast_nullable_to_non_nullable
as bool,isPurchased: null == isPurchased ? _self.isPurchased : isPurchased // ignore: cast_nullable_to_non_nullable
as bool,current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as SubscriptionState?,failureMessage: freezed == failureMessage ? _self.failureMessage : failureMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionScreenState].
extension SubscriptionScreenStatePatterns on SubscriptionScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionScreenState value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SubscriptionPlan> plans,  PlanKind selectedKind,  PlanTerm selectedTerm,  bool isRestoring,  bool isPurchased,  SubscriptionState? current,  String? failureMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionScreenState() when $default != null:
return $default(_that.plans,_that.selectedKind,_that.selectedTerm,_that.isRestoring,_that.isPurchased,_that.current,_that.failureMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SubscriptionPlan> plans,  PlanKind selectedKind,  PlanTerm selectedTerm,  bool isRestoring,  bool isPurchased,  SubscriptionState? current,  String? failureMessage)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionScreenState():
return $default(_that.plans,_that.selectedKind,_that.selectedTerm,_that.isRestoring,_that.isPurchased,_that.current,_that.failureMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SubscriptionPlan> plans,  PlanKind selectedKind,  PlanTerm selectedTerm,  bool isRestoring,  bool isPurchased,  SubscriptionState? current,  String? failureMessage)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionScreenState() when $default != null:
return $default(_that.plans,_that.selectedKind,_that.selectedTerm,_that.isRestoring,_that.isPurchased,_that.current,_that.failureMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SubscriptionScreenState implements SubscriptionScreenState {
  const _SubscriptionScreenState({required final  List<SubscriptionPlan> plans, required this.selectedKind, required this.selectedTerm, required this.isRestoring, required this.isPurchased, this.current, this.failureMessage}): _plans = plans;
  

 final  List<SubscriptionPlan> _plans;
@override List<SubscriptionPlan> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

@override final  PlanKind selectedKind;
@override final  PlanTerm selectedTerm;
@override final  bool isRestoring;
@override final  bool isPurchased;
@override final  SubscriptionState? current;
@override final  String? failureMessage;

/// Create a copy of SubscriptionScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionScreenStateCopyWith<_SubscriptionScreenState> get copyWith => __$SubscriptionScreenStateCopyWithImpl<_SubscriptionScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionScreenState&&const DeepCollectionEquality().equals(other._plans, _plans)&&(identical(other.selectedKind, selectedKind) || other.selectedKind == selectedKind)&&(identical(other.selectedTerm, selectedTerm) || other.selectedTerm == selectedTerm)&&(identical(other.isRestoring, isRestoring) || other.isRestoring == isRestoring)&&(identical(other.isPurchased, isPurchased) || other.isPurchased == isPurchased)&&(identical(other.current, current) || other.current == current)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_plans),selectedKind,selectedTerm,isRestoring,isPurchased,current,failureMessage);

@override
String toString() {
  return 'SubscriptionScreenState(plans: $plans, selectedKind: $selectedKind, selectedTerm: $selectedTerm, isRestoring: $isRestoring, isPurchased: $isPurchased, current: $current, failureMessage: $failureMessage)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionScreenStateCopyWith<$Res> implements $SubscriptionScreenStateCopyWith<$Res> {
  factory _$SubscriptionScreenStateCopyWith(_SubscriptionScreenState value, $Res Function(_SubscriptionScreenState) _then) = __$SubscriptionScreenStateCopyWithImpl;
@override @useResult
$Res call({
 List<SubscriptionPlan> plans, PlanKind selectedKind, PlanTerm selectedTerm, bool isRestoring, bool isPurchased, SubscriptionState? current, String? failureMessage
});




}
/// @nodoc
class __$SubscriptionScreenStateCopyWithImpl<$Res>
    implements _$SubscriptionScreenStateCopyWith<$Res> {
  __$SubscriptionScreenStateCopyWithImpl(this._self, this._then);

  final _SubscriptionScreenState _self;
  final $Res Function(_SubscriptionScreenState) _then;

/// Create a copy of SubscriptionScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plans = null,Object? selectedKind = null,Object? selectedTerm = null,Object? isRestoring = null,Object? isPurchased = null,Object? current = freezed,Object? failureMessage = freezed,}) {
  return _then(_SubscriptionScreenState(
plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<SubscriptionPlan>,selectedKind: null == selectedKind ? _self.selectedKind : selectedKind // ignore: cast_nullable_to_non_nullable
as PlanKind,selectedTerm: null == selectedTerm ? _self.selectedTerm : selectedTerm // ignore: cast_nullable_to_non_nullable
as PlanTerm,isRestoring: null == isRestoring ? _self.isRestoring : isRestoring // ignore: cast_nullable_to_non_nullable
as bool,isPurchased: null == isPurchased ? _self.isPurchased : isPurchased // ignore: cast_nullable_to_non_nullable
as bool,current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as SubscriptionState?,failureMessage: freezed == failureMessage ? _self.failureMessage : failureMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
