// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeLoad value)?  load,TResult Function( HomeRefresh value)?  refresh,TResult Function( HomeApproveItem value)?  approveItem,TResult Function( HomeDismissItem value)?  dismissItem,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeLoad() when load != null:
return load(_that);case HomeRefresh() when refresh != null:
return refresh(_that);case HomeApproveItem() when approveItem != null:
return approveItem(_that);case HomeDismissItem() when dismissItem != null:
return dismissItem(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeLoad value)  load,required TResult Function( HomeRefresh value)  refresh,required TResult Function( HomeApproveItem value)  approveItem,required TResult Function( HomeDismissItem value)  dismissItem,}){
final _that = this;
switch (_that) {
case HomeLoad():
return load(_that);case HomeRefresh():
return refresh(_that);case HomeApproveItem():
return approveItem(_that);case HomeDismissItem():
return dismissItem(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeLoad value)?  load,TResult? Function( HomeRefresh value)?  refresh,TResult? Function( HomeApproveItem value)?  approveItem,TResult? Function( HomeDismissItem value)?  dismissItem,}){
final _that = this;
switch (_that) {
case HomeLoad() when load != null:
return load(_that);case HomeRefresh() when refresh != null:
return refresh(_that);case HomeApproveItem() when approveItem != null:
return approveItem(_that);case HomeDismissItem() when dismissItem != null:
return dismissItem(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function()?  refresh,TResult Function( String itemId)?  approveItem,TResult Function( String itemId)?  dismissItem,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeLoad() when load != null:
return load();case HomeRefresh() when refresh != null:
return refresh();case HomeApproveItem() when approveItem != null:
return approveItem(_that.itemId);case HomeDismissItem() when dismissItem != null:
return dismissItem(_that.itemId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function()  refresh,required TResult Function( String itemId)  approveItem,required TResult Function( String itemId)  dismissItem,}) {final _that = this;
switch (_that) {
case HomeLoad():
return load();case HomeRefresh():
return refresh();case HomeApproveItem():
return approveItem(_that.itemId);case HomeDismissItem():
return dismissItem(_that.itemId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function()?  refresh,TResult? Function( String itemId)?  approveItem,TResult? Function( String itemId)?  dismissItem,}) {final _that = this;
switch (_that) {
case HomeLoad() when load != null:
return load();case HomeRefresh() when refresh != null:
return refresh();case HomeApproveItem() when approveItem != null:
return approveItem(_that.itemId);case HomeDismissItem() when dismissItem != null:
return dismissItem(_that.itemId);case _:
  return null;

}
}

}

/// @nodoc


class HomeLoad implements HomeEvent {
  const HomeLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.load()';
}


}




/// @nodoc


class HomeRefresh implements HomeEvent {
  const HomeRefresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeRefresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.refresh()';
}


}




/// @nodoc


class HomeApproveItem implements HomeEvent {
  const HomeApproveItem(this.itemId);
  

 final  String itemId;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeApproveItemCopyWith<HomeApproveItem> get copyWith => _$HomeApproveItemCopyWithImpl<HomeApproveItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeApproveItem&&(identical(other.itemId, itemId) || other.itemId == itemId));
}


@override
int get hashCode => Object.hash(runtimeType,itemId);

