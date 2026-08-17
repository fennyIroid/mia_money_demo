// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'money_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoneyEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoneyEvent()';
}


}

/// @nodoc
class $MoneyEventCopyWith<$Res>  {
$MoneyEventCopyWith(MoneyEvent _, $Res Function(MoneyEvent) __);
}


/// Adds pattern-matching-related methods to [MoneyEvent].
extension MoneyEventPatterns on MoneyEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MoneyLoad value)?  load,TResult Function( MoneyPeriodChanged value)?  periodChanged,TResult Function( MoneyBudgetModeChanged value)?  budgetModeChanged,TResult Function( MoneySmallerSpendingToggled value)?  smallerSpendingToggled,TResult Function( MoneyScenarioRun value)?  scenarioRun,TResult Function( MoneyShowArchivedToggled value)?  showArchivedToggled,TResult Function( MoneyGoalDraftStarted value)?  goalDraftStarted,TResult Function( MoneyGoalDraftChanged value)?  goalDraftChanged,TResult Function( MoneyGoalDraftSubmitted value)?  goalDraftSubmitted,TResult Function( MoneyGoalMovementRecorded value)?  goalMovementRecorded,TResult Function( MoneyExportRequested value)?  exportRequested,TResult Function( MoneyAccountArchived value)?  accountArchived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MoneyLoad() when load != null:
return load(_that);case MoneyPeriodChanged() when periodChanged != null:
return periodChanged(_that);case MoneyBudgetModeChanged() when budgetModeChanged != null:
return budgetModeChanged(_that);case MoneySmallerSpendingToggled() when smallerSpendingToggled != null:
return smallerSpendingToggled(_that);case MoneyScenarioRun() when scenarioRun != null:
return scenarioRun(_that);case MoneyShowArchivedToggled() when showArchivedToggled != null:
return showArchivedToggled(_that);case MoneyGoalDraftStarted() when goalDraftStarted != null:
return goalDraftStarted(_that);case MoneyGoalDraftChanged() when goalDraftChanged != null:
return goalDraftChanged(_that);case MoneyGoalDraftSubmitted() when goalDraftSubmitted != null:
return goalDraftSubmitted(_that);case MoneyGoalMovementRecorded() when goalMovementRecorded != null:
return goalMovementRecorded(_that);case MoneyExportRequested() when exportRequested != null:
return exportRequested(_that);case MoneyAccountArchived() when accountArchived != null:
return accountArchived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MoneyLoad value)  load,required TResult Function( MoneyPeriodChanged value)  periodChanged,required TResult Function( MoneyBudgetModeChanged value)  budgetModeChanged,required TResult Function( MoneySmallerSpendingToggled value)  smallerSpendingToggled,required TResult Function( MoneyScenarioRun value)  scenarioRun,required TResult Function( MoneyShowArchivedToggled value)  showArchivedToggled,required TResult Function( MoneyGoalDraftStarted value)  goalDraftStarted,required TResult Function( MoneyGoalDraftChanged value)  goalDraftChanged,required TResult Function( MoneyGoalDraftSubmitted value)  goalDraftSubmitted,required TResult Function( MoneyGoalMovementRecorded value)  goalMovementRecorded,required TResult Function( MoneyExportRequested value)  exportRequested,required TResult Function( MoneyAccountArchived value)  accountArchived,}){
final _that = this;
switch (_that) {
case MoneyLoad():
return load(_that);case MoneyPeriodChanged():
return periodChanged(_that);case MoneyBudgetModeChanged():
return budgetModeChanged(_that);case MoneySmallerSpendingToggled():
return smallerSpendingToggled(_that);case MoneyScenarioRun():
return scenarioRun(_that);case MoneyShowArchivedToggled():
return showArchivedToggled(_that);case MoneyGoalDraftStarted():
return goalDraftStarted(_that);case MoneyGoalDraftChanged():
return goalDraftChanged(_that);case MoneyGoalDraftSubmitted():
return goalDraftSubmitted(_that);case MoneyGoalMovementRecorded():
return goalMovementRecorded(_that);case MoneyExportRequested():
return exportRequested(_that);case MoneyAccountArchived():
return accountArchived(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MoneyLoad value)?  load,TResult? Function( MoneyPeriodChanged value)?  periodChanged,TResult? Function( MoneyBudgetModeChanged value)?  budgetModeChanged,TResult? Function( MoneySmallerSpendingToggled value)?  smallerSpendingToggled,TResult? Function( MoneyScenarioRun value)?  scenarioRun,TResult? Function( MoneyShowArchivedToggled value)?  showArchivedToggled,TResult? Function( MoneyGoalDraftStarted value)?  goalDraftStarted,TResult? Function( MoneyGoalDraftChanged value)?  goalDraftChanged,TResult? Function( MoneyGoalDraftSubmitted value)?  goalDraftSubmitted,TResult? Function( MoneyGoalMovementRecorded value)?  goalMovementRecorded,TResult? Function( MoneyExportRequested value)?  exportRequested,TResult? Function( MoneyAccountArchived value)?  accountArchived,}){
final _that = this;
switch (_that) {
case MoneyLoad() when load != null:
return load(_that);case MoneyPeriodChanged() when periodChanged != null:
return periodChanged(_that);case MoneyBudgetModeChanged() when budgetModeChanged != null:
return budgetModeChanged(_that);case MoneySmallerSpendingToggled() when smallerSpendingToggled != null:
return smallerSpendingToggled(_that);case MoneyScenarioRun() when scenarioRun != null:
return scenarioRun(_that);case MoneyShowArchivedToggled() when showArchivedToggled != null:
return showArchivedToggled(_that);case MoneyGoalDraftStarted() when goalDraftStarted != null:
return goalDraftStarted(_that);case MoneyGoalDraftChanged() when goalDraftChanged != null:
return goalDraftChanged(_that);case MoneyGoalDraftSubmitted() when goalDraftSubmitted != null:
return goalDraftSubmitted(_that);case MoneyGoalMovementRecorded() when goalMovementRecorded != null:
return goalMovementRecorded(_that);case MoneyExportRequested() when exportRequested != null:
return exportRequested(_that);case MoneyAccountArchived() when accountArchived != null:
return accountArchived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( ReportPeriod period)?  periodChanged,TResult Function( BudgetMode mode)?  budgetModeChanged,TResult Function()?  smallerSpendingToggled,TResult Function( Goal goal,  double expense)?  scenarioRun,TResult Function()?  showArchivedToggled,TResult Function()?  goalDraftStarted,TResult Function( String? name,  GoalKind? kind,  double? target,  double? current,  int? months,  bool? sharedWithHousehold)?  goalDraftChanged,TResult Function()?  goalDraftSubmitted,TResult Function( String goalId,  double amount,  String label)?  goalMovementRecorded,TResult Function( String label,  String format)?  exportRequested,TResult Function( String accountId)?  accountArchived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MoneyLoad() when load != null:
return load();case MoneyPeriodChanged() when periodChanged != null:
return periodChanged(_that.period);case MoneyBudgetModeChanged() when budgetModeChanged != null:
return budgetModeChanged(_that.mode);case MoneySmallerSpendingToggled() when smallerSpendingToggled != null:
return smallerSpendingToggled();case MoneyScenarioRun() when scenarioRun != null:
return scenarioRun(_that.goal,_that.expense);case MoneyShowArchivedToggled() when showArchivedToggled != null:
return showArchivedToggled();case MoneyGoalDraftStarted() when goalDraftStarted != null:
return goalDraftStarted();case MoneyGoalDraftChanged() when goalDraftChanged != null:
return goalDraftChanged(_that.name,_that.kind,_that.target,_that.current,_that.months,_that.sharedWithHousehold);case MoneyGoalDraftSubmitted() when goalDraftSubmitted != null:
return goalDraftSubmitted();case MoneyGoalMovementRecorded() when goalMovementRecorded != null:
return goalMovementRecorded(_that.goalId,_that.amount,_that.label);case MoneyExportRequested() when exportRequested != null:
return exportRequested(_that.label,_that.format);case MoneyAccountArchived() when accountArchived != null:
return accountArchived(_that.accountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( ReportPeriod period)  periodChanged,required TResult Function( BudgetMode mode)  budgetModeChanged,required TResult Function()  smallerSpendingToggled,required TResult Function( Goal goal,  double expense)  scenarioRun,required TResult Function()  showArchivedToggled,required TResult Function()  goalDraftStarted,required TResult Function( String? name,  GoalKind? kind,  double? target,  double? current,  int? months,  bool? sharedWithHousehold)  goalDraftChanged,required TResult Function()  goalDraftSubmitted,required TResult Function( String goalId,  double amount,  String label)  goalMovementRecorded,required TResult Function( String label,  String format)  exportRequested,required TResult Function( String accountId)  accountArchived,}) {final _that = this;
switch (_that) {
case MoneyLoad():
return load();case MoneyPeriodChanged():
return periodChanged(_that.period);case MoneyBudgetModeChanged():
return budgetModeChanged(_that.mode);case MoneySmallerSpendingToggled():
return smallerSpendingToggled();case MoneyScenarioRun():
return scenarioRun(_that.goal,_that.expense);case MoneyShowArchivedToggled():
return showArchivedToggled();case MoneyGoalDraftStarted():
return goalDraftStarted();case MoneyGoalDraftChanged():
return goalDraftChanged(_that.name,_that.kind,_that.target,_that.current,_that.months,_that.sharedWithHousehold);case MoneyGoalDraftSubmitted():
return goalDraftSubmitted();case MoneyGoalMovementRecorded():
return goalMovementRecorded(_that.goalId,_that.amount,_that.label);case MoneyExportRequested():
return exportRequested(_that.label,_that.format);case MoneyAccountArchived():
return accountArchived(_that.accountId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( ReportPeriod period)?  periodChanged,TResult? Function( BudgetMode mode)?  budgetModeChanged,TResult? Function()?  smallerSpendingToggled,TResult? Function( Goal goal,  double expense)?  scenarioRun,TResult? Function()?  showArchivedToggled,TResult? Function()?  goalDraftStarted,TResult? Function( String? name,  GoalKind? kind,  double? target,  double? current,  int? months,  bool? sharedWithHousehold)?  goalDraftChanged,TResult? Function()?  goalDraftSubmitted,TResult? Function( String goalId,  double amount,  String label)?  goalMovementRecorded,TResult? Function( String label,  String format)?  exportRequested,TResult? Function( String accountId)?  accountArchived,}) {final _that = this;
switch (_that) {
case MoneyLoad() when load != null:
return load();case MoneyPeriodChanged() when periodChanged != null:
return periodChanged(_that.period);case MoneyBudgetModeChanged() when budgetModeChanged != null:
return budgetModeChanged(_that.mode);case MoneySmallerSpendingToggled() when smallerSpendingToggled != null:
return smallerSpendingToggled();case MoneyScenarioRun() when scenarioRun != null:
return scenarioRun(_that.goal,_that.expense);case MoneyShowArchivedToggled() when showArchivedToggled != null:
return showArchivedToggled();case MoneyGoalDraftStarted() when goalDraftStarted != null:
return goalDraftStarted();case MoneyGoalDraftChanged() when goalDraftChanged != null:
return goalDraftChanged(_that.name,_that.kind,_that.target,_that.current,_that.months,_that.sharedWithHousehold);case MoneyGoalDraftSubmitted() when goalDraftSubmitted != null:
return goalDraftSubmitted();case MoneyGoalMovementRecorded() when goalMovementRecorded != null:
return goalMovementRecorded(_that.goalId,_that.amount,_that.label);case MoneyExportRequested() when exportRequested != null:
return exportRequested(_that.label,_that.format);case MoneyAccountArchived() when accountArchived != null:
return accountArchived(_that.accountId);case _:
  return null;

}
}

}

/// @nodoc


class MoneyLoad implements MoneyEvent {
  const MoneyLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoneyEvent.load()';
}


}




