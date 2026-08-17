// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnboardingAdvance value)?  advance,TResult Function( OnboardingGoBack value)?  goBack,TResult Function( OnboardingJumpTo value)?  jumpTo,TResult Function( OnboardingNameChanged value)?  nameChanged,TResult Function( OnboardingHouseholdChosen value)?  householdChosen,TResult Function( OnboardingPainToggled value)?  painToggled,TResult Function( OnboardingPayFrequencyChosen value)?  payFrequencyChosen,TResult Function( OnboardingBudgetModeChosen value)?  budgetModeChosen,TResult Function( OnboardingCadenceChosen value)?  cadenceChosen,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnboardingAdvance() when advance != null:
return advance(_that);case OnboardingGoBack() when goBack != null:
return goBack(_that);case OnboardingJumpTo() when jumpTo != null:
return jumpTo(_that);case OnboardingNameChanged() when nameChanged != null:
return nameChanged(_that);case OnboardingHouseholdChosen() when householdChosen != null:
return householdChosen(_that);case OnboardingPainToggled() when painToggled != null:
return painToggled(_that);case OnboardingPayFrequencyChosen() when payFrequencyChosen != null:
return payFrequencyChosen(_that);case OnboardingBudgetModeChosen() when budgetModeChosen != null:
return budgetModeChosen(_that);case OnboardingCadenceChosen() when cadenceChosen != null:
return cadenceChosen(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnboardingAdvance value)  advance,required TResult Function( OnboardingGoBack value)  goBack,required TResult Function( OnboardingJumpTo value)  jumpTo,required TResult Function( OnboardingNameChanged value)  nameChanged,required TResult Function( OnboardingHouseholdChosen value)  householdChosen,required TResult Function( OnboardingPainToggled value)  painToggled,required TResult Function( OnboardingPayFrequencyChosen value)  payFrequencyChosen,required TResult Function( OnboardingBudgetModeChosen value)  budgetModeChosen,required TResult Function( OnboardingCadenceChosen value)  cadenceChosen,}){
final _that = this;
switch (_that) {
case OnboardingAdvance():
return advance(_that);case OnboardingGoBack():
return goBack(_that);case OnboardingJumpTo():
return jumpTo(_that);case OnboardingNameChanged():
return nameChanged(_that);case OnboardingHouseholdChosen():
return householdChosen(_that);case OnboardingPainToggled():
return painToggled(_that);case OnboardingPayFrequencyChosen():
return payFrequencyChosen(_that);case OnboardingBudgetModeChosen():
return budgetModeChosen(_that);case OnboardingCadenceChosen():
return cadenceChosen(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnboardingAdvance value)?  advance,TResult? Function( OnboardingGoBack value)?  goBack,TResult? Function( OnboardingJumpTo value)?  jumpTo,TResult? Function( OnboardingNameChanged value)?  nameChanged,TResult? Function( OnboardingHouseholdChosen value)?  householdChosen,TResult? Function( OnboardingPainToggled value)?  painToggled,TResult? Function( OnboardingPayFrequencyChosen value)?  payFrequencyChosen,TResult? Function( OnboardingBudgetModeChosen value)?  budgetModeChosen,TResult? Function( OnboardingCadenceChosen value)?  cadenceChosen,}){
final _that = this;
switch (_that) {
case OnboardingAdvance() when advance != null:
return advance(_that);case OnboardingGoBack() when goBack != null:
return goBack(_that);case OnboardingJumpTo() when jumpTo != null:
return jumpTo(_that);case OnboardingNameChanged() when nameChanged != null:
return nameChanged(_that);case OnboardingHouseholdChosen() when householdChosen != null:
return householdChosen(_that);case OnboardingPainToggled() when painToggled != null:
return painToggled(_that);case OnboardingPayFrequencyChosen() when payFrequencyChosen != null:
return payFrequencyChosen(_that);case OnboardingBudgetModeChosen() when budgetModeChosen != null:
return budgetModeChosen(_that);case OnboardingCadenceChosen() when cadenceChosen != null:
return cadenceChosen(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  advance,TResult Function()?  goBack,TResult Function( OnboardingStep step)?  jumpTo,TResult Function( String value)?  nameChanged,TResult Function( HouseholdShape shape)?  householdChosen,TResult Function( String pain)?  painToggled,TResult Function( PayFrequency frequency)?  payFrequencyChosen,TResult Function( BudgetMode mode)?  budgetModeChosen,TResult Function( ReviewCadence cadence)?  cadenceChosen,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnboardingAdvance() when advance != null:
return advance();case OnboardingGoBack() when goBack != null:
return goBack();case OnboardingJumpTo() when jumpTo != null:
return jumpTo(_that.step);case OnboardingNameChanged() when nameChanged != null:
return nameChanged(_that.value);case OnboardingHouseholdChosen() when householdChosen != null:
return householdChosen(_that.shape);case OnboardingPainToggled() when painToggled != null:
return painToggled(_that.pain);case OnboardingPayFrequencyChosen() when payFrequencyChosen != null:
return payFrequencyChosen(_that.frequency);case OnboardingBudgetModeChosen() when budgetModeChosen != null:
return budgetModeChosen(_that.mode);case OnboardingCadenceChosen() when cadenceChosen != null:
return cadenceChosen(_that.cadence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  advance,required TResult Function()  goBack,required TResult Function( OnboardingStep step)  jumpTo,required TResult Function( String value)  nameChanged,required TResult Function( HouseholdShape shape)  householdChosen,required TResult Function( String pain)  painToggled,required TResult Function( PayFrequency frequency)  payFrequencyChosen,required TResult Function( BudgetMode mode)  budgetModeChosen,required TResult Function( ReviewCadence cadence)  cadenceChosen,}) {final _that = this;
switch (_that) {
case OnboardingAdvance():
return advance();case OnboardingGoBack():
return goBack();case OnboardingJumpTo():
return jumpTo(_that.step);case OnboardingNameChanged():
return nameChanged(_that.value);case OnboardingHouseholdChosen():
return householdChosen(_that.shape);case OnboardingPainToggled():
return painToggled(_that.pain);case OnboardingPayFrequencyChosen():
return payFrequencyChosen(_that.frequency);case OnboardingBudgetModeChosen():
return budgetModeChosen(_that.mode);case OnboardingCadenceChosen():
return cadenceChosen(_that.cadence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  advance,TResult? Function()?  goBack,TResult? Function( OnboardingStep step)?  jumpTo,TResult? Function( String value)?  nameChanged,TResult? Function( HouseholdShape shape)?  householdChosen,TResult? Function( String pain)?  painToggled,TResult? Function( PayFrequency frequency)?  payFrequencyChosen,TResult? Function( BudgetMode mode)?  budgetModeChosen,TResult? Function( ReviewCadence cadence)?  cadenceChosen,}) {final _that = this;
switch (_that) {
case OnboardingAdvance() when advance != null:
return advance();case OnboardingGoBack() when goBack != null:
return goBack();case OnboardingJumpTo() when jumpTo != null:
return jumpTo(_that.step);case OnboardingNameChanged() when nameChanged != null:
return nameChanged(_that.value);case OnboardingHouseholdChosen() when householdChosen != null:
return householdChosen(_that.shape);case OnboardingPainToggled() when painToggled != null:
return painToggled(_that.pain);case OnboardingPayFrequencyChosen() when payFrequencyChosen != null:
return payFrequencyChosen(_that.frequency);case OnboardingBudgetModeChosen() when budgetModeChosen != null:
return budgetModeChosen(_that.mode);case OnboardingCadenceChosen() when cadenceChosen != null:
return cadenceChosen(_that.cadence);case _:
  return null;

}
}

}

/// @nodoc


class OnboardingAdvance implements OnboardingEvent {
  const OnboardingAdvance();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingAdvance);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.advance()';
}


}




