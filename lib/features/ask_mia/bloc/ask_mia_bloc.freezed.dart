// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ask_mia_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AskMiaEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskMiaEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AskMiaEvent()';
}


}

/// @nodoc
class $AskMiaEventCopyWith<$Res>  {
$AskMiaEventCopyWith(AskMiaEvent _, $Res Function(AskMiaEvent) __);
}


/// Adds pattern-matching-related methods to [AskMiaEvent].
extension AskMiaEventPatterns on AskMiaEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AskMiaLoad value)?  load,TResult Function( AskMiaDraftChanged value)?  draftChanged,TResult Function( AskMiaSubmitted value)?  submitted,TResult Function( AskMiaConversationOpened value)?  conversationOpened,TResult Function( AskMiaNewConversation value)?  newConversation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AskMiaLoad() when load != null:
return load(_that);case AskMiaDraftChanged() when draftChanged != null:
return draftChanged(_that);case AskMiaSubmitted() when submitted != null:
return submitted(_that);case AskMiaConversationOpened() when conversationOpened != null:
return conversationOpened(_that);case AskMiaNewConversation() when newConversation != null:
return newConversation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AskMiaLoad value)  load,required TResult Function( AskMiaDraftChanged value)  draftChanged,required TResult Function( AskMiaSubmitted value)  submitted,required TResult Function( AskMiaConversationOpened value)  conversationOpened,required TResult Function( AskMiaNewConversation value)  newConversation,}){
final _that = this;
switch (_that) {
case AskMiaLoad():
return load(_that);case AskMiaDraftChanged():
return draftChanged(_that);case AskMiaSubmitted():
return submitted(_that);case AskMiaConversationOpened():
return conversationOpened(_that);case AskMiaNewConversation():
return newConversation(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AskMiaLoad value)?  load,TResult? Function( AskMiaDraftChanged value)?  draftChanged,TResult? Function( AskMiaSubmitted value)?  submitted,TResult? Function( AskMiaConversationOpened value)?  conversationOpened,TResult? Function( AskMiaNewConversation value)?  newConversation,}){
final _that = this;
switch (_that) {
case AskMiaLoad() when load != null:
return load(_that);case AskMiaDraftChanged() when draftChanged != null:
return draftChanged(_that);case AskMiaSubmitted() when submitted != null:
return submitted(_that);case AskMiaConversationOpened() when conversationOpened != null:
return conversationOpened(_that);case AskMiaNewConversation() when newConversation != null:
return newConversation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String value)?  draftChanged,TResult Function( String question)?  submitted,TResult Function( String conversationId)?  conversationOpened,TResult Function()?  newConversation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AskMiaLoad() when load != null:
return load();case AskMiaDraftChanged() when draftChanged != null:
return draftChanged(_that.value);case AskMiaSubmitted() when submitted != null:
return submitted(_that.question);case AskMiaConversationOpened() when conversationOpened != null:
return conversationOpened(_that.conversationId);case AskMiaNewConversation() when newConversation != null:
return newConversation();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String value)  draftChanged,required TResult Function( String question)  submitted,required TResult Function( String conversationId)  conversationOpened,required TResult Function()  newConversation,}) {final _that = this;
switch (_that) {
case AskMiaLoad():
return load();case AskMiaDraftChanged():
return draftChanged(_that.value);case AskMiaSubmitted():
return submitted(_that.question);case AskMiaConversationOpened():
return conversationOpened(_that.conversationId);case AskMiaNewConversation():
return newConversation();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String value)?  draftChanged,TResult? Function( String question)?  submitted,TResult? Function( String conversationId)?  conversationOpened,TResult? Function()?  newConversation,}) {final _that = this;
switch (_that) {
case AskMiaLoad() when load != null:
return load();case AskMiaDraftChanged() when draftChanged != null:
return draftChanged(_that.value);case AskMiaSubmitted() when submitted != null:
return submitted(_that.question);case AskMiaConversationOpened() when conversationOpened != null:
return conversationOpened(_that.conversationId);case AskMiaNewConversation() when newConversation != null:
return newConversation();case _:
  return null;

}
}

}

/// @nodoc


class AskMiaLoad implements AskMiaEvent {
  const AskMiaLoad();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskMiaLoad);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AskMiaEvent.load()';
}


}




/// @nodoc


class AskMiaDraftChanged implements AskMiaEvent {
  const AskMiaDraftChanged(this.value);
  

