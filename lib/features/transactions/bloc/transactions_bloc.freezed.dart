// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent()';
}


}

/// @nodoc
class $TransactionsEventCopyWith<$Res>  {
$TransactionsEventCopyWith(TransactionsEvent _, $Res Function(TransactionsEvent) __);
}


/// Adds pattern-matching-related methods to [TransactionsEvent].
extension TransactionsEventPatterns on TransactionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TransactionsLoad value)?  load,TResult Function( TransactionsSearchChanged value)?  searchChanged,TResult Function( TransactionsFilterChanged value)?  filterChanged,TResult Function( TransactionsSelectionToggled value)?  selectionToggled,TResult Function( TransactionsCorrectionApplied value)?  correctionApplied,TResult Function( TransactionsBulkCorrectionApplied value)?  bulkCorrectionApplied,TResult Function( TransactionsReconciliationConfirmed value)?  reconciliationConfirmed,TResult Function( TransactionsReconciliationDismissed value)?  reconciliationDismissed,TResult Function( TransactionsRuleCreated value)?  ruleCreated,TResult Function( TransactionsRuleDeleted value)?  ruleDeleted,TResult Function( TransactionsRuleTogglePaused value)?  ruleTogglePaused,TResult Function( TransactionsCategoryDraftStarted value)?  categoryDraftStarted,TResult Function( TransactionsCategoryDraftChanged value)?  categoryDraftChanged,TResult Function( TransactionsCategoryDraftSubmitted value)?  categoryDraftSubmitted,TResult Function( TransactionsCategoriesMerged value)?  categoriesMerged,TResult Function( TransactionsSubcategoryMoved value)?  subcategoryMoved,TResult Function( TransactionsCategoryArchived value)?  categoryArchived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TransactionsLoad() when load != null:
return load(_that);case TransactionsSearchChanged() when searchChanged != null:
return searchChanged(_that);case TransactionsFilterChanged() when filterChanged != null:
return filterChanged(_that);case TransactionsSelectionToggled() when selectionToggled != null:
return selectionToggled(_that);case TransactionsCorrectionApplied() when correctionApplied != null:
return correctionApplied(_that);case TransactionsBulkCorrectionApplied() when bulkCorrectionApplied != null:
return bulkCorrectionApplied(_that);case TransactionsReconciliationConfirmed() when reconciliationConfirmed != null:
return reconciliationConfirmed(_that);case TransactionsReconciliationDismissed() when reconciliationDismissed != null:
return reconciliationDismissed(_that);case TransactionsRuleCreated() when ruleCreated != null:
return ruleCreated(_that);case TransactionsRuleDeleted() when ruleDeleted != null:
return ruleDeleted(_that);case TransactionsRuleTogglePaused() when ruleTogglePaused != null:
return ruleTogglePaused(_that);case TransactionsCategoryDraftStarted() when categoryDraftStarted != null:
return categoryDraftStarted(_that);case TransactionsCategoryDraftChanged() when categoryDraftChanged != null:
return categoryDraftChanged(_that);case TransactionsCategoryDraftSubmitted() when categoryDraftSubmitted != null:
return categoryDraftSubmitted(_that);case TransactionsCategoriesMerged() when categoriesMerged != null:
return categoriesMerged(_that);case TransactionsSubcategoryMoved() when subcategoryMoved != null:
return subcategoryMoved(_that);case TransactionsCategoryArchived() when categoryArchived != null:
return categoryArchived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TransactionsLoad value)  load,required TResult Function( TransactionsSearchChanged value)  searchChanged,required TResult Function( TransactionsFilterChanged value)  filterChanged,required TResult Function( TransactionsSelectionToggled value)  selectionToggled,required TResult Function( TransactionsCorrectionApplied value)  correctionApplied,required TResult Function( TransactionsBulkCorrectionApplied value)  bulkCorrectionApplied,required TResult Function( TransactionsReconciliationConfirmed value)  reconciliationConfirmed,required TResult Function( TransactionsReconciliationDismissed value)  reconciliationDismissed,required TResult Function( TransactionsRuleCreated value)  ruleCreated,required TResult Function( TransactionsRuleDeleted value)  ruleDeleted,required TResult Function( TransactionsRuleTogglePaused value)  ruleTogglePaused,required TResult Function( TransactionsCategoryDraftStarted value)  categoryDraftStarted,required TResult Function( TransactionsCategoryDraftChanged value)  categoryDraftChanged,required TResult Function( TransactionsCategoryDraftSubmitted value)  categoryDraftSubmitted,required TResult Function( TransactionsCategoriesMerged value)  categoriesMerged,required TResult Function( TransactionsSubcategoryMoved value)  subcategoryMoved,required TResult Function( TransactionsCategoryArchived value)  categoryArchived,}){
final _that = this;
switch (_that) {
case TransactionsLoad():
return load(_that);case TransactionsSearchChanged():
return searchChanged(_that);case TransactionsFilterChanged():
return filterChanged(_that);case TransactionsSelectionToggled():
return selectionToggled(_that);case TransactionsCorrectionApplied():
return correctionApplied(_that);case TransactionsBulkCorrectionApplied():
return bulkCorrectionApplied(_that);case TransactionsReconciliationConfirmed():
return reconciliationConfirmed(_that);case TransactionsReconciliationDismissed():
return reconciliationDismissed(_that);case TransactionsRuleCreated():
return ruleCreated(_that);case TransactionsRuleDeleted():
return ruleDeleted(_that);case TransactionsRuleTogglePaused():
return ruleTogglePaused(_that);case TransactionsCategoryDraftStarted():
return categoryDraftStarted(_that);case TransactionsCategoryDraftChanged():
return categoryDraftChanged(_that);case TransactionsCategoryDraftSubmitted():
return categoryDraftSubmitted(_that);case TransactionsCategoriesMerged():
return categoriesMerged(_that);case TransactionsSubcategoryMoved():
return subcategoryMoved(_that);case TransactionsCategoryArchived():
return categoryArchived(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TransactionsLoad value)?  load,TResult? Function( TransactionsSearchChanged value)?  searchChanged,TResult? Function( TransactionsFilterChanged value)?  filterChanged,TResult? Function( TransactionsSelectionToggled value)?  selectionToggled,TResult? Function( TransactionsCorrectionApplied value)?  correctionApplied,TResult? Function( TransactionsBulkCorrectionApplied value)?  bulkCorrectionApplied,TResult? Function( TransactionsReconciliationConfirmed value)?  reconciliationConfirmed,TResult? Function( TransactionsReconciliationDismissed value)?  reconciliationDismissed,TResult? Function( TransactionsRuleCreated value)?  ruleCreated,TResult? Function( TransactionsRuleDeleted value)?  ruleDeleted,TResult? Function( TransactionsRuleTogglePaused value)?  ruleTogglePaused,TResult? Function( TransactionsCategoryDraftStarted value)?  categoryDraftStarted,TResult? Function( TransactionsCategoryDraftChanged value)?  categoryDraftChanged,TResult? Function( TransactionsCategoryDraftSubmitted value)?  categoryDraftSubmitted,TResult? Function( TransactionsCategoriesMerged value)?  categoriesMerged,TResult? Function( TransactionsSubcategoryMoved value)?  subcategoryMoved,TResult? Function( TransactionsCategoryArchived value)?  categoryArchived,}){
final _that = this;
switch (_that) {
case TransactionsLoad() when load != null:
return load(_that);case TransactionsSearchChanged() when searchChanged != null:
return searchChanged(_that);case TransactionsFilterChanged() when filterChanged != null:
return filterChanged(_that);case TransactionsSelectionToggled() when selectionToggled != null:
return selectionToggled(_that);case TransactionsCorrectionApplied() when correctionApplied != null:
return correctionApplied(_that);case TransactionsBulkCorrectionApplied() when bulkCorrectionApplied != null:
return bulkCorrectionApplied(_that);case TransactionsReconciliationConfirmed() when reconciliationConfirmed != null:
return reconciliationConfirmed(_that);case TransactionsReconciliationDismissed() when reconciliationDismissed != null:
return reconciliationDismissed(_that);case TransactionsRuleCreated() when ruleCreated != null:
return ruleCreated(_that);case TransactionsRuleDeleted() when ruleDeleted != null:
return ruleDeleted(_that);case TransactionsRuleTogglePaused() when ruleTogglePaused != null:
return ruleTogglePaused(_that);case TransactionsCategoryDraftStarted() when categoryDraftStarted != null:
return categoryDraftStarted(_that);case TransactionsCategoryDraftChanged() when categoryDraftChanged != null:
return categoryDraftChanged(_that);case TransactionsCategoryDraftSubmitted() when categoryDraftSubmitted != null:
return categoryDraftSubmitted(_that);case TransactionsCategoriesMerged() when categoriesMerged != null:
return categoriesMerged(_that);case TransactionsSubcategoryMoved() when subcategoryMoved != null:
return subcategoryMoved(_that);case TransactionsCategoryArchived() when categoryArchived != null:
return categoryArchived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isRefresh)?  load,TResult Function( String query)?  searchChanged,TResult Function( TransactionFilter filter)?  filterChanged,TResult Function( String id)?  selectionToggled,TResult Function( String transactionId,  String? categoryId,  TransactionTreatment? treatment)?  correctionApplied,TResult Function( String? categoryId,  TransactionTreatment? treatment)?  bulkCorrectionApplied,TResult Function( String candidateId)?  reconciliationConfirmed,TResult Function( String candidateId)?  reconciliationDismissed,TResult Function( MiaRule rule)?  ruleCreated,TResult Function( String ruleId)?  ruleDeleted,TResult Function( String ruleId,  bool paused)?  ruleTogglePaused,TResult Function()?  categoryDraftStarted,TResult Function( String? name,  int? colourIndex,  int? iconIndex,  String? parentId,  bool clearParent)?  categoryDraftChanged,TResult Function()?  categoryDraftSubmitted,TResult Function( String fromId,  String intoId)?  categoriesMerged,TResult Function( String categoryId,  String parentId)?  subcategoryMoved,TResult Function( String categoryId)?  categoryArchived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TransactionsLoad() when load != null:
return load(_that.isRefresh);case TransactionsSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case TransactionsFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case TransactionsSelectionToggled() when selectionToggled != null:
return selectionToggled(_that.id);case TransactionsCorrectionApplied() when correctionApplied != null:
return correctionApplied(_that.transactionId,_that.categoryId,_that.treatment);case TransactionsBulkCorrectionApplied() when bulkCorrectionApplied != null:
return bulkCorrectionApplied(_that.categoryId,_that.treatment);case TransactionsReconciliationConfirmed() when reconciliationConfirmed != null:
return reconciliationConfirmed(_that.candidateId);case TransactionsReconciliationDismissed() when reconciliationDismissed != null:
return reconciliationDismissed(_that.candidateId);case TransactionsRuleCreated() when ruleCreated != null:
return ruleCreated(_that.rule);case TransactionsRuleDeleted() when ruleDeleted != null:
return ruleDeleted(_that.ruleId);case TransactionsRuleTogglePaused() when ruleTogglePaused != null:
return ruleTogglePaused(_that.ruleId,_that.paused);case TransactionsCategoryDraftStarted() when categoryDraftStarted != null:
return categoryDraftStarted();case TransactionsCategoryDraftChanged() when categoryDraftChanged != null:
return categoryDraftChanged(_that.name,_that.colourIndex,_that.iconIndex,_that.parentId,_that.clearParent);case TransactionsCategoryDraftSubmitted() when categoryDraftSubmitted != null:
return categoryDraftSubmitted();case TransactionsCategoriesMerged() when categoriesMerged != null:
return categoriesMerged(_that.fromId,_that.intoId);case TransactionsSubcategoryMoved() when subcategoryMoved != null:
return subcategoryMoved(_that.categoryId,_that.parentId);case TransactionsCategoryArchived() when categoryArchived != null:
return categoryArchived(_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isRefresh)  load,required TResult Function( String query)  searchChanged,required TResult Function( TransactionFilter filter)  filterChanged,required TResult Function( String id)  selectionToggled,required TResult Function( String transactionId,  String? categoryId,  TransactionTreatment? treatment)  correctionApplied,required TResult Function( String? categoryId,  TransactionTreatment? treatment)  bulkCorrectionApplied,required TResult Function( String candidateId)  reconciliationConfirmed,required TResult Function( String candidateId)  reconciliationDismissed,required TResult Function( MiaRule rule)  ruleCreated,required TResult Function( String ruleId)  ruleDeleted,required TResult Function( String ruleId,  bool paused)  ruleTogglePaused,required TResult Function()  categoryDraftStarted,required TResult Function( String? name,  int? colourIndex,  int? iconIndex,  String? parentId,  bool clearParent)  categoryDraftChanged,required TResult Function()  categoryDraftSubmitted,required TResult Function( String fromId,  String intoId)  categoriesMerged,required TResult Function( String categoryId,  String parentId)  subcategoryMoved,required TResult Function( String categoryId)  categoryArchived,}) {final _that = this;
switch (_that) {
case TransactionsLoad():
return load(_that.isRefresh);case TransactionsSearchChanged():
return searchChanged(_that.query);case TransactionsFilterChanged():
return filterChanged(_that.filter);case TransactionsSelectionToggled():
return selectionToggled(_that.id);case TransactionsCorrectionApplied():
return correctionApplied(_that.transactionId,_that.categoryId,_that.treatment);case TransactionsBulkCorrectionApplied():
return bulkCorrectionApplied(_that.categoryId,_that.treatment);case TransactionsReconciliationConfirmed():
return reconciliationConfirmed(_that.candidateId);case TransactionsReconciliationDismissed():
return reconciliationDismissed(_that.candidateId);case TransactionsRuleCreated():
return ruleCreated(_that.rule);case TransactionsRuleDeleted():
return ruleDeleted(_that.ruleId);case TransactionsRuleTogglePaused():
return ruleTogglePaused(_that.ruleId,_that.paused);case TransactionsCategoryDraftStarted():
return categoryDraftStarted();case TransactionsCategoryDraftChanged():
return categoryDraftChanged(_that.name,_that.colourIndex,_that.iconIndex,_that.parentId,_that.clearParent);case TransactionsCategoryDraftSubmitted():
return categoryDraftSubmitted();case TransactionsCategoriesMerged():
return categoriesMerged(_that.fromId,_that.intoId);case TransactionsSubcategoryMoved():
return subcategoryMoved(_that.categoryId,_that.parentId);case TransactionsCategoryArchived():
return categoryArchived(_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isRefresh)?  load,TResult? Function( String query)?  searchChanged,TResult? Function( TransactionFilter filter)?  filterChanged,TResult? Function( String id)?  selectionToggled,TResult? Function( String transactionId,  String? categoryId,  TransactionTreatment? treatment)?  correctionApplied,TResult? Function( String? categoryId,  TransactionTreatment? treatment)?  bulkCorrectionApplied,TResult? Function( String candidateId)?  reconciliationConfirmed,TResult? Function( String candidateId)?  reconciliationDismissed,TResult? Function( MiaRule rule)?  ruleCreated,TResult? Function( String ruleId)?  ruleDeleted,TResult? Function( String ruleId,  bool paused)?  ruleTogglePaused,TResult? Function()?  categoryDraftStarted,TResult? Function( String? name,  int? colourIndex,  int? iconIndex,  String? parentId,  bool clearParent)?  categoryDraftChanged,TResult? Function()?  categoryDraftSubmitted,TResult? Function( String fromId,  String intoId)?  categoriesMerged,TResult? Function( String categoryId,  String parentId)?  subcategoryMoved,TResult? Function( String categoryId)?  categoryArchived,}) {final _that = this;
switch (_that) {
case TransactionsLoad() when load != null:
return load(_that.isRefresh);case TransactionsSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case TransactionsFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case TransactionsSelectionToggled() when selectionToggled != null:
return selectionToggled(_that.id);case TransactionsCorrectionApplied() when correctionApplied != null:
return correctionApplied(_that.transactionId,_that.categoryId,_that.treatment);case TransactionsBulkCorrectionApplied() when bulkCorrectionApplied != null:
return bulkCorrectionApplied(_that.categoryId,_that.treatment);case TransactionsReconciliationConfirmed() when reconciliationConfirmed != null:
return reconciliationConfirmed(_that.candidateId);case TransactionsReconciliationDismissed() when reconciliationDismissed != null:
return reconciliationDismissed(_that.candidateId);case TransactionsRuleCreated() when ruleCreated != null:
return ruleCreated(_that.rule);case TransactionsRuleDeleted() when ruleDeleted != null:
return ruleDeleted(_that.ruleId);case TransactionsRuleTogglePaused() when ruleTogglePaused != null:
return ruleTogglePaused(_that.ruleId,_that.paused);case TransactionsCategoryDraftStarted() when categoryDraftStarted != null:
return categoryDraftStarted();case TransactionsCategoryDraftChanged() when categoryDraftChanged != null:
return categoryDraftChanged(_that.name,_that.colourIndex,_that.iconIndex,_that.parentId,_that.clearParent);case TransactionsCategoryDraftSubmitted() when categoryDraftSubmitted != null:
return categoryDraftSubmitted();case TransactionsCategoriesMerged() when categoriesMerged != null:
return categoriesMerged(_that.fromId,_that.intoId);case TransactionsSubcategoryMoved() when subcategoryMoved != null:
return subcategoryMoved(_that.categoryId,_that.parentId);case TransactionsCategoryArchived() when categoryArchived != null:
return categoryArchived(_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc


class TransactionsLoad implements TransactionsEvent {
  const TransactionsLoad({this.isRefresh = false});
  

@JsonKey() final  bool isRefresh;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsLoadCopyWith<TransactionsLoad> get copyWith => _$TransactionsLoadCopyWithImpl<TransactionsLoad>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsLoad&&(identical(other.isRefresh, isRefresh) || other.isRefresh == isRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,isRefresh);

@override
String toString() {
  return 'TransactionsEvent.load(isRefresh: $isRefresh)';
}


}

/// @nodoc
abstract mixin class $TransactionsLoadCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsLoadCopyWith(TransactionsLoad value, $Res Function(TransactionsLoad) _then) = _$TransactionsLoadCopyWithImpl;
@useResult
$Res call({
 bool isRefresh
});




}
/// @nodoc
class _$TransactionsLoadCopyWithImpl<$Res>
    implements $TransactionsLoadCopyWith<$Res> {
  _$TransactionsLoadCopyWithImpl(this._self, this._then);

  final TransactionsLoad _self;
  final $Res Function(TransactionsLoad) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isRefresh = null,}) {
  return _then(TransactionsLoad(
isRefresh: null == isRefresh ? _self.isRefresh : isRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TransactionsSearchChanged implements TransactionsEvent {
  const TransactionsSearchChanged(this.query);
  

 final  String query;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsSearchChangedCopyWith<TransactionsSearchChanged> get copyWith => _$TransactionsSearchChangedCopyWithImpl<TransactionsSearchChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsSearchChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'TransactionsEvent.searchChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $TransactionsSearchChangedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsSearchChangedCopyWith(TransactionsSearchChanged value, $Res Function(TransactionsSearchChanged) _then) = _$TransactionsSearchChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$TransactionsSearchChangedCopyWithImpl<$Res>
    implements $TransactionsSearchChangedCopyWith<$Res> {
  _$TransactionsSearchChangedCopyWithImpl(this._self, this._then);

  final TransactionsSearchChanged _self;
  final $Res Function(TransactionsSearchChanged) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(TransactionsSearchChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TransactionsFilterChanged implements TransactionsEvent {
  const TransactionsFilterChanged(this.filter);
  

 final  TransactionFilter filter;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsFilterChangedCopyWith<TransactionsFilterChanged> get copyWith => _$TransactionsFilterChangedCopyWithImpl<TransactionsFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsFilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'TransactionsEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $TransactionsFilterChangedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsFilterChangedCopyWith(TransactionsFilterChanged value, $Res Function(TransactionsFilterChanged) _then) = _$TransactionsFilterChangedCopyWithImpl;
@useResult
$Res call({
 TransactionFilter filter
});




}
/// @nodoc
class _$TransactionsFilterChangedCopyWithImpl<$Res>
    implements $TransactionsFilterChangedCopyWith<$Res> {
  _$TransactionsFilterChangedCopyWithImpl(this._self, this._then);

  final TransactionsFilterChanged _self;
  final $Res Function(TransactionsFilterChanged) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(TransactionsFilterChanged(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as TransactionFilter,
  ));
}


}

/// @nodoc


class TransactionsSelectionToggled implements TransactionsEvent {
  const TransactionsSelectionToggled(this.id);
  

 final  String id;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsSelectionToggledCopyWith<TransactionsSelectionToggled> get copyWith => _$TransactionsSelectionToggledCopyWithImpl<TransactionsSelectionToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsSelectionToggled&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TransactionsEvent.selectionToggled(id: $id)';
}


}

/// @nodoc
abstract mixin class $TransactionsSelectionToggledCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsSelectionToggledCopyWith(TransactionsSelectionToggled value, $Res Function(TransactionsSelectionToggled) _then) = _$TransactionsSelectionToggledCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$TransactionsSelectionToggledCopyWithImpl<$Res>
    implements $TransactionsSelectionToggledCopyWith<$Res> {
  _$TransactionsSelectionToggledCopyWithImpl(this._self, this._then);

  final TransactionsSelectionToggled _self;
  final $Res Function(TransactionsSelectionToggled) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(TransactionsSelectionToggled(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TransactionsCorrectionApplied implements TransactionsEvent {
  const TransactionsCorrectionApplied({required this.transactionId, this.categoryId, this.treatment});
  

 final  String transactionId;
 final  String? categoryId;
 final  TransactionTreatment? treatment;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsCorrectionAppliedCopyWith<TransactionsCorrectionApplied> get copyWith => _$TransactionsCorrectionAppliedCopyWithImpl<TransactionsCorrectionApplied>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsCorrectionApplied&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.treatment, treatment) || other.treatment == treatment));
}


@override
int get hashCode => Object.hash(runtimeType,transactionId,categoryId,treatment);

@override
String toString() {
  return 'TransactionsEvent.correctionApplied(transactionId: $transactionId, categoryId: $categoryId, treatment: $treatment)';
}


}

/// @nodoc
abstract mixin class $TransactionsCorrectionAppliedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsCorrectionAppliedCopyWith(TransactionsCorrectionApplied value, $Res Function(TransactionsCorrectionApplied) _then) = _$TransactionsCorrectionAppliedCopyWithImpl;
@useResult
$Res call({
 String transactionId, String? categoryId, TransactionTreatment? treatment
});




}
/// @nodoc
class _$TransactionsCorrectionAppliedCopyWithImpl<$Res>
    implements $TransactionsCorrectionAppliedCopyWith<$Res> {
  _$TransactionsCorrectionAppliedCopyWithImpl(this._self, this._then);

  final TransactionsCorrectionApplied _self;
  final $Res Function(TransactionsCorrectionApplied) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? categoryId = freezed,Object? treatment = freezed,}) {
  return _then(TransactionsCorrectionApplied(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,treatment: freezed == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as TransactionTreatment?,
  ));
}


}

/// @nodoc


class TransactionsBulkCorrectionApplied implements TransactionsEvent {
  const TransactionsBulkCorrectionApplied({this.categoryId, this.treatment});
  

 final  String? categoryId;
 final  TransactionTreatment? treatment;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsBulkCorrectionAppliedCopyWith<TransactionsBulkCorrectionApplied> get copyWith => _$TransactionsBulkCorrectionAppliedCopyWithImpl<TransactionsBulkCorrectionApplied>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsBulkCorrectionApplied&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.treatment, treatment) || other.treatment == treatment));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,treatment);

