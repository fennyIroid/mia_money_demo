// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiscoveryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiscoveryEvent()';
}


}

/// @nodoc
class $DiscoveryEventCopyWith<$Res>  {
$DiscoveryEventCopyWith(DiscoveryEvent _, $Res Function(DiscoveryEvent) __);
}


/// Adds pattern-matching-related methods to [DiscoveryEvent].
extension DiscoveryEventPatterns on DiscoveryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DiscoveryLoad value)?  load,TResult Function( DiscoverySearchChanged value)?  searchChanged,TResult Function( DiscoveryNotificationsRead value)?  notificationsRead,TResult Function( DiscoveryCaseSubmitted value)?  caseSubmitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DiscoveryLoad() when load != null:
return load(_that);case DiscoverySearchChanged() when searchChanged != null:
return searchChanged(_that);case DiscoveryNotificationsRead() when notificationsRead != null:
return notificationsRead(_that);case DiscoveryCaseSubmitted() when caseSubmitted != null:
return caseSubmitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DiscoveryLoad value)  load,required TResult Function( DiscoverySearchChanged value)  searchChanged,required TResult Function( DiscoveryNotificationsRead value)  notificationsRead,required TResult Function( DiscoveryCaseSubmitted value)  caseSubmitted,}){
final _that = this;
switch (_that) {
case DiscoveryLoad():
return load(_that);case DiscoverySearchChanged():
return searchChanged(_that);case DiscoveryNotificationsRead():
return notificationsRead(_that);case DiscoveryCaseSubmitted():
return caseSubmitted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DiscoveryLoad value)?  load,TResult? Function( DiscoverySearchChanged value)?  searchChanged,TResult? Function( DiscoveryNotificationsRead value)?  notificationsRead,TResult? Function( DiscoveryCaseSubmitted value)?  caseSubmitted,}){
final _that = this;
switch (_that) {
case DiscoveryLoad() when load != null:
return load(_that);case DiscoverySearchChanged() when searchChanged != null:
return searchChanged(_that);case DiscoveryNotificationsRead() when notificationsRead != null:
return notificationsRead(_that);case DiscoveryCaseSubmitted() when caseSubmitted != null:
return caseSubmitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String query)?  searchChanged,TResult Function()?  notificationsRead,TResult Function( String subject,  bool diagnostics)?  caseSubmitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DiscoveryLoad() when load != null:
return load();case DiscoverySearchChanged() when searchChanged != null:
return searchChanged(_that.query);case DiscoveryNotificationsRead() when notificationsRead != null:
return notificationsRead();case DiscoveryCaseSubmitted() when caseSubmitted != null:
return caseSubmitted(_that.subject,_that.diagnostics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String query)  searchChanged,required TResult Function()  notificationsRead,required TResult Function( String subject,  bool diagnostics)  caseSubmitted,}) {final _that = this;
switch (_that) {
case DiscoveryLoad():
return load();case DiscoverySearchChanged():
return searchChanged(_that.query);case DiscoveryNotificationsRead():
return notificationsRead();case DiscoveryCaseSubmitted():
return caseSubmitted(_that.subject,_that.diagnostics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String query)?  searchChanged,TResult? Function()?  notificationsRead,TResult? Function( String subject,  bool diagnostics)?  caseSubmitted,}) {final _that = this;
switch (_that) {
case DiscoveryLoad() when load != null:
return load();case DiscoverySearchChanged() when searchChanged != null:
return searchChanged(_that.query);case DiscoveryNotificationsRead() when notificationsRead != null:
return notificationsRead();case DiscoveryCaseSubmitted() when caseSubmitted != null:
return caseSubmitted(_that.subject,_that.diagnostics);case _:
  return null;

}
}

}

/// @nodoc


class DiscoveryLoad implements DiscoveryEvent {
  const DiscoveryLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiscoveryEvent.load()';
}


}




/// @nodoc


class DiscoverySearchChanged implements DiscoveryEvent {
  const DiscoverySearchChanged(this.query);
  

