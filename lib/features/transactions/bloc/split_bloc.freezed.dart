// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplitEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplitEvent()';
}


}

/// @nodoc
class $SplitEventCopyWith<$Res>  {
$SplitEventCopyWith(SplitEvent _, $Res Function(SplitEvent) __);
}


/// Adds pattern-matching-related methods to [SplitEvent].
extension SplitEventPatterns on SplitEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SplitStarted value)?  started,TResult Function( SplitMethodChanged value)?  methodChanged,TResult Function( SplitLineAdded value)?  lineAdded,TResult Function( SplitLineRemoved value)?  lineRemoved,TResult Function( SplitLineAmountChanged value)?  lineAmountChanged,TResult Function( SplitLineCategoryChanged value)?  lineCategoryChanged,TResult Function( SplitSaved value)?  saved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SplitStarted() when started != null:
return started(_that);case SplitMethodChanged() when methodChanged != null:
return methodChanged(_that);case SplitLineAdded() when lineAdded != null:
return lineAdded(_that);case SplitLineRemoved() when lineRemoved != null:
return lineRemoved(_that);case SplitLineAmountChanged() when lineAmountChanged != null:
return lineAmountChanged(_that);case SplitLineCategoryChanged() when lineCategoryChanged != null:
return lineCategoryChanged(_that);case SplitSaved() when saved != null:
return saved(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SplitStarted value)  started,required TResult Function( SplitMethodChanged value)  methodChanged,required TResult Function( SplitLineAdded value)  lineAdded,required TResult Function( SplitLineRemoved value)  lineRemoved,required TResult Function( SplitLineAmountChanged value)  lineAmountChanged,required TResult Function( SplitLineCategoryChanged value)  lineCategoryChanged,required TResult Function( SplitSaved value)  saved,}){
final _that = this;
switch (_that) {
case SplitStarted():
return started(_that);case SplitMethodChanged():
return methodChanged(_that);case SplitLineAdded():
return lineAdded(_that);case SplitLineRemoved():
return lineRemoved(_that);case SplitLineAmountChanged():
return lineAmountChanged(_that);case SplitLineCategoryChanged():
return lineCategoryChanged(_that);case SplitSaved():
return saved(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SplitStarted value)?  started,TResult? Function( SplitMethodChanged value)?  methodChanged,TResult? Function( SplitLineAdded value)?  lineAdded,TResult? Function( SplitLineRemoved value)?  lineRemoved,TResult? Function( SplitLineAmountChanged value)?  lineAmountChanged,TResult? Function( SplitLineCategoryChanged value)?  lineCategoryChanged,TResult? Function( SplitSaved value)?  saved,}){
final _that = this;
switch (_that) {
case SplitStarted() when started != null:
return started(_that);case SplitMethodChanged() when methodChanged != null:
return methodChanged(_that);case SplitLineAdded() when lineAdded != null:
return lineAdded(_that);case SplitLineRemoved() when lineRemoved != null:
return lineRemoved(_that);case SplitLineAmountChanged() when lineAmountChanged != null:
return lineAmountChanged(_that);case SplitLineCategoryChanged() when lineCategoryChanged != null:
return lineCategoryChanged(_that);case SplitSaved() when saved != null:
return saved(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( MiaTransaction transaction)?  started,TResult Function( SplitMethod method)?  methodChanged,TResult Function( String categoryId)?  lineAdded,TResult Function( String lineId)?  lineRemoved,TResult Function( String lineId,  double amount)?  lineAmountChanged,TResult Function( String lineId,  String categoryId)?  lineCategoryChanged,TResult Function()?  saved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SplitStarted() when started != null:
return started(_that.transaction);case SplitMethodChanged() when methodChanged != null:
return methodChanged(_that.method);case SplitLineAdded() when lineAdded != null:
return lineAdded(_that.categoryId);case SplitLineRemoved() when lineRemoved != null:
return lineRemoved(_that.lineId);case SplitLineAmountChanged() when lineAmountChanged != null:
return lineAmountChanged(_that.lineId,_that.amount);case SplitLineCategoryChanged() when lineCategoryChanged != null:
return lineCategoryChanged(_that.lineId,_that.categoryId);case SplitSaved() when saved != null:
return saved();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( MiaTransaction transaction)  started,required TResult Function( SplitMethod method)  methodChanged,required TResult Function( String categoryId)  lineAdded,required TResult Function( String lineId)  lineRemoved,required TResult Function( String lineId,  double amount)  lineAmountChanged,required TResult Function( String lineId,  String categoryId)  lineCategoryChanged,required TResult Function()  saved,}) {final _that = this;
switch (_that) {
case SplitStarted():
return started(_that.transaction);case SplitMethodChanged():
return methodChanged(_that.method);case SplitLineAdded():
return lineAdded(_that.categoryId);case SplitLineRemoved():
return lineRemoved(_that.lineId);case SplitLineAmountChanged():
return lineAmountChanged(_that.lineId,_that.amount);case SplitLineCategoryChanged():
return lineCategoryChanged(_that.lineId,_that.categoryId);case SplitSaved():
return saved();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( MiaTransaction transaction)?  started,TResult? Function( SplitMethod method)?  methodChanged,TResult? Function( String categoryId)?  lineAdded,TResult? Function( String lineId)?  lineRemoved,TResult? Function( String lineId,  double amount)?  lineAmountChanged,TResult? Function( String lineId,  String categoryId)?  lineCategoryChanged,TResult? Function()?  saved,}) {final _that = this;
switch (_that) {
case SplitStarted() when started != null:
return started(_that.transaction);case SplitMethodChanged() when methodChanged != null:
return methodChanged(_that.method);case SplitLineAdded() when lineAdded != null:
return lineAdded(_that.categoryId);case SplitLineRemoved() when lineRemoved != null:
return lineRemoved(_that.lineId);case SplitLineAmountChanged() when lineAmountChanged != null:
return lineAmountChanged(_that.lineId,_that.amount);case SplitLineCategoryChanged() when lineCategoryChanged != null:
return lineCategoryChanged(_that.lineId,_that.categoryId);case SplitSaved() when saved != null:
return saved();case _:
  return null;

}
}

}