/// @nodoc


class MoneyPeriodChanged implements MoneyEvent {
  const MoneyPeriodChanged(this.period);
  

 final  ReportPeriod period;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyPeriodChangedCopyWith<MoneyPeriodChanged> get copyWith => _$MoneyPeriodChangedCopyWithImpl<MoneyPeriodChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyPeriodChanged&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,period);

@override
String toString() {
  return 'MoneyEvent.periodChanged(period: $period)';
}


}

/// @nodoc
abstract mixin class $MoneyPeriodChangedCopyWith<$Res> implements $MoneyEventCopyWith<$Res> {
  factory $MoneyPeriodChangedCopyWith(MoneyPeriodChanged value, $Res Function(MoneyPeriodChanged) _then) = _$MoneyPeriodChangedCopyWithImpl;
@useResult
$Res call({
 ReportPeriod period
});




}
/// @nodoc
class _$MoneyPeriodChangedCopyWithImpl<$Res>
    implements $MoneyPeriodChangedCopyWith<$Res> {
  _$MoneyPeriodChangedCopyWithImpl(this._self, this._then);

  final MoneyPeriodChanged _self;
  final $Res Function(MoneyPeriodChanged) _then;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? period = null,}) {
  return _then(MoneyPeriodChanged(
null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as ReportPeriod,
  ));
}


}