/// @nodoc


class OnboardingGoBack implements OnboardingEvent {
  const OnboardingGoBack();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingGoBack);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.goBack()';
}


}




/// @nodoc


class OnboardingJumpTo implements OnboardingEvent {
  const OnboardingJumpTo(this.step);
  

 final  OnboardingStep step;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingJumpToCopyWith<OnboardingJumpTo> get copyWith => _$OnboardingJumpToCopyWithImpl<OnboardingJumpTo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingJumpTo&&(identical(other.step, step) || other.step == step));
}


@override
int get hashCode => Object.hash(runtimeType,step);

@override
String toString() {
  return 'OnboardingEvent.jumpTo(step: $step)';
}


}

/// @nodoc
abstract mixin class $OnboardingJumpToCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingJumpToCopyWith(OnboardingJumpTo value, $Res Function(OnboardingJumpTo) _then) = _$OnboardingJumpToCopyWithImpl;
@useResult
$Res call({
 OnboardingStep step
});




}
/// @nodoc
class _$OnboardingJumpToCopyWithImpl<$Res>
    implements $OnboardingJumpToCopyWith<$Res> {
  _$OnboardingJumpToCopyWithImpl(this._self, this._then);

  final OnboardingJumpTo _self;
  final $Res Function(OnboardingJumpTo) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? step = null,}) {
  return _then(OnboardingJumpTo(
null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as OnboardingStep,
  ));
}


}

