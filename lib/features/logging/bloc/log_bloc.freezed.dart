// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogEvent()';
}


}

/// @nodoc
class $LogEventCopyWith<$Res>  {
$LogEventCopyWith(LogEvent _, $Res Function(LogEvent) __);
}


/// Adds pattern-matching-related methods to [LogEvent].
extension LogEventPatterns on LogEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LogStarted value)?  started,TResult Function( LogTransactionDraftChanged value)?  transactionDraftChanged,TResult Function( LogTransactionSubmitted value)?  transactionSubmitted,TResult Function( LogBillDraftChanged value)?  billDraftChanged,TResult Function( LogBillSubmitted value)?  billSubmitted,TResult Function( LogExpectedDraftChanged value)?  expectedDraftChanged,TResult Function( LogExpectedSubmitted value)?  expectedSubmitted,TResult Function( LogAccountDraftChanged value)?  accountDraftChanged,TResult Function( LogAccountSubmitted value)?  accountSubmitted,TResult Function( LogReceiptDraftChanged value)?  receiptDraftChanged,TResult Function( LogReceiptSubmitted value)?  receiptSubmitted,TResult Function( LogPurchaseDraftChanged value)?  purchaseDraftChanged,TResult Function( LogPurchaseSubmitted value)?  purchaseSubmitted,TResult Function( LogDocumentDraftChanged value)?  documentDraftChanged,TResult Function( LogDocumentSubmitted value)?  documentSubmitted,TResult Function( LogGoalMovementSubmitted value)?  goalMovementSubmitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LogStarted() when started != null:
return started(_that);case LogTransactionDraftChanged() when transactionDraftChanged != null:
return transactionDraftChanged(_that);case LogTransactionSubmitted() when transactionSubmitted != null:
return transactionSubmitted(_that);case LogBillDraftChanged() when billDraftChanged != null:
return billDraftChanged(_that);case LogBillSubmitted() when billSubmitted != null:
return billSubmitted(_that);case LogExpectedDraftChanged() when expectedDraftChanged != null:
return expectedDraftChanged(_that);case LogExpectedSubmitted() when expectedSubmitted != null:
return expectedSubmitted(_that);case LogAccountDraftChanged() when accountDraftChanged != null:
return accountDraftChanged(_that);case LogAccountSubmitted() when accountSubmitted != null:
return accountSubmitted(_that);case LogReceiptDraftChanged() when receiptDraftChanged != null:
return receiptDraftChanged(_that);case LogReceiptSubmitted() when receiptSubmitted != null:
return receiptSubmitted(_that);case LogPurchaseDraftChanged() when purchaseDraftChanged != null:
return purchaseDraftChanged(_that);case LogPurchaseSubmitted() when purchaseSubmitted != null:
return purchaseSubmitted(_that);case LogDocumentDraftChanged() when documentDraftChanged != null:
return documentDraftChanged(_that);case LogDocumentSubmitted() when documentSubmitted != null:
return documentSubmitted(_that);case LogGoalMovementSubmitted() when goalMovementSubmitted != null:
return goalMovementSubmitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LogStarted value)  started,required TResult Function( LogTransactionDraftChanged value)  transactionDraftChanged,required TResult Function( LogTransactionSubmitted value)  transactionSubmitted,required TResult Function( LogBillDraftChanged value)  billDraftChanged,required TResult Function( LogBillSubmitted value)  billSubmitted,required TResult Function( LogExpectedDraftChanged value)  expectedDraftChanged,required TResult Function( LogExpectedSubmitted value)  expectedSubmitted,required TResult Function( LogAccountDraftChanged value)  accountDraftChanged,required TResult Function( LogAccountSubmitted value)  accountSubmitted,required TResult Function( LogReceiptDraftChanged value)  receiptDraftChanged,required TResult Function( LogReceiptSubmitted value)  receiptSubmitted,required TResult Function( LogPurchaseDraftChanged value)  purchaseDraftChanged,required TResult Function( LogPurchaseSubmitted value)  purchaseSubmitted,required TResult Function( LogDocumentDraftChanged value)  documentDraftChanged,required TResult Function( LogDocumentSubmitted value)  documentSubmitted,required TResult Function( LogGoalMovementSubmitted value)  goalMovementSubmitted,}){
final _that = this;
switch (_that) {
case LogStarted():
return started(_that);case LogTransactionDraftChanged():
return transactionDraftChanged(_that);case LogTransactionSubmitted():
return transactionSubmitted(_that);case LogBillDraftChanged():
return billDraftChanged(_that);case LogBillSubmitted():
return billSubmitted(_that);case LogExpectedDraftChanged():
return expectedDraftChanged(_that);case LogExpectedSubmitted():
return expectedSubmitted(_that);case LogAccountDraftChanged():
return accountDraftChanged(_that);case LogAccountSubmitted():
return accountSubmitted(_that);case LogReceiptDraftChanged():
return receiptDraftChanged(_that);case LogReceiptSubmitted():
return receiptSubmitted(_that);case LogPurchaseDraftChanged():
return purchaseDraftChanged(_that);case LogPurchaseSubmitted():
return purchaseSubmitted(_that);case LogDocumentDraftChanged():
return documentDraftChanged(_that);case LogDocumentSubmitted():
return documentSubmitted(_that);case LogGoalMovementSubmitted():
return goalMovementSubmitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LogStarted value)?  started,TResult? Function( LogTransactionDraftChanged value)?  transactionDraftChanged,TResult? Function( LogTransactionSubmitted value)?  transactionSubmitted,TResult? Function( LogBillDraftChanged value)?  billDraftChanged,TResult? Function( LogBillSubmitted value)?  billSubmitted,TResult? Function( LogExpectedDraftChanged value)?  expectedDraftChanged,TResult? Function( LogExpectedSubmitted value)?  expectedSubmitted,TResult? Function( LogAccountDraftChanged value)?  accountDraftChanged,TResult? Function( LogAccountSubmitted value)?  accountSubmitted,TResult? Function( LogReceiptDraftChanged value)?  receiptDraftChanged,TResult? Function( LogReceiptSubmitted value)?  receiptSubmitted,TResult? Function( LogPurchaseDraftChanged value)?  purchaseDraftChanged,TResult? Function( LogPurchaseSubmitted value)?  purchaseSubmitted,TResult? Function( LogDocumentDraftChanged value)?  documentDraftChanged,TResult? Function( LogDocumentSubmitted value)?  documentSubmitted,TResult? Function( LogGoalMovementSubmitted value)?  goalMovementSubmitted,}){
final _that = this;
switch (_that) {
case LogStarted() when started != null:
return started(_that);case LogTransactionDraftChanged() when transactionDraftChanged != null:
return transactionDraftChanged(_that);case LogTransactionSubmitted() when transactionSubmitted != null:
return transactionSubmitted(_that);case LogBillDraftChanged() when billDraftChanged != null:
return billDraftChanged(_that);case LogBillSubmitted() when billSubmitted != null:
return billSubmitted(_that);case LogExpectedDraftChanged() when expectedDraftChanged != null:
return expectedDraftChanged(_that);case LogExpectedSubmitted() when expectedSubmitted != null:
return expectedSubmitted(_that);case LogAccountDraftChanged() when accountDraftChanged != null:
return accountDraftChanged(_that);case LogAccountSubmitted() when accountSubmitted != null:
return accountSubmitted(_that);case LogReceiptDraftChanged() when receiptDraftChanged != null:
return receiptDraftChanged(_that);case LogReceiptSubmitted() when receiptSubmitted != null:
return receiptSubmitted(_that);case LogPurchaseDraftChanged() when purchaseDraftChanged != null:
return purchaseDraftChanged(_that);case LogPurchaseSubmitted() when purchaseSubmitted != null:
return purchaseSubmitted(_that);case LogDocumentDraftChanged() when documentDraftChanged != null:
return documentDraftChanged(_that);case LogDocumentSubmitted() when documentSubmitted != null:
return documentSubmitted(_that);case LogGoalMovementSubmitted() when goalMovementSubmitted != null:
return goalMovementSubmitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( LoggedMoneyKind? kind,  double? amount,  String? description,  DateTime? date,  String? accountId,  String? toAccountId,  String? categoryId,  String? note,  bool? shared,  bool? business,  bool? reimbursable)?  transactionDraftChanged,TResult Function()?  transactionSubmitted,TResult Function( String? provider,  ObligationKind? kind,  double? amount,  DateTime? dueDate,  RecurrenceFrequency? frequency,  String? paymentAccountName,  bool? autopay,  bool? shared)?  billDraftChanged,TResult Function()?  billSubmitted,TResult Function( ExpectedMoneyKind? kind,  String? counterparty,  double? amount,  DateTime? expectedDate,  String? note,  bool? shared)?  expectedDraftChanged,TResult Function()?  expectedSubmitted,TResult Function( String? name,  String? institution,  AccountType? type,  double? balance,  bool? shared)?  accountDraftChanged,TResult Function()?  accountSubmitted,TResult Function( String? merchant,  double? total,  double? gst,  DateTime? date,  String? number,  String? transactionId)?  receiptDraftChanged,TResult Function()?  receiptSubmitted,TResult Function( String? itemName,  String? retailer,  double? amount,  DateTime? date,  int? warrantyMonths,  String? serialNumber,  String? note)?  purchaseDraftChanged,TResult Function()?  purchaseSubmitted,TResult Function( String? name,  DocumentKind? kind,  String? fileType,  int? sizeKb,  String? coveragePeriod)?  documentDraftChanged,TResult Function()?  documentSubmitted,TResult Function( String goalId,  double amount,  String label)?  goalMovementSubmitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LogStarted() when started != null:
return started();case LogTransactionDraftChanged() when transactionDraftChanged != null:
return transactionDraftChanged(_that.kind,_that.amount,_that.description,_that.date,_that.accountId,_that.toAccountId,_that.categoryId,_that.note,_that.shared,_that.business,_that.reimbursable);case LogTransactionSubmitted() when transactionSubmitted != null:
return transactionSubmitted();case LogBillDraftChanged() when billDraftChanged != null:
return billDraftChanged(_that.provider,_that.kind,_that.amount,_that.dueDate,_that.frequency,_that.paymentAccountName,_that.autopay,_that.shared);case LogBillSubmitted() when billSubmitted != null:
return billSubmitted();case LogExpectedDraftChanged() when expectedDraftChanged != null:
return expectedDraftChanged(_that.kind,_that.counterparty,_that.amount,_that.expectedDate,_that.note,_that.shared);case LogExpectedSubmitted() when expectedSubmitted != null:
return expectedSubmitted();case LogAccountDraftChanged() when accountDraftChanged != null:
return accountDraftChanged(_that.name,_that.institution,_that.type,_that.balance,_that.shared);case LogAccountSubmitted() when accountSubmitted != null:
return accountSubmitted();case LogReceiptDraftChanged() when receiptDraftChanged != null:
return receiptDraftChanged(_that.merchant,_that.total,_that.gst,_that.date,_that.number,_that.transactionId);case LogReceiptSubmitted() when receiptSubmitted != null:
return receiptSubmitted();case LogPurchaseDraftChanged() when purchaseDraftChanged != null:
return purchaseDraftChanged(_that.itemName,_that.retailer,_that.amount,_that.date,_that.warrantyMonths,_that.serialNumber,_that.note);case LogPurchaseSubmitted() when purchaseSubmitted != null:
return purchaseSubmitted();case LogDocumentDraftChanged() when documentDraftChanged != null:
return documentDraftChanged(_that.name,_that.kind,_that.fileType,_that.sizeKb,_that.coveragePeriod);case LogDocumentSubmitted() when documentSubmitted != null:
return documentSubmitted();case LogGoalMovementSubmitted() when goalMovementSubmitted != null:
return goalMovementSubmitted(_that.goalId,_that.amount,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( LoggedMoneyKind? kind,  double? amount,  String? description,  DateTime? date,  String? accountId,  String? toAccountId,  String? categoryId,  String? note,  bool? shared,  bool? business,  bool? reimbursable)  transactionDraftChanged,required TResult Function()  transactionSubmitted,required TResult Function( String? provider,  ObligationKind? kind,  double? amount,  DateTime? dueDate,  RecurrenceFrequency? frequency,  String? paymentAccountName,  bool? autopay,  bool? shared)  billDraftChanged,required TResult Function()  billSubmitted,required TResult Function( ExpectedMoneyKind? kind,  String? counterparty,  double? amount,  DateTime? expectedDate,  String? note,  bool? shared)  expectedDraftChanged,required TResult Function()  expectedSubmitted,required TResult Function( String? name,  String? institution,  AccountType? type,  double? balance,  bool? shared)  accountDraftChanged,required TResult Function()  accountSubmitted,required TResult Function( String? merchant,  double? total,  double? gst,  DateTime? date,  String? number,  String? transactionId)  receiptDraftChanged,required TResult Function()  receiptSubmitted,required TResult Function( String? itemName,  String? retailer,  double? amount,  DateTime? date,  int? warrantyMonths,  String? serialNumber,  String? note)  purchaseDraftChanged,required TResult Function()  purchaseSubmitted,required TResult Function( String? name,  DocumentKind? kind,  String? fileType,  int? sizeKb,  String? coveragePeriod)  documentDraftChanged,required TResult Function()  documentSubmitted,required TResult Function( String goalId,  double amount,  String label)  goalMovementSubmitted,}) {final _that = this;
switch (_that) {
case LogStarted():
return started();case LogTransactionDraftChanged():
return transactionDraftChanged(_that.kind,_that.amount,_that.description,_that.date,_that.accountId,_that.toAccountId,_that.categoryId,_that.note,_that.shared,_that.business,_that.reimbursable);case LogTransactionSubmitted():
return transactionSubmitted();case LogBillDraftChanged():
return billDraftChanged(_that.provider,_that.kind,_that.amount,_that.dueDate,_that.frequency,_that.paymentAccountName,_that.autopay,_that.shared);case LogBillSubmitted():
return billSubmitted();case LogExpectedDraftChanged():
return expectedDraftChanged(_that.kind,_that.counterparty,_that.amount,_that.expectedDate,_that.note,_that.shared);case LogExpectedSubmitted():
return expectedSubmitted();case LogAccountDraftChanged():
return accountDraftChanged(_that.name,_that.institution,_that.type,_that.balance,_that.shared);case LogAccountSubmitted():
return accountSubmitted();case LogReceiptDraftChanged():
return receiptDraftChanged(_that.merchant,_that.total,_that.gst,_that.date,_that.number,_that.transactionId);case LogReceiptSubmitted():
return receiptSubmitted();case LogPurchaseDraftChanged():
return purchaseDraftChanged(_that.itemName,_that.retailer,_that.amount,_that.date,_that.warrantyMonths,_that.serialNumber,_that.note);case LogPurchaseSubmitted():
return purchaseSubmitted();case LogDocumentDraftChanged():
return documentDraftChanged(_that.name,_that.kind,_that.fileType,_that.sizeKb,_that.coveragePeriod);case LogDocumentSubmitted():
return documentSubmitted();case LogGoalMovementSubmitted():
return goalMovementSubmitted(_that.goalId,_that.amount,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( LoggedMoneyKind? kind,  double? amount,  String? description,  DateTime? date,  String? accountId,  String? toAccountId,  String? categoryId,  String? note,  bool? shared,  bool? business,  bool? reimbursable)?  transactionDraftChanged,TResult? Function()?  transactionSubmitted,TResult? Function( String? provider,  ObligationKind? kind,  double? amount,  DateTime? dueDate,  RecurrenceFrequency? frequency,  String? paymentAccountName,  bool? autopay,  bool? shared)?  billDraftChanged,TResult? Function()?  billSubmitted,TResult? Function( ExpectedMoneyKind? kind,  String? counterparty,  double? amount,  DateTime? expectedDate,  String? note,  bool? shared)?  expectedDraftChanged,TResult? Function()?  expectedSubmitted,TResult? Function( String? name,  String? institution,  AccountType? type,  double? balance,  bool? shared)?  accountDraftChanged,TResult? Function()?  accountSubmitted,TResult? Function( String? merchant,  double? total,  double? gst,  DateTime? date,  String? number,  String? transactionId)?  receiptDraftChanged,TResult? Function()?  receiptSubmitted,TResult? Function( String? itemName,  String? retailer,  double? amount,  DateTime? date,  int? warrantyMonths,  String? serialNumber,  String? note)?  purchaseDraftChanged,TResult? Function()?  purchaseSubmitted,TResult? Function( String? name,  DocumentKind? kind,  String? fileType,  int? sizeKb,  String? coveragePeriod)?  documentDraftChanged,TResult? Function()?  documentSubmitted,TResult? Function( String goalId,  double amount,  String label)?  goalMovementSubmitted,}) {final _that = this;
switch (_that) {
case LogStarted() when started != null:
return started();case LogTransactionDraftChanged() when transactionDraftChanged != null:
return transactionDraftChanged(_that.kind,_that.amount,_that.description,_that.date,_that.accountId,_that.toAccountId,_that.categoryId,_that.note,_that.shared,_that.business,_that.reimbursable);case LogTransactionSubmitted() when transactionSubmitted != null:
return transactionSubmitted();case LogBillDraftChanged() when billDraftChanged != null:
return billDraftChanged(_that.provider,_that.kind,_that.amount,_that.dueDate,_that.frequency,_that.paymentAccountName,_that.autopay,_that.shared);case LogBillSubmitted() when billSubmitted != null:
return billSubmitted();case LogExpectedDraftChanged() when expectedDraftChanged != null:
return expectedDraftChanged(_that.kind,_that.counterparty,_that.amount,_that.expectedDate,_that.note,_that.shared);case LogExpectedSubmitted() when expectedSubmitted != null:
return expectedSubmitted();case LogAccountDraftChanged() when accountDraftChanged != null:
return accountDraftChanged(_that.name,_that.institution,_that.type,_that.balance,_that.shared);case LogAccountSubmitted() when accountSubmitted != null:
return accountSubmitted();case LogReceiptDraftChanged() when receiptDraftChanged != null:
return receiptDraftChanged(_that.merchant,_that.total,_that.gst,_that.date,_that.number,_that.transactionId);case LogReceiptSubmitted() when receiptSubmitted != null:
return receiptSubmitted();case LogPurchaseDraftChanged() when purchaseDraftChanged != null:
return purchaseDraftChanged(_that.itemName,_that.retailer,_that.amount,_that.date,_that.warrantyMonths,_that.serialNumber,_that.note);case LogPurchaseSubmitted() when purchaseSubmitted != null:
return purchaseSubmitted();case LogDocumentDraftChanged() when documentDraftChanged != null:
return documentDraftChanged(_that.name,_that.kind,_that.fileType,_that.sizeKb,_that.coveragePeriod);case LogDocumentSubmitted() when documentSubmitted != null:
return documentSubmitted();case LogGoalMovementSubmitted() when goalMovementSubmitted != null:
return goalMovementSubmitted(_that.goalId,_that.amount,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class LogStarted implements LogEvent {
  const LogStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogEvent.started()';
}


}




/// @nodoc


class LogTransactionDraftChanged implements LogEvent {
  const LogTransactionDraftChanged({this.kind, this.amount, this.description, this.date, this.accountId, this.toAccountId, this.categoryId, this.note, this.shared, this.business, this.reimbursable});
  

 final  LoggedMoneyKind? kind;
 final  double? amount;
 final  String? description;
 final  DateTime? date;
 final  String? accountId;
 final  String? toAccountId;
 final  String? categoryId;
 final  String? note;
 final  bool? shared;
 final  bool? business;
 final  bool? reimbursable;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogTransactionDraftChangedCopyWith<LogTransactionDraftChanged> get copyWith => _$LogTransactionDraftChangedCopyWithImpl<LogTransactionDraftChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogTransactionDraftChanged&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.toAccountId, toAccountId) || other.toAccountId == toAccountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.note, note) || other.note == note)&&(identical(other.shared, shared) || other.shared == shared)&&(identical(other.business, business) || other.business == business)&&(identical(other.reimbursable, reimbursable) || other.reimbursable == reimbursable));
}