@override
String toString() {
  return 'TransactionsEvent.bulkCorrectionApplied(categoryId: $categoryId, treatment: $treatment)';
}


}

/// @nodoc
abstract mixin class $TransactionsBulkCorrectionAppliedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsBulkCorrectionAppliedCopyWith(TransactionsBulkCorrectionApplied value, $Res Function(TransactionsBulkCorrectionApplied) _then) = _$TransactionsBulkCorrectionAppliedCopyWithImpl;
@useResult
$Res call({
 String? categoryId, TransactionTreatment? treatment
});




}
/// @nodoc
class _$TransactionsBulkCorrectionAppliedCopyWithImpl<$Res>
    implements $TransactionsBulkCorrectionAppliedCopyWith<$Res> {
  _$TransactionsBulkCorrectionAppliedCopyWithImpl(this._self, this._then);

  final TransactionsBulkCorrectionApplied _self;
  final $Res Function(TransactionsBulkCorrectionApplied) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,Object? treatment = freezed,}) {
  return _then(TransactionsBulkCorrectionApplied(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,treatment: freezed == treatment ? _self.treatment : treatment // ignore: cast_nullable_to_non_nullable
as TransactionTreatment?,
  ));
}


}

/// @nodoc


class TransactionsReconciliationConfirmed implements TransactionsEvent {
  const TransactionsReconciliationConfirmed(this.candidateId);
  