/// @nodoc


class OnboardingNameChanged implements OnboardingEvent {
  const OnboardingNameChanged(this.value);
  

 final  String value;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingNameChangedCopyWith<OnboardingNameChanged> get copyWith => _$OnboardingNameChangedCopyWithImpl<OnboardingNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingNameChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'OnboardingEvent.nameChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $OnboardingNameChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingNameChangedCopyWith(OnboardingNameChanged value, $Res Function(OnboardingNameChanged) _then) = _$OnboardingNameChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$OnboardingNameChangedCopyWithImpl<$Res>
    implements $OnboardingNameChangedCopyWith<$Res> {
  _$OnboardingNameChangedCopyWithImpl(this._self, this._then);

  final OnboardingNameChanged _self;
  final $Res Function(OnboardingNameChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(OnboardingNameChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnboardingHouseholdChosen implements OnboardingEvent {
  const OnboardingHouseholdChosen(this.shape);
  

 final  HouseholdShape shape;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingHouseholdChosenCopyWith<OnboardingHouseholdChosen> get copyWith => _$OnboardingHouseholdChosenCopyWithImpl<OnboardingHouseholdChosen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingHouseholdChosen&&(identical(other.shape, shape) || other.shape == shape));
}


@override
int get hashCode => Object.hash(runtimeType,shape);

@override
String toString() {
  return 'OnboardingEvent.householdChosen(shape: $shape)';
}


}

/// @nodoc
abstract mixin class $OnboardingHouseholdChosenCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingHouseholdChosenCopyWith(OnboardingHouseholdChosen value, $Res Function(OnboardingHouseholdChosen) _then) = _$OnboardingHouseholdChosenCopyWithImpl;
@useResult
$Res call({
 HouseholdShape shape
});




}
/// @nodoc
class _$OnboardingHouseholdChosenCopyWithImpl<$Res>
    implements $OnboardingHouseholdChosenCopyWith<$Res> {
  _$OnboardingHouseholdChosenCopyWithImpl(this._self, this._then);

  final OnboardingHouseholdChosen _self;
  final $Res Function(OnboardingHouseholdChosen) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? shape = null,}) {
  return _then(OnboardingHouseholdChosen(
null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as HouseholdShape,
  ));
}


}

/// @nodoc


class OnboardingPainToggled implements OnboardingEvent {
  const OnboardingPainToggled(this.pain);
  

 final  String pain;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingPainToggledCopyWith<OnboardingPainToggled> get copyWith => _$OnboardingPainToggledCopyWithImpl<OnboardingPainToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingPainToggled&&(identical(other.pain, pain) || other.pain == pain));
}