@override
int get hashCode => Object.hash(runtimeType,kind,amount,description,date,accountId,toAccountId,categoryId,note,shared,business,reimbursable);

@override
String toString() {
  return 'LogEvent.transactionDraftChanged(kind: $kind, amount: $amount, description: $description, date: $date, accountId: $accountId, toAccountId: $toAccountId, categoryId: $categoryId, note: $note, shared: $shared, business: $business, reimbursable: $reimbursable)';
}


}

/// @nodoc
abstract mixin class $LogTransactionDraftChangedCopyWith<$Res> implements $LogEventCopyWith<$Res> {
  factory $LogTransactionDraftChangedCopyWith(LogTransactionDraftChanged value, $Res Function(LogTransactionDraftChanged) _then) = _$LogTransactionDraftChangedCopyWithImpl;
@useResult
$Res call({
 LoggedMoneyKind? kind, double? amount, String? description, DateTime? date, String? accountId, String? toAccountId, String? categoryId, String? note, bool? shared, bool? business, bool? reimbursable
});




}
/// @nodoc
class _$LogTransactionDraftChangedCopyWithImpl<$Res>
    implements $LogTransactionDraftChangedCopyWith<$Res> {
  _$LogTransactionDraftChangedCopyWithImpl(this._self, this._then);

  final LogTransactionDraftChanged _self;
  final $Res Function(LogTransactionDraftChanged) _then;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = freezed,Object? amount = freezed,Object? description = freezed,Object? date = freezed,Object? accountId = freezed,Object? toAccountId = freezed,Object? categoryId = freezed,Object? note = freezed,Object? shared = freezed,Object? business = freezed,Object? reimbursable = freezed,}) {
  return _then(LogTransactionDraftChanged(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as LoggedMoneyKind?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,toAccountId: freezed == toAccountId ? _self.toAccountId : toAccountId // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,shared: freezed == shared ? _self.shared : shared // ignore: cast_nullable_to_non_nullable
as bool?,business: freezed == business ? _self.business : business // ignore: cast_nullable_to_non_nullable
as bool?,reimbursable: freezed == reimbursable ? _self.reimbursable : reimbursable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class LogTransactionSubmitted implements LogEvent {
  const LogTransactionSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogTransactionSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogEvent.transactionSubmitted()';
}


}




/// @nodoc


class LogBillDraftChanged implements LogEvent {
  const LogBillDraftChanged({this.provider, this.kind, this.amount, this.dueDate, this.frequency, this.paymentAccountName, this.autopay, this.shared});
  

 final  String? provider;
 final  ObligationKind? kind;
 final  double? amount;
 final  DateTime? dueDate;
 final  RecurrenceFrequency? frequency;
 final  String? paymentAccountName;
 final  bool? autopay;
 final  bool? shared;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogBillDraftChangedCopyWith<LogBillDraftChanged> get copyWith => _$LogBillDraftChangedCopyWithImpl<LogBillDraftChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogBillDraftChanged&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.paymentAccountName, paymentAccountName) || other.paymentAccountName == paymentAccountName)&&(identical(other.autopay, autopay) || other.autopay == autopay)&&(identical(other.shared, shared) || other.shared == shared));
}


@override
int get hashCode => Object.hash(runtimeType,provider,kind,amount,dueDate,frequency,paymentAccountName,autopay,shared);