/// @nodoc


class MoneyBudgetModeChanged implements MoneyEvent {
  const MoneyBudgetModeChanged(this.mode);
  

 final  BudgetMode mode;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyBudgetModeChangedCopyWith<MoneyBudgetModeChanged> get copyWith => _$MoneyBudgetModeChangedCopyWithImpl<MoneyBudgetModeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyBudgetModeChanged&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString() {
  return 'MoneyEvent.budgetModeChanged(mode: $mode)';
}


}

/// @nodoc
abstract mixin class $MoneyBudgetModeChangedCopyWith<$Res> implements $MoneyEventCopyWith<$Res> {
  factory $MoneyBudgetModeChangedCopyWith(MoneyBudgetModeChanged value, $Res Function(MoneyBudgetModeChanged) _then) = _$MoneyBudgetModeChangedCopyWithImpl;
@useResult
$Res call({
 BudgetMode mode
});




}
/// @nodoc
class _$MoneyBudgetModeChangedCopyWithImpl<$Res>
    implements $MoneyBudgetModeChangedCopyWith<$Res> {
  _$MoneyBudgetModeChangedCopyWithImpl(this._self, this._then);

  final MoneyBudgetModeChanged _self;
  final $Res Function(MoneyBudgetModeChanged) _then;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(MoneyBudgetModeChanged(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as BudgetMode,
  ));
}


}

/// @nodoc


class MoneySmallerSpendingToggled implements MoneyEvent {
  const MoneySmallerSpendingToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneySmallerSpendingToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoneyEvent.smallerSpendingToggled()';
}


}




/// @nodoc


class MoneyScenarioRun implements MoneyEvent {
  const MoneyScenarioRun({required this.goal, required this.expense});
  

 final  Goal goal;
 final  double expense;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyScenarioRunCopyWith<MoneyScenarioRun> get copyWith => _$MoneyScenarioRunCopyWithImpl<MoneyScenarioRun>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyScenarioRun&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.expense, expense) || other.expense == expense));
}


@override
int get hashCode => Object.hash(runtimeType,goal,expense);

@override
String toString() {
  return 'MoneyEvent.scenarioRun(goal: $goal, expense: $expense)';
}


}

