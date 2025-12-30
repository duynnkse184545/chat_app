// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEntity {

 String get uid; String get email; String get username; String? get avatarUrl; DateTime get createdAt; String? get bio; List<String> get serverIds; List<String> get friendIds;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.serverIds, serverIds)&&const DeepCollectionEquality().equals(other.friendIds, friendIds));
}


@override
int get hashCode => Object.hash(runtimeType,uid,email,username,avatarUrl,createdAt,bio,const DeepCollectionEquality().hash(serverIds),const DeepCollectionEquality().hash(friendIds));

@override
String toString() {
  return 'UserEntity(uid: $uid, email: $email, username: $username, avatarUrl: $avatarUrl, createdAt: $createdAt, bio: $bio, serverIds: $serverIds, friendIds: $friendIds)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 String uid, String email, String username, String? avatarUrl, DateTime createdAt, String? bio, List<String> serverIds, List<String> friendIds
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? email = null,Object? username = null,Object? avatarUrl = freezed,Object? createdAt = null,Object? bio = freezed,Object? serverIds = null,Object? friendIds = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,serverIds: null == serverIds ? _self.serverIds : serverIds // ignore: cast_nullable_to_non_nullable
as List<String>,friendIds: null == friendIds ? _self.friendIds : friendIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String email,  String username,  String? avatarUrl,  DateTime createdAt,  String? bio,  List<String> serverIds,  List<String> friendIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.uid,_that.email,_that.username,_that.avatarUrl,_that.createdAt,_that.bio,_that.serverIds,_that.friendIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String email,  String username,  String? avatarUrl,  DateTime createdAt,  String? bio,  List<String> serverIds,  List<String> friendIds)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.uid,_that.email,_that.username,_that.avatarUrl,_that.createdAt,_that.bio,_that.serverIds,_that.friendIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String email,  String username,  String? avatarUrl,  DateTime createdAt,  String? bio,  List<String> serverIds,  List<String> friendIds)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.uid,_that.email,_that.username,_that.avatarUrl,_that.createdAt,_that.bio,_that.serverIds,_that.friendIds);case _:
  return null;

}
}

}

/// @nodoc


class _UserEntity implements UserEntity {
  const _UserEntity({required this.uid, required this.email, required this.username, this.avatarUrl, required this.createdAt, this.bio, final  List<String> serverIds = const [], final  List<String> friendIds = const []}): _serverIds = serverIds,_friendIds = friendIds;
  

@override final  String uid;
@override final  String email;
@override final  String username;
@override final  String? avatarUrl;
@override final  DateTime createdAt;
@override final  String? bio;
 final  List<String> _serverIds;
@override@JsonKey() List<String> get serverIds {
  if (_serverIds is EqualUnmodifiableListView) return _serverIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serverIds);
}

 final  List<String> _friendIds;
@override@JsonKey() List<String> get friendIds {
  if (_friendIds is EqualUnmodifiableListView) return _friendIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_friendIds);
}


/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._serverIds, _serverIds)&&const DeepCollectionEquality().equals(other._friendIds, _friendIds));
}


@override
int get hashCode => Object.hash(runtimeType,uid,email,username,avatarUrl,createdAt,bio,const DeepCollectionEquality().hash(_serverIds),const DeepCollectionEquality().hash(_friendIds));

@override
String toString() {
  return 'UserEntity(uid: $uid, email: $email, username: $username, avatarUrl: $avatarUrl, createdAt: $createdAt, bio: $bio, serverIds: $serverIds, friendIds: $friendIds)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 String uid, String email, String username, String? avatarUrl, DateTime createdAt, String? bio, List<String> serverIds, List<String> friendIds
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? email = null,Object? username = null,Object? avatarUrl = freezed,Object? createdAt = null,Object? bio = freezed,Object? serverIds = null,Object? friendIds = null,}) {
  return _then(_UserEntity(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,serverIds: null == serverIds ? _self._serverIds : serverIds // ignore: cast_nullable_to_non_nullable
as List<String>,friendIds: null == friendIds ? _self._friendIds : friendIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