 final  String value;

/// Create a copy of AskMiaEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AskMiaDraftChangedCopyWith<AskMiaDraftChanged> get copyWith => _$AskMiaDraftChangedCopyWithImpl<AskMiaDraftChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskMiaDraftChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AskMiaEvent.draftChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $AskMiaDraftChangedCopyWith<$Res> implements $AskMiaEventCopyWith<$Res> {
  factory $AskMiaDraftChangedCopyWith(AskMiaDraftChanged value, $Res Function(AskMiaDraftChanged) _then) = _$AskMiaDraftChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$AskMiaDraftChangedCopyWithImpl<$Res>
    implements $AskMiaDraftChangedCopyWith<$Res> {
  _$AskMiaDraftChangedCopyWithImpl(this._self, this._then);

  final AskMiaDraftChanged _self;
  final $Res Function(AskMiaDraftChanged) _then;

/// Create a copy of AskMiaEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(AskMiaDraftChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AskMiaSubmitted implements AskMiaEvent {
  const AskMiaSubmitted(this.question);
  

 final  String question;

/// Create a copy of AskMiaEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AskMiaSubmittedCopyWith<AskMiaSubmitted> get copyWith => _$AskMiaSubmittedCopyWithImpl<AskMiaSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskMiaSubmitted&&(identical(other.question, question) || other.question == question));
}


@override
int get hashCode => Object.hash(runtimeType,question);

@override
String toString() {
  return 'AskMiaEvent.submitted(question: $question)';
}


}