/// @nodoc


class SplitStarted implements SplitEvent {
  const SplitStarted(this.transaction);
  

 final  MiaTransaction transaction;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitStartedCopyWith<SplitStarted> get copyWith => _$SplitStartedCopyWithImpl<SplitStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitStarted&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,transaction);

@override
String toString() {
  return 'SplitEvent.started(transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class $SplitStartedCopyWith<$Res> implements $SplitEventCopyWith<$Res> {
  factory $SplitStartedCopyWith(SplitStarted value, $Res Function(SplitStarted) _then) = _$SplitStartedCopyWithImpl;
@useResult
$Res call({
 MiaTransaction transaction
});




}
/// @nodoc
class _$SplitStartedCopyWithImpl<$Res>
    implements $SplitStartedCopyWith<$Res> {
  _$SplitStartedCopyWithImpl(this._self, this._then);

  final SplitStarted _self;
  final $Res Function(SplitStarted) _then;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,}) {
  return _then(SplitStarted(
null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as MiaTransaction,
  ));
}


}

/// @nodoc


class SplitMethodChanged implements SplitEvent {
  const SplitMethodChanged(this.method);
  

 final  SplitMethod method;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitMethodChangedCopyWith<SplitMethodChanged> get copyWith => _$SplitMethodChangedCopyWithImpl<SplitMethodChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitMethodChanged&&(identical(other.method, method) || other.method == method));
}


@override
int get hashCode => Object.hash(runtimeType,method);

@override
String toString() {
  return 'SplitEvent.methodChanged(method: $method)';
}


}

/// @nodoc
abstract mixin class $SplitMethodChangedCopyWith<$Res> implements $SplitEventCopyWith<$Res> {
  factory $SplitMethodChangedCopyWith(SplitMethodChanged value, $Res Function(SplitMethodChanged) _then) = _$SplitMethodChangedCopyWithImpl;
@useResult
$Res call({
 SplitMethod method
});




}
/// @nodoc
class _$SplitMethodChangedCopyWithImpl<$Res>
    implements $SplitMethodChangedCopyWith<$Res> {
  _$SplitMethodChangedCopyWithImpl(this._self, this._then);

  final SplitMethodChanged _self;
  final $Res Function(SplitMethodChanged) _then;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,}) {
  return _then(SplitMethodChanged(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as SplitMethod,
  ));
}


}

/// @nodoc


class SplitLineAdded implements SplitEvent {
  const SplitLineAdded(this.categoryId);
  