@override
String toString() {
  return 'LogEvent.billDraftChanged(provider: $provider, kind: $kind, amount: $amount, dueDate: $dueDate, frequency: $frequency, paymentAccountName: $paymentAccountName, autopay: $autopay, shared: $shared)';
}


}

/// @nodoc
abstract mixin class $LogBillDraftChangedCopyWith<$Res> implements $LogEventCopyWith<$Res> {
  factory $LogBillDraftChangedCopyWith(LogBillDraftChanged value, $Res Function(LogBillDraftChanged) _then) = _$LogBillDraftChangedCopyWithImpl;
@useResult
$Res call({
 String? provider, ObligationKind? kind, double? amount, DateTime? dueDate, RecurrenceFrequency? frequency, String? paymentAccountName, bool? autopay, bool? shared
});




}
/// @nodoc
class _$LogBillDraftChangedCopyWithImpl<$Res>
    implements $LogBillDraftChangedCopyWith<$Res> {
  _$LogBillDraftChangedCopyWithImpl(this._self, this._then);

  final LogBillDraftChanged _self;
  final $Res Function(LogBillDraftChanged) _then;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? provider = freezed,Object? kind = freezed,Object? amount = freezed,Object? dueDate = freezed,Object? frequency = freezed,Object? paymentAccountName = freezed,Object? autopay = freezed,Object? shared = freezed,}) {
  return _then(LogBillDraftChanged(
provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ObligationKind?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as RecurrenceFrequency?,paymentAccountName: freezed == paymentAccountName ? _self.paymentAccountName : paymentAccountName // ignore: cast_nullable_to_non_nullable
as String?,autopay: freezed == autopay ? _self.autopay : autopay // ignore: cast_nullable_to_non_nullable
as bool?,shared: freezed == shared ? _self.shared : shared // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class LogBillSubmitted implements LogEvent {
  const LogBillSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogBillSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogEvent.billSubmitted()';
}


}




/// @nodoc


class LogExpectedDraftChanged implements LogEvent {
  const LogExpectedDraftChanged({this.kind, this.counterparty, this.amount, this.expectedDate, this.note, this.shared});
  

 final  ExpectedMoneyKind? kind;
 final  String? counterparty;
 final  double? amount;
 final  DateTime? expectedDate;
 final  String? note;
 final  bool? shared;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogExpectedDraftChangedCopyWith<LogExpectedDraftChanged> get copyWith => _$LogExpectedDraftChangedCopyWithImpl<LogExpectedDraftChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogExpectedDraftChanged&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.counterparty, counterparty) || other.counterparty == counterparty)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expectedDate, expectedDate) || other.expectedDate == expectedDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.shared, shared) || other.shared == shared));
}


@override
int get hashCode => Object.hash(runtimeType,kind,counterparty,amount,expectedDate,note,shared);

@override
String toString() {
  return 'LogEvent.expectedDraftChanged(kind: $kind, counterparty: $counterparty, amount: $amount, expectedDate: $expectedDate, note: $note, shared: $shared)';
}


}

/// @nodoc
abstract mixin class $LogExpectedDraftChangedCopyWith<$Res> implements $LogEventCopyWith<$Res> {
  factory $LogExpectedDraftChangedCopyWith(LogExpectedDraftChanged value, $Res Function(LogExpectedDraftChanged) _then) = _$LogExpectedDraftChangedCopyWithImpl;
@useResult
$Res call({
 ExpectedMoneyKind? kind, String? counterparty, double? amount, DateTime? expectedDate, String? note, bool? shared
});




}
/// @nodoc
class _$LogExpectedDraftChangedCopyWithImpl<$Res>
    implements $LogExpectedDraftChangedCopyWith<$Res> {
  _$LogExpectedDraftChangedCopyWithImpl(this._self, this._then);

  final LogExpectedDraftChanged _self;
  final $Res Function(LogExpectedDraftChanged) _then;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = freezed,Object? counterparty = freezed,Object? amount = freezed,Object? expectedDate = freezed,Object? note = freezed,Object? shared = freezed,}) {
  return _then(LogExpectedDraftChanged(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ExpectedMoneyKind?,counterparty: freezed == counterparty ? _self.counterparty : counterparty // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,expectedDate: freezed == expectedDate ? _self.expectedDate : expectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,shared: freezed == shared ? _self.shared : shared // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class LogExpectedSubmitted implements LogEvent {
  const LogExpectedSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogExpectedSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogEvent.expectedSubmitted()';
}


}




/// @nodoc


class LogAccountDraftChanged implements LogEvent {
  const LogAccountDraftChanged({this.name, this.institution, this.type, this.balance, this.shared});
  

 final  String? name;
 final  String? institution;
 final  AccountType? type;
 final  double? balance;
 final  bool? shared;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogAccountDraftChangedCopyWith<LogAccountDraftChanged> get copyWith => _$LogAccountDraftChangedCopyWithImpl<LogAccountDraftChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogAccountDraftChanged&&(identical(other.name, name) || other.name == name)&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.type, type) || other.type == type)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.shared, shared) || other.shared == shared));
}


@override
int get hashCode => Object.hash(runtimeType,name,institution,type,balance,shared);

@override
String toString() {
  return 'LogEvent.accountDraftChanged(name: $name, institution: $institution, type: $type, balance: $balance, shared: $shared)';
}


}

/// @nodoc
abstract mixin class $LogAccountDraftChangedCopyWith<$Res> implements $LogEventCopyWith<$Res> {
  factory $LogAccountDraftChangedCopyWith(LogAccountDraftChanged value, $Res Function(LogAccountDraftChanged) _then) = _$LogAccountDraftChangedCopyWithImpl;
@useResult
$Res call({
 String? name, String? institution, AccountType? type, double? balance, bool? shared
});




}
/// @nodoc
class _$LogAccountDraftChangedCopyWithImpl<$Res>
    implements $LogAccountDraftChangedCopyWith<$Res> {
  _$LogAccountDraftChangedCopyWithImpl(this._self, this._then);

  final LogAccountDraftChanged _self;
  final $Res Function(LogAccountDraftChanged) _then;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? institution = freezed,Object? type = freezed,Object? balance = freezed,Object? shared = freezed,}) {
  return _then(LogAccountDraftChanged(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccountType?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,shared: freezed == shared ? _self.shared : shared // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class LogAccountSubmitted implements LogEvent {
  const LogAccountSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogAccountSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogEvent.accountSubmitted()';
}


}




/// @nodoc


class LogReceiptDraftChanged implements LogEvent {
  const LogReceiptDraftChanged({this.merchant, this.total, this.gst, this.date, this.number, this.transactionId});
  

 final  String? merchant;
 final  double? total;
 final  double? gst;
 final  DateTime? date;
 final  String? number;
 final  String? transactionId;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogReceiptDraftChangedCopyWith<LogReceiptDraftChanged> get copyWith => _$LogReceiptDraftChangedCopyWithImpl<LogReceiptDraftChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogReceiptDraftChanged&&(identical(other.merchant, merchant) || other.merchant == merchant)&&(identical(other.total, total) || other.total == total)&&(identical(other.gst, gst) || other.gst == gst)&&(identical(other.date, date) || other.date == date)&&(identical(other.number, number) || other.number == number)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}


@override
int get hashCode => Object.hash(runtimeType,merchant,total,gst,date,number,transactionId);

@override
String toString() {
  return 'LogEvent.receiptDraftChanged(merchant: $merchant, total: $total, gst: $gst, date: $date, number: $number, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class $LogReceiptDraftChangedCopyWith<$Res> implements $LogEventCopyWith<$Res> {
  factory $LogReceiptDraftChangedCopyWith(LogReceiptDraftChanged value, $Res Function(LogReceiptDraftChanged) _then) = _$LogReceiptDraftChangedCopyWithImpl;
@useResult
$Res call({
 String? merchant, double? total, double? gst, DateTime? date, String? number, String? transactionId
});




}
/// @nodoc
class _$LogReceiptDraftChangedCopyWithImpl<$Res>
    implements $LogReceiptDraftChangedCopyWith<$Res> {
  _$LogReceiptDraftChangedCopyWithImpl(this._self, this._then);

  final LogReceiptDraftChanged _self;
  final $Res Function(LogReceiptDraftChanged) _then;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? merchant = freezed,Object? total = freezed,Object? gst = freezed,Object? date = freezed,Object? number = freezed,Object? transactionId = freezed,}) {
  return _then(LogReceiptDraftChanged(
merchant: freezed == merchant ? _self.merchant : merchant // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,gst: freezed == gst ? _self.gst : gst // ignore: cast_nullable_to_non_nullable
as double?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LogReceiptSubmitted implements LogEvent {
  const LogReceiptSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogReceiptSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogEvent.receiptSubmitted()';
}


}




/// @nodoc


class LogPurchaseDraftChanged implements LogEvent {
  const LogPurchaseDraftChanged({this.itemName, this.retailer, this.amount, this.date, this.warrantyMonths, this.serialNumber, this.note});
  

 final  String? itemName;
 final  String? retailer;
 final  double? amount;
 final  DateTime? date;
 final  int? warrantyMonths;
 final  String? serialNumber;
 final  String? note;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogPurchaseDraftChangedCopyWith<LogPurchaseDraftChanged> get copyWith => _$LogPurchaseDraftChangedCopyWithImpl<LogPurchaseDraftChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogPurchaseDraftChanged&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.retailer, retailer) || other.retailer == retailer)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.warrantyMonths, warrantyMonths) || other.warrantyMonths == warrantyMonths)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,itemName,retailer,amount,date,warrantyMonths,serialNumber,note);

@override
String toString() {
  return 'LogEvent.purchaseDraftChanged(itemName: $itemName, retailer: $retailer, amount: $amount, date: $date, warrantyMonths: $warrantyMonths, serialNumber: $serialNumber, note: $note)';
}


}

/// @nodoc
abstract mixin class $LogPurchaseDraftChangedCopyWith<$Res> implements $LogEventCopyWith<$Res> {
  factory $LogPurchaseDraftChangedCopyWith(LogPurchaseDraftChanged value, $Res Function(LogPurchaseDraftChanged) _then) = _$LogPurchaseDraftChangedCopyWithImpl;
@useResult
$Res call({
 String? itemName, String? retailer, double? amount, DateTime? date, int? warrantyMonths, String? serialNumber, String? note
});




}
/// @nodoc
class _$LogPurchaseDraftChangedCopyWithImpl<$Res>
    implements $LogPurchaseDraftChangedCopyWith<$Res> {
  _$LogPurchaseDraftChangedCopyWithImpl(this._self, this._then);

  final LogPurchaseDraftChanged _self;
  final $Res Function(LogPurchaseDraftChanged) _then;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemName = freezed,Object? retailer = freezed,Object? amount = freezed,Object? date = freezed,Object? warrantyMonths = freezed,Object? serialNumber = freezed,Object? note = freezed,}) {
  return _then(LogPurchaseDraftChanged(
itemName: freezed == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String?,retailer: freezed == retailer ? _self.retailer : retailer // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,warrantyMonths: freezed == warrantyMonths ? _self.warrantyMonths : warrantyMonths // ignore: cast_nullable_to_non_nullable
as int?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LogPurchaseSubmitted implements LogEvent {
  const LogPurchaseSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogPurchaseSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogEvent.purchaseSubmitted()';
}


}




/// @nodoc


class LogDocumentDraftChanged implements LogEvent {
  const LogDocumentDraftChanged({this.name, this.kind, this.fileType, this.sizeKb, this.coveragePeriod});
  

 final  String? name;
 final  DocumentKind? kind;
 final  String? fileType;
 final  int? sizeKb;
 final  String? coveragePeriod;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogDocumentDraftChangedCopyWith<LogDocumentDraftChanged> get copyWith => _$LogDocumentDraftChangedCopyWithImpl<LogDocumentDraftChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogDocumentDraftChanged&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.sizeKb, sizeKb) || other.sizeKb == sizeKb)&&(identical(other.coveragePeriod, coveragePeriod) || other.coveragePeriod == coveragePeriod));
}