 final  String candidateId;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsReconciliationConfirmedCopyWith<TransactionsReconciliationConfirmed> get copyWith => _$TransactionsReconciliationConfirmedCopyWithImpl<TransactionsReconciliationConfirmed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsReconciliationConfirmed&&(identical(other.candidateId, candidateId) || other.candidateId == candidateId));
}


@override
int get hashCode => Object.hash(runtimeType,candidateId);

@override
String toString() {
  return 'TransactionsEvent.reconciliationConfirmed(candidateId: $candidateId)';
}


}

/// @nodoc
abstract mixin class $TransactionsReconciliationConfirmedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsReconciliationConfirmedCopyWith(TransactionsReconciliationConfirmed value, $Res Function(TransactionsReconciliationConfirmed) _then) = _$TransactionsReconciliationConfirmedCopyWithImpl;
@useResult
$Res call({
 String candidateId
});




}
/// @nodoc
class _$TransactionsReconciliationConfirmedCopyWithImpl<$Res>
    implements $TransactionsReconciliationConfirmedCopyWith<$Res> {
  _$TransactionsReconciliationConfirmedCopyWithImpl(this._self, this._then);

  final TransactionsReconciliationConfirmed _self;
  final $Res Function(TransactionsReconciliationConfirmed) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? candidateId = null,}) {
  return _then(TransactionsReconciliationConfirmed(
null == candidateId ? _self.candidateId : candidateId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TransactionsReconciliationDismissed implements TransactionsEvent {
  const TransactionsReconciliationDismissed(this.candidateId);
  

 final  String candidateId;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsReconciliationDismissedCopyWith<TransactionsReconciliationDismissed> get copyWith => _$TransactionsReconciliationDismissedCopyWithImpl<TransactionsReconciliationDismissed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsReconciliationDismissed&&(identical(other.candidateId, candidateId) || other.candidateId == candidateId));
}


@override
int get hashCode => Object.hash(runtimeType,candidateId);

@override
String toString() {
  return 'TransactionsEvent.reconciliationDismissed(candidateId: $candidateId)';
}


}

/// @nodoc
abstract mixin class $TransactionsReconciliationDismissedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsReconciliationDismissedCopyWith(TransactionsReconciliationDismissed value, $Res Function(TransactionsReconciliationDismissed) _then) = _$TransactionsReconciliationDismissedCopyWithImpl;
@useResult
$Res call({
 String candidateId
});




}
/// @nodoc
class _$TransactionsReconciliationDismissedCopyWithImpl<$Res>
    implements $TransactionsReconciliationDismissedCopyWith<$Res> {
  _$TransactionsReconciliationDismissedCopyWithImpl(this._self, this._then);

  final TransactionsReconciliationDismissed _self;
  final $Res Function(TransactionsReconciliationDismissed) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? candidateId = null,}) {
  return _then(TransactionsReconciliationDismissed(
null == candidateId ? _self.candidateId : candidateId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TransactionsRuleCreated implements TransactionsEvent {
  const TransactionsRuleCreated(this.rule);
  

 final  MiaRule rule;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsRuleCreatedCopyWith<TransactionsRuleCreated> get copyWith => _$TransactionsRuleCreatedCopyWithImpl<TransactionsRuleCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsRuleCreated&&(identical(other.rule, rule) || other.rule == rule));
}


@override
int get hashCode => Object.hash(runtimeType,rule);

@override
String toString() {
  return 'TransactionsEvent.ruleCreated(rule: $rule)';
}


}

/// @nodoc
abstract mixin class $TransactionsRuleCreatedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsRuleCreatedCopyWith(TransactionsRuleCreated value, $Res Function(TransactionsRuleCreated) _then) = _$TransactionsRuleCreatedCopyWithImpl;
@useResult
$Res call({
 MiaRule rule
});




}
/// @nodoc
class _$TransactionsRuleCreatedCopyWithImpl<$Res>
    implements $TransactionsRuleCreatedCopyWith<$Res> {
  _$TransactionsRuleCreatedCopyWithImpl(this._self, this._then);

  final TransactionsRuleCreated _self;
  final $Res Function(TransactionsRuleCreated) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rule = null,}) {
  return _then(TransactionsRuleCreated(
null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as MiaRule,
  ));
}


}