@override
int get hashCode => Object.hash(runtimeType,pain);

@override
String toString() {
  return 'OnboardingEvent.painToggled(pain: $pain)';
}


}

/// @nodoc
abstract mixin class $OnboardingPainToggledCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingPainToggledCopyWith(OnboardingPainToggled value, $Res Function(OnboardingPainToggled) _then) = _$OnboardingPainToggledCopyWithImpl;
@useResult
$Res call({
 String pain
});




}
/// @nodoc
class _$OnboardingPainToggledCopyWithImpl<$Res>
    implements $OnboardingPainToggledCopyWith<$Res> {
  _$OnboardingPainToggledCopyWithImpl(this._self, this._then);

  final OnboardingPainToggled _self;
  final $Res Function(OnboardingPainToggled) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pain = null,}) {
  return _then(OnboardingPainToggled(
null == pain ? _self.pain : pain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnboardingPayFrequencyChosen implements OnboardingEvent {
  const OnboardingPayFrequencyChosen(this.frequency);
  

 final  PayFrequency frequency;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingPayFrequencyChosenCopyWith<OnboardingPayFrequencyChosen> get copyWith => _$OnboardingPayFrequencyChosenCopyWithImpl<OnboardingPayFrequencyChosen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingPayFrequencyChosen&&(identical(other.frequency, frequency) || other.frequency == frequency));
}


@override
int get hashCode => Object.hash(runtimeType,frequency);

@override
String toString() {
  return 'OnboardingEvent.payFrequencyChosen(frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class $OnboardingPayFrequencyChosenCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingPayFrequencyChosenCopyWith(OnboardingPayFrequencyChosen value, $Res Function(OnboardingPayFrequencyChosen) _then) = _$OnboardingPayFrequencyChosenCopyWithImpl;
@useResult
$Res call({
 PayFrequency frequency
});




}
/// @nodoc
class _$OnboardingPayFrequencyChosenCopyWithImpl<$Res>
    implements $OnboardingPayFrequencyChosenCopyWith<$Res> {
  _$OnboardingPayFrequencyChosenCopyWithImpl(this._self, this._then);

  final OnboardingPayFrequencyChosen _self;
  final $Res Function(OnboardingPayFrequencyChosen) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? frequency = null,}) {
  return _then(OnboardingPayFrequencyChosen(
null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as PayFrequency,
  ));
}


}

/// @nodoc


class OnboardingBudgetModeChosen implements OnboardingEvent {
  const OnboardingBudgetModeChosen(this.mode);
  

 final  BudgetMode mode;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingBudgetModeChosenCopyWith<OnboardingBudgetModeChosen> get copyWith => _$OnboardingBudgetModeChosenCopyWithImpl<OnboardingBudgetModeChosen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingBudgetModeChosen&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString() {
  return 'OnboardingEvent.budgetModeChosen(mode: $mode)';
}


}

/// @nodoc
abstract mixin class $OnboardingBudgetModeChosenCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingBudgetModeChosenCopyWith(OnboardingBudgetModeChosen value, $Res Function(OnboardingBudgetModeChosen) _then) = _$OnboardingBudgetModeChosenCopyWithImpl;
@useResult
$Res call({
 BudgetMode mode
});




}
/// @nodoc
class _$OnboardingBudgetModeChosenCopyWithImpl<$Res>
    implements $OnboardingBudgetModeChosenCopyWith<$Res> {
  _$OnboardingBudgetModeChosenCopyWithImpl(this._self, this._then);

  final OnboardingBudgetModeChosen _self;
  final $Res Function(OnboardingBudgetModeChosen) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(OnboardingBudgetModeChosen(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as BudgetMode,
  ));
}


}

/// @nodoc


class OnboardingCadenceChosen implements OnboardingEvent {
  const OnboardingCadenceChosen(this.cadence);
  

