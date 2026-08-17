// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_lens_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoanLensEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanLensEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoanLensEvent()';
}


}

/// @nodoc
class $LoanLensEventCopyWith<$Res>  {
$LoanLensEventCopyWith(LoanLensEvent _, $Res Function(LoanLensEvent) __);
}


/// Adds pattern-matching-related methods to [LoanLensEvent].
extension LoanLensEventPatterns on LoanLensEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoanLensLoad value)?  load,TResult Function( LoanLensObjectiveChanged value)?  objectiveChanged,TResult Function( LoanLensProductTypeChanged value)?  productTypeChanged,TResult Function( LoanLensGroupToggled value)?  groupToggled,TResult Function( LoanLensAmountChanged value)?  amountChanged,TResult Function( LoanLensFeatureToggled value)?  featureToggled,TResult Function( LoanLensRecalculated value)?  recalculated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoanLensLoad() when load != null:
return load(_that);case LoanLensObjectiveChanged() when objectiveChanged != null:
return objectiveChanged(_that);case LoanLensProductTypeChanged() when productTypeChanged != null:
return productTypeChanged(_that);case LoanLensGroupToggled() when groupToggled != null:
return groupToggled(_that);case LoanLensAmountChanged() when amountChanged != null:
return amountChanged(_that);case LoanLensFeatureToggled() when featureToggled != null:
return featureToggled(_that);case LoanLensRecalculated() when recalculated != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoanLensLoad value)  load,required TResult Function( LoanLensObjectiveChanged value)  objectiveChanged,required TResult Function( LoanLensProductTypeChanged value)  productTypeChanged,required TResult Function( LoanLensGroupToggled value)  groupToggled,required TResult Function( LoanLensAmountChanged value)  amountChanged,required TResult Function( LoanLensFeatureToggled value)  featureToggled,required TResult Function( LoanLensRecalculated value)  recalculated,}){
final _that = this;
switch (_that) {
case LoanLensLoad():
return load(_that);case LoanLensObjectiveChanged():
return objectiveChanged(_that);case LoanLensProductTypeChanged():
return productTypeChanged(_that);case LoanLensGroupToggled():
return groupToggled(_that);case LoanLensAmountChanged():
return amountChanged(_that);case LoanLensFeatureToggled():
return featureToggled(_that);case LoanLensRecalculated():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoanLensLoad value)?  load,TResult? Function( LoanLensObjectiveChanged value)?  objectiveChanged,TResult? Function( LoanLensProductTypeChanged value)?  productTypeChanged,TResult? Function( LoanLensGroupToggled value)?  groupToggled,TResult? Function( LoanLensAmountChanged value)?  amountChanged,TResult? Function( LoanLensFeatureToggled value)?  featureToggled,TResult? Function( LoanLensRecalculated value)?  recalculated,}){
final _that = this;
switch (_that) {
case LoanLensLoad() when load != null:
return load(_that);case LoanLensObjectiveChanged() when objectiveChanged != null:
return objectiveChanged(_that);case LoanLensProductTypeChanged() when productTypeChanged != null:
return productTypeChanged(_that);case LoanLensGroupToggled() when groupToggled != null:
return groupToggled(_that);case LoanLensAmountChanged() when amountChanged != null:
return amountChanged(_that);case LoanLensFeatureToggled() when featureToggled != null:
return featureToggled(_that);case LoanLensRecalculated() when recalculated != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( LoanRankingObjective objective)?  objectiveChanged,TResult Function( LoanProductType type)?  productTypeChanged,TResult Function( LenderGroup group)?  groupToggled,TResult Function( double amount)?  amountChanged,TResult Function( String feature)?  featureToggled,TResult Function()?  recalculated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoanLensLoad() when load != null:
return load();case LoanLensObjectiveChanged() when objectiveChanged != null:
return objectiveChanged(_that.objective);case LoanLensProductTypeChanged() when productTypeChanged != null:
return productTypeChanged(_that.type);case LoanLensGroupToggled() when groupToggled != null:
return groupToggled(_that.group);case LoanLensAmountChanged() when amountChanged != null:
return amountChanged(_that.amount);case LoanLensFeatureToggled() when featureToggled != null:
return featureToggled(_that.feature);case LoanLensRecalculated() when recalculated != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( LoanRankingObjective objective)  objectiveChanged,required TResult Function( LoanProductType type)  productTypeChanged,required TResult Function( LenderGroup group)  groupToggled,required TResult Function( double amount)  amountChanged,required TResult Function( String feature)  featureToggled,required TResult Function()  recalculated,}) {final _that = this;
switch (_that) {
case LoanLensLoad():
return load();case LoanLensObjectiveChanged():
return objectiveChanged(_that.objective);case LoanLensProductTypeChanged():
return productTypeChanged(_that.type);case LoanLensGroupToggled():
return groupToggled(_that.group);case LoanLensAmountChanged():
return amountChanged(_that.amount);case LoanLensFeatureToggled():
return featureToggled(_that.feature);case LoanLensRecalculated():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( LoanRankingObjective objective)?  objectiveChanged,TResult? Function( LoanProductType type)?  productTypeChanged,TResult? Function( LenderGroup group)?  groupToggled,TResult? Function( double amount)?  amountChanged,TResult? Function( String feature)?  featureToggled,TResult? Function()?  recalculated,}) {final _that = this;
switch (_that) {
case LoanLensLoad() when load != null:
return load();case LoanLensObjectiveChanged() when objectiveChanged != null:
return objectiveChanged(_that.objective);case LoanLensProductTypeChanged() when productTypeChanged != null:
return productTypeChanged(_that.type);case LoanLensGroupToggled() when groupToggled != null:
return groupToggled(_that.group);case LoanLensAmountChanged() when amountChanged != null:
return amountChanged(_that.amount);case LoanLensFeatureToggled() when featureToggled != null:
return featureToggled(_that.feature);case LoanLensRecalculated() when recalculated != null:
return recalculated();case _:
  return null;

}
}

}