/// @nodoc


class TransactionsRuleDeleted implements TransactionsEvent {
  const TransactionsRuleDeleted(this.ruleId);
  

 final  String ruleId;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsRuleDeletedCopyWith<TransactionsRuleDeleted> get copyWith => _$TransactionsRuleDeletedCopyWithImpl<TransactionsRuleDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsRuleDeleted&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId));
}


@override
int get hashCode => Object.hash(runtimeType,ruleId);

@override
String toString() {
  return 'TransactionsEvent.ruleDeleted(ruleId: $ruleId)';
}


}

/// @nodoc
abstract mixin class $TransactionsRuleDeletedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsRuleDeletedCopyWith(TransactionsRuleDeleted value, $Res Function(TransactionsRuleDeleted) _then) = _$TransactionsRuleDeletedCopyWithImpl;
@useResult
$Res call({
 String ruleId
});




}
/// @nodoc
class _$TransactionsRuleDeletedCopyWithImpl<$Res>
    implements $TransactionsRuleDeletedCopyWith<$Res> {
  _$TransactionsRuleDeletedCopyWithImpl(this._self, this._then);

  final TransactionsRuleDeleted _self;
  final $Res Function(TransactionsRuleDeleted) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ruleId = null,}) {
  return _then(TransactionsRuleDeleted(
null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TransactionsRuleTogglePaused implements TransactionsEvent {
  const TransactionsRuleTogglePaused({required this.ruleId, required this.paused});
  

 final  String ruleId;
 final  bool paused;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsRuleTogglePausedCopyWith<TransactionsRuleTogglePaused> get copyWith => _$TransactionsRuleTogglePausedCopyWithImpl<TransactionsRuleTogglePaused>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsRuleTogglePaused&&(identical(other.ruleId, ruleId) || other.ruleId == ruleId)&&(identical(other.paused, paused) || other.paused == paused));
}


@override
int get hashCode => Object.hash(runtimeType,ruleId,paused);

@override
String toString() {
  return 'TransactionsEvent.ruleTogglePaused(ruleId: $ruleId, paused: $paused)';
}


}

/// @nodoc
abstract mixin class $TransactionsRuleTogglePausedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsRuleTogglePausedCopyWith(TransactionsRuleTogglePaused value, $Res Function(TransactionsRuleTogglePaused) _then) = _$TransactionsRuleTogglePausedCopyWithImpl;
@useResult
$Res call({
 String ruleId, bool paused
});




}
/// @nodoc
class _$TransactionsRuleTogglePausedCopyWithImpl<$Res>
    implements $TransactionsRuleTogglePausedCopyWith<$Res> {
  _$TransactionsRuleTogglePausedCopyWithImpl(this._self, this._then);

  final TransactionsRuleTogglePaused _self;
  final $Res Function(TransactionsRuleTogglePaused) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ruleId = null,Object? paused = null,}) {
  return _then(TransactionsRuleTogglePaused(
ruleId: null == ruleId ? _self.ruleId : ruleId // ignore: cast_nullable_to_non_nullable
as String,paused: null == paused ? _self.paused : paused // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TransactionsCategoryDraftStarted implements TransactionsEvent {
  const TransactionsCategoryDraftStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsCategoryDraftStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent.categoryDraftStarted()';
}


}




/// @nodoc


class TransactionsCategoryDraftChanged implements TransactionsEvent {
  const TransactionsCategoryDraftChanged({this.name, this.colourIndex, this.iconIndex, this.parentId, this.clearParent = false});
  

 final  String? name;
 final  int? colourIndex;
 final  int? iconIndex;
 final  String? parentId;
@JsonKey() final  bool clearParent;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsCategoryDraftChangedCopyWith<TransactionsCategoryDraftChanged> get copyWith => _$TransactionsCategoryDraftChangedCopyWithImpl<TransactionsCategoryDraftChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsCategoryDraftChanged&&(identical(other.name, name) || other.name == name)&&(identical(other.colourIndex, colourIndex) || other.colourIndex == colourIndex)&&(identical(other.iconIndex, iconIndex) || other.iconIndex == iconIndex)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.clearParent, clearParent) || other.clearParent == clearParent));
}