@override
int get hashCode => Object.hash(runtimeType,name,kind,fileType,sizeKb,coveragePeriod);

@override
String toString() {
  return 'LogEvent.documentDraftChanged(name: $name, kind: $kind, fileType: $fileType, sizeKb: $sizeKb, coveragePeriod: $coveragePeriod)';
}


}

/// @nodoc
abstract mixin class $LogDocumentDraftChangedCopyWith<$Res> implements $LogEventCopyWith<$Res> {
  factory $LogDocumentDraftChangedCopyWith(LogDocumentDraftChanged value, $Res Function(LogDocumentDraftChanged) _then) = _$LogDocumentDraftChangedCopyWithImpl;
@useResult
$Res call({
 String? name, DocumentKind? kind, String? fileType, int? sizeKb, String? coveragePeriod
});




}
/// @nodoc
class _$LogDocumentDraftChangedCopyWithImpl<$Res>
    implements $LogDocumentDraftChangedCopyWith<$Res> {
  _$LogDocumentDraftChangedCopyWithImpl(this._self, this._then);

  final LogDocumentDraftChanged _self;
  final $Res Function(LogDocumentDraftChanged) _then;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? kind = freezed,Object? fileType = freezed,Object? sizeKb = freezed,Object? coveragePeriod = freezed,}) {
  return _then(LogDocumentDraftChanged(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DocumentKind?,fileType: freezed == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String?,sizeKb: freezed == sizeKb ? _self.sizeKb : sizeKb // ignore: cast_nullable_to_non_nullable
as int?,coveragePeriod: freezed == coveragePeriod ? _self.coveragePeriod : coveragePeriod // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LogDocumentSubmitted implements LogEvent {
  const LogDocumentSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogDocumentSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogEvent.documentSubmitted()';
}


}




/// @nodoc


class LogGoalMovementSubmitted implements LogEvent {
  const LogGoalMovementSubmitted({required this.goalId, required this.amount, required this.label});
  

 final  String goalId;
 final  double amount;
 final  String label;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogGoalMovementSubmittedCopyWith<LogGoalMovementSubmitted> get copyWith => _$LogGoalMovementSubmittedCopyWithImpl<LogGoalMovementSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogGoalMovementSubmitted&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,goalId,amount,label);

@override
String toString() {
  return 'LogEvent.goalMovementSubmitted(goalId: $goalId, amount: $amount, label: $label)';
}


}

/// @nodoc
abstract mixin class $LogGoalMovementSubmittedCopyWith<$Res> implements $LogEventCopyWith<$Res> {
  factory $LogGoalMovementSubmittedCopyWith(LogGoalMovementSubmitted value, $Res Function(LogGoalMovementSubmitted) _then) = _$LogGoalMovementSubmittedCopyWithImpl;
@useResult
$Res call({
 String goalId, double amount, String label
});




}
/// @nodoc
class _$LogGoalMovementSubmittedCopyWithImpl<$Res>
    implements $LogGoalMovementSubmittedCopyWith<$Res> {
  _$LogGoalMovementSubmittedCopyWithImpl(this._self, this._then);

  final LogGoalMovementSubmitted _self;
  final $Res Function(LogGoalMovementSubmitted) _then;

/// Create a copy of LogEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goalId = null,Object? amount = null,Object? label = null,}) {
  return _then(LogGoalMovementSubmitted(
goalId: null == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LogState {

 bool get isReady; bool get isSaving; String get owner; List<FinancialAccount> get accounts; List<MiaCategory> get categories; List<Goal> get goals;/// Recent ledger rows, so a receipt can be attached to what it pays for.
 List<MiaTransaction> get transactions;// Transaction draft
 LoggedMoneyKind get transactionKind; double get transactionAmount; String get transactionDescription; DateTime get transactionDate; bool get transactionShared; bool get transactionBusiness; bool get transactionReimbursable; String? get transactionAccountId; String? get transactionToAccountId; String? get transactionCategoryId; String? get transactionNote;// Bill draft
 String get billProvider; ObligationKind get billKind; double get billAmount; DateTime get billDueDate; RecurrenceFrequency get billFrequency; bool get billAutopay; bool get billShared; String? get billPaymentAccountName;// Expected money draft
 ExpectedMoneyKind get expectedKind; String get expectedCounterparty; double get expectedAmount; DateTime get expectedDate; bool get expectedShared; String? get expectedNote;// Account draft
 String get accountName; String get accountInstitution; AccountType get accountType; double get accountBalance; bool get accountShared;// Receipt draft
 String get receiptMerchant; double get receiptTotal; double get receiptGst; DateTime get receiptDate; String? get receiptNumber; String? get receiptTransactionId;// Purchase draft
 String get purchaseItemName; String get purchaseRetailer; double get purchaseAmount; DateTime get purchaseDate; int? get purchaseWarrantyMonths; String? get purchaseSerial; String? get purchaseNote;// Document draft
 String get documentName; DocumentKind get documentKind; String get documentFileType; int get documentSizeKb; String get documentCoverage;// Results
 MiaTransaction? get createdTransaction; Bill? get createdBill; ExpectedMoney? get createdExpected; FinancialAccount? get createdAccount; Receipt? get createdReceipt; PurchaseRecord? get createdPurchase; MiaDocument? get createdDocument; Goal? get updatedGoal;
/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogStateCopyWith<LogState> get copyWith => _$LogStateCopyWithImpl<LogState>(this as LogState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogState&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other.accounts, accounts)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.goals, goals)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.transactionKind, transactionKind) || other.transactionKind == transactionKind)&&(identical(other.transactionAmount, transactionAmount) || other.transactionAmount == transactionAmount)&&(identical(other.transactionDescription, transactionDescription) || other.transactionDescription == transactionDescription)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.transactionShared, transactionShared) || other.transactionShared == transactionShared)&&(identical(other.transactionBusiness, transactionBusiness) || other.transactionBusiness == transactionBusiness)&&(identical(other.transactionReimbursable, transactionReimbursable) || other.transactionReimbursable == transactionReimbursable)&&(identical(other.transactionAccountId, transactionAccountId) || other.transactionAccountId == transactionAccountId)&&(identical(other.transactionToAccountId, transactionToAccountId) || other.transactionToAccountId == transactionToAccountId)&&(identical(other.transactionCategoryId, transactionCategoryId) || other.transactionCategoryId == transactionCategoryId)&&(identical(other.transactionNote, transactionNote) || other.transactionNote == transactionNote)&&(identical(other.billProvider, billProvider) || other.billProvider == billProvider)&&(identical(other.billKind, billKind) || other.billKind == billKind)&&(identical(other.billAmount, billAmount) || other.billAmount == billAmount)&&(identical(other.billDueDate, billDueDate) || other.billDueDate == billDueDate)&&(identical(other.billFrequency, billFrequency) || other.billFrequency == billFrequency)&&(identical(other.billAutopay, billAutopay) || other.billAutopay == billAutopay)&&(identical(other.billShared, billShared) || other.billShared == billShared)&&(identical(other.billPaymentAccountName, billPaymentAccountName) || other.billPaymentAccountName == billPaymentAccountName)&&(identical(other.expectedKind, expectedKind) || other.expectedKind == expectedKind)&&(identical(other.expectedCounterparty, expectedCounterparty) || other.expectedCounterparty == expectedCounterparty)&&(identical(other.expectedAmount, expectedAmount) || other.expectedAmount == expectedAmount)&&(identical(other.expectedDate, expectedDate) || other.expectedDate == expectedDate)&&(identical(other.expectedShared, expectedShared) || other.expectedShared == expectedShared)&&(identical(other.expectedNote, expectedNote) || other.expectedNote == expectedNote)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountInstitution, accountInstitution) || other.accountInstitution == accountInstitution)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.accountBalance, accountBalance) || other.accountBalance == accountBalance)&&(identical(other.accountShared, accountShared) || other.accountShared == accountShared)&&(identical(other.receiptMerchant, receiptMerchant) || other.receiptMerchant == receiptMerchant)&&(identical(other.receiptTotal, receiptTotal) || other.receiptTotal == receiptTotal)&&(identical(other.receiptGst, receiptGst) || other.receiptGst == receiptGst)&&(identical(other.receiptDate, receiptDate) || other.receiptDate == receiptDate)&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.receiptTransactionId, receiptTransactionId) || other.receiptTransactionId == receiptTransactionId)&&(identical(other.purchaseItemName, purchaseItemName) || other.purchaseItemName == purchaseItemName)&&(identical(other.purchaseRetailer, purchaseRetailer) || other.purchaseRetailer == purchaseRetailer)&&(identical(other.purchaseAmount, purchaseAmount) || other.purchaseAmount == purchaseAmount)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.purchaseWarrantyMonths, purchaseWarrantyMonths) || other.purchaseWarrantyMonths == purchaseWarrantyMonths)&&(identical(other.purchaseSerial, purchaseSerial) || other.purchaseSerial == purchaseSerial)&&(identical(other.purchaseNote, purchaseNote) || other.purchaseNote == purchaseNote)&&(identical(other.documentName, documentName) || other.documentName == documentName)&&(identical(other.documentKind, documentKind) || other.documentKind == documentKind)&&(identical(other.documentFileType, documentFileType) || other.documentFileType == documentFileType)&&(identical(other.documentSizeKb, documentSizeKb) || other.documentSizeKb == documentSizeKb)&&(identical(other.documentCoverage, documentCoverage) || other.documentCoverage == documentCoverage)&&(identical(other.createdTransaction, createdTransaction) || other.createdTransaction == createdTransaction)&&(identical(other.createdBill, createdBill) || other.createdBill == createdBill)&&(identical(other.createdExpected, createdExpected) || other.createdExpected == createdExpected)&&(identical(other.createdAccount, createdAccount) || other.createdAccount == createdAccount)&&(identical(other.createdReceipt, createdReceipt) || other.createdReceipt == createdReceipt)&&(identical(other.createdPurchase, createdPurchase) || other.createdPurchase == createdPurchase)&&(identical(other.createdDocument, createdDocument) || other.createdDocument == createdDocument)&&(identical(other.updatedGoal, updatedGoal) || other.updatedGoal == updatedGoal));
}


@override
int get hashCode => Object.hashAll([runtimeType,isReady,isSaving,owner,const DeepCollectionEquality().hash(accounts),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(goals),const DeepCollectionEquality().hash(transactions),transactionKind,transactionAmount,transactionDescription,transactionDate,transactionShared,transactionBusiness,transactionReimbursable,transactionAccountId,transactionToAccountId,transactionCategoryId,transactionNote,billProvider,billKind,billAmount,billDueDate,billFrequency,billAutopay,billShared,billPaymentAccountName,expectedKind,expectedCounterparty,expectedAmount,expectedDate,expectedShared,expectedNote,accountName,accountInstitution,accountType,accountBalance,accountShared,receiptMerchant,receiptTotal,receiptGst,receiptDate,receiptNumber,receiptTransactionId,purchaseItemName,purchaseRetailer,purchaseAmount,purchaseDate,purchaseWarrantyMonths,purchaseSerial,purchaseNote,documentName,documentKind,documentFileType,documentSizeKb,documentCoverage,createdTransaction,createdBill,createdExpected,createdAccount,createdReceipt,createdPurchase,createdDocument,updatedGoal]);