 final  String query;

/// Create a copy of DiscoveryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoverySearchChangedCopyWith<DiscoverySearchChanged> get copyWith => _$DiscoverySearchChangedCopyWithImpl<DiscoverySearchChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoverySearchChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'DiscoveryEvent.searchChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $DiscoverySearchChangedCopyWith<$Res> implements $DiscoveryEventCopyWith<$Res> {
  factory $DiscoverySearchChangedCopyWith(DiscoverySearchChanged value, $Res Function(DiscoverySearchChanged) _then) = _$DiscoverySearchChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$DiscoverySearchChangedCopyWithImpl<$Res>
    implements $DiscoverySearchChangedCopyWith<$Res> {
  _$DiscoverySearchChangedCopyWithImpl(this._self, this._then);

  final DiscoverySearchChanged _self;
  final $Res Function(DiscoverySearchChanged) _then;

/// Create a copy of DiscoveryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(DiscoverySearchChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DiscoveryNotificationsRead implements DiscoveryEvent {
  const DiscoveryNotificationsRead();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryNotificationsRead);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DiscoveryEvent.notificationsRead()';
}


}




/// @nodoc


class DiscoveryCaseSubmitted implements DiscoveryEvent {
  const DiscoveryCaseSubmitted({required this.subject, required this.diagnostics});
  

 final  String subject;
 final  bool diagnostics;

/// Create a copy of DiscoveryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoveryCaseSubmittedCopyWith<DiscoveryCaseSubmitted> get copyWith => _$DiscoveryCaseSubmittedCopyWithImpl<DiscoveryCaseSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryCaseSubmitted&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.diagnostics, diagnostics) || other.diagnostics == diagnostics));
}


@override
int get hashCode => Object.hash(runtimeType,subject,diagnostics);

@override
String toString() {
  return 'DiscoveryEvent.caseSubmitted(subject: $subject, diagnostics: $diagnostics)';
}


}

/// @nodoc
abstract mixin class $DiscoveryCaseSubmittedCopyWith<$Res> implements $DiscoveryEventCopyWith<$Res> {
  factory $DiscoveryCaseSubmittedCopyWith(DiscoveryCaseSubmitted value, $Res Function(DiscoveryCaseSubmitted) _then) = _$DiscoveryCaseSubmittedCopyWithImpl;
@useResult
$Res call({
 String subject, bool diagnostics
});




}
/// @nodoc
class _$DiscoveryCaseSubmittedCopyWithImpl<$Res>
    implements $DiscoveryCaseSubmittedCopyWith<$Res> {
  _$DiscoveryCaseSubmittedCopyWithImpl(this._self, this._then);

  final DiscoveryCaseSubmitted _self;
  final $Res Function(DiscoveryCaseSubmitted) _then;

/// Create a copy of DiscoveryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subject = null,Object? diagnostics = null,}) {
  return _then(DiscoveryCaseSubmitted(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,diagnostics: null == diagnostics ? _self.diagnostics : diagnostics // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$DiscoveryState {

 List<SearchResult> get results; List<MiaNotification> get notifications; List<HelpArticle> get articles; List<SupportCase> get cases; String get query; bool get isSearching; bool get isReady;
/// Create a copy of DiscoveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoveryStateCopyWith<DiscoveryState> get copyWith => _$DiscoveryStateCopyWithImpl<DiscoveryState>(this as DiscoveryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoveryState&&const DeepCollectionEquality().equals(other.results, results)&&const DeepCollectionEquality().equals(other.notifications, notifications)&&const DeepCollectionEquality().equals(other.articles, articles)&&const DeepCollectionEquality().equals(other.cases, cases)&&(identical(other.query, query) || other.query == query)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isReady, isReady) || other.isReady == isReady));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results),const DeepCollectionEquality().hash(notifications),const DeepCollectionEquality().hash(articles),const DeepCollectionEquality().hash(cases),query,isSearching,isReady);

@override
String toString() {
  return 'DiscoveryState(results: $results, notifications: $notifications, articles: $articles, cases: $cases, query: $query, isSearching: $isSearching, isReady: $isReady)';
}


}

/// @nodoc
abstract mixin class $DiscoveryStateCopyWith<$Res>  {
  factory $DiscoveryStateCopyWith(DiscoveryState value, $Res Function(DiscoveryState) _then) = _$DiscoveryStateCopyWithImpl;
@useResult
$Res call({
 List<SearchResult> results, List<MiaNotification> notifications, List<HelpArticle> articles, List<SupportCase> cases, String query, bool isSearching, bool isReady
});




}
/// @nodoc
class _$DiscoveryStateCopyWithImpl<$Res>
    implements $DiscoveryStateCopyWith<$Res> {
  _$DiscoveryStateCopyWithImpl(this._self, this._then);

  final DiscoveryState _self;
  final $Res Function(DiscoveryState) _then;

/// Create a copy of DiscoveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,Object? notifications = null,Object? articles = null,Object? cases = null,Object? query = null,Object? isSearching = null,Object? isReady = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SearchResult>,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<MiaNotification>,articles: null == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<HelpArticle>,cases: null == cases ? _self.cases : cases // ignore: cast_nullable_to_non_nullable
as List<SupportCase>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscoveryState].
extension DiscoveryStatePatterns on DiscoveryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscoveryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscoveryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscoveryState value)  $default,){
final _that = this;
switch (_that) {
case _DiscoveryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscoveryState value)?  $default,){
final _that = this;
switch (_that) {
case _DiscoveryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SearchResult> results,  List<MiaNotification> notifications,  List<HelpArticle> articles,  List<SupportCase> cases,  String query,  bool isSearching,  bool isReady)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscoveryState() when $default != null:
return $default(_that.results,_that.notifications,_that.articles,_that.cases,_that.query,_that.isSearching,_that.isReady);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SearchResult> results,  List<MiaNotification> notifications,  List<HelpArticle> articles,  List<SupportCase> cases,  String query,  bool isSearching,  bool isReady)  $default,) {final _that = this;
switch (_that) {
case _DiscoveryState():
return $default(_that.results,_that.notifications,_that.articles,_that.cases,_that.query,_that.isSearching,_that.isReady);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SearchResult> results,  List<MiaNotification> notifications,  List<HelpArticle> articles,  List<SupportCase> cases,  String query,  bool isSearching,  bool isReady)?  $default,) {final _that = this;
switch (_that) {
case _DiscoveryState() when $default != null:
return $default(_that.results,_that.notifications,_that.articles,_that.cases,_that.query,_that.isSearching,_that.isReady);case _:
  return null;

}
}

}