 final  ReviewCadence cadence;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingCadenceChosenCopyWith<OnboardingCadenceChosen> get copyWith => _$OnboardingCadenceChosenCopyWithImpl<OnboardingCadenceChosen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingCadenceChosen&&(identical(other.cadence, cadence) || other.cadence == cadence));
}


@override
int get hashCode => Object.hash(runtimeType,cadence);

@override
String toString() {
  return 'OnboardingEvent.cadenceChosen(cadence: $cadence)';
}


}

/// @nodoc
abstract mixin class $OnboardingCadenceChosenCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingCadenceChosenCopyWith(OnboardingCadenceChosen value, $Res Function(OnboardingCadenceChosen) _then) = _$OnboardingCadenceChosenCopyWithImpl;
@useResult
$Res call({
 ReviewCadence cadence
});




}
/// @nodoc
class _$OnboardingCadenceChosenCopyWithImpl<$Res>
    implements $OnboardingCadenceChosenCopyWith<$Res> {
  _$OnboardingCadenceChosenCopyWithImpl(this._self, this._then);

  final OnboardingCadenceChosen _self;
  final $Res Function(OnboardingCadenceChosen) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cadence = null,}) {
  return _then(OnboardingCadenceChosen(
null == cadence ? _self.cadence : cadence // ignore: cast_nullable_to_non_nullable
as ReviewCadence,
  ));
}


}

/// @nodoc
mixin _$OnboardingState {

 OnboardingStep get step; String get firstName; Set<String> get pains; bool get isForward; HouseholdShape? get householdShape; PayFrequency? get payFrequency; BudgetMode? get budgetMode; ReviewCadence? get reviewCadence;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.step, step) || other.step == step)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&const DeepCollectionEquality().equals(other.pains, pains)&&(identical(other.isForward, isForward) || other.isForward == isForward)&&(identical(other.householdShape, householdShape) || other.householdShape == householdShape)&&(identical(other.payFrequency, payFrequency) || other.payFrequency == payFrequency)&&(identical(other.budgetMode, budgetMode) || other.budgetMode == budgetMode)&&(identical(other.reviewCadence, reviewCadence) || other.reviewCadence == reviewCadence));
}


@override
int get hashCode => Object.hash(runtimeType,step,firstName,const DeepCollectionEquality().hash(pains),isForward,householdShape,payFrequency,budgetMode,reviewCadence);

@override
String toString() {
  return 'OnboardingState(step: $step, firstName: $firstName, pains: $pains, isForward: $isForward, householdShape: $householdShape, payFrequency: $payFrequency, budgetMode: $budgetMode, reviewCadence: $reviewCadence)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 OnboardingStep step, String firstName, Set<String> pains, bool isForward, HouseholdShape? householdShape, PayFrequency? payFrequency, BudgetMode? budgetMode, ReviewCadence? reviewCadence
});




}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? firstName = null,Object? pains = null,Object? isForward = null,Object? householdShape = freezed,Object? payFrequency = freezed,Object? budgetMode = freezed,Object? reviewCadence = freezed,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as OnboardingStep,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,pains: null == pains ? _self.pains : pains // ignore: cast_nullable_to_non_nullable
as Set<String>,isForward: null == isForward ? _self.isForward : isForward // ignore: cast_nullable_to_non_nullable
as bool,householdShape: freezed == householdShape ? _self.householdShape : householdShape // ignore: cast_nullable_to_non_nullable
as HouseholdShape?,payFrequency: freezed == payFrequency ? _self.payFrequency : payFrequency // ignore: cast_nullable_to_non_nullable
as PayFrequency?,budgetMode: freezed == budgetMode ? _self.budgetMode : budgetMode // ignore: cast_nullable_to_non_nullable
as BudgetMode?,reviewCadence: freezed == reviewCadence ? _self.reviewCadence : reviewCadence // ignore: cast_nullable_to_non_nullable
as ReviewCadence?,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OnboardingStep step,  String firstName,  Set<String> pains,  bool isForward,  HouseholdShape? householdShape,  PayFrequency? payFrequency,  BudgetMode? budgetMode,  ReviewCadence? reviewCadence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.step,_that.firstName,_that.pains,_that.isForward,_that.householdShape,_that.payFrequency,_that.budgetMode,_that.reviewCadence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OnboardingStep step,  String firstName,  Set<String> pains,  bool isForward,  HouseholdShape? householdShape,  PayFrequency? payFrequency,  BudgetMode? budgetMode,  ReviewCadence? reviewCadence)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.step,_that.firstName,_that.pains,_that.isForward,_that.householdShape,_that.payFrequency,_that.budgetMode,_that.reviewCadence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OnboardingStep step,  String firstName,  Set<String> pains,  bool isForward,  HouseholdShape? householdShape,  PayFrequency? payFrequency,  BudgetMode? budgetMode,  ReviewCadence? reviewCadence)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.step,_that.firstName,_that.pains,_that.isForward,_that.householdShape,_that.payFrequency,_that.budgetMode,_that.reviewCadence);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({required this.step, required this.firstName, required final  Set<String> pains, required this.isForward, this.householdShape, this.payFrequency, this.budgetMode, this.reviewCadence}): _pains = pains;
  