@override
String toString() {
  return 'LogState(isReady: $isReady, isSaving: $isSaving, owner: $owner, accounts: $accounts, categories: $categories, goals: $goals, transactions: $transactions, transactionKind: $transactionKind, transactionAmount: $transactionAmount, transactionDescription: $transactionDescription, transactionDate: $transactionDate, transactionShared: $transactionShared, transactionBusiness: $transactionBusiness, transactionReimbursable: $transactionReimbursable, transactionAccountId: $transactionAccountId, transactionToAccountId: $transactionToAccountId, transactionCategoryId: $transactionCategoryId, transactionNote: $transactionNote, billProvider: $billProvider, billKind: $billKind, billAmount: $billAmount, billDueDate: $billDueDate, billFrequency: $billFrequency, billAutopay: $billAutopay, billShared: $billShared, billPaymentAccountName: $billPaymentAccountName, expectedKind: $expectedKind, expectedCounterparty: $expectedCounterparty, expectedAmount: $expectedAmount, expectedDate: $expectedDate, expectedShared: $expectedShared, expectedNote: $expectedNote, accountName: $accountName, accountInstitution: $accountInstitution, accountType: $accountType, accountBalance: $accountBalance, accountShared: $accountShared, receiptMerchant: $receiptMerchant, receiptTotal: $receiptTotal, receiptGst: $receiptGst, receiptDate: $receiptDate, receiptNumber: $receiptNumber, receiptTransactionId: $receiptTransactionId, purchaseItemName: $purchaseItemName, purchaseRetailer: $purchaseRetailer, purchaseAmount: $purchaseAmount, purchaseDate: $purchaseDate, purchaseWarrantyMonths: $purchaseWarrantyMonths, purchaseSerial: $purchaseSerial, purchaseNote: $purchaseNote, documentName: $documentName, documentKind: $documentKind, documentFileType: $documentFileType, documentSizeKb: $documentSizeKb, documentCoverage: $documentCoverage, createdTransaction: $createdTransaction, createdBill: $createdBill, createdExpected: $createdExpected, createdAccount: $createdAccount, createdReceipt: $createdReceipt, createdPurchase: $createdPurchase, createdDocument: $createdDocument, updatedGoal: $updatedGoal)';
}


}

/// @nodoc
abstract mixin class $LogStateCopyWith<$Res>  {
  factory $LogStateCopyWith(LogState value, $Res Function(LogState) _then) = _$LogStateCopyWithImpl;
@useResult
$Res call({
 bool isReady, bool isSaving, String owner, List<FinancialAccount> accounts, List<MiaCategory> categories, List<Goal> goals, List<MiaTransaction> transactions, LoggedMoneyKind transactionKind, double transactionAmount, String transactionDescription, DateTime transactionDate, bool transactionShared, bool transactionBusiness, bool transactionReimbursable, String? transactionAccountId, String? transactionToAccountId, String? transactionCategoryId, String? transactionNote, String billProvider, ObligationKind billKind, double billAmount, DateTime billDueDate, RecurrenceFrequency billFrequency, bool billAutopay, bool billShared, String? billPaymentAccountName, ExpectedMoneyKind expectedKind, String expectedCounterparty, double expectedAmount, DateTime expectedDate, bool expectedShared, String? expectedNote, String accountName, String accountInstitution, AccountType accountType, double accountBalance, bool accountShared, String receiptMerchant, double receiptTotal, double receiptGst, DateTime receiptDate, String? receiptNumber, String? receiptTransactionId, String purchaseItemName, String purchaseRetailer, double purchaseAmount, DateTime purchaseDate, int? purchaseWarrantyMonths, String? purchaseSerial, String? purchaseNote, String documentName, DocumentKind documentKind, String documentFileType, int documentSizeKb, String documentCoverage, MiaTransaction? createdTransaction, Bill? createdBill, ExpectedMoney? createdExpected, FinancialAccount? createdAccount, Receipt? createdReceipt, PurchaseRecord? createdPurchase, MiaDocument? createdDocument, Goal? updatedGoal
});




}
/// @nodoc
class _$LogStateCopyWithImpl<$Res>
    implements $LogStateCopyWith<$Res> {
  _$LogStateCopyWithImpl(this._self, this._then);

  final LogState _self;
  final $Res Function(LogState) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isReady = null,Object? isSaving = null,Object? owner = null,Object? accounts = null,Object? categories = null,Object? goals = null,Object? transactions = null,Object? transactionKind = null,Object? transactionAmount = null,Object? transactionDescription = null,Object? transactionDate = null,Object? transactionShared = null,Object? transactionBusiness = null,Object? transactionReimbursable = null,Object? transactionAccountId = freezed,Object? transactionToAccountId = freezed,Object? transactionCategoryId = freezed,Object? transactionNote = freezed,Object? billProvider = null,Object? billKind = null,Object? billAmount = null,Object? billDueDate = null,Object? billFrequency = null,Object? billAutopay = null,Object? billShared = null,Object? billPaymentAccountName = freezed,Object? expectedKind = null,Object? expectedCounterparty = null,Object? expectedAmount = null,Object? expectedDate = null,Object? expectedShared = null,Object? expectedNote = freezed,Object? accountName = null,Object? accountInstitution = null,Object? accountType = null,Object? accountBalance = null,Object? accountShared = null,Object? receiptMerchant = null,Object? receiptTotal = null,Object? receiptGst = null,Object? receiptDate = null,Object? receiptNumber = freezed,Object? receiptTransactionId = freezed,Object? purchaseItemName = null,Object? purchaseRetailer = null,Object? purchaseAmount = null,Object? purchaseDate = null,Object? purchaseWarrantyMonths = freezed,Object? purchaseSerial = freezed,Object? purchaseNote = freezed,Object? documentName = null,Object? documentKind = null,Object? documentFileType = null,Object? documentSizeKb = null,Object? documentCoverage = null,Object? createdTransaction = freezed,Object? createdBill = freezed,Object? createdExpected = freezed,Object? createdAccount = freezed,Object? createdReceipt = freezed,Object? createdPurchase = freezed,Object? createdDocument = freezed,Object? updatedGoal = freezed,}) {
  return _then(_self.copyWith(
isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,accounts: null == accounts ? _self.accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<FinancialAccount>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<MiaCategory>,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<Goal>,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<MiaTransaction>,transactionKind: null == transactionKind ? _self.transactionKind : transactionKind // ignore: cast_nullable_to_non_nullable
as LoggedMoneyKind,transactionAmount: null == transactionAmount ? _self.transactionAmount : transactionAmount // ignore: cast_nullable_to_non_nullable
as double,transactionDescription: null == transactionDescription ? _self.transactionDescription : transactionDescription // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,transactionShared: null == transactionShared ? _self.transactionShared : transactionShared // ignore: cast_nullable_to_non_nullable
as bool,transactionBusiness: null == transactionBusiness ? _self.transactionBusiness : transactionBusiness // ignore: cast_nullable_to_non_nullable
as bool,transactionReimbursable: null == transactionReimbursable ? _self.transactionReimbursable : transactionReimbursable // ignore: cast_nullable_to_non_nullable
as bool,transactionAccountId: freezed == transactionAccountId ? _self.transactionAccountId : transactionAccountId // ignore: cast_nullable_to_non_nullable
as String?,transactionToAccountId: freezed == transactionToAccountId ? _self.transactionToAccountId : transactionToAccountId // ignore: cast_nullable_to_non_nullable
as String?,transactionCategoryId: freezed == transactionCategoryId ? _self.transactionCategoryId : transactionCategoryId // ignore: cast_nullable_to_non_nullable
as String?,transactionNote: freezed == transactionNote ? _self.transactionNote : transactionNote // ignore: cast_nullable_to_non_nullable
as String?,billProvider: null == billProvider ? _self.billProvider : billProvider // ignore: cast_nullable_to_non_nullable
as String,billKind: null == billKind ? _self.billKind : billKind // ignore: cast_nullable_to_non_nullable
as ObligationKind,billAmount: null == billAmount ? _self.billAmount : billAmount // ignore: cast_nullable_to_non_nullable
as double,billDueDate: null == billDueDate ? _self.billDueDate : billDueDate // ignore: cast_nullable_to_non_nullable
as DateTime,billFrequency: null == billFrequency ? _self.billFrequency : billFrequency // ignore: cast_nullable_to_non_nullable
as RecurrenceFrequency,billAutopay: null == billAutopay ? _self.billAutopay : billAutopay // ignore: cast_nullable_to_non_nullable
as bool,billShared: null == billShared ? _self.billShared : billShared // ignore: cast_nullable_to_non_nullable
as bool,billPaymentAccountName: freezed == billPaymentAccountName ? _self.billPaymentAccountName : billPaymentAccountName // ignore: cast_nullable_to_non_nullable
as String?,expectedKind: null == expectedKind ? _self.expectedKind : expectedKind // ignore: cast_nullable_to_non_nullable
as ExpectedMoneyKind,expectedCounterparty: null == expectedCounterparty ? _self.expectedCounterparty : expectedCounterparty // ignore: cast_nullable_to_non_nullable
as String,expectedAmount: null == expectedAmount ? _self.expectedAmount : expectedAmount // ignore: cast_nullable_to_non_nullable
as double,expectedDate: null == expectedDate ? _self.expectedDate : expectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,expectedShared: null == expectedShared ? _self.expectedShared : expectedShared // ignore: cast_nullable_to_non_nullable
as bool,expectedNote: freezed == expectedNote ? _self.expectedNote : expectedNote // ignore: cast_nullable_to_non_nullable
as String?,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,accountInstitution: null == accountInstitution ? _self.accountInstitution : accountInstitution // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as AccountType,accountBalance: null == accountBalance ? _self.accountBalance : accountBalance // ignore: cast_nullable_to_non_nullable
as double,accountShared: null == accountShared ? _self.accountShared : accountShared // ignore: cast_nullable_to_non_nullable
as bool,receiptMerchant: null == receiptMerchant ? _self.receiptMerchant : receiptMerchant // ignore: cast_nullable_to_non_nullable
as String,receiptTotal: null == receiptTotal ? _self.receiptTotal : receiptTotal // ignore: cast_nullable_to_non_nullable
as double,receiptGst: null == receiptGst ? _self.receiptGst : receiptGst // ignore: cast_nullable_to_non_nullable
as double,receiptDate: null == receiptDate ? _self.receiptDate : receiptDate // ignore: cast_nullable_to_non_nullable
as DateTime,receiptNumber: freezed == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String?,receiptTransactionId: freezed == receiptTransactionId ? _self.receiptTransactionId : receiptTransactionId // ignore: cast_nullable_to_non_nullable
as String?,purchaseItemName: null == purchaseItemName ? _self.purchaseItemName : purchaseItemName // ignore: cast_nullable_to_non_nullable
as String,purchaseRetailer: null == purchaseRetailer ? _self.purchaseRetailer : purchaseRetailer // ignore: cast_nullable_to_non_nullable
as String,purchaseAmount: null == purchaseAmount ? _self.purchaseAmount : purchaseAmount // ignore: cast_nullable_to_non_nullable
as double,purchaseDate: null == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,purchaseWarrantyMonths: freezed == purchaseWarrantyMonths ? _self.purchaseWarrantyMonths : purchaseWarrantyMonths // ignore: cast_nullable_to_non_nullable
as int?,purchaseSerial: freezed == purchaseSerial ? _self.purchaseSerial : purchaseSerial // ignore: cast_nullable_to_non_nullable
as String?,purchaseNote: freezed == purchaseNote ? _self.purchaseNote : purchaseNote // ignore: cast_nullable_to_non_nullable
as String?,documentName: null == documentName ? _self.documentName : documentName // ignore: cast_nullable_to_non_nullable
as String,documentKind: null == documentKind ? _self.documentKind : documentKind // ignore: cast_nullable_to_non_nullable
as DocumentKind,documentFileType: null == documentFileType ? _self.documentFileType : documentFileType // ignore: cast_nullable_to_non_nullable
as String,documentSizeKb: null == documentSizeKb ? _self.documentSizeKb : documentSizeKb // ignore: cast_nullable_to_non_nullable
as int,documentCoverage: null == documentCoverage ? _self.documentCoverage : documentCoverage // ignore: cast_nullable_to_non_nullable
as String,createdTransaction: freezed == createdTransaction ? _self.createdTransaction : createdTransaction // ignore: cast_nullable_to_non_nullable
as MiaTransaction?,createdBill: freezed == createdBill ? _self.createdBill : createdBill // ignore: cast_nullable_to_non_nullable
as Bill?,createdExpected: freezed == createdExpected ? _self.createdExpected : createdExpected // ignore: cast_nullable_to_non_nullable
as ExpectedMoney?,createdAccount: freezed == createdAccount ? _self.createdAccount : createdAccount // ignore: cast_nullable_to_non_nullable
as FinancialAccount?,createdReceipt: freezed == createdReceipt ? _self.createdReceipt : createdReceipt // ignore: cast_nullable_to_non_nullable
as Receipt?,createdPurchase: freezed == createdPurchase ? _self.createdPurchase : createdPurchase // ignore: cast_nullable_to_non_nullable
as PurchaseRecord?,createdDocument: freezed == createdDocument ? _self.createdDocument : createdDocument // ignore: cast_nullable_to_non_nullable
as MiaDocument?,updatedGoal: freezed == updatedGoal ? _self.updatedGoal : updatedGoal // ignore: cast_nullable_to_non_nullable
as Goal?,
  ));
}

}


