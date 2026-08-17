// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VaultEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultEvent()';
}


}

/// @nodoc
class $VaultEventCopyWith<$Res>  {
$VaultEventCopyWith(VaultEvent _, $Res Function(VaultEvent) __);
}


/// Adds pattern-matching-related methods to [VaultEvent].
extension VaultEventPatterns on VaultEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VaultLoad value)?  load,TResult Function( VaultQueryChanged value)?  queryChanged,TResult Function( VaultWarrantyFilterChanged value)?  warrantyFilterChanged,TResult Function( VaultDocumentFilterChanged value)?  documentFilterChanged,TResult Function( VaultReminderToggled value)?  reminderToggled,TResult Function( VaultDocumentDeleted value)?  documentDeleted,TResult Function( VaultDocumentReprocessed value)?  documentReprocessed,TResult Function( VaultReceiptMatchAccepted value)?  receiptMatchAccepted,TResult Function( VaultReceiptMatchRejected value)?  receiptMatchRejected,TResult Function( VaultImportRolledBack value)?  importRolledBack,TResult Function( VaultPurchaseIssueNoted value)?  purchaseIssueNoted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VaultLoad() when load != null:
return load(_that);case VaultQueryChanged() when queryChanged != null:
return queryChanged(_that);case VaultWarrantyFilterChanged() when warrantyFilterChanged != null:
return warrantyFilterChanged(_that);case VaultDocumentFilterChanged() when documentFilterChanged != null:
return documentFilterChanged(_that);case VaultReminderToggled() when reminderToggled != null:
return reminderToggled(_that);case VaultDocumentDeleted() when documentDeleted != null:
return documentDeleted(_that);case VaultDocumentReprocessed() when documentReprocessed != null:
return documentReprocessed(_that);case VaultReceiptMatchAccepted() when receiptMatchAccepted != null:
return receiptMatchAccepted(_that);case VaultReceiptMatchRejected() when receiptMatchRejected != null:
return receiptMatchRejected(_that);case VaultImportRolledBack() when importRolledBack != null:
return importRolledBack(_that);case VaultPurchaseIssueNoted() when purchaseIssueNoted != null:
return purchaseIssueNoted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VaultLoad value)  load,required TResult Function( VaultQueryChanged value)  queryChanged,required TResult Function( VaultWarrantyFilterChanged value)  warrantyFilterChanged,required TResult Function( VaultDocumentFilterChanged value)  documentFilterChanged,required TResult Function( VaultReminderToggled value)  reminderToggled,required TResult Function( VaultDocumentDeleted value)  documentDeleted,required TResult Function( VaultDocumentReprocessed value)  documentReprocessed,required TResult Function( VaultReceiptMatchAccepted value)  receiptMatchAccepted,required TResult Function( VaultReceiptMatchRejected value)  receiptMatchRejected,required TResult Function( VaultImportRolledBack value)  importRolledBack,required TResult Function( VaultPurchaseIssueNoted value)  purchaseIssueNoted,}){
final _that = this;
switch (_that) {
case VaultLoad():
return load(_that);case VaultQueryChanged():
return queryChanged(_that);case VaultWarrantyFilterChanged():
return warrantyFilterChanged(_that);case VaultDocumentFilterChanged():
return documentFilterChanged(_that);case VaultReminderToggled():
return reminderToggled(_that);case VaultDocumentDeleted():
return documentDeleted(_that);case VaultDocumentReprocessed():
return documentReprocessed(_that);case VaultReceiptMatchAccepted():
return receiptMatchAccepted(_that);case VaultReceiptMatchRejected():
return receiptMatchRejected(_that);case VaultImportRolledBack():
return importRolledBack(_that);case VaultPurchaseIssueNoted():
return purchaseIssueNoted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VaultLoad value)?  load,TResult? Function( VaultQueryChanged value)?  queryChanged,TResult? Function( VaultWarrantyFilterChanged value)?  warrantyFilterChanged,TResult? Function( VaultDocumentFilterChanged value)?  documentFilterChanged,TResult? Function( VaultReminderToggled value)?  reminderToggled,TResult? Function( VaultDocumentDeleted value)?  documentDeleted,TResult? Function( VaultDocumentReprocessed value)?  documentReprocessed,TResult? Function( VaultReceiptMatchAccepted value)?  receiptMatchAccepted,TResult? Function( VaultReceiptMatchRejected value)?  receiptMatchRejected,TResult? Function( VaultImportRolledBack value)?  importRolledBack,TResult? Function( VaultPurchaseIssueNoted value)?  purchaseIssueNoted,}){
final _that = this;
switch (_that) {
case VaultLoad() when load != null:
return load(_that);case VaultQueryChanged() when queryChanged != null:
return queryChanged(_that);case VaultWarrantyFilterChanged() when warrantyFilterChanged != null:
return warrantyFilterChanged(_that);case VaultDocumentFilterChanged() when documentFilterChanged != null:
return documentFilterChanged(_that);case VaultReminderToggled() when reminderToggled != null:
return reminderToggled(_that);case VaultDocumentDeleted() when documentDeleted != null:
return documentDeleted(_that);case VaultDocumentReprocessed() when documentReprocessed != null:
return documentReprocessed(_that);case VaultReceiptMatchAccepted() when receiptMatchAccepted != null:
return receiptMatchAccepted(_that);case VaultReceiptMatchRejected() when receiptMatchRejected != null:
return receiptMatchRejected(_that);case VaultImportRolledBack() when importRolledBack != null:
return importRolledBack(_that);case VaultPurchaseIssueNoted() when purchaseIssueNoted != null:
return purchaseIssueNoted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String query)?  queryChanged,TResult Function( WarrantyStatus? status)?  warrantyFilterChanged,TResult Function( DocumentKind? kind)?  documentFilterChanged,TResult Function( String purchaseId,  bool enabled)?  reminderToggled,TResult Function( String documentId)?  documentDeleted,TResult Function( String documentId)?  documentReprocessed,TResult Function( String receiptId,  String transactionId)?  receiptMatchAccepted,TResult Function( String receiptId)?  receiptMatchRejected,TResult Function( String batchId)?  importRolledBack,TResult Function( String purchaseId,  String note)?  purchaseIssueNoted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VaultLoad() when load != null:
return load();case VaultQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case VaultWarrantyFilterChanged() when warrantyFilterChanged != null:
return warrantyFilterChanged(_that.status);case VaultDocumentFilterChanged() when documentFilterChanged != null:
return documentFilterChanged(_that.kind);case VaultReminderToggled() when reminderToggled != null:
return reminderToggled(_that.purchaseId,_that.enabled);case VaultDocumentDeleted() when documentDeleted != null:
return documentDeleted(_that.documentId);case VaultDocumentReprocessed() when documentReprocessed != null:
return documentReprocessed(_that.documentId);case VaultReceiptMatchAccepted() when receiptMatchAccepted != null:
return receiptMatchAccepted(_that.receiptId,_that.transactionId);case VaultReceiptMatchRejected() when receiptMatchRejected != null:
return receiptMatchRejected(_that.receiptId);case VaultImportRolledBack() when importRolledBack != null:
return importRolledBack(_that.batchId);case VaultPurchaseIssueNoted() when purchaseIssueNoted != null:
return purchaseIssueNoted(_that.purchaseId,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String query)  queryChanged,required TResult Function( WarrantyStatus? status)  warrantyFilterChanged,required TResult Function( DocumentKind? kind)  documentFilterChanged,required TResult Function( String purchaseId,  bool enabled)  reminderToggled,required TResult Function( String documentId)  documentDeleted,required TResult Function( String documentId)  documentReprocessed,required TResult Function( String receiptId,  String transactionId)  receiptMatchAccepted,required TResult Function( String receiptId)  receiptMatchRejected,required TResult Function( String batchId)  importRolledBack,required TResult Function( String purchaseId,  String note)  purchaseIssueNoted,}) {final _that = this;
switch (_that) {
case VaultLoad():
return load();case VaultQueryChanged():
return queryChanged(_that.query);case VaultWarrantyFilterChanged():
return warrantyFilterChanged(_that.status);case VaultDocumentFilterChanged():
return documentFilterChanged(_that.kind);case VaultReminderToggled():
return reminderToggled(_that.purchaseId,_that.enabled);case VaultDocumentDeleted():
return documentDeleted(_that.documentId);case VaultDocumentReprocessed():
return documentReprocessed(_that.documentId);case VaultReceiptMatchAccepted():
return receiptMatchAccepted(_that.receiptId,_that.transactionId);case VaultReceiptMatchRejected():
return receiptMatchRejected(_that.receiptId);case VaultImportRolledBack():
return importRolledBack(_that.batchId);case VaultPurchaseIssueNoted():
return purchaseIssueNoted(_that.purchaseId,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String query)?  queryChanged,TResult? Function( WarrantyStatus? status)?  warrantyFilterChanged,TResult? Function( DocumentKind? kind)?  documentFilterChanged,TResult? Function( String purchaseId,  bool enabled)?  reminderToggled,TResult? Function( String documentId)?  documentDeleted,TResult? Function( String documentId)?  documentReprocessed,TResult? Function( String receiptId,  String transactionId)?  receiptMatchAccepted,TResult? Function( String receiptId)?  receiptMatchRejected,TResult? Function( String batchId)?  importRolledBack,TResult? Function( String purchaseId,  String note)?  purchaseIssueNoted,}) {final _that = this;
switch (_that) {
case VaultLoad() when load != null:
return load();case VaultQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case VaultWarrantyFilterChanged() when warrantyFilterChanged != null:
return warrantyFilterChanged(_that.status);case VaultDocumentFilterChanged() when documentFilterChanged != null:
return documentFilterChanged(_that.kind);case VaultReminderToggled() when reminderToggled != null:
return reminderToggled(_that.purchaseId,_that.enabled);case VaultDocumentDeleted() when documentDeleted != null:
return documentDeleted(_that.documentId);case VaultDocumentReprocessed() when documentReprocessed != null:
return documentReprocessed(_that.documentId);case VaultReceiptMatchAccepted() when receiptMatchAccepted != null:
return receiptMatchAccepted(_that.receiptId,_that.transactionId);case VaultReceiptMatchRejected() when receiptMatchRejected != null:
return receiptMatchRejected(_that.receiptId);case VaultImportRolledBack() when importRolledBack != null:
return importRolledBack(_that.batchId);case VaultPurchaseIssueNoted() when purchaseIssueNoted != null:
return purchaseIssueNoted(_that.purchaseId,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class VaultLoad implements VaultEvent {
  const VaultLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VaultEvent.load()';
}


}




/// @nodoc


class VaultQueryChanged implements VaultEvent {
  const VaultQueryChanged(this.query);
  

 final  String query;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultQueryChangedCopyWith<VaultQueryChanged> get copyWith => _$VaultQueryChangedCopyWithImpl<VaultQueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'VaultEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $VaultQueryChangedCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $VaultQueryChangedCopyWith(VaultQueryChanged value, $Res Function(VaultQueryChanged) _then) = _$VaultQueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$VaultQueryChangedCopyWithImpl<$Res>
    implements $VaultQueryChangedCopyWith<$Res> {
  _$VaultQueryChangedCopyWithImpl(this._self, this._then);

  final VaultQueryChanged _self;
  final $Res Function(VaultQueryChanged) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(VaultQueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VaultWarrantyFilterChanged implements VaultEvent {
  const VaultWarrantyFilterChanged(this.status);
  

 final  WarrantyStatus? status;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultWarrantyFilterChangedCopyWith<VaultWarrantyFilterChanged> get copyWith => _$VaultWarrantyFilterChangedCopyWithImpl<VaultWarrantyFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultWarrantyFilterChanged&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'VaultEvent.warrantyFilterChanged(status: $status)';
}


}

/// @nodoc
abstract mixin class $VaultWarrantyFilterChangedCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $VaultWarrantyFilterChangedCopyWith(VaultWarrantyFilterChanged value, $Res Function(VaultWarrantyFilterChanged) _then) = _$VaultWarrantyFilterChangedCopyWithImpl;
@useResult
$Res call({
 WarrantyStatus? status
});




}
/// @nodoc
class _$VaultWarrantyFilterChangedCopyWithImpl<$Res>
    implements $VaultWarrantyFilterChangedCopyWith<$Res> {
  _$VaultWarrantyFilterChangedCopyWithImpl(this._self, this._then);

  final VaultWarrantyFilterChanged _self;
  final $Res Function(VaultWarrantyFilterChanged) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(VaultWarrantyFilterChanged(
freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WarrantyStatus?,
  ));
}


}

/// @nodoc


class VaultDocumentFilterChanged implements VaultEvent {
  const VaultDocumentFilterChanged(this.kind);
  

 final  DocumentKind? kind;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultDocumentFilterChangedCopyWith<VaultDocumentFilterChanged> get copyWith => _$VaultDocumentFilterChangedCopyWithImpl<VaultDocumentFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultDocumentFilterChanged&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'VaultEvent.documentFilterChanged(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $VaultDocumentFilterChangedCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $VaultDocumentFilterChangedCopyWith(VaultDocumentFilterChanged value, $Res Function(VaultDocumentFilterChanged) _then) = _$VaultDocumentFilterChangedCopyWithImpl;
@useResult
$Res call({
 DocumentKind? kind
});




}
/// @nodoc
class _$VaultDocumentFilterChangedCopyWithImpl<$Res>
    implements $VaultDocumentFilterChangedCopyWith<$Res> {
  _$VaultDocumentFilterChangedCopyWithImpl(this._self, this._then);

  final VaultDocumentFilterChanged _self;
  final $Res Function(VaultDocumentFilterChanged) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = freezed,}) {
  return _then(VaultDocumentFilterChanged(
freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DocumentKind?,
  ));
}


}

