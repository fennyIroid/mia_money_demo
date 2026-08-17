// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InboxEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxEvent()';
}


}

/// @nodoc
class $InboxEventCopyWith<$Res>  {
$InboxEventCopyWith(InboxEvent _, $Res Function(InboxEvent) __);
}


/// Adds pattern-matching-related methods to [InboxEvent].
extension InboxEventPatterns on InboxEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InboxLoad value)?  load,TResult Function( InboxStageSelected value)?  stageSelected,TResult Function( InboxScopeSelected value)?  scopeSelected,TResult Function( InboxSelectionToggled value)?  selectionToggled,TResult Function( InboxSelectionCleared value)?  selectionCleared,TResult Function( InboxApprove value)?  approve,TResult Function( InboxApproveSelected value)?  approveSelected,TResult Function( InboxDismiss value)?  dismiss,TResult Function( InboxUndoApproval value)?  undoApproval,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InboxLoad() when load != null:
return load(_that);case InboxStageSelected() when stageSelected != null:
return stageSelected(_that);case InboxScopeSelected() when scopeSelected != null:
return scopeSelected(_that);case InboxSelectionToggled() when selectionToggled != null:
return selectionToggled(_that);case InboxSelectionCleared() when selectionCleared != null:
return selectionCleared(_that);case InboxApprove() when approve != null:
return approve(_that);case InboxApproveSelected() when approveSelected != null:
return approveSelected(_that);case InboxDismiss() when dismiss != null:
return dismiss(_that);case InboxUndoApproval() when undoApproval != null:
return undoApproval(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InboxLoad value)  load,required TResult Function( InboxStageSelected value)  stageSelected,required TResult Function( InboxScopeSelected value)  scopeSelected,required TResult Function( InboxSelectionToggled value)  selectionToggled,required TResult Function( InboxSelectionCleared value)  selectionCleared,required TResult Function( InboxApprove value)  approve,required TResult Function( InboxApproveSelected value)  approveSelected,required TResult Function( InboxDismiss value)  dismiss,required TResult Function( InboxUndoApproval value)  undoApproval,}){
final _that = this;
switch (_that) {
case InboxLoad():
return load(_that);case InboxStageSelected():
return stageSelected(_that);case InboxScopeSelected():
return scopeSelected(_that);case InboxSelectionToggled():
return selectionToggled(_that);case InboxSelectionCleared():
return selectionCleared(_that);case InboxApprove():
return approve(_that);case InboxApproveSelected():
return approveSelected(_that);case InboxDismiss():
return dismiss(_that);case InboxUndoApproval():
return undoApproval(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InboxLoad value)?  load,TResult? Function( InboxStageSelected value)?  stageSelected,TResult? Function( InboxScopeSelected value)?  scopeSelected,TResult? Function( InboxSelectionToggled value)?  selectionToggled,TResult? Function( InboxSelectionCleared value)?  selectionCleared,TResult? Function( InboxApprove value)?  approve,TResult? Function( InboxApproveSelected value)?  approveSelected,TResult? Function( InboxDismiss value)?  dismiss,TResult? Function( InboxUndoApproval value)?  undoApproval,}){
final _that = this;
switch (_that) {
case InboxLoad() when load != null:
return load(_that);case InboxStageSelected() when stageSelected != null:
return stageSelected(_that);case InboxScopeSelected() when scopeSelected != null:
return scopeSelected(_that);case InboxSelectionToggled() when selectionToggled != null:
return selectionToggled(_that);case InboxSelectionCleared() when selectionCleared != null:
return selectionCleared(_that);case InboxApprove() when approve != null:
return approve(_that);case InboxApproveSelected() when approveSelected != null:
return approveSelected(_that);case InboxDismiss() when dismiss != null:
return dismiss(_that);case InboxUndoApproval() when undoApproval != null:
return undoApproval(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( InboxStage stage)?  stageSelected,TResult Function( InboxScope scope)?  scopeSelected,TResult Function( String itemId)?  selectionToggled,TResult Function()?  selectionCleared,TResult Function( String itemId)?  approve,TResult Function()?  approveSelected,TResult Function( String itemId)?  dismiss,TResult Function( String itemId)?  undoApproval,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InboxLoad() when load != null:
return load();case InboxStageSelected() when stageSelected != null:
return stageSelected(_that.stage);case InboxScopeSelected() when scopeSelected != null:
return scopeSelected(_that.scope);case InboxSelectionToggled() when selectionToggled != null:
return selectionToggled(_that.itemId);case InboxSelectionCleared() when selectionCleared != null:
return selectionCleared();case InboxApprove() when approve != null:
return approve(_that.itemId);case InboxApproveSelected() when approveSelected != null:
return approveSelected();case InboxDismiss() when dismiss != null:
return dismiss(_that.itemId);case InboxUndoApproval() when undoApproval != null:
return undoApproval(_that.itemId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( InboxStage stage)  stageSelected,required TResult Function( InboxScope scope)  scopeSelected,required TResult Function( String itemId)  selectionToggled,required TResult Function()  selectionCleared,required TResult Function( String itemId)  approve,required TResult Function()  approveSelected,required TResult Function( String itemId)  dismiss,required TResult Function( String itemId)  undoApproval,}) {final _that = this;
switch (_that) {
case InboxLoad():
return load();case InboxStageSelected():
return stageSelected(_that.stage);case InboxScopeSelected():
return scopeSelected(_that.scope);case InboxSelectionToggled():
return selectionToggled(_that.itemId);case InboxSelectionCleared():
return selectionCleared();case InboxApprove():
return approve(_that.itemId);case InboxApproveSelected():
return approveSelected();case InboxDismiss():
return dismiss(_that.itemId);case InboxUndoApproval():
return undoApproval(_that.itemId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( InboxStage stage)?  stageSelected,TResult? Function( InboxScope scope)?  scopeSelected,TResult? Function( String itemId)?  selectionToggled,TResult? Function()?  selectionCleared,TResult? Function( String itemId)?  approve,TResult? Function()?  approveSelected,TResult? Function( String itemId)?  dismiss,TResult? Function( String itemId)?  undoApproval,}) {final _that = this;
switch (_that) {
case InboxLoad() when load != null:
return load();case InboxStageSelected() when stageSelected != null:
return stageSelected(_that.stage);case InboxScopeSelected() when scopeSelected != null:
return scopeSelected(_that.scope);case InboxSelectionToggled() when selectionToggled != null:
return selectionToggled(_that.itemId);case InboxSelectionCleared() when selectionCleared != null:
return selectionCleared();case InboxApprove() when approve != null:
return approve(_that.itemId);case InboxApproveSelected() when approveSelected != null:
return approveSelected();case InboxDismiss() when dismiss != null:
return dismiss(_that.itemId);case InboxUndoApproval() when undoApproval != null:
return undoApproval(_that.itemId);case _:
  return null;

}
}

}

/// @nodoc


class InboxLoad implements InboxEvent {
  const InboxLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxEvent.load()';
}


}




/// @nodoc


class InboxStageSelected implements InboxEvent {
  const InboxStageSelected(this.stage);
  

 final  InboxStage stage;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxStageSelectedCopyWith<InboxStageSelected> get copyWith => _$InboxStageSelectedCopyWithImpl<InboxStageSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxStageSelected&&(identical(other.stage, stage) || other.stage == stage));
}


