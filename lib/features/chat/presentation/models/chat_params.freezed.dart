// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatParams {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatParams);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatParams()';
}


}

/// @nodoc
class $ChatParamsCopyWith<$Res>  {
$ChatParamsCopyWith(ChatParams _, $Res Function(ChatParams) __);
}


/// Adds pattern-matching-related methods to [ChatParams].
extension ChatParamsPatterns on ChatParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChannelChatParams value)?  channel,TResult Function( DirectMessageChatParams value)?  directMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChannelChatParams() when channel != null:
return channel(_that);case DirectMessageChatParams() when directMessage != null:
return directMessage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChannelChatParams value)  channel,required TResult Function( DirectMessageChatParams value)  directMessage,}){
final _that = this;
switch (_that) {
case ChannelChatParams():
return channel(_that);case DirectMessageChatParams():
return directMessage(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChannelChatParams value)?  channel,TResult? Function( DirectMessageChatParams value)?  directMessage,}){
final _that = this;
switch (_that) {
case ChannelChatParams() when channel != null:
return channel(_that);case DirectMessageChatParams() when directMessage != null:
return directMessage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String serverId,  String channelId,  String channelName)?  channel,TResult Function( String friendId,  String friendName)?  directMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChannelChatParams() when channel != null:
return channel(_that.serverId,_that.channelId,_that.channelName);case DirectMessageChatParams() when directMessage != null:
return directMessage(_that.friendId,_that.friendName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String serverId,  String channelId,  String channelName)  channel,required TResult Function( String friendId,  String friendName)  directMessage,}) {final _that = this;
switch (_that) {
case ChannelChatParams():
return channel(_that.serverId,_that.channelId,_that.channelName);case DirectMessageChatParams():
return directMessage(_that.friendId,_that.friendName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String serverId,  String channelId,  String channelName)?  channel,TResult? Function( String friendId,  String friendName)?  directMessage,}) {final _that = this;
switch (_that) {
case ChannelChatParams() when channel != null:
return channel(_that.serverId,_that.channelId,_that.channelName);case DirectMessageChatParams() when directMessage != null:
return directMessage(_that.friendId,_that.friendName);case _:
  return null;

}
}

}

/// @nodoc


class ChannelChatParams implements ChatParams {
  const ChannelChatParams({required this.serverId, required this.channelId, required this.channelName});
  

 final  String serverId;
 final  String channelId;
 final  String channelName;

/// Create a copy of ChatParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChannelChatParamsCopyWith<ChannelChatParams> get copyWith => _$ChannelChatParamsCopyWithImpl<ChannelChatParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChannelChatParams&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.channelId, channelId) || other.channelId == channelId)&&(identical(other.channelName, channelName) || other.channelName == channelName));
}


@override
int get hashCode => Object.hash(runtimeType,serverId,channelId,channelName);

@override
String toString() {
  return 'ChatParams.channel(serverId: $serverId, channelId: $channelId, channelName: $channelName)';
}


}

/// @nodoc
abstract mixin class $ChannelChatParamsCopyWith<$Res> implements $ChatParamsCopyWith<$Res> {
  factory $ChannelChatParamsCopyWith(ChannelChatParams value, $Res Function(ChannelChatParams) _then) = _$ChannelChatParamsCopyWithImpl;
@useResult
$Res call({
 String serverId, String channelId, String channelName
});




}
/// @nodoc
class _$ChannelChatParamsCopyWithImpl<$Res>
    implements $ChannelChatParamsCopyWith<$Res> {
  _$ChannelChatParamsCopyWithImpl(this._self, this._then);

  final ChannelChatParams _self;
  final $Res Function(ChannelChatParams) _then;

/// Create a copy of ChatParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serverId = null,Object? channelId = null,Object? channelName = null,}) {
  return _then(ChannelChatParams(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,channelId: null == channelId ? _self.channelId : channelId // ignore: cast_nullable_to_non_nullable
as String,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DirectMessageChatParams implements ChatParams {
  const DirectMessageChatParams({required this.friendId, required this.friendName});
  

 final  String friendId;
 final  String friendName;

/// Create a copy of ChatParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DirectMessageChatParamsCopyWith<DirectMessageChatParams> get copyWith => _$DirectMessageChatParamsCopyWithImpl<DirectMessageChatParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DirectMessageChatParams&&(identical(other.friendId, friendId) || other.friendId == friendId)&&(identical(other.friendName, friendName) || other.friendName == friendName));
}


@override
int get hashCode => Object.hash(runtimeType,friendId,friendName);

@override
String toString() {
  return 'ChatParams.directMessage(friendId: $friendId, friendName: $friendName)';
}


}

/// @nodoc
abstract mixin class $DirectMessageChatParamsCopyWith<$Res> implements $ChatParamsCopyWith<$Res> {
  factory $DirectMessageChatParamsCopyWith(DirectMessageChatParams value, $Res Function(DirectMessageChatParams) _then) = _$DirectMessageChatParamsCopyWithImpl;
@useResult
$Res call({
 String friendId, String friendName
});




}
/// @nodoc
class _$DirectMessageChatParamsCopyWithImpl<$Res>
    implements $DirectMessageChatParamsCopyWith<$Res> {
  _$DirectMessageChatParamsCopyWithImpl(this._self, this._then);

  final DirectMessageChatParams _self;
  final $Res Function(DirectMessageChatParams) _then;

/// Create a copy of ChatParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? friendId = null,Object? friendName = null,}) {
  return _then(DirectMessageChatParams(
friendId: null == friendId ? _self.friendId : friendId // ignore: cast_nullable_to_non_nullable
as String,friendName: null == friendName ? _self.friendName : friendName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