@override
String toString() {
  return 'HomeEvent.approveItem(itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class $HomeApproveItemCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeApproveItemCopyWith(HomeApproveItem value, $Res Function(HomeApproveItem) _then) = _$HomeApproveItemCopyWithImpl;
@useResult
$Res call({
 String itemId
});




}
/// @nodoc
class _$HomeApproveItemCopyWithImpl<$Res>
    implements $HomeApproveItemCopyWith<$Res> {
  _$HomeApproveItemCopyWithImpl(this._self, this._then);

  final HomeApproveItem _self;
  final $Res Function(HomeApproveItem) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,}) {
  return _then(HomeApproveItem(
null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HomeDismissItem implements HomeEvent {
  const HomeDismissItem(this.itemId);
  

 final  String itemId;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDismissItemCopyWith<HomeDismissItem> get copyWith => _$HomeDismissItemCopyWithImpl<HomeDismissItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDismissItem&&(identical(other.itemId, itemId) || other.itemId == itemId));
}


@override
int get hashCode => Object.hash(runtimeType,itemId);

@override
String toString() {
  return 'HomeEvent.dismissItem(itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class $HomeDismissItemCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeDismissItemCopyWith(HomeDismissItem value, $Res Function(HomeDismissItem) _then) = _$HomeDismissItemCopyWithImpl;
@useResult
$Res call({
 String itemId
});




}
/// @nodoc
class _$HomeDismissItemCopyWithImpl<$Res>
    implements $HomeDismissItemCopyWith<$Res> {
  _$HomeDismissItemCopyWithImpl(this._self, this._then);

  final HomeDismissItem _self;
  final $Res Function(HomeDismissItem) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,}) {
  return _then(HomeDismissItem(
null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$HomeState {

 bool get isReady; FinancialStanding get standing; List<ReviewItem> get priorityItems; List<WhatChangedItem> get whatChanged; List<TimelineItem> get comingUp; List<HandledItem> get handled; AvailableAfterObligations? get available; TrueCostOfLife? get trueCost; MiaUser? get user;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.standing, standing) || other.standing == standing)&&const DeepCollectionEquality().equals(other.priorityItems, priorityItems)&&const DeepCollectionEquality().equals(other.whatChanged, whatChanged)&&const DeepCollectionEquality().equals(other.comingUp, comingUp)&&const DeepCollectionEquality().equals(other.handled, handled)&&(identical(other.available, available) || other.available == available)&&(identical(other.trueCost, trueCost) || other.trueCost == trueCost)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,isReady,standing,const DeepCollectionEquality().hash(priorityItems),const DeepCollectionEquality().hash(whatChanged),const DeepCollectionEquality().hash(comingUp),const DeepCollectionEquality().hash(handled),available,trueCost,user);

@override
String toString() {
  return 'HomeState(isReady: $isReady, standing: $standing, priorityItems: $priorityItems, whatChanged: $whatChanged, comingUp: $comingUp, handled: $handled, available: $available, trueCost: $trueCost, user: $user)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 bool isReady, FinancialStanding standing, List<ReviewItem> priorityItems, List<WhatChangedItem> whatChanged, List<TimelineItem> comingUp, List<HandledItem> handled, AvailableAfterObligations? available, TrueCostOfLife? trueCost, MiaUser? user
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isReady = null,Object? standing = null,Object? priorityItems = null,Object? whatChanged = null,Object? comingUp = null,Object? handled = null,Object? available = freezed,Object? trueCost = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,standing: null == standing ? _self.standing : standing // ignore: cast_nullable_to_non_nullable
as FinancialStanding,priorityItems: null == priorityItems ? _self.priorityItems : priorityItems // ignore: cast_nullable_to_non_nullable
as List<ReviewItem>,whatChanged: null == whatChanged ? _self.whatChanged : whatChanged // ignore: cast_nullable_to_non_nullable
as List<WhatChangedItem>,comingUp: null == comingUp ? _self.comingUp : comingUp // ignore: cast_nullable_to_non_nullable
as List<TimelineItem>,handled: null == handled ? _self.handled : handled // ignore: cast_nullable_to_non_nullable
as List<HandledItem>,available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as AvailableAfterObligations?,trueCost: freezed == trueCost ? _self.trueCost : trueCost // ignore: cast_nullable_to_non_nullable
as TrueCostOfLife?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as MiaUser?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isReady,  FinancialStanding standing,  List<ReviewItem> priorityItems,  List<WhatChangedItem> whatChanged,  List<TimelineItem> comingUp,  List<HandledItem> handled,  AvailableAfterObligations? available,  TrueCostOfLife? trueCost,  MiaUser? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isReady,_that.standing,_that.priorityItems,_that.whatChanged,_that.comingUp,_that.handled,_that.available,_that.trueCost,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isReady,  FinancialStanding standing,  List<ReviewItem> priorityItems,  List<WhatChangedItem> whatChanged,  List<TimelineItem> comingUp,  List<HandledItem> handled,  AvailableAfterObligations? available,  TrueCostOfLife? trueCost,  MiaUser? user)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.isReady,_that.standing,_that.priorityItems,_that.whatChanged,_that.comingUp,_that.handled,_that.available,_that.trueCost,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isReady,  FinancialStanding standing,  List<ReviewItem> priorityItems,  List<WhatChangedItem> whatChanged,  List<TimelineItem> comingUp,  List<HandledItem> handled,  AvailableAfterObligations? available,  TrueCostOfLife? trueCost,  MiaUser? user)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isReady,_that.standing,_that.priorityItems,_that.whatChanged,_that.comingUp,_that.handled,_that.available,_that.trueCost,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({required this.isReady, required this.standing, required final  List<ReviewItem> priorityItems, required final  List<WhatChangedItem> whatChanged, required final  List<TimelineItem> comingUp, required final  List<HandledItem> handled, this.available, this.trueCost, this.user}): _priorityItems = priorityItems,_whatChanged = whatChanged,_comingUp = comingUp,_handled = handled;
  

@override final  bool isReady;
@override final  FinancialStanding standing;
 final  List<ReviewItem> _priorityItems;
@override List<ReviewItem> get priorityItems {
  if (_priorityItems is EqualUnmodifiableListView) return _priorityItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_priorityItems);
}

 final  List<WhatChangedItem> _whatChanged;