@override
int get hashCode => Object.hash(runtimeType,stage);

@override
String toString() {
  return 'InboxEvent.stageSelected(stage: $stage)';
}


}

/// @nodoc
abstract mixin class $InboxStageSelectedCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxStageSelectedCopyWith(InboxStageSelected value, $Res Function(InboxStageSelected) _then) = _$InboxStageSelectedCopyWithImpl;
@useResult
$Res call({
 InboxStage stage
});




}
/// @nodoc
class _$InboxStageSelectedCopyWithImpl<$Res>
    implements $InboxStageSelectedCopyWith<$Res> {
  _$InboxStageSelectedCopyWithImpl(this._self, this._then);

  final InboxStageSelected _self;
  final $Res Function(InboxStageSelected) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stage = null,}) {
  return _then(InboxStageSelected(
null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as InboxStage,
  ));
}


}

/// @nodoc


class InboxScopeSelected implements InboxEvent {
  const InboxScopeSelected(this.scope);
  

 final  InboxScope scope;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxScopeSelectedCopyWith<InboxScopeSelected> get copyWith => _$InboxScopeSelectedCopyWithImpl<InboxScopeSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxScopeSelected&&(identical(other.scope, scope) || other.scope == scope));
}


@override
int get hashCode => Object.hash(runtimeType,scope);

@override
String toString() {
  return 'InboxEvent.scopeSelected(scope: $scope)';
}


}

/// @nodoc
abstract mixin class $InboxScopeSelectedCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxScopeSelectedCopyWith(InboxScopeSelected value, $Res Function(InboxScopeSelected) _then) = _$InboxScopeSelectedCopyWithImpl;
@useResult
$Res call({
 InboxScope scope
});




}
/// @nodoc
class _$InboxScopeSelectedCopyWithImpl<$Res>
    implements $InboxScopeSelectedCopyWith<$Res> {
  _$InboxScopeSelectedCopyWithImpl(this._self, this._then);

  final InboxScopeSelected _self;
  final $Res Function(InboxScopeSelected) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scope = null,}) {
  return _then(InboxScopeSelected(
null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as InboxScope,
  ));
}


}