/// @nodoc


class _DiscoveryState implements DiscoveryState {
  const _DiscoveryState({required final  List<SearchResult> results, required final  List<MiaNotification> notifications, required final  List<HelpArticle> articles, required final  List<SupportCase> cases, required this.query, required this.isSearching, required this.isReady}): _results = results,_notifications = notifications,_articles = articles,_cases = cases;
  

 final  List<SearchResult> _results;
@override List<SearchResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

 final  List<MiaNotification> _notifications;
@override List<MiaNotification> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

 final  List<HelpArticle> _articles;
@override List<HelpArticle> get articles {
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articles);
}

 final  List<SupportCase> _cases;
@override List<SupportCase> get cases {
  if (_cases is EqualUnmodifiableListView) return _cases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cases);
}

@override final  String query;
@override final  bool isSearching;
@override final  bool isReady;

/// Create a copy of DiscoveryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoveryStateCopyWith<_DiscoveryState> get copyWith => __$DiscoveryStateCopyWithImpl<_DiscoveryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoveryState&&const DeepCollectionEquality().equals(other._results, _results)&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&const DeepCollectionEquality().equals(other._articles, _articles)&&const DeepCollectionEquality().equals(other._cases, _cases)&&(identical(other.query, query) || other.query == query)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching)&&(identical(other.isReady, isReady) || other.isReady == isReady));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),const DeepCollectionEquality().hash(_notifications),const DeepCollectionEquality().hash(_articles),const DeepCollectionEquality().hash(_cases),query,isSearching,isReady);

@override
String toString() {
  return 'DiscoveryState(results: $results, notifications: $notifications, articles: $articles, cases: $cases, query: $query, isSearching: $isSearching, isReady: $isReady)';
}


}

/// @nodoc
abstract mixin class _$DiscoveryStateCopyWith<$Res> implements $DiscoveryStateCopyWith<$Res> {
  factory _$DiscoveryStateCopyWith(_DiscoveryState value, $Res Function(_DiscoveryState) _then) = __$DiscoveryStateCopyWithImpl;
@override @useResult
$Res call({
 List<SearchResult> results, List<MiaNotification> notifications, List<HelpArticle> articles, List<SupportCase> cases, String query, bool isSearching, bool isReady
});




}
/// @nodoc
class __$DiscoveryStateCopyWithImpl<$Res>
    implements _$DiscoveryStateCopyWith<$Res> {
  __$DiscoveryStateCopyWithImpl(this._self, this._then);

  final _DiscoveryState _self;
  final $Res Function(_DiscoveryState) _then;

/// Create a copy of DiscoveryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,Object? notifications = null,Object? articles = null,Object? cases = null,Object? query = null,Object? isSearching = null,Object? isReady = null,}) {
  return _then(_DiscoveryState(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SearchResult>,notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<MiaNotification>,articles: null == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<HelpArticle>,cases: null == cases ? _self._cases : cases // ignore: cast_nullable_to_non_nullable
as List<SupportCase>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