/// @nodoc
abstract mixin class $MoneyScenarioRunCopyWith<$Res> implements $MoneyEventCopyWith<$Res> {
  factory $MoneyScenarioRunCopyWith(MoneyScenarioRun value, $Res Function(MoneyScenarioRun) _then) = _$MoneyScenarioRunCopyWithImpl;
@useResult
$Res call({
 Goal goal, double expense
});




}
/// @nodoc
class _$MoneyScenarioRunCopyWithImpl<$Res>
    implements $MoneyScenarioRunCopyWith<$Res> {
  _$MoneyScenarioRunCopyWithImpl(this._self, this._then);

  final MoneyScenarioRun _self;
  final $Res Function(MoneyScenarioRun) _then;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goal = null,Object? expense = null,}) {
  return _then(MoneyScenarioRun(
goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Goal,expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class MoneyShowArchivedToggled implements MoneyEvent {
  const MoneyShowArchivedToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyShowArchivedToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoneyEvent.showArchivedToggled()';
}


}




/// @nodoc


class MoneyGoalDraftStarted implements MoneyEvent {
  const MoneyGoalDraftStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyGoalDraftStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoneyEvent.goalDraftStarted()';
}


}




/// @nodoc


class MoneyGoalDraftChanged implements MoneyEvent {
  const MoneyGoalDraftChanged({this.name, this.kind, this.target, this.current, this.months, this.sharedWithHousehold});
  

 final  String? name;
 final  GoalKind? kind;
 final  double? target;
 final  double? current;
 final  int? months;
 final  bool? sharedWithHousehold;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyGoalDraftChangedCopyWith<MoneyGoalDraftChanged> get copyWith => _$MoneyGoalDraftChangedCopyWithImpl<MoneyGoalDraftChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyGoalDraftChanged&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.target, target) || other.target == target)&&(identical(other.current, current) || other.current == current)&&(identical(other.months, months) || other.months == months)&&(identical(other.sharedWithHousehold, sharedWithHousehold) || other.sharedWithHousehold == sharedWithHousehold));
}


@override
int get hashCode => Object.hash(runtimeType,name,kind,target,current,months,sharedWithHousehold);

@override
String toString() {
  return 'MoneyEvent.goalDraftChanged(name: $name, kind: $kind, target: $target, current: $current, months: $months, sharedWithHousehold: $sharedWithHousehold)';
}


}

/// @nodoc
abstract mixin class $MoneyGoalDraftChangedCopyWith<$Res> implements $MoneyEventCopyWith<$Res> {
  factory $MoneyGoalDraftChangedCopyWith(MoneyGoalDraftChanged value, $Res Function(MoneyGoalDraftChanged) _then) = _$MoneyGoalDraftChangedCopyWithImpl;
@useResult
$Res call({
 String? name, GoalKind? kind, double? target, double? current, int? months, bool? sharedWithHousehold
});




}
/// @nodoc
class _$MoneyGoalDraftChangedCopyWithImpl<$Res>
    implements $MoneyGoalDraftChangedCopyWith<$Res> {
  _$MoneyGoalDraftChangedCopyWithImpl(this._self, this._then);

  final MoneyGoalDraftChanged _self;
  final $Res Function(MoneyGoalDraftChanged) _then;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? kind = freezed,Object? target = freezed,Object? current = freezed,Object? months = freezed,Object? sharedWithHousehold = freezed,}) {
  return _then(MoneyGoalDraftChanged(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as GoalKind?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as double?,current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as double?,months: freezed == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int?,sharedWithHousehold: freezed == sharedWithHousehold ? _self.sharedWithHousehold : sharedWithHousehold // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class MoneyGoalDraftSubmitted implements MoneyEvent {
  const MoneyGoalDraftSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyGoalDraftSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoneyEvent.goalDraftSubmitted()';
}


}




/// @nodoc


class MoneyGoalMovementRecorded implements MoneyEvent {
  const MoneyGoalMovementRecorded({required this.goalId, required this.amount, required this.label});
  

 final  String goalId;
 final  double amount;
 final  String label;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyGoalMovementRecordedCopyWith<MoneyGoalMovementRecorded> get copyWith => _$MoneyGoalMovementRecordedCopyWithImpl<MoneyGoalMovementRecorded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyGoalMovementRecorded&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,goalId,amount,label);

@override
String toString() {
  return 'MoneyEvent.goalMovementRecorded(goalId: $goalId, amount: $amount, label: $label)';
}


}