/// @nodoc


class InboxSelectionToggled implements InboxEvent {
  const InboxSelectionToggled(this.itemId);
  

 final  String itemId;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxSelectionToggledCopyWith<InboxSelectionToggled> get copyWith => _$InboxSelectionToggledCopyWithImpl<InboxSelectionToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxSelectionToggled&&(identical(other.itemId, itemId) || other.itemId == itemId));
}


@override
int get hashCode => Object.hash(runtimeType,itemId);

@override
String toString() {
  return 'InboxEvent.selectionToggled(itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class $InboxSelectionToggledCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxSelectionToggledCopyWith(InboxSelectionToggled value, $Res Function(InboxSelectionToggled) _then) = _$InboxSelectionToggledCopyWithImpl;
@useResult
$Res call({
 String itemId
});




}
/// @nodoc
class _$InboxSelectionToggledCopyWithImpl<$Res>
    implements $InboxSelectionToggledCopyWith<$Res> {
  _$InboxSelectionToggledCopyWithImpl(this._self, this._then);

  final InboxSelectionToggled _self;
  final $Res Function(InboxSelectionToggled) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,}) {
  return _then(InboxSelectionToggled(
null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InboxSelectionCleared implements InboxEvent {
  const InboxSelectionCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxSelectionCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxEvent.selectionCleared()';
}


}




/// @nodoc


class InboxApprove implements InboxEvent {
  const InboxApprove(this.itemId);
  

 final  String itemId;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxApproveCopyWith<InboxApprove> get copyWith => _$InboxApproveCopyWithImpl<InboxApprove>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxApprove&&(identical(other.itemId, itemId) || other.itemId == itemId));
}


@override
int get hashCode => Object.hash(runtimeType,itemId);

@override
String toString() {
  return 'InboxEvent.approve(itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class $InboxApproveCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxApproveCopyWith(InboxApprove value, $Res Function(InboxApprove) _then) = _$InboxApproveCopyWithImpl;
@useResult
$Res call({
 String itemId
});




}
/// @nodoc
class _$InboxApproveCopyWithImpl<$Res>
    implements $InboxApproveCopyWith<$Res> {
  _$InboxApproveCopyWithImpl(this._self, this._then);

  final InboxApprove _self;
  final $Res Function(InboxApprove) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,}) {
  return _then(InboxApprove(
null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InboxApproveSelected implements InboxEvent {
  const InboxApproveSelected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxApproveSelected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxEvent.approveSelected()';
}


}




/// @nodoc


class InboxDismiss implements InboxEvent {
  const InboxDismiss(this.itemId);
  

 final  String itemId;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxDismissCopyWith<InboxDismiss> get copyWith => _$InboxDismissCopyWithImpl<InboxDismiss>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxDismiss&&(identical(other.itemId, itemId) || other.itemId == itemId));
}


@override
int get hashCode => Object.hash(runtimeType,itemId);

@override
String toString() {
  return 'InboxEvent.dismiss(itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class $InboxDismissCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxDismissCopyWith(InboxDismiss value, $Res Function(InboxDismiss) _then) = _$InboxDismissCopyWithImpl;
@useResult
$Res call({
 String itemId
});




}
/// @nodoc
class _$InboxDismissCopyWithImpl<$Res>
    implements $InboxDismissCopyWith<$Res> {
  _$InboxDismissCopyWithImpl(this._self, this._then);

  final InboxDismiss _self;
  final $Res Function(InboxDismiss) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,}) {
  return _then(InboxDismiss(
null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InboxUndoApproval implements InboxEvent {
  const InboxUndoApproval(this.itemId);
  

 final  String itemId;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxUndoApprovalCopyWith<InboxUndoApproval> get copyWith => _$InboxUndoApprovalCopyWithImpl<InboxUndoApproval>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxUndoApproval&&(identical(other.itemId, itemId) || other.itemId == itemId));
}


@override
int get hashCode => Object.hash(runtimeType,itemId);

@override
String toString() {
  return 'InboxEvent.undoApproval(itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class $InboxUndoApprovalCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxUndoApprovalCopyWith(InboxUndoApproval value, $Res Function(InboxUndoApproval) _then) = _$InboxUndoApprovalCopyWithImpl;
@useResult
$Res call({
 String itemId
});




}
/// @nodoc
class _$InboxUndoApprovalCopyWithImpl<$Res>
    implements $InboxUndoApprovalCopyWith<$Res> {
  _$InboxUndoApprovalCopyWithImpl(this._self, this._then);

  final InboxUndoApproval _self;
  final $Res Function(InboxUndoApproval) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,}) {
  return _then(InboxUndoApproval(
null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$InboxState {

 List<ReviewItem> get items; InboxStage get stage; InboxScope get scope; Set<String> get selectedIds; bool get isReady;
/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxStateCopyWith<InboxState> get copyWith => _$InboxStateCopyWithImpl<InboxState>(this as InboxState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.scope, scope) || other.scope == scope)&&const DeepCollectionEquality().equals(other.selectedIds, selectedIds)&&(identical(other.isReady, isReady) || other.isReady == isReady));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),stage,scope,const DeepCollectionEquality().hash(selectedIds),isReady);

@override
String toString() {
  return 'InboxState(items: $items, stage: $stage, scope: $scope, selectedIds: $selectedIds, isReady: $isReady)';
}


}

