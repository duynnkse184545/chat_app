// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendRequestModel {

 String get requestId; String get fromUserId; String get fromUsername; String get toUserId; String get toUsername; String get status;@TimestampConverter() DateTime get createdAt;@TimestampConverter() DateTime? get respondedAt;
/// Create a copy of FriendRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendRequestModelCopyWith<FriendRequestModel> get copyWith => _$FriendRequestModelCopyWithImpl<FriendRequestModel>(this as FriendRequestModel, _$identity);

  /// Serializes this FriendRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendRequestModel&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.fromUserId, fromUserId) || other.fromUserId == fromUserId)&&(identical(other.fromUsername, fromUsername) || other.fromUsername == fromUsername)&&(identical(other.toUserId, toUserId) || other.toUserId == toUserId)&&(identical(other.toUsername, toUsername) || other.toUsername == toUsername)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,fromUserId,fromUsername,toUserId,toUsername,status,createdAt,respondedAt);

@override
String toString() {
  return 'FriendRequestModel(requestId: $requestId, fromUserId: $fromUserId, fromUsername: $fromUsername, toUserId: $toUserId, toUsername: $toUsername, status: $status, createdAt: $createdAt, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class $FriendRequestModelCopyWith<$Res>  {
  factory $FriendRequestModelCopyWith(FriendRequestModel value, $Res Function(FriendRequestModel) _then) = _$FriendRequestModelCopyWithImpl;
@useResult
$Res call({
 String requestId, String fromUserId, String fromUsername, String toUserId, String toUsername, String status,@TimestampConverter() DateTime createdAt,@TimestampConverter() DateTime? respondedAt
});




}
/// @nodoc
class _$FriendRequestModelCopyWithImpl<$Res>
    implements $FriendRequestModelCopyWith<$Res> {
  _$FriendRequestModelCopyWithImpl(this._self, this._then);

  final FriendRequestModel _self;
  final $Res Function(FriendRequestModel) _then;

/// Create a copy of FriendRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? fromUserId = null,Object? fromUsername = null,Object? toUserId = null,Object? toUsername = null,Object? status = null,Object? createdAt = null,Object? respondedAt = freezed,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,fromUserId: null == fromUserId ? _self.fromUserId : fromUserId // ignore: cast_nullable_to_non_nullable
as String,fromUsername: null == fromUsername ? _self.fromUsername : fromUsername // ignore: cast_nullable_to_non_nullable
as String,toUserId: null == toUserId ? _self.toUserId : toUserId // ignore: cast_nullable_to_non_nullable
as String,toUsername: null == toUsername ? _self.toUsername : toUsername // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendRequestModel].
extension FriendRequestModelPatterns on FriendRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _FriendRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _FriendRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String fromUserId,  String fromUsername,  String toUserId,  String toUsername,  String status, @TimestampConverter()  DateTime createdAt, @TimestampConverter()  DateTime? respondedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendRequestModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String fromUserId,  String fromUsername,  String toUserId,  String toUsername,  String status, @TimestampConverter()  DateTime createdAt, @TimestampConverter()  DateTime? respondedAt)  $default,) {final _that = this;
switch (_that) {
case _FriendRequestModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String fromUserId,  String fromUsername,  String toUserId,  String toUsername,  String status, @TimestampConverter()  DateTime createdAt, @TimestampConverter()  DateTime? respondedAt)?  $default,) {final _that = this;
switch (_that) {
case _FriendRequestModel() when $default != null:
return $default(_that.requestId,_that.fromUserId,_that.fromUsername,_that.toUserId,_that.toUsername,_that.status,_that.createdAt,_that.respondedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FriendRequestModel extends FriendRequestModel {
  const _FriendRequestModel({required this.requestId, required this.fromUserId, required this.fromUsername, required this.toUserId, required this.toUsername, required this.status, @TimestampConverter() required this.createdAt, @TimestampConverter() this.respondedAt}): super._();
  factory _FriendRequestModel.fromJson(Map<String, dynamic> json) => _$FriendRequestModelFromJson(json);

@override final  String requestId;
@override final  String fromUserId;
@override final  String fromUsername;
@override final  String toUserId;
@override final  String toUsername;
@override final  String status;
@override@TimestampConverter() final  DateTime createdAt;
@override@TimestampConverter() final  DateTime? respondedAt;

/// Create a copy of FriendRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendRequestModelCopyWith<_FriendRequestModel> get copyWith => __$FriendRequestModelCopyWithImpl<_FriendRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FriendRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendRequestModel&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.fromUserId, fromUserId) || other.fromUserId == fromUserId)&&(identical(other.fromUsername, fromUsername) || other.fromUsername == fromUsername)&&(identical(other.toUserId, toUserId) || other.toUserId == toUserId)&&(identical(other.toUsername, toUsername) || other.toUsername == toUsername)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,fromUserId,fromUsername,toUserId,toUsername,status,createdAt,respondedAt);

@override
String toString() {
  return 'FriendRequestModel(requestId: $requestId, fromUserId: $fromUserId, fromUsername: $fromUsername, toUserId: $toUserId, toUsername: $toUsername, status: $status, createdAt: $createdAt, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class _$FriendRequestModelCopyWith<$Res> implements $FriendRequestModelCopyWith<$Res> {
  factory _$FriendRequestModelCopyWith(_FriendRequestModel value, $Res Function(_FriendRequestModel) _then) = __$FriendRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String fromUserId, String fromUsername, String toUserId, String toUsername, String status,@TimestampConverter() DateTime createdAt,@TimestampConverter() DateTime? respondedAt
});




}
/// @nodoc
class __$FriendRequestModelCopyWithImpl<$Res>
    implements _$FriendRequestModelCopyWith<$Res> {
  __$FriendRequestModelCopyWithImpl(this._self, this._then);

  final _FriendRequestModel _self;
  final $Res Function(_FriendRequestModel) _then;

/// Create a copy of FriendRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? fromUserId = null,Object? fromUsername = null,Object? toUserId = null,Object? toUsername = null,Object? status = null,Object? createdAt = null,Object? respondedAt = freezed,}) {
  return _then(_FriendRequestModel(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,fromUserId: null == fromUserId ? _self.fromUserId : fromUserId // ignore: cast_nullable_to_non_nullable
as String,fromUsername: null == fromUsername ? _self.fromUsername : fromUsername // ignore: cast_nullable_to_non_nullable
as String,toUserId: null == toUserId ? _self.toUserId : toUserId // ignore: cast_nullable_to_non_nullable
as String,toUsername: null == toUsername ? _self.toUsername : toUsername // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