/// Adds pattern-matching-related methods to [LogState].
extension LogStatePatterns on LogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogState value)  $default,){
final _that = this;
switch (_that) {
case _LogState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogState value)?  $default,){
final _that = this;
switch (_that) {
case _LogState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isReady,  bool isSaving,  String owner,  List<FinancialAccount> accounts,  List<MiaCategory> categories,  List<Goal> goals,  List<MiaTransaction> transactions,  LoggedMoneyKind transactionKind,  double transactionAmount,  String transactionDescription,  DateTime transactionDate,  bool transactionShared,  bool transactionBusiness,  bool transactionReimbursable,  String? transactionAccountId,  String? transactionToAccountId,  String? transactionCategoryId,  String? transactionNote,  String billProvider,  ObligationKind billKind,  double billAmount,  DateTime billDueDate,  RecurrenceFrequency billFrequency,  bool billAutopay,  bool billShared,  String? billPaymentAccountName,  ExpectedMoneyKind expectedKind,  String expectedCounterparty,  double expectedAmount,  DateTime expectedDate,  bool expectedShared,  String? expectedNote,  String accountName,  String accountInstitution,  AccountType accountType,  double accountBalance,  bool accountShared,  String receiptMerchant,  double receiptTotal,  double receiptGst,  DateTime receiptDate,  String? receiptNumber,  String? receiptTransactionId,  String purchaseItemName,  String purchaseRetailer,  double purchaseAmount,  DateTime purchaseDate,  int? purchaseWarrantyMonths,  String? purchaseSerial,  String? purchaseNote,  String documentName,  DocumentKind documentKind,  String documentFileType,  int documentSizeKb,  String documentCoverage,  MiaTransaction? createdTransaction,  Bill? createdBill,  ExpectedMoney? createdExpected,  FinancialAccount? createdAccount,  Receipt? createdReceipt,  PurchaseRecord? createdPurchase,  MiaDocument? createdDocument,  Goal? updatedGoal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogState() when $default != null:
return $default(_that.isReady,_that.isSaving,_that.owner,_that.accounts,_that.categories,_that.goals,_that.transactions,_that.transactionKind,_that.transactionAmount,_that.transactionDescription,_that.transactionDate,_that.transactionShared,_that.transactionBusiness,_that.transactionReimbursable,_that.transactionAccountId,_that.transactionToAccountId,_that.transactionCategoryId,_that.transactionNote,_that.billProvider,_that.billKind,_that.billAmount,_that.billDueDate,_that.billFrequency,_that.billAutopay,_that.billShared,_that.billPaymentAccountName,_that.expectedKind,_that.expectedCounterparty,_that.expectedAmount,_that.expectedDate,_that.expectedShared,_that.expectedNote,_that.accountName,_that.accountInstitution,_that.accountType,_that.accountBalance,_that.accountShared,_that.receiptMerchant,_that.receiptTotal,_that.receiptGst,_that.receiptDate,_that.receiptNumber,_that.receiptTransactionId,_that.purchaseItemName,_that.purchaseRetailer,_that.purchaseAmount,_that.purchaseDate,_that.purchaseWarrantyMonths,_that.purchaseSerial,_that.purchaseNote,_that.documentName,_that.documentKind,_that.documentFileType,_that.documentSizeKb,_that.documentCoverage,_that.createdTransaction,_that.createdBill,_that.createdExpected,_that.createdAccount,_that.createdReceipt,_that.createdPurchase,_that.createdDocument,_that.updatedGoal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isReady,  bool isSaving,  String owner,  List<FinancialAccount> accounts,  List<MiaCategory> categories,  List<Goal> goals,  List<MiaTransaction> transactions,  LoggedMoneyKind transactionKind,  double transactionAmount,  String transactionDescription,  DateTime transactionDate,  bool transactionShared,  bool transactionBusiness,  bool transactionReimbursable,  String? transactionAccountId,  String? transactionToAccountId,  String? transactionCategoryId,  String? transactionNote,  String billProvider,  ObligationKind billKind,  double billAmount,  DateTime billDueDate,  RecurrenceFrequency billFrequency,  bool billAutopay,  bool billShared,  String? billPaymentAccountName,  ExpectedMoneyKind expectedKind,  String expectedCounterparty,  double expectedAmount,  DateTime expectedDate,  bool expectedShared,  String? expectedNote,  String accountName,  String accountInstitution,  AccountType accountType,  double accountBalance,  bool accountShared,  String receiptMerchant,  double receiptTotal,  double receiptGst,  DateTime receiptDate,  String? receiptNumber,  String? receiptTransactionId,  String purchaseItemName,  String purchaseRetailer,  double purchaseAmount,  DateTime purchaseDate,  int? purchaseWarrantyMonths,  String? purchaseSerial,  String? purchaseNote,  String documentName,  DocumentKind documentKind,  String documentFileType,  int documentSizeKb,  String documentCoverage,  MiaTransaction? createdTransaction,  Bill? createdBill,  ExpectedMoney? createdExpected,  FinancialAccount? createdAccount,  Receipt? createdReceipt,  PurchaseRecord? createdPurchase,  MiaDocument? createdDocument,  Goal? updatedGoal)  $default,) {final _that = this;
switch (_that) {
case _LogState():
return $default(_that.isReady,_that.isSaving,_that.owner,_that.accounts,_that.categories,_that.goals,_that.transactions,_that.transactionKind,_that.transactionAmount,_that.transactionDescription,_that.transactionDate,_that.transactionShared,_that.transactionBusiness,_that.transactionReimbursable,_that.transactionAccountId,_that.transactionToAccountId,_that.transactionCategoryId,_that.transactionNote,_that.billProvider,_that.billKind,_that.billAmount,_that.billDueDate,_that.billFrequency,_that.billAutopay,_that.billShared,_that.billPaymentAccountName,_that.expectedKind,_that.expectedCounterparty,_that.expectedAmount,_that.expectedDate,_that.expectedShared,_that.expectedNote,_that.accountName,_that.accountInstitution,_that.accountType,_that.accountBalance,_that.accountShared,_that.receiptMerchant,_that.receiptTotal,_that.receiptGst,_that.receiptDate,_that.receiptNumber,_that.receiptTransactionId,_that.purchaseItemName,_that.purchaseRetailer,_that.purchaseAmount,_that.purchaseDate,_that.purchaseWarrantyMonths,_that.purchaseSerial,_that.purchaseNote,_that.documentName,_that.documentKind,_that.documentFileType,_that.documentSizeKb,_that.documentCoverage,_that.createdTransaction,_that.createdBill,_that.createdExpected,_that.createdAccount,_that.createdReceipt,_that.createdPurchase,_that.createdDocument,_that.updatedGoal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isReady,  bool isSaving,  String owner,  List<FinancialAccount> accounts,  List<MiaCategory> categories,  List<Goal> goals,  List<MiaTransaction> transactions,  LoggedMoneyKind transactionKind,  double transactionAmount,  String transactionDescription,  DateTime transactionDate,  bool transactionShared,  bool transactionBusiness,  bool transactionReimbursable,  String? transactionAccountId,  String? transactionToAccountId,  String? transactionCategoryId,  String? transactionNote,  String billProvider,  ObligationKind billKind,  double billAmount,  DateTime billDueDate,  RecurrenceFrequency billFrequency,  bool billAutopay,  bool billShared,  String? billPaymentAccountName,  ExpectedMoneyKind expectedKind,  String expectedCounterparty,  double expectedAmount,  DateTime expectedDate,  bool expectedShared,  String? expectedNote,  String accountName,  String accountInstitution,  AccountType accountType,  double accountBalance,  bool accountShared,  String receiptMerchant,  double receiptTotal,  double receiptGst,  DateTime receiptDate,  String? receiptNumber,  String? receiptTransactionId,  String purchaseItemName,  String purchaseRetailer,  double purchaseAmount,  DateTime purchaseDate,  int? purchaseWarrantyMonths,  String? purchaseSerial,  String? purchaseNote,  String documentName,  DocumentKind documentKind,  String documentFileType,  int documentSizeKb,  String documentCoverage,  MiaTransaction? createdTransaction,  Bill? createdBill,  ExpectedMoney? createdExpected,  FinancialAccount? createdAccount,  Receipt? createdReceipt,  PurchaseRecord? createdPurchase,  MiaDocument? createdDocument,  Goal? updatedGoal)?  $default,) {final _that = this;
switch (_that) {
case _LogState() when $default != null:
return $default(_that.isReady,_that.isSaving,_that.owner,_that.accounts,_that.categories,_that.goals,_that.transactions,_that.transactionKind,_that.transactionAmount,_that.transactionDescription,_that.transactionDate,_that.transactionShared,_that.transactionBusiness,_that.transactionReimbursable,_that.transactionAccountId,_that.transactionToAccountId,_that.transactionCategoryId,_that.transactionNote,_that.billProvider,_that.billKind,_that.billAmount,_that.billDueDate,_that.billFrequency,_that.billAutopay,_that.billShared,_that.billPaymentAccountName,_that.expectedKind,_that.expectedCounterparty,_that.expectedAmount,_that.expectedDate,_that.expectedShared,_that.expectedNote,_that.accountName,_that.accountInstitution,_that.accountType,_that.accountBalance,_that.accountShared,_that.receiptMerchant,_that.receiptTotal,_that.receiptGst,_that.receiptDate,_that.receiptNumber,_that.receiptTransactionId,_that.purchaseItemName,_that.purchaseRetailer,_that.purchaseAmount,_that.purchaseDate,_that.purchaseWarrantyMonths,_that.purchaseSerial,_that.purchaseNote,_that.documentName,_that.documentKind,_that.documentFileType,_that.documentSizeKb,_that.documentCoverage,_that.createdTransaction,_that.createdBill,_that.createdExpected,_that.createdAccount,_that.createdReceipt,_that.createdPurchase,_that.createdDocument,_that.updatedGoal);case _:
  return null;

}
}

}

/// @nodoc


class _LogState implements LogState {
  const _LogState({required this.isReady, required this.isSaving, required this.owner, required final  List<FinancialAccount> accounts, required final  List<MiaCategory> categories, required final  List<Goal> goals, required final  List<MiaTransaction> transactions, required this.transactionKind, required this.transactionAmount, required this.transactionDescription, required this.transactionDate, required this.transactionShared, required this.transactionBusiness, required this.transactionReimbursable, this.transactionAccountId, this.transactionToAccountId, this.transactionCategoryId, this.transactionNote, required this.billProvider, required this.billKind, required this.billAmount, required this.billDueDate, required this.billFrequency, required this.billAutopay, required this.billShared, this.billPaymentAccountName, required this.expectedKind, required this.expectedCounterparty, required this.expectedAmount, required this.expectedDate, required this.expectedShared, this.expectedNote, required this.accountName, required this.accountInstitution, required this.accountType, required this.accountBalance, required this.accountShared, required this.receiptMerchant, required this.receiptTotal, required this.receiptGst, required this.receiptDate, this.receiptNumber, this.receiptTransactionId, required this.purchaseItemName, required this.purchaseRetailer, required this.purchaseAmount, required this.purchaseDate, this.purchaseWarrantyMonths, this.purchaseSerial, this.purchaseNote, required this.documentName, required this.documentKind, required this.documentFileType, required this.documentSizeKb, required this.documentCoverage, this.createdTransaction, this.createdBill, this.createdExpected, this.createdAccount, this.createdReceipt, this.createdPurchase, this.createdDocument, this.updatedGoal}): _accounts = accounts,_categories = categories,_goals = goals,_transactions = transactions;
  

@override final  bool isReady;
@override final  bool isSaving;
@override final  String owner;
 final  List<FinancialAccount> _accounts;
@override List<FinancialAccount> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

 final  List<MiaCategory> _categories;
@override List<MiaCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<Goal> _goals;
@override List<Goal> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}

/// Recent ledger rows, so a receipt can be attached to what it pays for.
 final  List<MiaTransaction> _transactions;
/// Recent ledger rows, so a receipt can be attached to what it pays for.
@override List<MiaTransaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

// Transaction draft
@override final  LoggedMoneyKind transactionKind;
@override final  double transactionAmount;
@override final  String transactionDescription;
@override final  DateTime transactionDate;
@override final  bool transactionShared;
@override final  bool transactionBusiness;
@override final  bool transactionReimbursable;
@override final  String? transactionAccountId;
@override final  String? transactionToAccountId;
@override final  String? transactionCategoryId;
@override final  String? transactionNote;
// Bill draft
@override final  String billProvider;
@override final  ObligationKind billKind;
@override final  double billAmount;
@override final  DateTime billDueDate;
@override final  RecurrenceFrequency billFrequency;
@override final  bool billAutopay;
@override final  bool billShared;
@override final  String? billPaymentAccountName;
// Expected money draft
@override final  ExpectedMoneyKind expectedKind;
@override final  String expectedCounterparty;
@override final  double expectedAmount;
@override final  DateTime expectedDate;
@override final  bool expectedShared;
@override final  String? expectedNote;
// Account draft
@override final  String accountName;
@override final  String accountInstitution;
@override final  AccountType accountType;
@override final  double accountBalance;
@override final  bool accountShared;
// Receipt draft
@override final  String receiptMerchant;
@override final  double receiptTotal;
@override final  double receiptGst;
@override final  DateTime receiptDate;
@override final  String? receiptNumber;
@override final  String? receiptTransactionId;
// Purchase draft
@override final  String purchaseItemName;
@override final  String purchaseRetailer;
@override final  double purchaseAmount;
@override final  DateTime purchaseDate;
@override final  int? purchaseWarrantyMonths;
@override final  String? purchaseSerial;
@override final  String? purchaseNote;
// Document draft
@override final  String documentName;
@override final  DocumentKind documentKind;
@override final  String documentFileType;
@override final  int documentSizeKb;
@override final  String documentCoverage;
// Results
@override final  MiaTransaction? createdTransaction;
@override final  Bill? createdBill;
@override final  ExpectedMoney? createdExpected;
@override final  FinancialAccount? createdAccount;
@override final  Receipt? createdReceipt;
@override final  PurchaseRecord? createdPurchase;
@override final  MiaDocument? createdDocument;
@override final  Goal? updatedGoal;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogStateCopyWith<_LogState> get copyWith => __$LogStateCopyWithImpl<_LogState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogState&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._goals, _goals)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.transactionKind, transactionKind) || other.transactionKind == transactionKind)&&(identical(other.transactionAmount, transactionAmount) || other.transactionAmount == transactionAmount)&&(identical(other.transactionDescription, transactionDescription) || other.transactionDescription == transactionDescription)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.transactionShared, transactionShared) || other.transactionShared == transactionShared)&&(identical(other.transactionBusiness, transactionBusiness) || other.transactionBusiness == transactionBusiness)&&(identical(other.transactionReimbursable, transactionReimbursable) || other.transactionReimbursable == transactionReimbursable)&&(identical(other.transactionAccountId, transactionAccountId) || other.transactionAccountId == transactionAccountId)&&(identical(other.transactionToAccountId, transactionToAccountId) || other.transactionToAccountId == transactionToAccountId)&&(identical(other.transactionCategoryId, transactionCategoryId) || other.transactionCategoryId == transactionCategoryId)&&(identical(other.transactionNote, transactionNote) || other.transactionNote == transactionNote)&&(identical(other.billProvider, billProvider) || other.billProvider == billProvider)&&(identical(other.billKind, billKind) || other.billKind == billKind)&&(identical(other.billAmount, billAmount) || other.billAmount == billAmount)&&(identical(other.billDueDate, billDueDate) || other.billDueDate == billDueDate)&&(identical(other.billFrequency, billFrequency) || other.billFrequency == billFrequency)&&(identical(other.billAutopay, billAutopay) || other.billAutopay == billAutopay)&&(identical(other.billShared, billShared) || other.billShared == billShared)&&(identical(other.billPaymentAccountName, billPaymentAccountName) || other.billPaymentAccountName == billPaymentAccountName)&&(identical(other.expectedKind, expectedKind) || other.expectedKind == expectedKind)&&(identical(other.expectedCounterparty, expectedCounterparty) || other.expectedCounterparty == expectedCounterparty)&&(identical(other.expectedAmount, expectedAmount) || other.expectedAmount == expectedAmount)&&(identical(other.expectedDate, expectedDate) || other.expectedDate == expectedDate)&&(identical(other.expectedShared, expectedShared) || other.expectedShared == expectedShared)&&(identical(other.expectedNote, expectedNote) || other.expectedNote == expectedNote)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountInstitution, accountInstitution) || other.accountInstitution == accountInstitution)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.accountBalance, accountBalance) || other.accountBalance == accountBalance)&&(identical(other.accountShared, accountShared) || other.accountShared == accountShared)&&(identical(other.receiptMerchant, receiptMerchant) || other.receiptMerchant == receiptMerchant)&&(identical(other.receiptTotal, receiptTotal) || other.receiptTotal == receiptTotal)&&(identical(other.receiptGst, receiptGst) || other.receiptGst == receiptGst)&&(identical(other.receiptDate, receiptDate) || other.receiptDate == receiptDate)&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.receiptTransactionId, receiptTransactionId) || other.receiptTransactionId == receiptTransactionId)&&(identical(other.purchaseItemName, purchaseItemName) || other.purchaseItemName == purchaseItemName)&&(identical(other.purchaseRetailer, purchaseRetailer) || other.purchaseRetailer == purchaseRetailer)&&(identical(other.purchaseAmount, purchaseAmount) || other.purchaseAmount == purchaseAmount)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.purchaseWarrantyMonths, purchaseWarrantyMonths) || other.purchaseWarrantyMonths == purchaseWarrantyMonths)&&(identical(other.purchaseSerial, purchaseSerial) || other.purchaseSerial == purchaseSerial)&&(identical(other.purchaseNote, purchaseNote) || other.purchaseNote == purchaseNote)&&(identical(other.documentName, documentName) || other.documentName == documentName)&&(identical(other.documentKind, documentKind) || other.documentKind == documentKind)&&(identical(other.documentFileType, documentFileType) || other.documentFileType == documentFileType)&&(identical(other.documentSizeKb, documentSizeKb) || other.documentSizeKb == documentSizeKb)&&(identical(other.documentCoverage, documentCoverage) || other.documentCoverage == documentCoverage)&&(identical(other.createdTransaction, createdTransaction) || other.createdTransaction == createdTransaction)&&(identical(other.createdBill, createdBill) || other.createdBill == createdBill)&&(identical(other.createdExpected, createdExpected) || other.createdExpected == createdExpected)&&(identical(other.createdAccount, createdAccount) || other.createdAccount == createdAccount)&&(identical(other.createdReceipt, createdReceipt) || other.createdReceipt == createdReceipt)&&(identical(other.createdPurchase, createdPurchase) || other.createdPurchase == createdPurchase)&&(identical(other.createdDocument, createdDocument) || other.createdDocument == createdDocument)&&(identical(other.updatedGoal, updatedGoal) || other.updatedGoal == updatedGoal));
}