/// @nodoc
abstract mixin class $InboxStateCopyWith<$Res>  {
  factory $InboxStateCopyWith(InboxState value, $Res Function(InboxState) _then) = _$InboxStateCopyWithImpl;
@useResult
$Res call({
 List<ReviewItem> items, InboxStage stage, InboxScope scope, Set<String> selectedIds, bool isReady
});




}
/// @nodoc
class _$InboxStateCopyWithImpl<$Res>
    implements $InboxStateCopyWith<$Res> {
  _$InboxStateCopyWithImpl(this._self, this._then);

  final InboxState _self;
  final $Res Function(InboxState) _then;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? stage = null,Object? scope = null,Object? selectedIds = null,Object? isReady = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReviewItem>,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as InboxStage,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as InboxScope,selectedIds: null == selectedIds ? _self.selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InboxState].
extension InboxStatePatterns on InboxState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxState value)  $default,){
final _that = this;
switch (_that) {
case _InboxState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxState value)?  $default,){
final _that = this;
switch (_that) {
case _InboxState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ReviewItem> items,  InboxStage stage,  InboxScope scope,  Set<String> selectedIds,  bool isReady)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxState() when $default != null:
return $default(_that.items,_that.stage,_that.scope,_that.selectedIds,_that.isReady);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ReviewItem> items,  InboxStage stage,  InboxScope scope,  Set<String> selectedIds,  bool isReady)  $default,) {final _that = this;
switch (_that) {
case _InboxState():
return $default(_that.items,_that.stage,_that.scope,_that.selectedIds,_that.isReady);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ReviewItem> items,  InboxStage stage,  InboxScope scope,  Set<String> selectedIds,  bool isReady)?  $default,) {final _that = this;
switch (_that) {
case _InboxState() when $default != null:
return $default(_that.items,_that.stage,_that.scope,_that.selectedIds,_that.isReady);case _:
  return null;

}
}

}

/// @nodoc


class _InboxState implements InboxState {
  const _InboxState({required final  List<ReviewItem> items, required this.stage, required this.scope, required final  Set<String> selectedIds, required this.isReady}): _items = items,_selectedIds = selectedIds;
  

 final  List<ReviewItem> _items;
@override List<ReviewItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  InboxStage stage;
@override final  InboxScope scope;
 final  Set<String> _selectedIds;
@override Set<String> get selectedIds {
  if (_selectedIds is EqualUnmodifiableSetView) return _selectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedIds);
}

@override final  bool isReady;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxStateCopyWith<_InboxState> get copyWith => __$InboxStateCopyWithImpl<_InboxState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.scope, scope) || other.scope == scope)&&const DeepCollectionEquality().equals(other._selectedIds, _selectedIds)&&(identical(other.isReady, isReady) || other.isReady == isReady));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),stage,scope,const DeepCollectionEquality().hash(_selectedIds),isReady);

@override
String toString() {
  return 'InboxState(items: $items, stage: $stage, scope: $scope, selectedIds: $selectedIds, isReady: $isReady)';
}


}

/// @nodoc
abstract mixin class _$InboxStateCopyWith<$Res> implements $InboxStateCopyWith<$Res> {
  factory _$InboxStateCopyWith(_InboxState value, $Res Function(_InboxState) _then) = __$InboxStateCopyWithImpl;
@override @useResult
$Res call({
 List<ReviewItem> items, InboxStage stage, InboxScope scope, Set<String> selectedIds, bool isReady
});




}
/// @nodoc
class __$InboxStateCopyWithImpl<$Res>
    implements _$InboxStateCopyWith<$Res> {
  __$InboxStateCopyWithImpl(this._self, this._then);

  final _InboxState _self;
  final $Res Function(_InboxState) _then;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? stage = null,Object? scope = null,Object? selectedIds = null,Object? isReady = null,}) {
  return _then(_InboxState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReviewItem>,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as InboxStage,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as InboxScope,selectedIds: null == selectedIds ? _self._selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