/// @nodoc
abstract mixin class $MoneyGoalMovementRecordedCopyWith<$Res> implements $MoneyEventCopyWith<$Res> {
  factory $MoneyGoalMovementRecordedCopyWith(MoneyGoalMovementRecorded value, $Res Function(MoneyGoalMovementRecorded) _then) = _$MoneyGoalMovementRecordedCopyWithImpl;
@useResult
$Res call({
 String goalId, double amount, String label
});




}
/// @nodoc
class _$MoneyGoalMovementRecordedCopyWithImpl<$Res>
    implements $MoneyGoalMovementRecordedCopyWith<$Res> {
  _$MoneyGoalMovementRecordedCopyWithImpl(this._self, this._then);

  final MoneyGoalMovementRecorded _self;
  final $Res Function(MoneyGoalMovementRecorded) _then;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goalId = null,Object? amount = null,Object? label = null,}) {
  return _then(MoneyGoalMovementRecorded(
goalId: null == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MoneyExportRequested implements MoneyEvent {
  const MoneyExportRequested({required this.label, required this.format});
  

 final  String label;
 final  String format;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyExportRequestedCopyWith<MoneyExportRequested> get copyWith => _$MoneyExportRequestedCopyWithImpl<MoneyExportRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyExportRequested&&(identical(other.label, label) || other.label == label)&&(identical(other.format, format) || other.format == format));
}


@override
int get hashCode => Object.hash(runtimeType,label,format);

@override
String toString() {
  return 'MoneyEvent.exportRequested(label: $label, format: $format)';
}


}

/// @nodoc
abstract mixin class $MoneyExportRequestedCopyWith<$Res> implements $MoneyEventCopyWith<$Res> {
  factory $MoneyExportRequestedCopyWith(MoneyExportRequested value, $Res Function(MoneyExportRequested) _then) = _$MoneyExportRequestedCopyWithImpl;
@useResult
$Res call({
 String label, String format
});




}
/// @nodoc
class _$MoneyExportRequestedCopyWithImpl<$Res>
    implements $MoneyExportRequestedCopyWith<$Res> {
  _$MoneyExportRequestedCopyWithImpl(this._self, this._then);

  final MoneyExportRequested _self;
  final $Res Function(MoneyExportRequested) _then;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? label = null,Object? format = null,}) {
  return _then(MoneyExportRequested(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MoneyAccountArchived implements MoneyEvent {
  const MoneyAccountArchived(this.accountId);
  

 final  String accountId;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyAccountArchivedCopyWith<MoneyAccountArchived> get copyWith => _$MoneyAccountArchivedCopyWithImpl<MoneyAccountArchived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyAccountArchived&&(identical(other.accountId, accountId) || other.accountId == accountId));
}


@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'MoneyEvent.accountArchived(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $MoneyAccountArchivedCopyWith<$Res> implements $MoneyEventCopyWith<$Res> {
  factory $MoneyAccountArchivedCopyWith(MoneyAccountArchived value, $Res Function(MoneyAccountArchived) _then) = _$MoneyAccountArchivedCopyWithImpl;
@useResult
$Res call({
 String accountId
});




}
/// @nodoc
class _$MoneyAccountArchivedCopyWithImpl<$Res>
    implements $MoneyAccountArchivedCopyWith<$Res> {
  _$MoneyAccountArchivedCopyWithImpl(this._self, this._then);

  final MoneyAccountArchived _self;
  final $Res Function(MoneyAccountArchived) _then;

/// Create a copy of MoneyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountId = null,}) {
  return _then(MoneyAccountArchived(
null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MoneyState {

 List<FinancialAccount> get accounts; List<Goal> get goals; List<ExportJob> get exports; ReportPeriod get period; BudgetMode get budgetMode; bool get groupSmallerSpending; bool get showArchived; bool get isReady; String get goalDraftName; GoalKind get goalDraftKind; double get goalDraftTarget; double get goalDraftCurrent; int get goalDraftMonths; bool get goalDraftShared; NetWorthSnapshot? get netWorth; BudgetPeriod? get budget; ReportSnapshot? get report; ScenarioResult? get scenario; Goal? get createdGoal;
/// Create a copy of MoneyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyStateCopyWith<MoneyState> get copyWith => _$MoneyStateCopyWithImpl<MoneyState>(this as MoneyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyState&&const DeepCollectionEquality().equals(other.accounts, accounts)&&const DeepCollectionEquality().equals(other.goals, goals)&&const DeepCollectionEquality().equals(other.exports, exports)&&(identical(other.period, period) || other.period == period)&&(identical(other.budgetMode, budgetMode) || other.budgetMode == budgetMode)&&(identical(other.groupSmallerSpending, groupSmallerSpending) || other.groupSmallerSpending == groupSmallerSpending)&&(identical(other.showArchived, showArchived) || other.showArchived == showArchived)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.goalDraftName, goalDraftName) || other.goalDraftName == goalDraftName)&&(identical(other.goalDraftKind, goalDraftKind) || other.goalDraftKind == goalDraftKind)&&(identical(other.goalDraftTarget, goalDraftTarget) || other.goalDraftTarget == goalDraftTarget)&&(identical(other.goalDraftCurrent, goalDraftCurrent) || other.goalDraftCurrent == goalDraftCurrent)&&(identical(other.goalDraftMonths, goalDraftMonths) || other.goalDraftMonths == goalDraftMonths)&&(identical(other.goalDraftShared, goalDraftShared) || other.goalDraftShared == goalDraftShared)&&(identical(other.netWorth, netWorth) || other.netWorth == netWorth)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.report, report) || other.report == report)&&(identical(other.scenario, scenario) || other.scenario == scenario)&&(identical(other.createdGoal, createdGoal) || other.createdGoal == createdGoal));
}


@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(accounts),const DeepCollectionEquality().hash(goals),const DeepCollectionEquality().hash(exports),period,budgetMode,groupSmallerSpending,showArchived,isReady,goalDraftName,goalDraftKind,goalDraftTarget,goalDraftCurrent,goalDraftMonths,goalDraftShared,netWorth,budget,report,scenario,createdGoal]);

@override
String toString() {
  return 'MoneyState(accounts: $accounts, goals: $goals, exports: $exports, period: $period, budgetMode: $budgetMode, groupSmallerSpending: $groupSmallerSpending, showArchived: $showArchived, isReady: $isReady, goalDraftName: $goalDraftName, goalDraftKind: $goalDraftKind, goalDraftTarget: $goalDraftTarget, goalDraftCurrent: $goalDraftCurrent, goalDraftMonths: $goalDraftMonths, goalDraftShared: $goalDraftShared, netWorth: $netWorth, budget: $budget, report: $report, scenario: $scenario, createdGoal: $createdGoal)';
}


}

/// @nodoc
abstract mixin class $MoneyStateCopyWith<$Res>  {
  factory $MoneyStateCopyWith(MoneyState value, $Res Function(MoneyState) _then) = _$MoneyStateCopyWithImpl;
@useResult
$Res call({
 List<FinancialAccount> accounts, List<Goal> goals, List<ExportJob> exports, ReportPeriod period, BudgetMode budgetMode, bool groupSmallerSpending, bool showArchived, bool isReady, String goalDraftName, GoalKind goalDraftKind, double goalDraftTarget, double goalDraftCurrent, int goalDraftMonths, bool goalDraftShared, NetWorthSnapshot? netWorth, BudgetPeriod? budget, ReportSnapshot? report, ScenarioResult? scenario, Goal? createdGoal
});




}
/// @nodoc
class _$MoneyStateCopyWithImpl<$Res>
    implements $MoneyStateCopyWith<$Res> {
  _$MoneyStateCopyWithImpl(this._self, this._then);

  final MoneyState _self;
  final $Res Function(MoneyState) _then;

/// Create a copy of MoneyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accounts = null,Object? goals = null,Object? exports = null,Object? period = null,Object? budgetMode = null,Object? groupSmallerSpending = null,Object? showArchived = null,Object? isReady = null,Object? goalDraftName = null,Object? goalDraftKind = null,Object? goalDraftTarget = null,Object? goalDraftCurrent = null,Object? goalDraftMonths = null,Object? goalDraftShared = null,Object? netWorth = freezed,Object? budget = freezed,Object? report = freezed,Object? scenario = freezed,Object? createdGoal = freezed,}) {
  return _then(_self.copyWith(
accounts: null == accounts ? _self.accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<FinancialAccount>,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<Goal>,exports: null == exports ? _self.exports : exports // ignore: cast_nullable_to_non_nullable
as List<ExportJob>,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as ReportPeriod,budgetMode: null == budgetMode ? _self.budgetMode : budgetMode // ignore: cast_nullable_to_non_nullable
as BudgetMode,groupSmallerSpending: null == groupSmallerSpending ? _self.groupSmallerSpending : groupSmallerSpending // ignore: cast_nullable_to_non_nullable
as bool,showArchived: null == showArchived ? _self.showArchived : showArchived // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,goalDraftName: null == goalDraftName ? _self.goalDraftName : goalDraftName // ignore: cast_nullable_to_non_nullable
as String,goalDraftKind: null == goalDraftKind ? _self.goalDraftKind : goalDraftKind // ignore: cast_nullable_to_non_nullable
as GoalKind,goalDraftTarget: null == goalDraftTarget ? _self.goalDraftTarget : goalDraftTarget // ignore: cast_nullable_to_non_nullable
as double,goalDraftCurrent: null == goalDraftCurrent ? _self.goalDraftCurrent : goalDraftCurrent // ignore: cast_nullable_to_non_nullable
as double,goalDraftMonths: null == goalDraftMonths ? _self.goalDraftMonths : goalDraftMonths // ignore: cast_nullable_to_non_nullable
as int,goalDraftShared: null == goalDraftShared ? _self.goalDraftShared : goalDraftShared // ignore: cast_nullable_to_non_nullable
as bool,netWorth: freezed == netWorth ? _self.netWorth : netWorth // ignore: cast_nullable_to_non_nullable
as NetWorthSnapshot?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as BudgetPeriod?,report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as ReportSnapshot?,scenario: freezed == scenario ? _self.scenario : scenario // ignore: cast_nullable_to_non_nullable
as ScenarioResult?,createdGoal: freezed == createdGoal ? _self.createdGoal : createdGoal // ignore: cast_nullable_to_non_nullable
as Goal?,
  ));
}

}