@override
int get hashCode => Object.hash(runtimeType,name,colourIndex,iconIndex,parentId,clearParent);

@override
String toString() {
  return 'TransactionsEvent.categoryDraftChanged(name: $name, colourIndex: $colourIndex, iconIndex: $iconIndex, parentId: $parentId, clearParent: $clearParent)';
}


}

/// @nodoc
abstract mixin class $TransactionsCategoryDraftChangedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsCategoryDraftChangedCopyWith(TransactionsCategoryDraftChanged value, $Res Function(TransactionsCategoryDraftChanged) _then) = _$TransactionsCategoryDraftChangedCopyWithImpl;
@useResult
$Res call({
 String? name, int? colourIndex, int? iconIndex, String? parentId, bool clearParent
});




}
/// @nodoc
class _$TransactionsCategoryDraftChangedCopyWithImpl<$Res>
    implements $TransactionsCategoryDraftChangedCopyWith<$Res> {
  _$TransactionsCategoryDraftChangedCopyWithImpl(this._self, this._then);

  final TransactionsCategoryDraftChanged _self;
  final $Res Function(TransactionsCategoryDraftChanged) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? colourIndex = freezed,Object? iconIndex = freezed,Object? parentId = freezed,Object? clearParent = null,}) {
  return _then(TransactionsCategoryDraftChanged(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,colourIndex: freezed == colourIndex ? _self.colourIndex : colourIndex // ignore: cast_nullable_to_non_nullable
as int?,iconIndex: freezed == iconIndex ? _self.iconIndex : iconIndex // ignore: cast_nullable_to_non_nullable
as int?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,clearParent: null == clearParent ? _self.clearParent : clearParent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TransactionsCategoryDraftSubmitted implements TransactionsEvent {
  const TransactionsCategoryDraftSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsCategoryDraftSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionsEvent.categoryDraftSubmitted()';
}


}




/// @nodoc


class TransactionsCategoriesMerged implements TransactionsEvent {
  const TransactionsCategoriesMerged({required this.fromId, required this.intoId});
  

 final  String fromId;
 final  String intoId;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsCategoriesMergedCopyWith<TransactionsCategoriesMerged> get copyWith => _$TransactionsCategoriesMergedCopyWithImpl<TransactionsCategoriesMerged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsCategoriesMerged&&(identical(other.fromId, fromId) || other.fromId == fromId)&&(identical(other.intoId, intoId) || other.intoId == intoId));
}


@override
int get hashCode => Object.hash(runtimeType,fromId,intoId);

@override
String toString() {
  return 'TransactionsEvent.categoriesMerged(fromId: $fromId, intoId: $intoId)';
}


}