@override
int get hashCode => Object.hashAll([runtimeType,isReady,isSaving,owner,const DeepCollectionEquality().hash(_accounts),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_goals),const DeepCollectionEquality().hash(_transactions),transactionKind,transactionAmount,transactionDescription,transactionDate,transactionShared,transactionBusiness,transactionReimbursable,transactionAccountId,transactionToAccountId,transactionCategoryId,transactionNote,billProvider,billKind,billAmount,billDueDate,billFrequency,billAutopay,billShared,billPaymentAccountName,expectedKind,expectedCounterparty,expectedAmount,expectedDate,expectedShared,expectedNote,accountName,accountInstitution,accountType,accountBalance,accountShared,receiptMerchant,receiptTotal,receiptGst,receiptDate,receiptNumber,receiptTransactionId,purchaseItemName,purchaseRetailer,purchaseAmount,purchaseDate,purchaseWarrantyMonths,purchaseSerial,purchaseNote,documentName,documentKind,documentFileType,documentSizeKb,documentCoverage,createdTransaction,createdBill,createdExpected,createdAccount,createdReceipt,createdPurchase,createdDocument,updatedGoal]);

@override
String toString() {
  return 'LogState(isReady: $isReady, isSaving: $isSaving, owner: $owner, accounts: $accounts, categories: $categories, goals: $goals, transactions: $transactions, transactionKind: $transactionKind, transactionAmount: $transactionAmount, transactionDescription: $transactionDescription, transactionDate: $transactionDate, transactionShared: $transactionShared, transactionBusiness: $transactionBusiness, transactionReimbursable: $transactionReimbursable, transactionAccountId: $transactionAccountId, transactionToAccountId: $transactionToAccountId, transactionCategoryId: $transactionCategoryId, transactionNote: $transactionNote, billProvider: $billProvider, billKind: $billKind, billAmount: $billAmount, billDueDate: $billDueDate, billFrequency: $billFrequency, billAutopay: $billAutopay, billShared: $billShared, billPaymentAccountName: $billPaymentAccountName, expectedKind: $expectedKind, expectedCounterparty: $expectedCounterparty, expectedAmount: $expectedAmount, expectedDate: $expectedDate, expectedShared: $expectedShared, expectedNote: $expectedNote, accountName: $accountName, accountInstitution: $accountInstitution, accountType: $accountType, accountBalance: $accountBalance, accountShared: $accountShared, receiptMerchant: $receiptMerchant, receiptTotal: $receiptTotal, receiptGst: $receiptGst, receiptDate: $receiptDate, receiptNumber: $receiptNumber, receiptTransactionId: $receiptTransactionId, purchaseItemName: $purchaseItemName, purchaseRetailer: $purchaseRetailer, purchaseAmount: $purchaseAmount, purchaseDate: $purchaseDate, purchaseWarrantyMonths: $purchaseWarrantyMonths, purchaseSerial: $purchaseSerial, purchaseNote: $purchaseNote, documentName: $documentName, documentKind: $documentKind, documentFileType: $documentFileType, documentSizeKb: $documentSizeKb, documentCoverage: $documentCoverage, createdTransaction: $createdTransaction, createdBill: $createdBill, createdExpected: $createdExpected, createdAccount: $createdAccount, createdReceipt: $createdReceipt, createdPurchase: $createdPurchase, createdDocument: $createdDocument, updatedGoal: $updatedGoal)';
}


}