/// @nodoc
abstract mixin class $AskMiaSubmittedCopyWith<$Res> implements $AskMiaEventCopyWith<$Res> {
  factory $AskMiaSubmittedCopyWith(AskMiaSubmitted value, $Res Function(AskMiaSubmitted) _then) = _$AskMiaSubmittedCopyWithImpl;
@useResult
$Res call({
 String question
});




}
/// @nodoc
class _$AskMiaSubmittedCopyWithImpl<$Res>
    implements $AskMiaSubmittedCopyWith<$Res> {
  _$AskMiaSubmittedCopyWithImpl(this._self, this._then);

  final AskMiaSubmitted _self;
  final $Res Function(AskMiaSubmitted) _then;

/// Create a copy of AskMiaEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? question = null,}) {
  return _then(AskMiaSubmitted(
null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AskMiaConversationOpened implements AskMiaEvent {
  const AskMiaConversationOpened(this.conversationId);
  

 final  String conversationId;

/// Create a copy of AskMiaEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AskMiaConversationOpenedCopyWith<AskMiaConversationOpened> get copyWith => _$AskMiaConversationOpenedCopyWithImpl<AskMiaConversationOpened>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskMiaConversationOpened&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'AskMiaEvent.conversationOpened(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $AskMiaConversationOpenedCopyWith<$Res> implements $AskMiaEventCopyWith<$Res> {
  factory $AskMiaConversationOpenedCopyWith(AskMiaConversationOpened value, $Res Function(AskMiaConversationOpened) _then) = _$AskMiaConversationOpenedCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class _$AskMiaConversationOpenedCopyWithImpl<$Res>
    implements $AskMiaConversationOpenedCopyWith<$Res> {
  _$AskMiaConversationOpenedCopyWithImpl(this._self, this._then);

  final AskMiaConversationOpened _self;
  final $Res Function(AskMiaConversationOpened) _then;

/// Create a copy of AskMiaEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(AskMiaConversationOpened(
null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AskMiaNewConversation implements AskMiaEvent {
  const AskMiaNewConversation();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskMiaNewConversation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AskMiaEvent.newConversation()';
}


}




/// @nodoc
mixin _$AskMiaState {

 List<AskMiaMessage> get messages; List<AskMiaConversation> get conversations; List<String> get suggestions; String get draft; bool get isThinking; bool get isReady; String? get activeConversationId;
/// Create a copy of AskMiaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AskMiaStateCopyWith<AskMiaState> get copyWith => _$AskMiaStateCopyWithImpl<AskMiaState>(this as AskMiaState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AskMiaState&&const DeepCollectionEquality().equals(other.messages, messages)&&const DeepCollectionEquality().equals(other.conversations, conversations)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.isThinking, isThinking) || other.isThinking == isThinking)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.activeConversationId, activeConversationId) || other.activeConversationId == activeConversationId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),const DeepCollectionEquality().hash(conversations),const DeepCollectionEquality().hash(suggestions),draft,isThinking,isReady,activeConversationId);

@override
String toString() {
  return 'AskMiaState(messages: $messages, conversations: $conversations, suggestions: $suggestions, draft: $draft, isThinking: $isThinking, isReady: $isReady, activeConversationId: $activeConversationId)';
}


}

/// @nodoc
abstract mixin class $AskMiaStateCopyWith<$Res>  {
  factory $AskMiaStateCopyWith(AskMiaState value, $Res Function(AskMiaState) _then) = _$AskMiaStateCopyWithImpl;
@useResult
$Res call({
 List<AskMiaMessage> messages, List<AskMiaConversation> conversations, List<String> suggestions, String draft, bool isThinking, bool isReady, String? activeConversationId
});




}
/// @nodoc
class _$AskMiaStateCopyWithImpl<$Res>
    implements $AskMiaStateCopyWith<$Res> {
  _$AskMiaStateCopyWithImpl(this._self, this._then);

  final AskMiaState _self;
  final $Res Function(AskMiaState) _then;

/// Create a copy of AskMiaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? conversations = null,Object? suggestions = null,Object? draft = null,Object? isThinking = null,Object? isReady = null,Object? activeConversationId = freezed,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<AskMiaMessage>,conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<AskMiaConversation>,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,isThinking: null == isThinking ? _self.isThinking : isThinking // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,activeConversationId: freezed == activeConversationId ? _self.activeConversationId : activeConversationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AskMiaState].
extension AskMiaStatePatterns on AskMiaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AskMiaState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AskMiaState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AskMiaState value)  $default,){
final _that = this;
switch (_that) {
case _AskMiaState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AskMiaState value)?  $default,){
final _that = this;
switch (_that) {
case _AskMiaState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AskMiaMessage> messages,  List<AskMiaConversation> conversations,  List<String> suggestions,  String draft,  bool isThinking,  bool isReady,  String? activeConversationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AskMiaState() when $default != null:
return $default(_that.messages,_that.conversations,_that.suggestions,_that.draft,_that.isThinking,_that.isReady,_that.activeConversationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AskMiaMessage> messages,  List<AskMiaConversation> conversations,  List<String> suggestions,  String draft,  bool isThinking,  bool isReady,  String? activeConversationId)  $default,) {final _that = this;
switch (_that) {
case _AskMiaState():
return $default(_that.messages,_that.conversations,_that.suggestions,_that.draft,_that.isThinking,_that.isReady,_that.activeConversationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AskMiaMessage> messages,  List<AskMiaConversation> conversations,  List<String> suggestions,  String draft,  bool isThinking,  bool isReady,  String? activeConversationId)?  $default,) {final _that = this;
switch (_that) {
case _AskMiaState() when $default != null:
return $default(_that.messages,_that.conversations,_that.suggestions,_that.draft,_that.isThinking,_that.isReady,_that.activeConversationId);case _:
  return null;

}
}

}

/// @nodoc


class _AskMiaState implements AskMiaState {
  const _AskMiaState({required final  List<AskMiaMessage> messages, required final  List<AskMiaConversation> conversations, required final  List<String> suggestions, required this.draft, required this.isThinking, required this.isReady, this.activeConversationId}): _messages = messages,_conversations = conversations,_suggestions = suggestions;
  

 final  List<AskMiaMessage> _messages;
@override List<AskMiaMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

 final  List<AskMiaConversation> _conversations;
@override List<AskMiaConversation> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}

 final  List<String> _suggestions;
@override List<String> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}

@override final  String draft;
@override final  bool isThinking;
@override final  bool isReady;
@override final  String? activeConversationId;

/// Create a copy of AskMiaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AskMiaStateCopyWith<_AskMiaState> get copyWith => __$AskMiaStateCopyWithImpl<_AskMiaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AskMiaState&&const DeepCollectionEquality().equals(other._messages, _messages)&&const DeepCollectionEquality().equals(other._conversations, _conversations)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.isThinking, isThinking) || other.isThinking == isThinking)&&(identical(other.isReady, isReady) || other.isReady == isReady)&&(identical(other.activeConversationId, activeConversationId) || other.activeConversationId == activeConversationId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),const DeepCollectionEquality().hash(_conversations),const DeepCollectionEquality().hash(_suggestions),draft,isThinking,isReady,activeConversationId);

@override
String toString() {
  return 'AskMiaState(messages: $messages, conversations: $conversations, suggestions: $suggestions, draft: $draft, isThinking: $isThinking, isReady: $isReady, activeConversationId: $activeConversationId)';
}


}

/// @nodoc
abstract mixin class _$AskMiaStateCopyWith<$Res> implements $AskMiaStateCopyWith<$Res> {
  factory _$AskMiaStateCopyWith(_AskMiaState value, $Res Function(_AskMiaState) _then) = __$AskMiaStateCopyWithImpl;
@override @useResult
$Res call({
 List<AskMiaMessage> messages, List<AskMiaConversation> conversations, List<String> suggestions, String draft, bool isThinking, bool isReady, String? activeConversationId
});




}
/// @nodoc
class __$AskMiaStateCopyWithImpl<$Res>
    implements _$AskMiaStateCopyWith<$Res> {
  __$AskMiaStateCopyWithImpl(this._self, this._then);

  final _AskMiaState _self;
  final $Res Function(_AskMiaState) _then;

/// Create a copy of AskMiaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? conversations = null,Object? suggestions = null,Object? draft = null,Object? isThinking = null,Object? isReady = null,Object? activeConversationId = freezed,}) {
  return _then(_AskMiaState(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<AskMiaMessage>,conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<AskMiaConversation>,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as String,isThinking: null == isThinking ? _self.isThinking : isThinking // ignore: cast_nullable_to_non_nullable
as bool,isReady: null == isReady ? _self.isReady : isReady // ignore: cast_nullable_to_non_nullable
as bool,activeConversationId: freezed == activeConversationId ? _self.activeConversationId : activeConversationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