/// @nodoc


class LoanLensLoad implements LoanLensEvent {
  const LoanLensLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanLensLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoanLensEvent.load()';
}


}




/// @nodoc


class LoanLensObjectiveChanged implements LoanLensEvent {
  const LoanLensObjectiveChanged(this.objective);
  

 final  LoanRankingObjective objective;

/// Create a copy of LoanLensEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanLensObjectiveChangedCopyWith<LoanLensObjectiveChanged> get copyWith => _$LoanLensObjectiveChangedCopyWithImpl<LoanLensObjectiveChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanLensObjectiveChanged&&(identical(other.objective, objective) || other.objective == objective));
}


@override
int get hashCode => Object.hash(runtimeType,objective);

@override
String toString() {
  return 'LoanLensEvent.objectiveChanged(objective: $objective)';
}


}

/// @nodoc
abstract mixin class $LoanLensObjectiveChangedCopyWith<$Res> implements $LoanLensEventCopyWith<$Res> {
  factory $LoanLensObjectiveChangedCopyWith(LoanLensObjectiveChanged value, $Res Function(LoanLensObjectiveChanged) _then) = _$LoanLensObjectiveChangedCopyWithImpl;
@useResult
$Res call({
 LoanRankingObjective objective
});




}
/// @nodoc
class _$LoanLensObjectiveChangedCopyWithImpl<$Res>
    implements $LoanLensObjectiveChangedCopyWith<$Res> {
  _$LoanLensObjectiveChangedCopyWithImpl(this._self, this._then);

  final LoanLensObjectiveChanged _self;
  final $Res Function(LoanLensObjectiveChanged) _then;

/// Create a copy of LoanLensEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? objective = null,}) {
  return _then(LoanLensObjectiveChanged(
null == objective ? _self.objective : objective // ignore: cast_nullable_to_non_nullable
as LoanRankingObjective,
  ));
}


}

/// @nodoc


class LoanLensProductTypeChanged implements LoanLensEvent {
  const LoanLensProductTypeChanged(this.type);
  

 final  LoanProductType type;

/// Create a copy of LoanLensEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanLensProductTypeChangedCopyWith<LoanLensProductTypeChanged> get copyWith => _$LoanLensProductTypeChangedCopyWithImpl<LoanLensProductTypeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanLensProductTypeChanged&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'LoanLensEvent.productTypeChanged(type: $type)';
}


}

/// @nodoc
abstract mixin class $LoanLensProductTypeChangedCopyWith<$Res> implements $LoanLensEventCopyWith<$Res> {
  factory $LoanLensProductTypeChangedCopyWith(LoanLensProductTypeChanged value, $Res Function(LoanLensProductTypeChanged) _then) = _$LoanLensProductTypeChangedCopyWithImpl;
@useResult
$Res call({
 LoanProductType type
});




}
/// @nodoc
class _$LoanLensProductTypeChangedCopyWithImpl<$Res>
    implements $LoanLensProductTypeChangedCopyWith<$Res> {
  _$LoanLensProductTypeChangedCopyWithImpl(this._self, this._then);

  final LoanLensProductTypeChanged _self;
  final $Res Function(LoanLensProductTypeChanged) _then;

/// Create a copy of LoanLensEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(LoanLensProductTypeChanged(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LoanProductType,
  ));
}


}

/// @nodoc


class LoanLensGroupToggled implements LoanLensEvent {
  const LoanLensGroupToggled(this.group);
  