/// @nodoc
abstract mixin class $TransactionsCategoriesMergedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsCategoriesMergedCopyWith(TransactionsCategoriesMerged value, $Res Function(TransactionsCategoriesMerged) _then) = _$TransactionsCategoriesMergedCopyWithImpl;
@useResult
$Res call({
 String fromId, String intoId
});




}
/// @nodoc
class _$TransactionsCategoriesMergedCopyWithImpl<$Res>
    implements $TransactionsCategoriesMergedCopyWith<$Res> {
  _$TransactionsCategoriesMergedCopyWithImpl(this._self, this._then);

  final TransactionsCategoriesMerged _self;
  final $Res Function(TransactionsCategoriesMerged) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fromId = null,Object? intoId = null,}) {
  return _then(TransactionsCategoriesMerged(
fromId: null == fromId ? _self.fromId : fromId // ignore: cast_nullable_to_non_nullable
as String,intoId: null == intoId ? _self.intoId : intoId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TransactionsSubcategoryMoved implements TransactionsEvent {
  const TransactionsSubcategoryMoved({required this.categoryId, required this.parentId});
  

 final  String categoryId;
 final  String parentId;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsSubcategoryMovedCopyWith<TransactionsSubcategoryMoved> get copyWith => _$TransactionsSubcategoryMovedCopyWithImpl<TransactionsSubcategoryMoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsSubcategoryMoved&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,parentId);

@override
String toString() {
  return 'TransactionsEvent.subcategoryMoved(categoryId: $categoryId, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class $TransactionsSubcategoryMovedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsSubcategoryMovedCopyWith(TransactionsSubcategoryMoved value, $Res Function(TransactionsSubcategoryMoved) _then) = _$TransactionsSubcategoryMovedCopyWithImpl;
@useResult
$Res call({
 String categoryId, String parentId
});




}
/// @nodoc
class _$TransactionsSubcategoryMovedCopyWithImpl<$Res>
    implements $TransactionsSubcategoryMovedCopyWith<$Res> {
  _$TransactionsSubcategoryMovedCopyWithImpl(this._self, this._then);

  final TransactionsSubcategoryMoved _self;
  final $Res Function(TransactionsSubcategoryMoved) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? parentId = null,}) {
  return _then(TransactionsSubcategoryMoved(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,parentId: null == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TransactionsCategoryArchived implements TransactionsEvent {
  const TransactionsCategoryArchived(this.categoryId);
  

 final  String categoryId;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsCategoryArchivedCopyWith<TransactionsCategoryArchived> get copyWith => _$TransactionsCategoryArchivedCopyWithImpl<TransactionsCategoryArchived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsCategoryArchived&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'TransactionsEvent.categoryArchived(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $TransactionsCategoryArchivedCopyWith<$Res> implements $TransactionsEventCopyWith<$Res> {
  factory $TransactionsCategoryArchivedCopyWith(TransactionsCategoryArchived value, $Res Function(TransactionsCategoryArchived) _then) = _$TransactionsCategoryArchivedCopyWithImpl;
@useResult
$Res call({
 String categoryId
});




}
/// @nodoc
class _$TransactionsCategoryArchivedCopyWithImpl<$Res>
    implements $TransactionsCategoryArchivedCopyWith<$Res> {
  _$TransactionsCategoryArchivedCopyWithImpl(this._self, this._then);

  final TransactionsCategoryArchived _self;
  final $Res Function(TransactionsCategoryArchived) _then;

/// Create a copy of TransactionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(TransactionsCategoryArchived(
null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$TransactionsState {

 List<MiaTransaction> get transactions; List<MiaCategory> get categories; List<MiaRule> get rules; List<ReconciliationCandidate> get candidates; String get query; TransactionFilter get filter; Set<String> get selectedIds; int get currentPage; int get lastPage; bool get isReady; RefreshController get refreshController; String get categoryDraftName; int get categoryDraftColourIndex; int get categoryDraftIconIndex; String? get categoryDraftParentId; String? get lastCorrectionId; MiaCategory? get createdCategory;
/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsStateCopyWith<TransactionsState> get copyWith => _$TransactionsStateCopyWithImpl<TransactionsState>(this as TransactionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsState&&const DeepCollectionEquality().equals(other.transactions, transactions)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.rules, rules)&&const DeepCollectionEquality().equals(other.candidates, candidates)&&(identical(other.query, query) || other.query == query)&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other.selectedIds, selectedIds)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.refreshController, refreshController) || other.refreshController == refreshController)&&(identical(other.categoryDraftName, categoryDraftName) || other.categoryDraftName == categoryDraftName)&&(identical(other.categoryDraftColourIndex, categoryDraftColourIndex) || other.categoryDraftColourIndex == categoryDraftColourIndex)&&(identical(other.categoryDraftIconIndex, categoryDraftIconIndex) || other.categoryDraftIconIndex == categoryDraftIconIndex)&&(identical(other.categoryDraftParentId, categoryDraftParentId) || other.categoryDraftParentId == categoryDraftParentId)&&(identical(other.lastCorrectionId, lastCorrectionId) || other.lastCorrectionId == lastCorrectionId)&&(identical(other.createdCategory, createdCategory) || other.createdCategory == createdCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(transactions),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(rules),const DeepCollectionEquality().hash(candidates),query,filter,const DeepCollectionEquality().hash(selectedIds),currentPage,lastPage,isReady,refreshController,categoryDraftName,categoryDraftColourIndex,categoryDraftIconIndex,categoryDraftParentId,lastCorrectionId,createdCategory);

@override
String toString() {
  return 'TransactionsState(transactions: $transactions, categories: $categories, rules: $rules, candidates: $candidates, query: $query, filter: $filter, selectedIds: $selectedIds, currentPage: $currentPage, lastPage: $lastPage, isReady: $isReady, refreshController: $refreshController, categoryDraftName: $categoryDraftName, categoryDraftColourIndex: $categoryDraftColourIndex, categoryDraftIconIndex: $categoryDraftIconIndex, categoryDraftParentId: $categoryDraftParentId, lastCorrectionId: $lastCorrectionId, createdCategory: $createdCategory)';
}


}

/// @nodoc
abstract mixin class $TransactionsStateCopyWith<$Res>  {
  factory $TransactionsStateCopyWith(TransactionsState value, $Res Function(TransactionsState) _then) = _$TransactionsStateCopyWithImpl;
@useResult
$Res call({
 List<MiaTransaction> transactions, List<MiaCategory> categories, List<MiaRule> rules, List<ReconciliationCandidate> candidates, String query, TransactionFilter filter, Set<String> selectedIds, int currentPage, int lastPage, bool isReady, RefreshController refreshController, String categoryDraftName, int categoryDraftColourIndex, int categoryDraftIconIndex, String? categoryDraftParentId, String? lastCorrectionId, MiaCategory? createdCategory
});




}
/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._self, this._then);

  final TransactionsState _self;
  final $Res Function(TransactionsState) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactions = null,Object? categories = null,Object? rules = null,Object? candidates = null,Object? query = null,Object? filter = null,Object? selectedIds = null,Object? currentPage = null,Object? lastPage = null,Object? isReady = null,Object? refreshController = null,Object? categoryDraftName = null,Object? categoryDraftColourIndex = null,Object? categoryDraftIconIndex = null,Object? categoryDraftParentId = freezed,Object? lastCorrectionId = freezed,Object? createdCategory = freezed,}) {
  return _then(_self.copyWith(
transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<MiaTransaction>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<MiaCategory>,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as List<MiaRule>,candidates: null == candidates ? _self.candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<ReconciliationCandidate>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as TransactionFilter,selectedIds: null == selectedIds ? _self.selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,refreshController: null == refreshController ? _self.refreshController : refreshController // ignore: cast_nullable_to_non_nullable
as RefreshController,categoryDraftName: null == categoryDraftName ? _self.categoryDraftName : categoryDraftName // ignore: cast_nullable_to_non_nullable
as String,categoryDraftColourIndex: null == categoryDraftColourIndex ? _self.categoryDraftColourIndex : categoryDraftColourIndex // ignore: cast_nullable_to_non_nullable
as int,categoryDraftIconIndex: null == categoryDraftIconIndex ? _self.categoryDraftIconIndex : categoryDraftIconIndex // ignore: cast_nullable_to_non_nullable
as int,categoryDraftParentId: freezed == categoryDraftParentId ? _self.categoryDraftParentId : categoryDraftParentId // ignore: cast_nullable_to_non_nullable
as String?,lastCorrectionId: freezed == lastCorrectionId ? _self.lastCorrectionId : lastCorrectionId // ignore: cast_nullable_to_non_nullable
as String?,createdCategory: freezed == createdCategory ? _self.createdCategory : createdCategory // ignore: cast_nullable_to_non_nullable
as MiaCategory?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionsState].
extension TransactionsStatePatterns on TransactionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionsState value)  $default,){
final _that = this;
switch (_that) {
case _TransactionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionsState value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MiaTransaction> transactions,  List<MiaCategory> categories,  List<MiaRule> rules,  List<ReconciliationCandidate> candidates,  String query,  TransactionFilter filter,  Set<String> selectedIds,  int currentPage,  int lastPage,  bool isReady,  RefreshController refreshController,  String categoryDraftName,  int categoryDraftColourIndex,  int categoryDraftIconIndex,  String? categoryDraftParentId,  String? lastCorrectionId,  MiaCategory? createdCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionsState() when $default != null:
return $default(_that.transactions,_that.categories,_that.rules,_that.candidates,_that.query,_that.filter,_that.selectedIds,_that.currentPage,_that.lastPage,_that.isReady,_that.refreshController,_that.categoryDraftName,_that.categoryDraftColourIndex,_that.categoryDraftIconIndex,_that.categoryDraftParentId,_that.lastCorrectionId,_that.createdCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MiaTransaction> transactions,  List<MiaCategory> categories,  List<MiaRule> rules,  List<ReconciliationCandidate> candidates,  String query,  TransactionFilter filter,  Set<String> selectedIds,  int currentPage,  int lastPage,  bool isReady,  RefreshController refreshController,  String categoryDraftName,  int categoryDraftColourIndex,  int categoryDraftIconIndex,  String? categoryDraftParentId,  String? lastCorrectionId,  MiaCategory? createdCategory)  $default,) {final _that = this;
switch (_that) {
case _TransactionsState():
return $default(_that.transactions,_that.categories,_that.rules,_that.candidates,_that.query,_that.filter,_that.selectedIds,_that.currentPage,_that.lastPage,_that.isReady,_that.refreshController,_that.categoryDraftName,_that.categoryDraftColourIndex,_that.categoryDraftIconIndex,_that.categoryDraftParentId,_that.lastCorrectionId,_that.createdCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MiaTransaction> transactions,  List<MiaCategory> categories,  List<MiaRule> rules,  List<ReconciliationCandidate> candidates,  String query,  TransactionFilter filter,  Set<String> selectedIds,  int currentPage,  int lastPage,  bool isReady,  RefreshController refreshController,  String categoryDraftName,  int categoryDraftColourIndex,  int categoryDraftIconIndex,  String? categoryDraftParentId,  String? lastCorrectionId,  MiaCategory? createdCategory)?  $default,) {final _that = this;
switch (_that) {
case _TransactionsState() when $default != null:
return $default(_that.transactions,_that.categories,_that.rules,_that.candidates,_that.query,_that.filter,_that.selectedIds,_that.currentPage,_that.lastPage,_that.isReady,_that.refreshController,_that.categoryDraftName,_that.categoryDraftColourIndex,_that.categoryDraftIconIndex,_that.categoryDraftParentId,_that.lastCorrectionId,_that.createdCategory);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionsState implements TransactionsState {
  const _TransactionsState({required final  List<MiaTransaction> transactions, required final  List<MiaCategory> categories, required final  List<MiaRule> rules, required final  List<ReconciliationCandidate> candidates, required this.query, required this.filter, required final  Set<String> selectedIds, required this.currentPage, required this.lastPage, required this.isReady, required this.refreshController, required this.categoryDraftName, required this.categoryDraftColourIndex, required this.categoryDraftIconIndex, this.categoryDraftParentId, this.lastCorrectionId, this.createdCategory}): _transactions = transactions,_categories = categories,_rules = rules,_candidates = candidates,_selectedIds = selectedIds;
  

 final  List<MiaTransaction> _transactions;
@override List<MiaTransaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

 final  List<MiaCategory> _categories;
@override List<MiaCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<MiaRule> _rules;
@override List<MiaRule> get rules {
  if (_rules is EqualUnmodifiableListView) return _rules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rules);
}

 final  List<ReconciliationCandidate> _candidates;
@override List<ReconciliationCandidate> get candidates {
  if (_candidates is EqualUnmodifiableListView) return _candidates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_candidates);
}

@override final  String query;
@override final  TransactionFilter filter;
 final  Set<String> _selectedIds;
@override Set<String> get selectedIds {
  if (_selectedIds is EqualUnmodifiableSetView) return _selectedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedIds);
}

@override final  int currentPage;
@override final  int lastPage;
@override final  bool isReady;
@override final  RefreshController refreshController;
@override final  String categoryDraftName;
@override final  int categoryDraftColourIndex;
@override final  int categoryDraftIconIndex;
@override final  String? categoryDraftParentId;
@override final  String? lastCorrectionId;
@override final  MiaCategory? createdCategory;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsStateCopyWith<_TransactionsState> get copyWith => __$TransactionsStateCopyWithImpl<_TransactionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionsState&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._rules, _rules)&&const DeepCollectionEquality().equals(other._candidates, _candidates)&&(identical(other.query, query) || other.query == query)&&(identical(other.filter, filter) || other.filter == filter)&&const DeepCollectionEquality().equals(other._selectedIds, _selectedIds)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.refreshController, refreshController) || other.refreshController == refreshController)&&(identical(other.categoryDraftName, categoryDraftName) || other.categoryDraftName == categoryDraftName)&&(identical(other.categoryDraftColourIndex, categoryDraftColourIndex) || other.categoryDraftColourIndex == categoryDraftColourIndex)&&(identical(other.categoryDraftIconIndex, categoryDraftIconIndex) || other.categoryDraftIconIndex == categoryDraftIconIndex)&&(identical(other.categoryDraftParentId, categoryDraftParentId) || other.categoryDraftParentId == categoryDraftParentId)&&(identical(other.lastCorrectionId, lastCorrectionId) || other.lastCorrectionId == lastCorrectionId)&&(identical(other.createdCategory, createdCategory) || other.createdCategory == createdCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_rules),const DeepCollectionEquality().hash(_candidates),query,filter,const DeepCollectionEquality().hash(_selectedIds),currentPage,lastPage,isReady,refreshController,categoryDraftName,categoryDraftColourIndex,categoryDraftIconIndex,categoryDraftParentId,lastCorrectionId,createdCategory);