/// Adds pattern-matching-related methods to [MoneyState].
extension MoneyStatePatterns on MoneyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoneyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoneyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoneyState value)  $default,){
final _that = this;
switch (_that) {
case _MoneyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoneyState value)?  $default,){
final _that = this;
switch (_that) {
case _MoneyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FinancialAccount> accounts,  List<Goal> goals,  List<ExportJob> exports,  ReportPeriod period,  BudgetMode budgetMode,  bool groupSmallerSpending,  bool showArchived,  bool isReady,  String goalDraftName,  GoalKind goalDraftKind,  double goalDraftTarget,  double goalDraftCurrent,  int goalDraftMonths,  bool goalDraftShared,  NetWorthSnapshot? netWorth,  BudgetPeriod? budget,  ReportSnapshot? report,  ScenarioResult? scenario,  Goal? createdGoal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoneyState() when $default != null:
return $default(_that.accounts,_that.goals,_that.exports,_that.period,_that.budgetMode,_that.groupSmallerSpending,_that.showArchived,_that.isReady,_that.goalDraftName,_that.goalDraftKind,_that.goalDraftTarget,_that.goalDraftCurrent,_that.goalDraftMonths,_that.goalDraftShared,_that.netWorth,_that.budget,_that.report,_that.scenario,_that.createdGoal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FinancialAccount> accounts,  List<Goal> goals,  List<ExportJob> exports,  ReportPeriod period,  BudgetMode budgetMode,  bool groupSmallerSpending,  bool showArchived,  bool isReady,  String goalDraftName,  GoalKind goalDraftKind,  double goalDraftTarget,  double goalDraftCurrent,  int goalDraftMonths,  bool goalDraftShared,  NetWorthSnapshot? netWorth,  BudgetPeriod? budget,  ReportSnapshot? report,  ScenarioResult? scenario,  Goal? createdGoal)  $default,) {final _that = this;
switch (_that) {
case _MoneyState():
return $default(_that.accounts,_that.goals,_that.exports,_that.period,_that.budgetMode,_that.groupSmallerSpending,_that.showArchived,_that.isReady,_that.goalDraftName,_that.goalDraftKind,_that.goalDraftTarget,_that.goalDraftCurrent,_that.goalDraftMonths,_that.goalDraftShared,_that.netWorth,_that.budget,_that.report,_that.scenario,_that.createdGoal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FinancialAccount> accounts,  List<Goal> goals,  List<ExportJob> exports,  ReportPeriod period,  BudgetMode budgetMode,  bool groupSmallerSpending,  bool showArchived,  bool isReady,  String goalDraftName,  GoalKind goalDraftKind,  double goalDraftTarget,  double goalDraftCurrent,  int goalDraftMonths,  bool goalDraftShared,  NetWorthSnapshot? netWorth,  BudgetPeriod? budget,  ReportSnapshot? report,  ScenarioResult? scenario,  Goal? createdGoal)?  $default,) {final _that = this;
switch (_that) {
case _MoneyState() when $default != null:
return $default(_that.accounts,_that.goals,_that.exports,_that.period,_that.budgetMode,_that.groupSmallerSpending,_that.showArchived,_that.isReady,_that.goalDraftName,_that.goalDraftKind,_that.goalDraftTarget,_that.goalDraftCurrent,_that.goalDraftMonths,_that.goalDraftShared,_that.netWorth,_that.budget,_that.report,_that.scenario,_that.createdGoal);case _:
  return null;

}
}

}

/// @nodoc


class _MoneyState implements MoneyState {
  const _MoneyState({required final  List<FinancialAccount> accounts, required final  List<Goal> goals, required final  List<ExportJob> exports, required this.period, required this.budgetMode, required this.groupSmallerSpending, required this.showArchived, required this.isReady, required this.goalDraftName, required this.goalDraftKind, required this.goalDraftTarget, required this.goalDraftCurrent, required this.goalDraftMonths, required this.goalDraftShared, this.netWorth, this.budget, this.report, this.scenario, this.createdGoal}): _accounts = accounts,_goals = goals,_exports = exports;
  

 final  List<FinancialAccount> _accounts;
@override List<FinancialAccount> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

 final  List<Goal> _goals;
@override List<Goal> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}

 final  List<ExportJob> _exports;
@override List<ExportJob> get exports {
  if (_exports is EqualUnmodifiableListView) return _exports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exports);
}