@override List<WhatChangedItem> get whatChanged {
  if (_whatChanged is EqualUnmodifiableListView) return _whatChanged;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_whatChanged);
}

 final  List<TimelineItem> _comingUp;
@override List<TimelineItem> get comingUp {
  if (_comingUp is EqualUnmodifiableListView) return _comingUp;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comingUp);
}

 final  List<HandledItem> _handled;
@override List<HandledItem> get handled {
  if (_handled is EqualUnmodifiableListView) return _handled;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_handled);
}

@override final  AvailableAfterObligations? available;
@override final  TrueCostOfLife? trueCost;
@override final  MiaUser? user;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.standing, standing) || other.standing == standing)&&const DeepCollectionEquality().equals(other._priorityItems, _priorityItems)&&const DeepCollectionEquality().equals(other._whatChanged, _whatChanged)&&const DeepCollectionEquality().equals(other._comingUp, _comingUp)&&const DeepCollectionEquality().equals(other._handled, _handled)&&(identical(other.available, available) || other.available == available)&&(identical(other.trueCost, trueCost) || other.trueCost == trueCost)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,isReady,standing,const DeepCollectionEquality().hash(_priorityItems),const DeepCollectionEquality().hash(_whatChanged),const DeepCollectionEquality().hash(_comingUp),const DeepCollectionEquality().hash(_handled),available,trueCost,user);

@override
String toString() {
  return 'HomeState(isReady: $isReady, standing: $standing, priorityItems: $priorityItems, whatChanged: $whatChanged, comingUp: $comingUp, handled: $handled, available: $available, trueCost: $trueCost, user: $user)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isReady, FinancialStanding standing, List<ReviewItem> priorityItems, List<WhatChangedItem> whatChanged, List<TimelineItem> comingUp, List<HandledItem> handled, AvailableAfterObligations? available, TrueCostOfLife? trueCost, MiaUser? user
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isReady = null,Object? standing = null,Object? priorityItems = null,Object? whatChanged = null,Object? comingUp = null,Object? handled = null,Object? available = freezed,Object? trueCost = freezed,Object? user = freezed,}) {
  return _then(_HomeState(
isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,standing: null == standing ? _self.standing : standing // ignore: cast_nullable_to_non_nullable
as FinancialStanding,priorityItems: null == priorityItems ? _self._priorityItems : priorityItems // ignore: cast_nullable_to_non_nullable
as List<ReviewItem>,whatChanged: null == whatChanged ? _self._whatChanged : whatChanged // ignore: cast_nullable_to_non_nullable
as List<WhatChangedItem>,comingUp: null == comingUp ? _self._comingUp : comingUp // ignore: cast_nullable_to_non_nullable
as List<TimelineItem>,handled: null == handled ? _self._handled : handled // ignore: cast_nullable_to_non_nullable
as List<HandledItem>,available: freezed == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as AvailableAfterObligations?,trueCost: freezed == trueCost ? _self.trueCost : trueCost // ignore: cast_nullable_to_non_nullable
as TrueCostOfLife?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as MiaUser?,
  ));
}


}

// dart format on