 final  String categoryId;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitLineAddedCopyWith<SplitLineAdded> get copyWith => _$SplitLineAddedCopyWithImpl<SplitLineAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitLineAdded&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'SplitEvent.lineAdded(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $SplitLineAddedCopyWith<$Res> implements $SplitEventCopyWith<$Res> {
  factory $SplitLineAddedCopyWith(SplitLineAdded value, $Res Function(SplitLineAdded) _then) = _$SplitLineAddedCopyWithImpl;
@useResult
$Res call({
 String categoryId
});




}
/// @nodoc
class _$SplitLineAddedCopyWithImpl<$Res>
    implements $SplitLineAddedCopyWith<$Res> {
  _$SplitLineAddedCopyWithImpl(this._self, this._then);

  final SplitLineAdded _self;
  final $Res Function(SplitLineAdded) _then;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(SplitLineAdded(
null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SplitLineRemoved implements SplitEvent {
  const SplitLineRemoved(this.lineId);
  

 final  String lineId;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitLineRemovedCopyWith<SplitLineRemoved> get copyWith => _$SplitLineRemovedCopyWithImpl<SplitLineRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitLineRemoved&&(identical(other.lineId, lineId) || other.lineId == lineId));
}


@override
int get hashCode => Object.hash(runtimeType,lineId);

@override
String toString() {
  return 'SplitEvent.lineRemoved(lineId: $lineId)';
}


}

/// @nodoc
abstract mixin class $SplitLineRemovedCopyWith<$Res> implements $SplitEventCopyWith<$Res> {
  factory $SplitLineRemovedCopyWith(SplitLineRemoved value, $Res Function(SplitLineRemoved) _then) = _$SplitLineRemovedCopyWithImpl;
@useResult
$Res call({
 String lineId
});




}
/// @nodoc
class _$SplitLineRemovedCopyWithImpl<$Res>
    implements $SplitLineRemovedCopyWith<$Res> {
  _$SplitLineRemovedCopyWithImpl(this._self, this._then);

  final SplitLineRemoved _self;
  final $Res Function(SplitLineRemoved) _then;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lineId = null,}) {
  return _then(SplitLineRemoved(
null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SplitLineAmountChanged implements SplitEvent {
  const SplitLineAmountChanged({required this.lineId, required this.amount});
  

 final  String lineId;
 final  double amount;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitLineAmountChangedCopyWith<SplitLineAmountChanged> get copyWith => _$SplitLineAmountChangedCopyWithImpl<SplitLineAmountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitLineAmountChanged&&(identical(other.lineId, lineId) || other.lineId == lineId)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,lineId,amount);

@override
String toString() {
  return 'SplitEvent.lineAmountChanged(lineId: $lineId, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SplitLineAmountChangedCopyWith<$Res> implements $SplitEventCopyWith<$Res> {
  factory $SplitLineAmountChangedCopyWith(SplitLineAmountChanged value, $Res Function(SplitLineAmountChanged) _then) = _$SplitLineAmountChangedCopyWithImpl;
@useResult
$Res call({
 String lineId, double amount
});




}
/// @nodoc
class _$SplitLineAmountChangedCopyWithImpl<$Res>
    implements $SplitLineAmountChangedCopyWith<$Res> {
  _$SplitLineAmountChangedCopyWithImpl(this._self, this._then);

  final SplitLineAmountChanged _self;
  final $Res Function(SplitLineAmountChanged) _then;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lineId = null,Object? amount = null,}) {
  return _then(SplitLineAmountChanged(
lineId: null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class SplitLineCategoryChanged implements SplitEvent {
  const SplitLineCategoryChanged({required this.lineId, required this.categoryId});
  

 final  String lineId;
 final  String categoryId;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitLineCategoryChangedCopyWith<SplitLineCategoryChanged> get copyWith => _$SplitLineCategoryChangedCopyWithImpl<SplitLineCategoryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitLineCategoryChanged&&(identical(other.lineId, lineId) || other.lineId == lineId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,lineId,categoryId);

@override
String toString() {
  return 'SplitEvent.lineCategoryChanged(lineId: $lineId, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $SplitLineCategoryChangedCopyWith<$Res> implements $SplitEventCopyWith<$Res> {
  factory $SplitLineCategoryChangedCopyWith(SplitLineCategoryChanged value, $Res Function(SplitLineCategoryChanged) _then) = _$SplitLineCategoryChangedCopyWithImpl;
@useResult
$Res call({
 String lineId, String categoryId
});




}
/// @nodoc
class _$SplitLineCategoryChangedCopyWithImpl<$Res>
    implements $SplitLineCategoryChangedCopyWith<$Res> {
  _$SplitLineCategoryChangedCopyWithImpl(this._self, this._then);

  final SplitLineCategoryChanged _self;
  final $Res Function(SplitLineCategoryChanged) _then;

/// Create a copy of SplitEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lineId = null,Object? categoryId = null,}) {
  return _then(SplitLineCategoryChanged(
lineId: null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SplitSaved implements SplitEvent {
  const SplitSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplitEvent.saved()';
}


}




/// @nodoc
mixin _$SplitState {

 String get transactionId; double get parentAmount; List<TransactionSplit> get lines; SplitMethod get method; bool get isSaved;
/// Create a copy of SplitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitStateCopyWith<SplitState> get copyWith => _$SplitStateCopyWithImpl<SplitState>(this as SplitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitState&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.parentAmount, parentAmount) || other.parentAmount == parentAmount)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.method, method) || other.method == method)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,transactionId,parentAmount,const DeepCollectionEquality().hash(lines),method,isSaved);

@override
String toString() {
  return 'SplitState(transactionId: $transactionId, parentAmount: $parentAmount, lines: $lines, method: $method, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class $SplitStateCopyWith<$Res>  {
  factory $SplitStateCopyWith(SplitState value, $Res Function(SplitState) _then) = _$SplitStateCopyWithImpl;
@useResult
$Res call({
 String transactionId, double parentAmount, List<TransactionSplit> lines, SplitMethod method, bool isSaved
});




}
/// @nodoc
class _$SplitStateCopyWithImpl<$Res>
    implements $SplitStateCopyWith<$Res> {
  _$SplitStateCopyWithImpl(this._self, this._then);

  final SplitState _self;
  final $Res Function(SplitState) _then;

/// Create a copy of SplitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? parentAmount = null,Object? lines = null,Object? method = null,Object? isSaved = null,}) {
  return _then(_self.copyWith(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,parentAmount: null == parentAmount ? _self.parentAmount : parentAmount // ignore: cast_nullable_to_non_nullable
as double,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<TransactionSplit>,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as SplitMethod,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SplitState].
extension SplitStatePatterns on SplitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplitState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplitState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplitState value)  $default,){
final _that = this;
switch (_that) {
case _SplitState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplitState value)?  $default,){
final _that = this;
switch (_that) {
case _SplitState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transactionId,  double parentAmount,  List<TransactionSplit> lines,  SplitMethod method,  bool isSaved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplitState() when $default != null:
return $default(_that.transactionId,_that.parentAmount,_that.lines,_that.method,_that.isSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transactionId,  double parentAmount,  List<TransactionSplit> lines,  SplitMethod method,  bool isSaved)  $default,) {final _that = this;
switch (_that) {
case _SplitState():
return $default(_that.transactionId,_that.parentAmount,_that.lines,_that.method,_that.isSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transactionId,  double parentAmount,  List<TransactionSplit> lines,  SplitMethod method,  bool isSaved)?  $default,) {final _that = this;
switch (_that) {
case _SplitState() when $default != null:
return $default(_that.transactionId,_that.parentAmount,_that.lines,_that.method,_that.isSaved);case _:
  return null;

}
}

}

/// @nodoc


class _SplitState implements SplitState {
  const _SplitState({required this.transactionId, required this.parentAmount, required final  List<TransactionSplit> lines, required this.method, required this.isSaved}): _lines = lines;
  

@override final  String transactionId;
@override final  double parentAmount;
 final  List<TransactionSplit> _lines;
@override List<TransactionSplit> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  SplitMethod method;
@override final  bool isSaved;

/// Create a copy of SplitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplitStateCopyWith<_SplitState> get copyWith => __$SplitStateCopyWithImpl<_SplitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplitState&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.parentAmount, parentAmount) || other.parentAmount == parentAmount)&&const DeepCollectionEquality().equals(other._lines, _lines)&&(identical(other.method, method) || other.method == method)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,transactionId,parentAmount,const DeepCollectionEquality().hash(_lines),method,isSaved);

@override
String toString() {
  return 'SplitState(transactionId: $transactionId, parentAmount: $parentAmount, lines: $lines, method: $method, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class _$SplitStateCopyWith<$Res> implements $SplitStateCopyWith<$Res> {
  factory _$SplitStateCopyWith(_SplitState value, $Res Function(_SplitState) _then) = __$SplitStateCopyWithImpl;
@override @useResult
$Res call({
 String transactionId, double parentAmount, List<TransactionSplit> lines, SplitMethod method, bool isSaved
});




}
/// @nodoc
class __$SplitStateCopyWithImpl<$Res>
    implements _$SplitStateCopyWith<$Res> {
  __$SplitStateCopyWithImpl(this._self, this._then);

  final _SplitState _self;
  final $Res Function(_SplitState) _then;

/// Create a copy of SplitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? parentAmount = null,Object? lines = null,Object? method = null,Object? isSaved = null,}) {
  return _then(_SplitState(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,parentAmount: null == parentAmount ? _self.parentAmount : parentAmount // ignore: cast_nullable_to_non_nullable
as double,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<TransactionSplit>,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as SplitMethod,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