@override final  ReportPeriod period;
@override final  BudgetMode budgetMode;
@override final  bool groupSmallerSpending;
@override final  bool showArchived;
@override final  bool isReady;
@override final  String goalDraftName;
@override final  GoalKind goalDraftKind;
@override final  double goalDraftTarget;
@override final  double goalDraftCurrent;
@override final  int goalDraftMonths;
@override final  bool goalDraftShared;
@override final  NetWorthSnapshot? netWorth;
@override final  BudgetPeriod? budget;
@override final  ReportSnapshot? report;
@override final  ScenarioResult? scenario;
@override final  Goal? createdGoal;

/// Create a copy of MoneyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoneyStateCopyWith<_MoneyState> get copyWith => __$MoneyStateCopyWithImpl<_MoneyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoneyState&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&const DeepCollectionEquality().equals(other._goals, _goals)&&const DeepCollectionEquality().equals(other._exports, _exports)&&(identical(other.period, period) || other.period == period)&&(identical(other.budgetMode, budgetMode) || other.budgetMode == budgetMode)&&(identical(other.groupSmallerSpending, groupSmallerSpending) || other.groupSmallerSpending == groupSmallerSpending)&&(identical(other.showArchived, showArchived) || other.showArchived == showArchived)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.goalDraftName, goalDraftName) || other.goalDraftName == goalDraftName)&&(identical(other.goalDraftKind, goalDraftKind) || other.goalDraftKind == goalDraftKind)&&(identical(other.goalDraftTarget, goalDraftTarget) || other.goalDraftTarget == goalDraftTarget)&&(identical(other.goalDraftCurrent, goalDraftCurrent) || other.goalDraftCurrent == goalDraftCurrent)&&(identical(other.goalDraftMonths, goalDraftMonths) || other.goalDraftMonths == goalDraftMonths)&&(identical(other.goalDraftShared, goalDraftShared) || other.goalDraftShared == goalDraftShared)&&(identical(other.netWorth, netWorth) || other.netWorth == netWorth)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.report, report) || other.report == report)&&(identical(other.scenario, scenario) || other.scenario == scenario)&&(identical(other.createdGoal, createdGoal) || other.createdGoal == createdGoal));
}