 final  LenderGroup group;

/// Create a copy of LoanLensEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanLensGroupToggledCopyWith<LoanLensGroupToggled> get copyWith => _$LoanLensGroupToggledCopyWithImpl<LoanLensGroupToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanLensGroupToggled&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,group);

@override
String toString() {
  return 'LoanLensEvent.groupToggled(group: $group)';
}


}

/// @nodoc
abstract mixin class $LoanLensGroupToggledCopyWith<$Res> implements $LoanLensEventCopyWith<$Res> {
  factory $LoanLensGroupToggledCopyWith(LoanLensGroupToggled value, $Res Function(LoanLensGroupToggled) _then) = _$LoanLensGroupToggledCopyWithImpl;
@useResult
$Res call({
 LenderGroup group
});




}
/// @nodoc
class _$LoanLensGroupToggledCopyWithImpl<$Res>
    implements $LoanLensGroupToggledCopyWith<$Res> {
  _$LoanLensGroupToggledCopyWithImpl(this._self, this._then);

  final LoanLensGroupToggled _self;
  final $Res Function(LoanLensGroupToggled) _then;

/// Create a copy of LoanLensEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? group = null,}) {
  return _then(LoanLensGroupToggled(
null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as LenderGroup,
  ));
}


}

/// @nodoc


class LoanLensAmountChanged implements LoanLensEvent {
  const LoanLensAmountChanged(this.amount);
  

 final  double amount;

/// Create a copy of LoanLensEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanLensAmountChangedCopyWith<LoanLensAmountChanged> get copyWith => _$LoanLensAmountChangedCopyWithImpl<LoanLensAmountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanLensAmountChanged&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'LoanLensEvent.amountChanged(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $LoanLensAmountChangedCopyWith<$Res> implements $LoanLensEventCopyWith<$Res> {
  factory $LoanLensAmountChangedCopyWith(LoanLensAmountChanged value, $Res Function(LoanLensAmountChanged) _then) = _$LoanLensAmountChangedCopyWithImpl;
@useResult
$Res call({
 double amount
});




}
/// @nodoc
class _$LoanLensAmountChangedCopyWithImpl<$Res>
    implements $LoanLensAmountChangedCopyWith<$Res> {
  _$LoanLensAmountChangedCopyWithImpl(this._self, this._then);

  final LoanLensAmountChanged _self;
  final $Res Function(LoanLensAmountChanged) _then;

/// Create a copy of LoanLensEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(LoanLensAmountChanged(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class LoanLensFeatureToggled implements LoanLensEvent {
  const LoanLensFeatureToggled(this.feature);
  

 final  String feature;

/// Create a copy of LoanLensEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanLensFeatureToggledCopyWith<LoanLensFeatureToggled> get copyWith => _$LoanLensFeatureToggledCopyWithImpl<LoanLensFeatureToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanLensFeatureToggled&&(identical(other.feature, feature) || other.feature == feature));
}


@override
int get hashCode => Object.hash(runtimeType,feature);

@override
String toString() {
  return 'LoanLensEvent.featureToggled(feature: $feature)';
}


}

