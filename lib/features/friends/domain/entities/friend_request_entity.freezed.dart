// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendRequestEntity {

 String get requestId; String get fromUserId; String get fromUsername; String get toUserId; String get toUsername; FriendRequestStatus get status; DateTime get createdAt; DateTime? get respondedAt;
/// Create a copy of FriendRequestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendRequestEntityCopyWith<FriendRequestEntity> get copyWith => _$FriendRequestEntityCopyWithImpl<FriendRequestEntity>(this as FriendRequestEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendRequestEntity&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.fromUserId, fromUserId) || other.fromUserId == fromUserId)&&(identical(other.fromUsername, fromUsername) || other.fromUsername == fromUsername)&&(identical(other.toUserId, toUserId) || other.toUserId == toUserId)&&(identical(other.toUsername, toUsername) || other.toUsername == toUsername)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,fromUserId,fromUsername,toUserId,toUsername,status,createdAt,respondedAt);

@override
String toString() {
  return 'FriendRequestEntity(requestId: $requestId, fromUserId: $fromUserId, fromUsername: $fromUsername, toUserId: $toUserId, toUsername: $toUsername, status: $status, createdAt: $createdAt, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class $FriendRequestEntityCopyWith<$Res>  {
  factory $FriendRequestEntityCopyWith(FriendRequestEntity value, $Res Function(FriendRequestEntity) _then) = _$FriendRequestEntityCopyWithImpl;
@useResult
$Res call({
 String requestId, String fromUserId, String fromUsername, String toUserId, String toUsername, FriendRequestStatus status, DateTime createdAt, DateTime? respondedAt
});




}
/// @nodoc
class _$FriendRequestEntityCopyWithImpl<$Res>
    implements $FriendRequestEntityCopyWith<$Res> {
  _$FriendRequestEntityCopyWithImpl(this._self, this._then);

  final FriendRequestEntity _self;
  final $Res Function(FriendRequestEntity) _then;

/// Create a copy of FriendRequestEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? fromUserId = null,Object? fromUsername = null,Object? toUserId = null,Object? toUsername = null,Object? status = null,Object? createdAt = null,Object? respondedAt = freezed,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,fromUserId: null == fromUserId ? _self.fromUserId : fromUserId // ignore: cast_nullable_to_non_nullable
as String,fromUsername: null == fromUsername ? _self.fromUsername : fromUsername // ignore: cast_nullable_to_non_nullable
as String,toUserId: null == toUserId ? _self.toUserId : toUserId // ignore: cast_nullable_to_non_nullable
as String,toUsername: null == toUsername ? _self.toUsername : toUsername // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FriendRequestStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendRequestEntity].
extension FriendRequestEntityPatterns on FriendRequestEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendRequestEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendRequestEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendRequestEntity value)  $default,){
final _that = this;
switch (_that) {
case _FriendRequestEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendRequestEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FriendRequestEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String fromUserId,  String fromUsername,  String toUserId,  String toUsername,  FriendRequestStatus status,  DateTime createdAt,  DateTime? respondedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendRequestEntity() when $default != null:
return $default(_that.requestId,_that.fromUserId,_that.fromUsername,_that.toUserId,_that.toUsername,_that.status,_that.createdAt,_that.respondedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String fromUserId,  String fromUsername,  String toUserId,  String toUsername,  FriendRequestStatus status,  DateTime createdAt,  DateTime? respondedAt)  $default,) {final _that = this;
switch (_that) {
case _FriendRequestEntity():
return $default(_that.requestId,_that.fromUserId,_that.fromUsername,_that.toUserId,_that.toUsername,_that.status,_that.createdAt,_that.respondedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String fromUserId,  String fromUsername,  String toUserId,  String toUsername,  FriendRequestStatus status,  DateTime createdAt,  DateTime? respondedAt)?  $default,) {final _that = this;
switch (_that) {
case _FriendRequestEntity() when $default != null:
return $default(_that.requestId,_that.fromUserId,_that.fromUsername,_that.toUserId,_that.toUsername,_that.status,_that.createdAt,_that.respondedAt);case _:
  return null;

}
}

}

/// @nodoc


class _FriendRequestEntity implements FriendRequestEntity {
  const _FriendRequestEntity({required this.requestId, required this.fromUserId, required this.fromUsername, required this.toUserId, required this.toUsername, required this.status, required this.createdAt, this.respondedAt});
  

@override final  String requestId;
@override final  String fromUserId;
@override final  String fromUsername;
@override final  String toUserId;
@override final  String toUsername;
@override final  FriendRequestStatus status;
@override final  DateTime createdAt;
@override final  DateTime? respondedAt;

/// Create a copy of FriendRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendRequestEntityCopyWith<_FriendRequestEntity> get copyWith => __$FriendRequestEntityCopyWithImpl<_FriendRequestEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendRequestEntity&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.fromUserId, fromUserId) || other.fromUserId == fromUserId)&&(identical(other.fromUsername, fromUsername) || other.fromUsername == fromUsername)&&(identical(other.toUserId, toUserId) || other.toUserId == toUserId)&&(identical(other.toUsername, toUsername) || other.toUsername == toUsername)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,fromUserId,fromUsername,toUserId,toUsername,status,createdAt,respondedAt);

@override
String toString() {
  return 'FriendRequestEntity(requestId: $requestId, fromUserId: $fromUserId, fromUsername: $fromUsername, toUserId: $toUserId, toUsername: $toUsername, status: $status, createdAt: $createdAt, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class _$FriendRequestEntityCopyWith<$Res> implements $FriendRequestEntityCopyWith<$Res> {
  factory _$FriendRequestEntityCopyWith(_FriendRequestEntity value, $Res Function(_FriendRequestEntity) _then) = __$FriendRequestEntityCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String fromUserId, String fromUsername, String toUserId, String toUsername, FriendRequestStatus status, DateTime createdAt, DateTime? respondedAt
});




}
/// @nodoc
class __$FriendRequestEntityCopyWithImpl<$Res>
    implements _$FriendRequestEntityCopyWith<$Res> {
  __$FriendRequestEntityCopyWithImpl(this._self, this._then);

  final _FriendRequestEntity _self;
  final $Res Function(_FriendRequestEntity) _then;

/// Create a copy of FriendRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? fromUserId = null,Object? fromUsername = null,Object? toUserId = null,Object? toUsername = null,Object? status = null,Object? createdAt = null,Object? respondedAt = freezed,}) {
  return _then(_FriendRequestEntity(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,fromUserId: null == fromUserId ? _self.fromUserId : fromUserId // ignore: cast_nullable_to_non_nullable
as String,fromUsername: null == fromUsername ? _self.fromUsername : fromUsername // ignore: cast_nullable_to_non_nullable
as String,toUserId: null == toUserId ? _self.toUserId : toUserId // ignore: cast_nullable_to_non_nullable
as String,toUsername: null == toUsername ? _self.toUsername : toUsername // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FriendRequestStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