/// @nodoc


class VaultReminderToggled implements VaultEvent {
  const VaultReminderToggled({required this.purchaseId, required this.enabled});
  

 final  String purchaseId;
 final  bool enabled;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultReminderToggledCopyWith<VaultReminderToggled> get copyWith => _$VaultReminderToggledCopyWithImpl<VaultReminderToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultReminderToggled&&(identical(other.purchaseId, purchaseId) || other.purchaseId == purchaseId)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,purchaseId,enabled);

@override
String toString() {
  return 'VaultEvent.reminderToggled(purchaseId: $purchaseId, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $VaultReminderToggledCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $VaultReminderToggledCopyWith(VaultReminderToggled value, $Res Function(VaultReminderToggled) _then) = _$VaultReminderToggledCopyWithImpl;
@useResult
$Res call({
 String purchaseId, bool enabled
});




}
/// @nodoc
class _$VaultReminderToggledCopyWithImpl<$Res>
    implements $VaultReminderToggledCopyWith<$Res> {
  _$VaultReminderToggledCopyWithImpl(this._self, this._then);

  final VaultReminderToggled _self;
  final $Res Function(VaultReminderToggled) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? purchaseId = null,Object? enabled = null,}) {
  return _then(VaultReminderToggled(
purchaseId: null == purchaseId ? _self.purchaseId : purchaseId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class VaultDocumentDeleted implements VaultEvent {
  const VaultDocumentDeleted(this.documentId);
  

 final  String documentId;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultDocumentDeletedCopyWith<VaultDocumentDeleted> get copyWith => _$VaultDocumentDeletedCopyWithImpl<VaultDocumentDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultDocumentDeleted&&(identical(other.documentId, documentId) || other.documentId == documentId));
}


@override
int get hashCode => Object.hash(runtimeType,documentId);

@override
String toString() {
  return 'VaultEvent.documentDeleted(documentId: $documentId)';
}


}

/// @nodoc
abstract mixin class $VaultDocumentDeletedCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $VaultDocumentDeletedCopyWith(VaultDocumentDeleted value, $Res Function(VaultDocumentDeleted) _then) = _$VaultDocumentDeletedCopyWithImpl;
@useResult
$Res call({
 String documentId
});




}
/// @nodoc
class _$VaultDocumentDeletedCopyWithImpl<$Res>
    implements $VaultDocumentDeletedCopyWith<$Res> {
  _$VaultDocumentDeletedCopyWithImpl(this._self, this._then);

  final VaultDocumentDeleted _self;
  final $Res Function(VaultDocumentDeleted) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documentId = null,}) {
  return _then(VaultDocumentDeleted(
null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VaultDocumentReprocessed implements VaultEvent {
  const VaultDocumentReprocessed(this.documentId);
  

 final  String documentId;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultDocumentReprocessedCopyWith<VaultDocumentReprocessed> get copyWith => _$VaultDocumentReprocessedCopyWithImpl<VaultDocumentReprocessed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultDocumentReprocessed&&(identical(other.documentId, documentId) || other.documentId == documentId));
}


@override
int get hashCode => Object.hash(runtimeType,documentId);

@override
String toString() {
  return 'VaultEvent.documentReprocessed(documentId: $documentId)';
}


}

/// @nodoc
abstract mixin class $VaultDocumentReprocessedCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $VaultDocumentReprocessedCopyWith(VaultDocumentReprocessed value, $Res Function(VaultDocumentReprocessed) _then) = _$VaultDocumentReprocessedCopyWithImpl;
@useResult
$Res call({
 String documentId
});




}
/// @nodoc
class _$VaultDocumentReprocessedCopyWithImpl<$Res>
    implements $VaultDocumentReprocessedCopyWith<$Res> {
  _$VaultDocumentReprocessedCopyWithImpl(this._self, this._then);

  final VaultDocumentReprocessed _self;
  final $Res Function(VaultDocumentReprocessed) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documentId = null,}) {
  return _then(VaultDocumentReprocessed(
null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VaultReceiptMatchAccepted implements VaultEvent {
  const VaultReceiptMatchAccepted({required this.receiptId, required this.transactionId});
  

 final  String receiptId;
 final  String transactionId;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultReceiptMatchAcceptedCopyWith<VaultReceiptMatchAccepted> get copyWith => _$VaultReceiptMatchAcceptedCopyWithImpl<VaultReceiptMatchAccepted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultReceiptMatchAccepted&&(identical(other.receiptId, receiptId) || other.receiptId == receiptId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}


@override
int get hashCode => Object.hash(runtimeType,receiptId,transactionId);

@override
String toString() {
  return 'VaultEvent.receiptMatchAccepted(receiptId: $receiptId, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class $VaultReceiptMatchAcceptedCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $VaultReceiptMatchAcceptedCopyWith(VaultReceiptMatchAccepted value, $Res Function(VaultReceiptMatchAccepted) _then) = _$VaultReceiptMatchAcceptedCopyWithImpl;
@useResult
$Res call({
 String receiptId, String transactionId
});




}
/// @nodoc
class _$VaultReceiptMatchAcceptedCopyWithImpl<$Res>
    implements $VaultReceiptMatchAcceptedCopyWith<$Res> {
  _$VaultReceiptMatchAcceptedCopyWithImpl(this._self, this._then);

  final VaultReceiptMatchAccepted _self;
  final $Res Function(VaultReceiptMatchAccepted) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? receiptId = null,Object? transactionId = null,}) {
  return _then(VaultReceiptMatchAccepted(
receiptId: null == receiptId ? _self.receiptId : receiptId // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VaultReceiptMatchRejected implements VaultEvent {
  const VaultReceiptMatchRejected(this.receiptId);
  

 final  String receiptId;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultReceiptMatchRejectedCopyWith<VaultReceiptMatchRejected> get copyWith => _$VaultReceiptMatchRejectedCopyWithImpl<VaultReceiptMatchRejected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultReceiptMatchRejected&&(identical(other.receiptId, receiptId) || other.receiptId == receiptId));
}


@override
int get hashCode => Object.hash(runtimeType,receiptId);

@override
String toString() {
  return 'VaultEvent.receiptMatchRejected(receiptId: $receiptId)';
}


}

/// @nodoc
abstract mixin class $VaultReceiptMatchRejectedCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $VaultReceiptMatchRejectedCopyWith(VaultReceiptMatchRejected value, $Res Function(VaultReceiptMatchRejected) _then) = _$VaultReceiptMatchRejectedCopyWithImpl;
@useResult
$Res call({
 String receiptId
});




}
/// @nodoc
class _$VaultReceiptMatchRejectedCopyWithImpl<$Res>
    implements $VaultReceiptMatchRejectedCopyWith<$Res> {
  _$VaultReceiptMatchRejectedCopyWithImpl(this._self, this._then);

  final VaultReceiptMatchRejected _self;
  final $Res Function(VaultReceiptMatchRejected) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? receiptId = null,}) {
  return _then(VaultReceiptMatchRejected(
null == receiptId ? _self.receiptId : receiptId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VaultImportRolledBack implements VaultEvent {
  const VaultImportRolledBack(this.batchId);
  

 final  String batchId;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultImportRolledBackCopyWith<VaultImportRolledBack> get copyWith => _$VaultImportRolledBackCopyWithImpl<VaultImportRolledBack>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultImportRolledBack&&(identical(other.batchId, batchId) || other.batchId == batchId));
}


@override
int get hashCode => Object.hash(runtimeType,batchId);

@override
String toString() {
  return 'VaultEvent.importRolledBack(batchId: $batchId)';
}


}

/// @nodoc
abstract mixin class $VaultImportRolledBackCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $VaultImportRolledBackCopyWith(VaultImportRolledBack value, $Res Function(VaultImportRolledBack) _then) = _$VaultImportRolledBackCopyWithImpl;
@useResult
$Res call({
 String batchId
});




}
/// @nodoc
class _$VaultImportRolledBackCopyWithImpl<$Res>
    implements $VaultImportRolledBackCopyWith<$Res> {
  _$VaultImportRolledBackCopyWithImpl(this._self, this._then);

  final VaultImportRolledBack _self;
  final $Res Function(VaultImportRolledBack) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? batchId = null,}) {
  return _then(VaultImportRolledBack(
null == batchId ? _self.batchId : batchId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VaultPurchaseIssueNoted implements VaultEvent {
  const VaultPurchaseIssueNoted({required this.purchaseId, required this.note});
  

 final  String purchaseId;
 final  String note;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultPurchaseIssueNotedCopyWith<VaultPurchaseIssueNoted> get copyWith => _$VaultPurchaseIssueNotedCopyWithImpl<VaultPurchaseIssueNoted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultPurchaseIssueNoted&&(identical(other.purchaseId, purchaseId) || other.purchaseId == purchaseId)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,purchaseId,note);

@override
String toString() {
  return 'VaultEvent.purchaseIssueNoted(purchaseId: $purchaseId, note: $note)';
}


}

/// @nodoc
abstract mixin class $VaultPurchaseIssueNotedCopyWith<$Res> implements $VaultEventCopyWith<$Res> {
  factory $VaultPurchaseIssueNotedCopyWith(VaultPurchaseIssueNoted value, $Res Function(VaultPurchaseIssueNoted) _then) = _$VaultPurchaseIssueNotedCopyWithImpl;
@useResult
$Res call({
 String purchaseId, String note
});




}
/// @nodoc
class _$VaultPurchaseIssueNotedCopyWithImpl<$Res>
    implements $VaultPurchaseIssueNotedCopyWith<$Res> {
  _$VaultPurchaseIssueNotedCopyWithImpl(this._self, this._then);

  final VaultPurchaseIssueNoted _self;
  final $Res Function(VaultPurchaseIssueNoted) _then;

/// Create a copy of VaultEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? purchaseId = null,Object? note = null,}) {
  return _then(VaultPurchaseIssueNoted(
purchaseId: null == purchaseId ? _self.purchaseId : purchaseId // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$VaultState {

 List<MiaDocument> get documents; List<Receipt> get receipts; List<PurchaseRecord> get purchases; List<ImportBatch> get imports; String get query; bool get isReady; WarrantyStatus? get warrantyFilter; DocumentKind? get documentFilter;
/// Create a copy of VaultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VaultStateCopyWith<VaultState> get copyWith => _$VaultStateCopyWithImpl<VaultState>(this as VaultState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VaultState&&const DeepCollectionEquality().equals(other.documents, documents)&&const DeepCollectionEquality().equals(other.receipts, receipts)&&const DeepCollectionEquality().equals(other.purchases, purchases)&&const DeepCollectionEquality().equals(other.imports, imports)&&(identical(other.query, query) || other.query == query)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.warrantyFilter, warrantyFilter) || other.warrantyFilter == warrantyFilter)&&(identical(other.documentFilter, documentFilter) || other.documentFilter == documentFilter));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(documents),const DeepCollectionEquality().hash(receipts),const DeepCollectionEquality().hash(purchases),const DeepCollectionEquality().hash(imports),query,isReady,warrantyFilter,documentFilter);

@override
String toString() {
  return 'VaultState(documents: $documents, receipts: $receipts, purchases: $purchases, imports: $imports, query: $query, isReady: $isReady, warrantyFilter: $warrantyFilter, documentFilter: $documentFilter)';
}


}

/// @nodoc
abstract mixin class $VaultStateCopyWith<$Res>  {
  factory $VaultStateCopyWith(VaultState value, $Res Function(VaultState) _then) = _$VaultStateCopyWithImpl;
@useResult
$Res call({
 List<MiaDocument> documents, List<Receipt> receipts, List<PurchaseRecord> purchases, List<ImportBatch> imports, String query, bool isReady, WarrantyStatus? warrantyFilter, DocumentKind? documentFilter
});




}
/// @nodoc
class _$VaultStateCopyWithImpl<$Res>
    implements $VaultStateCopyWith<$Res> {
  _$VaultStateCopyWithImpl(this._self, this._then);

  final VaultState _self;
  final $Res Function(VaultState) _then;

/// Create a copy of VaultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documents = null,Object? receipts = null,Object? purchases = null,Object? imports = null,Object? query = null,Object? isReady = null,Object? warrantyFilter = freezed,Object? documentFilter = freezed,}) {
  return _then(_self.copyWith(
documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<MiaDocument>,receipts: null == receipts ? _self.receipts : receipts // ignore: cast_nullable_to_non_nullable
as List<Receipt>,purchases: null == purchases ? _self.purchases : purchases // ignore: cast_nullable_to_non_nullable
as List<PurchaseRecord>,imports: null == imports ? _self.imports : imports // ignore: cast_nullable_to_non_nullable
as List<ImportBatch>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,warrantyFilter: freezed == warrantyFilter ? _self.warrantyFilter : warrantyFilter // ignore: cast_nullable_to_non_nullable
as WarrantyStatus?,documentFilter: freezed == documentFilter ? _self.documentFilter : documentFilter // ignore: cast_nullable_to_non_nullable
as DocumentKind?,
  ));
}

}


/// Adds pattern-matching-related methods to [VaultState].
extension VaultStatePatterns on VaultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VaultState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VaultState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VaultState value)  $default,){
final _that = this;
switch (_that) {
case _VaultState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VaultState value)?  $default,){
final _that = this;
switch (_that) {
case _VaultState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MiaDocument> documents,  List<Receipt> receipts,  List<PurchaseRecord> purchases,  List<ImportBatch> imports,  String query,  bool isReady,  WarrantyStatus? warrantyFilter,  DocumentKind? documentFilter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VaultState() when $default != null:
return $default(_that.documents,_that.receipts,_that.purchases,_that.imports,_that.query,_that.isReady,_that.warrantyFilter,_that.documentFilter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MiaDocument> documents,  List<Receipt> receipts,  List<PurchaseRecord> purchases,  List<ImportBatch> imports,  String query,  bool isReady,  WarrantyStatus? warrantyFilter,  DocumentKind? documentFilter)  $default,) {final _that = this;
switch (_that) {
case _VaultState():
return $default(_that.documents,_that.receipts,_that.purchases,_that.imports,_that.query,_that.isReady,_that.warrantyFilter,_that.documentFilter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MiaDocument> documents,  List<Receipt> receipts,  List<PurchaseRecord> purchases,  List<ImportBatch> imports,  String query,  bool isReady,  WarrantyStatus? warrantyFilter,  DocumentKind? documentFilter)?  $default,) {final _that = this;
switch (_that) {
case _VaultState() when $default != null:
return $default(_that.documents,_that.receipts,_that.purchases,_that.imports,_that.query,_that.isReady,_that.warrantyFilter,_that.documentFilter);case _:
  return null;

}
}

}

/// @nodoc


class _VaultState implements VaultState {
  const _VaultState({required final  List<MiaDocument> documents, required final  List<Receipt> receipts, required final  List<PurchaseRecord> purchases, required final  List<ImportBatch> imports, required this.query, required this.isReady, this.warrantyFilter, this.documentFilter}): _documents = documents,_receipts = receipts,_purchases = purchases,_imports = imports;
  

 final  List<MiaDocument> _documents;
@override List<MiaDocument> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

 final  List<Receipt> _receipts;
@override List<Receipt> get receipts {
  if (_receipts is EqualUnmodifiableListView) return _receipts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_receipts);
}

 final  List<PurchaseRecord> _purchases;
@override List<PurchaseRecord> get purchases {
  if (_purchases is EqualUnmodifiableListView) return _purchases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_purchases);
}

 final  List<ImportBatch> _imports;
@override List<ImportBatch> get imports {
  if (_imports is EqualUnmodifiableListView) return _imports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imports);
}