/// @nodoc
abstract mixin class _$LogStateCopyWith<$Res> implements $LogStateCopyWith<$Res> {
  factory _$LogStateCopyWith(_LogState value, $Res Function(_LogState) _then) = __$LogStateCopyWithImpl;
@override @useResult
$Res call({
 bool isReady, bool isSaving, String owner, List<FinancialAccount> accounts, List<MiaCategory> categories, List<Goal> goals, List<MiaTransaction> transactions, LoggedMoneyKind transactionKind, double transactionAmount, String transactionDescription, DateTime transactionDate, bool transactionShared, bool transactionBusiness, bool transactionReimbursable, String? transactionAccountId, String? transactionToAccountId, String? transactionCategoryId, String? transactionNote, String billProvider, ObligationKind billKind, double billAmount, DateTime billDueDate, RecurrenceFrequency billFrequency, bool billAutopay, bool billShared, String? billPaymentAccountName, ExpectedMoneyKind expectedKind, String expectedCounterparty, double expectedAmount, DateTime expectedDate, bool expectedShared, String? expectedNote, String accountName, String accountInstitution, AccountType accountType, double accountBalance, bool accountShared, String receiptMerchant, double receiptTotal, double receiptGst, DateTime receiptDate, String? receiptNumber, String? receiptTransactionId, String purchaseItemName, String purchaseRetailer, double purchaseAmount, DateTime purchaseDate, int? purchaseWarrantyMonths, String? purchaseSerial, String? purchaseNote, String documentName, DocumentKind documentKind, String documentFileType, int documentSizeKb, String documentCoverage, MiaTransaction? createdTransaction, Bill? createdBill, ExpectedMoney? createdExpected, FinancialAccount? createdAccount, Receipt? createdReceipt, PurchaseRecord? createdPurchase, MiaDocument? createdDocument, Goal? updatedGoal
});




}
/// @nodoc
class __$LogStateCopyWithImpl<$Res>
    implements _$LogStateCopyWith<$Res> {
  __$LogStateCopyWithImpl(this._self, this._then);

  final _LogState _self;
  final $Res Function(_LogState) _then;

/// Create a copy of LogState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isReady = null,Object? isSaving = null,Object? owner = null,Object? accounts = null,Object? categories = null,Object? goals = null,Object? transactions = null,Object? transactionKind = null,Object? transactionAmount = null,Object? transactionDescription = null,Object? transactionDate = null,Object? transactionShared = null,Object? transactionBusiness = null,Object? transactionReimbursable = null,Object? transactionAccountId = freezed,Object? transactionToAccountId = freezed,Object? transactionCategoryId = freezed,Object? transactionNote = freezed,Object? billProvider = null,Object? billKind = null,Object? billAmount = null,Object? billDueDate = null,Object? billFrequency = null,Object? billAutopay = null,Object? billShared = null,Object? billPaymentAccountName = freezed,Object? expectedKind = null,Object? expectedCounterparty = null,Object? expectedAmount = null,Object? expectedDate = null,Object? expectedShared = null,Object? expectedNote = freezed,Object? accountName = null,Object? accountInstitution = null,Object? accountType = null,Object? accountBalance = null,Object? accountShared = null,Object? receiptMerchant = null,Object? receiptTotal = null,Object? receiptGst = null,Object? receiptDate = null,Object? receiptNumber = freezed,Object? receiptTransactionId = freezed,Object? purchaseItemName = null,Object? purchaseRetailer = null,Object? purchaseAmount = null,Object? purchaseDate = null,Object? purchaseWarrantyMonths = freezed,Object? purchaseSerial = freezed,Object? purchaseNote = freezed,Object? documentName = null,Object? documentKind = null,Object? documentFileType = null,Object? documentSizeKb = null,Object? documentCoverage = null,Object? createdTransaction = freezed,Object? createdBill = freezed,Object? createdExpected = freezed,Object? createdAccount = freezed,Object? createdReceipt = freezed,Object? createdPurchase = freezed,Object? createdDocument = freezed,Object? updatedGoal = freezed,}) {
  return _then(_LogState(
isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<FinancialAccount>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<MiaCategory>,goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<Goal>,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<MiaTransaction>,transactionKind: null == transactionKind ? _self.transactionKind : transactionKind // ignore: cast_nullable_to_non_nullable
as LoggedMoneyKind,transactionAmount: null == transactionAmount ? _self.transactionAmount : transactionAmount // ignore: cast_nullable_to_non_nullable
as double,transactionDescription: null == transactionDescription ? _self.transactionDescription : transactionDescription // ignore: cast_nullable_to_non_nullable
as String,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,transactionShared: null == transactionShared ? _self.transactionShared : transactionShared // ignore: cast_nullable_to_non_nullable
as bool,transactionBusiness: null == transactionBusiness ? _self.transactionBusiness : transactionBusiness // ignore: cast_nullable_to_non_nullable
as bool,transactionReimbursable: null == transactionReimbursable ? _self.transactionReimbursable : transactionReimbursable // ignore: cast_nullable_to_non_nullable
as bool,transactionAccountId: freezed == transactionAccountId ? _self.transactionAccountId : transactionAccountId // ignore: cast_nullable_to_non_nullable
as String?,transactionToAccountId: freezed == transactionToAccountId ? _self.transactionToAccountId : transactionToAccountId // ignore: cast_nullable_to_non_nullable
as String?,transactionCategoryId: freezed == transactionCategoryId ? _self.transactionCategoryId : transactionCategoryId // ignore: cast_nullable_to_non_nullable
as String?,transactionNote: freezed == transactionNote ? _self.transactionNote : transactionNote // ignore: cast_nullable_to_non_nullable
as String?,billProvider: null == billProvider ? _self.billProvider : billProvider // ignore: cast_nullable_to_non_nullable
as String,billKind: null == billKind ? _self.billKind : billKind // ignore: cast_nullable_to_non_nullable
as ObligationKind,billAmount: null == billAmount ? _self.billAmount : billAmount // ignore: cast_nullable_to_non_nullable
as double,billDueDate: null == billDueDate ? _self.billDueDate : billDueDate // ignore: cast_nullable_to_non_nullable
as DateTime,billFrequency: null == billFrequency ? _self.billFrequency : billFrequency // ignore: cast_nullable_to_non_nullable
as RecurrenceFrequency,billAutopay: null == billAutopay ? _self.billAutopay : billAutopay // ignore: cast_nullable_to_non_nullable
as bool,billShared: null == billShared ? _self.billShared : billShared // ignore: cast_nullable_to_non_nullable
as bool,billPaymentAccountName: freezed == billPaymentAccountName ? _self.billPaymentAccountName : billPaymentAccountName // ignore: cast_nullable_to_non_nullable
as String?,expectedKind: null == expectedKind ? _self.expectedKind : expectedKind // ignore: cast_nullable_to_non_nullable
as ExpectedMoneyKind,expectedCounterparty: null == expectedCounterparty ? _self.expectedCounterparty : expectedCounterparty // ignore: cast_nullable_to_non_nullable
as String,expectedAmount: null == expectedAmount ? _self.expectedAmount : expectedAmount // ignore: cast_nullable_to_non_nullable
as double,expectedDate: null == expectedDate ? _self.expectedDate : expectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,expectedShared: null == expectedShared ? _self.expectedShared : expectedShared // ignore: cast_nullable_to_non_nullable
as bool,expectedNote: freezed == expectedNote ? _self.expectedNote : expectedNote // ignore: cast_nullable_to_non_nullable
as String?,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,accountInstitution: null == accountInstitution ? _self.accountInstitution : accountInstitution // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as AccountType,accountBalance: null == accountBalance ? _self.accountBalance : accountBalance // ignore: cast_nullable_to_non_nullable
as double,accountShared: null == accountShared ? _self.accountShared : accountShared // ignore: cast_nullable_to_non_nullable
as bool,receiptMerchant: null == receiptMerchant ? _self.receiptMerchant : receiptMerchant // ignore: cast_nullable_to_non_nullable
as String,receiptTotal: null == receiptTotal ? _self.receiptTotal : receiptTotal // ignore: cast_nullable_to_non_nullable
as double,receiptGst: null == receiptGst ? _self.receiptGst : receiptGst // ignore: cast_nullable_to_non_nullable
as double,receiptDate: null == receiptDate ? _self.receiptDate : receiptDate // ignore: cast_nullable_to_non_nullable
as DateTime,receiptNumber: freezed == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String?,receiptTransactionId: freezed == receiptTransactionId ? _self.receiptTransactionId : receiptTransactionId // ignore: cast_nullable_to_non_nullable
as String?,purchaseItemName: null == purchaseItemName ? _self.purchaseItemName : purchaseItemName // ignore: cast_nullable_to_non_nullable
as String,purchaseRetailer: null == purchaseRetailer ? _self.purchaseRetailer : purchaseRetailer // ignore: cast_nullable_to_non_nullable
as String,purchaseAmount: null == purchaseAmount ? _self.purchaseAmount : purchaseAmount // ignore: cast_nullable_to_non_nullable
as double,purchaseDate: null == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,purchaseWarrantyMonths: freezed == purchaseWarrantyMonths ? _self.purchaseWarrantyMonths : purchaseWarrantyMonths // ignore: cast_nullable_to_non_nullable
as int?,purchaseSerial: freezed == purchaseSerial ? _self.purchaseSerial : purchaseSerial // ignore: cast_nullable_to_non_nullable
as String?,purchaseNote: freezed == purchaseNote ? _self.purchaseNote : purchaseNote // ignore: cast_nullable_to_non_nullable
as String?,documentName: null == documentName ? _self.documentName : documentName // ignore: cast_nullable_to_non_nullable
as String,documentKind: null == documentKind ? _self.documentKind : documentKind // ignore: cast_nullable_to_non_nullable
as DocumentKind,documentFileType: null == documentFileType ? _self.documentFileType : documentFileType // ignore: cast_nullable_to_non_nullable
as String,documentSizeKb: null == documentSizeKb ? _self.documentSizeKb : documentSizeKb // ignore: cast_nullable_to_non_nullable
as int,documentCoverage: null == documentCoverage ? _self.documentCoverage : documentCoverage // ignore: cast_nullable_to_non_nullable
as String,createdTransaction: freezed == createdTransaction ? _self.createdTransaction : createdTransaction // ignore: cast_nullable_to_non_nullable
as MiaTransaction?,createdBill: freezed == createdBill ? _self.createdBill : createdBill // ignore: cast_nullable_to_non_nullable
as Bill?,createdExpected: freezed == createdExpected ? _self.createdExpected : createdExpected // ignore: cast_nullable_to_non_nullable
as ExpectedMoney?,createdAccount: freezed == createdAccount ? _self.createdAccount : createdAccount // ignore: cast_nullable_to_non_nullable
as FinancialAccount?,createdReceipt: freezed == createdReceipt ? _self.createdReceipt : createdReceipt // ignore: cast_nullable_to_non_nullable
as Receipt?,createdPurchase: freezed == createdPurchase ? _self.createdPurchase : createdPurchase // ignore: cast_nullable_to_non_nullable
as PurchaseRecord?,createdDocument: freezed == createdDocument ? _self.createdDocument : createdDocument // ignore: cast_nullable_to_non_nullable
as MiaDocument?,updatedGoal: freezed == updatedGoal ? _self.updatedGoal : updatedGoal // ignore: cast_nullable_to_non_nullable
as Goal?,
  ));
}


}

// dart format on
