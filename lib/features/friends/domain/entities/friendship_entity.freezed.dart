// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friendship_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendshipEntity {

 String get userId; String get username; String get email; String? get avatarUrl; String? get bio; DateTime get friendsSince;
/// Create a copy of FriendshipEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendshipEntityCopyWith<FriendshipEntity> get copyWith => _$FriendshipEntityCopyWithImpl<FriendshipEntity>(this as FriendshipEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendshipEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.friendsSince, friendsSince) || other.friendsSince == friendsSince));
}


@override
int get hashCode => Object.hash(runtimeType,userId,username,email,avatarUrl,bio,friendsSince);

@override
String toString() {
  return 'FriendshipEntity(userId: $userId, username: $username, email: $email, avatarUrl: $avatarUrl, bio: $bio, friendsSince: $friendsSince)';
}


}

/// @nodoc
abstract mixin class $FriendshipEntityCopyWith<$Res>  {
  factory $FriendshipEntityCopyWith(FriendshipEntity value, $Res Function(FriendshipEntity) _then) = _$FriendshipEntityCopyWithImpl;
@useResult
$Res call({
 String userId, String username, String email, String? avatarUrl, String? bio, DateTime friendsSince
});




}
/// @nodoc
class _$FriendshipEntityCopyWithImpl<$Res>
    implements $FriendshipEntityCopyWith<$Res> {
  _$FriendshipEntityCopyWithImpl(this._self, this._then);

  final FriendshipEntity _self;
  final $Res Function(FriendshipEntity) _then;

/// Create a copy of FriendshipEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? username = null,Object? email = null,Object? avatarUrl = freezed,Object? bio = freezed,Object? friendsSince = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,friendsSince: null == friendsSince ? _self.friendsSince : friendsSince // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendshipEntity].
extension FriendshipEntityPatterns on FriendshipEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendshipEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendshipEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendshipEntity value)  $default,){
final _that = this;
switch (_that) {
case _FriendshipEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendshipEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FriendshipEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String username,  String email,  String? avatarUrl,  String? bio,  DateTime friendsSince)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendshipEntity() when $default != null:
return $default(_that.userId,_that.username,_that.email,_that.avatarUrl,_that.bio,_that.friendsSince);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String username,  String email,  String? avatarUrl,  String? bio,  DateTime friendsSince)  $default,) {final _that = this;
switch (_that) {
case _FriendshipEntity():
return $default(_that.userId,_that.username,_that.email,_that.avatarUrl,_that.bio,_that.friendsSince);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String username,  String email,  String? avatarUrl,  String? bio,  DateTime friendsSince)?  $default,) {final _that = this;
switch (_that) {
case _FriendshipEntity() when $default != null:
return $default(_that.userId,_that.username,_that.email,_that.avatarUrl,_that.bio,_that.friendsSince);case _:
  return null;

}
}

}

/// @nodoc


class _FriendshipEntity implements FriendshipEntity {
  const _FriendshipEntity({required this.userId, required this.username, required this.email, this.avatarUrl, this.bio, required this.friendsSince});
  

@override final  String userId;
@override final  String username;
@override final  String email;
@override final  String? avatarUrl;
@override final  String? bio;
@override final  DateTime friendsSince;

/// Create a copy of FriendshipEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendshipEntityCopyWith<_FriendshipEntity> get copyWith => __$FriendshipEntityCopyWithImpl<_FriendshipEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendshipEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.friendsSince, friendsSince) || other.friendsSince == friendsSince));
}


@override
int get hashCode => Object.hash(runtimeType,userId,username,email,avatarUrl,bio,friendsSince);

@override
String toString() {
  return 'FriendshipEntity(userId: $userId, username: $username, email: $email, avatarUrl: $avatarUrl, bio: $bio, friendsSince: $friendsSince)';
}


}

/// @nodoc
abstract mixin class _$FriendshipEntityCopyWith<$Res> implements $FriendshipEntityCopyWith<$Res> {
  factory _$FriendshipEntityCopyWith(_FriendshipEntity value, $Res Function(_FriendshipEntity) _then) = __$FriendshipEntityCopyWithImpl;
@override @useResult
$Res call({
 String userId, String username, String email, String? avatarUrl, String? bio, DateTime friendsSince
});




}
/// @nodoc
class __$FriendshipEntityCopyWithImpl<$Res>
    implements _$FriendshipEntityCopyWith<$Res> {
  __$FriendshipEntityCopyWithImpl(this._self, this._then);

  final _FriendshipEntity _self;
  final $Res Function(_FriendshipEntity) _then;

/// Create a copy of FriendshipEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? username = null,Object? email = null,Object? avatarUrl = freezed,Object? bio = freezed,Object? friendsSince = null,}) {
  return _then(_FriendshipEntity(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,friendsSince: null == friendsSince ? _self.friendsSince : friendsSince // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