@override
int get hashCode => Object.hashAll([runtimeType,const DeepCollectionEquality().hash(_accounts),const DeepCollectionEquality().hash(_goals),const DeepCollectionEquality().hash(_exports),period,budgetMode,groupSmallerSpending,showArchived,isReady,goalDraftName,goalDraftKind,goalDraftTarget,goalDraftCurrent,goalDraftMonths,goalDraftShared,netWorth,budget,report,scenario,createdGoal]);

@override
String toString() {
  return 'MoneyState(accounts: $accounts, goals: $goals, exports: $exports, period: $period, budgetMode: $budgetMode, groupSmallerSpending: $groupSmallerSpending, showArchived: $showArchived, isReady: $isReady, goalDraftName: $goalDraftName, goalDraftKind: $goalDraftKind, goalDraftTarget: $goalDraftTarget, goalDraftCurrent: $goalDraftCurrent, goalDraftMonths: $goalDraftMonths, goalDraftShared: $goalDraftShared, netWorth: $netWorth, budget: $budget, report: $report, scenario: $scenario, createdGoal: $createdGoal)';
}


}

/// @nodoc
abstract mixin class _$MoneyStateCopyWith<$Res> implements $MoneyStateCopyWith<$Res> {
  factory _$MoneyStateCopyWith(_MoneyState value, $Res Function(_MoneyState) _then) = __$MoneyStateCopyWithImpl;
@override @useResult
$Res call({
 List<FinancialAccount> accounts, List<Goal> goals, List<ExportJob> exports, ReportPeriod period, BudgetMode budgetMode, bool groupSmallerSpending, bool showArchived, bool isReady, String goalDraftName, GoalKind goalDraftKind, double goalDraftTarget, double goalDraftCurrent, int goalDraftMonths, bool goalDraftShared, NetWorthSnapshot? netWorth, BudgetPeriod? budget, ReportSnapshot? report, ScenarioResult? scenario, Goal? createdGoal
});




}
/// @nodoc
class __$MoneyStateCopyWithImpl<$Res>
    implements _$MoneyStateCopyWith<$Res> {
  __$MoneyStateCopyWithImpl(this._self, this._then);

  final _MoneyState _self;
  final $Res Function(_MoneyState) _then;

/// Create a copy of MoneyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accounts = null,Object? goals = null,Object? exports = null,Object? period = null,Object? budgetMode = null,Object? groupSmallerSpending = null,Object? showArchived = null,Object? isReady = null,Object? goalDraftName = null,Object? goalDraftKind = null,Object? goalDraftTarget = null,Object? goalDraftCurrent = null,Object? goalDraftMonths = null,Object? goalDraftShared = null,Object? netWorth = freezed,Object? budget = freezed,Object? report = freezed,Object? scenario = freezed,Object? createdGoal = freezed,}) {
  return _then(_MoneyState(
accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<FinancialAccount>,goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<Goal>,exports: null == exports ? _self._exports : exports // ignore: cast_nullable_to_non_nullable
as List<ExportJob>,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as ReportPeriod,budgetMode: null == budgetMode ? _self.budgetMode : budgetMode // ignore: cast_nullable_to_non_nullable
as BudgetMode,groupSmallerSpending: null == groupSmallerSpending ? _self.groupSmallerSpending : groupSmallerSpending // ignore: cast_nullable_to_non_nullable
as bool,showArchived: null == showArchived ? _self.showArchived : showArchived // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,goalDraftName: null == goalDraftName ? _self.goalDraftName : goalDraftName // ignore: cast_nullable_to_non_nullable
as String,goalDraftKind: null == goalDraftKind ? _self.goalDraftKind : goalDraftKind // ignore: cast_nullable_to_non_nullable
as GoalKind,goalDraftTarget: null == goalDraftTarget ? _self.goalDraftTarget : goalDraftTarget // ignore: cast_nullable_to_non_nullable
as double,goalDraftCurrent: null == goalDraftCurrent ? _self.goalDraftCurrent : goalDraftCurrent // ignore: cast_nullable_to_non_nullable
as double,goalDraftMonths: null == goalDraftMonths ? _self.goalDraftMonths : goalDraftMonths // ignore: cast_nullable_to_non_nullable
as int,goalDraftShared: null == goalDraftShared ? _self.goalDraftShared : goalDraftShared // ignore: cast_nullable_to_non_nullable
as bool,netWorth: freezed == netWorth ? _self.netWorth : netWorth // ignore: cast_nullable_to_non_nullable
as NetWorthSnapshot?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as BudgetPeriod?,report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as ReportSnapshot?,scenario: freezed == scenario ? _self.scenario : scenario // ignore: cast_nullable_to_non_nullable
as ScenarioResult?,createdGoal: freezed == createdGoal ? _self.createdGoal : createdGoal // ignore: cast_nullable_to_non_nullable
as Goal?,
  ));
}


}

// dart format on