@override
String toString() {
  return 'TransactionsState(transactions: $transactions, categories: $categories, rules: $rules, candidates: $candidates, query: $query, filter: $filter, selectedIds: $selectedIds, currentPage: $currentPage, lastPage: $lastPage, isReady: $isReady, refreshController: $refreshController, categoryDraftName: $categoryDraftName, categoryDraftColourIndex: $categoryDraftColourIndex, categoryDraftIconIndex: $categoryDraftIconIndex, categoryDraftParentId: $categoryDraftParentId, lastCorrectionId: $lastCorrectionId, createdCategory: $createdCategory)';
}


}

/// @nodoc
abstract mixin class _$TransactionsStateCopyWith<$Res> implements $TransactionsStateCopyWith<$Res> {
  factory _$TransactionsStateCopyWith(_TransactionsState value, $Res Function(_TransactionsState) _then) = __$TransactionsStateCopyWithImpl;
@override @useResult
$Res call({
 List<MiaTransaction> transactions, List<MiaCategory> categories, List<MiaRule> rules, List<ReconciliationCandidate> candidates, String query, TransactionFilter filter, Set<String> selectedIds, int currentPage, int lastPage, bool isReady, RefreshController refreshController, String categoryDraftName, int categoryDraftColourIndex, int categoryDraftIconIndex, String? categoryDraftParentId, String? lastCorrectionId, MiaCategory? createdCategory
});




}
/// @nodoc
class __$TransactionsStateCopyWithImpl<$Res>
    implements _$TransactionsStateCopyWith<$Res> {
  __$TransactionsStateCopyWithImpl(this._self, this._then);

  final _TransactionsState _self;
  final $Res Function(_TransactionsState) _then;

/// Create a copy of TransactionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactions = null,Object? categories = null,Object? rules = null,Object? candidates = null,Object? query = null,Object? filter = null,Object? selectedIds = null,Object? currentPage = null,Object? lastPage = null,Object? isReady = null,Object? refreshController = null,Object? categoryDraftName = null,Object? categoryDraftColourIndex = null,Object? categoryDraftIconIndex = null,Object? categoryDraftParentId = freezed,Object? lastCorrectionId = freezed,Object? createdCategory = freezed,}) {
  return _then(_TransactionsState(
transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<MiaTransaction>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<MiaCategory>,rules: null == rules ? _self._rules : rules // ignore: cast_nullable_to_non_nullable
as List<MiaRule>,candidates: null == candidates ? _self._candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<ReconciliationCandidate>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as TransactionFilter,selectedIds: null == selectedIds ? _self._selectedIds : selectedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,refreshController: null == refreshController ? _self.refreshController : refreshController // ignore: cast_nullable_to_non_nullable
as RefreshController,categoryDraftName: null == categoryDraftName ? _self.categoryDraftName : categoryDraftName // ignore: cast_nullable_to_non_nullable
as String,categoryDraftColourIndex: null == categoryDraftColourIndex ? _self.categoryDraftColourIndex : categoryDraftColourIndex // ignore: cast_nullable_to_non_nullable
as int,categoryDraftIconIndex: null == categoryDraftIconIndex ? _self.categoryDraftIconIndex : categoryDraftIconIndex // ignore: cast_nullable_to_non_nullable
as int,categoryDraftParentId: freezed == categoryDraftParentId ? _self.categoryDraftParentId : categoryDraftParentId // ignore: cast_nullable_to_non_nullable
as String?,lastCorrectionId: freezed == lastCorrectionId ? _self.lastCorrectionId : lastCorrectionId // ignore: cast_nullable_to_non_nullable
as String?,createdCategory: freezed == createdCategory ? _self.createdCategory : createdCategory // ignore: cast_nullable_to_non_nullable
as MiaCategory?,
  ));
}


}

// dart format on