@override final  OnboardingStep step;
@override final  String firstName;
 final  Set<String> _pains;
@override Set<String> get pains {
  if (_pains is EqualUnmodifiableSetView) return _pains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_pains);
}

@override final  bool isForward;
@override final  HouseholdShape? householdShape;
@override final  PayFrequency? payFrequency;
@override final  BudgetMode? budgetMode;
@override final  ReviewCadence? reviewCadence;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.step, step) || other.step == step)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&const DeepCollectionEquality().equals(other._pains, _pains)&&(identical(other.isForward, isForward) || other.isForward == isForward)&&(identical(other.householdShape, householdShape) || other.householdShape == householdShape)&&(identical(other.payFrequency, payFrequency) || other.payFrequency == payFrequency)&&(identical(other.budgetMode, budgetMode) || other.budgetMode == budgetMode)&&(identical(other.reviewCadence, reviewCadence) || other.reviewCadence == reviewCadence));
}


@override
int get hashCode => Object.hash(runtimeType,step,firstName,const DeepCollectionEquality().hash(_pains),isForward,householdShape,payFrequency,budgetMode,reviewCadence);

@override
String toString() {
  return 'OnboardingState(step: $step, firstName: $firstName, pains: $pains, isForward: $isForward, householdShape: $householdShape, payFrequency: $payFrequency, budgetMode: $budgetMode, reviewCadence: $reviewCadence)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 OnboardingStep step, String firstName, Set<String> pains, bool isForward, HouseholdShape? householdShape, PayFrequency? payFrequency, BudgetMode? budgetMode, ReviewCadence? reviewCadence
});




}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? firstName = null,Object? pains = null,Object? isForward = null,Object? householdShape = freezed,Object? payFrequency = freezed,Object? budgetMode = freezed,Object? reviewCadence = freezed,}) {
  return _then(_OnboardingState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as OnboardingStep,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,pains: null == pains ? _self._pains : pains // ignore: cast_nullable_to_non_nullable
as Set<String>,isForward: null == isForward ? _self.isForward : isForward // ignore: cast_nullable_to_non_nullable
as bool,householdShape: freezed == householdShape ? _self.householdShape : householdShape // ignore: cast_nullable_to_non_nullable
as HouseholdShape?,payFrequency: freezed == payFrequency ? _self.payFrequency : payFrequency // ignore: cast_nullable_to_non_nullable
as PayFrequency?,budgetMode: freezed == budgetMode ? _self.budgetMode : budgetMode // ignore: cast_nullable_to_non_nullable
as BudgetMode?,reviewCadence: freezed == reviewCadence ? _self.reviewCadence : reviewCadence // ignore: cast_nullable_to_non_nullable
as ReviewCadence?,
  ));
}


}

// dart format on