@override final  String query;
@override final  bool isReady;
@override final  WarrantyStatus? warrantyFilter;
@override final  DocumentKind? documentFilter;

/// Create a copy of VaultState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VaultStateCopyWith<_VaultState> get copyWith => __$VaultStateCopyWithImpl<_VaultState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VaultState&&const DeepCollectionEquality().equals(other._documents, _documents)&&const DeepCollectionEquality().equals(other._receipts, _receipts)&&const DeepCollectionEquality().equals(other._purchases, _purchases)&&const DeepCollectionEquality().equals(other._imports, _imports)&&(identical(other.query, query) || other.query == query)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.warrantyFilter, warrantyFilter) || other.warrantyFilter == warrantyFilter)&&(identical(other.documentFilter, documentFilter) || other.documentFilter == documentFilter));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_documents),const DeepCollectionEquality().hash(_receipts),const DeepCollectionEquality().hash(_purchases),const DeepCollectionEquality().hash(_imports),query,isReady,warrantyFilter,documentFilter);

@override
String toString() {
  return 'VaultState(documents: $documents, receipts: $receipts, purchases: $purchases, imports: $imports, query: $query, isReady: $isReady, warrantyFilter: $warrantyFilter, documentFilter: $documentFilter)';
}


}

/// @nodoc
abstract mixin class _$VaultStateCopyWith<$Res> implements $VaultStateCopyWith<$Res> {
  factory _$VaultStateCopyWith(_VaultState value, $Res Function(_VaultState) _then) = __$VaultStateCopyWithImpl;
@override @useResult
$Res call({
 List<MiaDocument> documents, List<Receipt> receipts, List<PurchaseRecord> purchases, List<ImportBatch> imports, String query, bool isReady, WarrantyStatus? warrantyFilter, DocumentKind? documentFilter
});




}
/// @nodoc
class __$VaultStateCopyWithImpl<$Res>
    implements _$VaultStateCopyWith<$Res> {
  __$VaultStateCopyWithImpl(this._self, this._then);

  final _VaultState _self;
  final $Res Function(_VaultState) _then;

/// Create a copy of VaultState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documents = null,Object? receipts = null,Object? purchases = null,Object? imports = null,Object? query = null,Object? isReady = null,Object? warrantyFilter = freezed,Object? documentFilter = freezed,}) {
  return _then(_VaultState(
documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<MiaDocument>,receipts: null == receipts ? _self._receipts : receipts // ignore: cast_nullable_to_non_nullable
as List<Receipt>,purchases: null == purchases ? _self._purchases : purchases // ignore: cast_nullable_to_non_nullable
as List<PurchaseRecord>,imports: null == imports ? _self._imports : imports // ignore: cast_nullable_to_non_nullable
as List<ImportBatch>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,warrantyFilter: freezed == warrantyFilter ? _self.warrantyFilter : warrantyFilter // ignore: cast_nullable_to_non_nullable
as WarrantyStatus?,documentFilter: freezed == documentFilter ? _self.documentFilter : documentFilter // ignore: cast_nullable_to_non_nullable
as DocumentKind?,
  ));
}


}

// dart format on