/// @nodoc
abstract mixin class $LoanLensFeatureToggledCopyWith<$Res> implements $LoanLensEventCopyWith<$Res> {
  factory $LoanLensFeatureToggledCopyWith(LoanLensFeatureToggled value, $Res Function(LoanLensFeatureToggled) _then) = _$LoanLensFeatureToggledCopyWithImpl;
@useResult
$Res call({
 String feature
});




}
/// @nodoc
class _$LoanLensFeatureToggledCopyWithImpl<$Res>
    implements $LoanLensFeatureToggledCopyWith<$Res> {
  _$LoanLensFeatureToggledCopyWithImpl(this._self, this._then);

  final LoanLensFeatureToggled _self;
  final $Res Function(LoanLensFeatureToggled) _then;

/// Create a copy of LoanLensEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? feature = null,}) {
  return _then(LoanLensFeatureToggled(
null == feature ? _self.feature : feature // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoanLensRecalculated implements LoanLensEvent {
  const LoanLensRecalculated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanLensRecalculated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoanLensEvent.recalculated()';
}


}




/// @nodoc
mixin _$LoanLensState {

 List<Lender> get lenders; LoanLensFilters get filters; bool get isCalculating; bool get isReady; LoanLensResult? get result;
/// Create a copy of LoanLensState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoanLensStateCopyWith<LoanLensState> get copyWith => _$LoanLensStateCopyWithImpl<LoanLensState>(this as LoanLensState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoanLensState&&const DeepCollectionEquality().equals(other.lenders, lenders)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.isCalculating, isCalculating) || other.isCalculating == isCalculating)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(lenders),filters,isCalculating,isReady,result);

@override
String toString() {
  return 'LoanLensState(lenders: $lenders, filters: $filters, isCalculating: $isCalculating, isReady: $isReady, result: $result)';
}


}

/// @nodoc
abstract mixin class $LoanLensStateCopyWith<$Res>  {
  factory $LoanLensStateCopyWith(LoanLensState value, $Res Function(LoanLensState) _then) = _$LoanLensStateCopyWithImpl;
@useResult
$Res call({
 List<Lender> lenders, LoanLensFilters filters, bool isCalculating, bool isReady, LoanLensResult? result
});




}
/// @nodoc
class _$LoanLensStateCopyWithImpl<$Res>
    implements $LoanLensStateCopyWith<$Res> {
  _$LoanLensStateCopyWithImpl(this._self, this._then);

  final LoanLensState _self;
  final $Res Function(LoanLensState) _then;

/// Create a copy of LoanLensState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lenders = null,Object? filters = null,Object? isCalculating = null,Object? isReady = null,Object? result = freezed,}) {
  return _then(_self.copyWith(
lenders: null == lenders ? _self.lenders : lenders // ignore: cast_nullable_to_non_nullable
as List<Lender>,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as LoanLensFilters,isCalculating: null == isCalculating ? _self.isCalculating : isCalculating // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as LoanLensResult?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoanLensState].
extension LoanLensStatePatterns on LoanLensState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoanLensState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoanLensState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoanLensState value)  $default,){
final _that = this;
switch (_that) {
case _LoanLensState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoanLensState value)?  $default,){
final _that = this;
switch (_that) {
case _LoanLensState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Lender> lenders,  LoanLensFilters filters,  bool isCalculating,  bool isReady,  LoanLensResult? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoanLensState() when $default != null:
return $default(_that.lenders,_that.filters,_that.isCalculating,_that.isReady,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Lender> lenders,  LoanLensFilters filters,  bool isCalculating,  bool isReady,  LoanLensResult? result)  $default,) {final _that = this;
switch (_that) {
case _LoanLensState():
return $default(_that.lenders,_that.filters,_that.isCalculating,_that.isReady,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Lender> lenders,  LoanLensFilters filters,  bool isCalculating,  bool isReady,  LoanLensResult? result)?  $default,) {final _that = this;
switch (_that) {
case _LoanLensState() when $default != null:
return $default(_that.lenders,_that.filters,_that.isCalculating,_that.isReady,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _LoanLensState implements LoanLensState {
  const _LoanLensState({required final  List<Lender> lenders, required this.filters, required this.isCalculating, required this.isReady, this.result}): _lenders = lenders;
  

 final  List<Lender> _lenders;
@override List<Lender> get lenders {
  if (_lenders is EqualUnmodifiableListView) return _lenders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lenders);
}

@override final  LoanLensFilters filters;
@override final  bool isCalculating;
@override final  bool isReady;
@override final  LoanLensResult? result;

/// Create a copy of LoanLensState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoanLensStateCopyWith<_LoanLensState> get copyWith => __$LoanLensStateCopyWithImpl<_LoanLensState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoanLensState&&const DeepCollectionEquality().equals(other._lenders, _lenders)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.isCalculating, isCalculating) || other.isCalculating == isCalculating)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lenders),filters,isCalculating,isReady,result);

@override
String toString() {
  return 'LoanLensState(lenders: $lenders, filters: $filters, isCalculating: $isCalculating, isReady: $isReady, result: $result)';
}


}

/// @nodoc
abstract mixin class _$LoanLensStateCopyWith<$Res> implements $LoanLensStateCopyWith<$Res> {
  factory _$LoanLensStateCopyWith(_LoanLensState value, $Res Function(_LoanLensState) _then) = __$LoanLensStateCopyWithImpl;
@override @useResult
$Res call({
 List<Lender> lenders, LoanLensFilters filters, bool isCalculating, bool isReady, LoanLensResult? result
});




}
/// @nodoc
class __$LoanLensStateCopyWithImpl<$Res>
    implements _$LoanLensStateCopyWith<$Res> {
  __$LoanLensStateCopyWithImpl(this._self, this._then);

  final _LoanLensState _self;
  final $Res Function(_LoanLensState) _then;

/// Create a copy of LoanLensState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lenders = null,Object? filters = null,Object? isCalculating = null,Object? isReady = null,Object? result = freezed,}) {
  return _then(_LoanLensState(
lenders: null == lenders ? _self._lenders : lenders // ignore: cast_nullable_to_non_nullable
as List<Lender>,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as LoanLensFilters,isCalculating: null == isCalculating ? _self.isCalculating : isCalculating // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as LoanLensResult?,
  ));
}


}

// dart format on
