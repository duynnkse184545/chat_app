// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServerEntity {

 String get serverId; String get name; String get description; String? get iconUrl; String get ownerId; List<String> get memberIds; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ServerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerEntityCopyWith<ServerEntity> get copyWith => _$ServerEntityCopyWithImpl<ServerEntity>(this as ServerEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerEntity&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other.memberIds, memberIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,serverId,name,description,iconUrl,ownerId,const DeepCollectionEquality().hash(memberIds),createdAt,updatedAt);

@override
String toString() {
  return 'ServerEntity(serverId: $serverId, name: $name, description: $description, iconUrl: $iconUrl, ownerId: $ownerId, memberIds: $memberIds, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ServerEntityCopyWith<$Res>  {
  factory $ServerEntityCopyWith(ServerEntity value, $Res Function(ServerEntity) _then) = _$ServerEntityCopyWithImpl;
@useResult
$Res call({
 String serverId, String name, String description, String? iconUrl, String ownerId, List<String> memberIds, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ServerEntityCopyWithImpl<$Res>
    implements $ServerEntityCopyWith<$Res> {
  _$ServerEntityCopyWithImpl(this._self, this._then);

  final ServerEntity _self;
  final $Res Function(ServerEntity) _then;

/// Create a copy of ServerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverId = null,Object? name = null,Object? description = null,Object? iconUrl = freezed,Object? ownerId = null,Object? memberIds = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,memberIds: null == memberIds ? _self.memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerEntity].
extension ServerEntityPatterns on ServerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerEntity value)  $default,){
final _that = this;
switch (_that) {
case _ServerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ServerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverId,  String name,  String description,  String? iconUrl,  String ownerId,  List<String> memberIds,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerEntity() when $default != null:
return $default(_that.serverId,_that.name,_that.description,_that.iconUrl,_that.ownerId,_that.memberIds,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverId,  String name,  String description,  String? iconUrl,  String ownerId,  List<String> memberIds,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ServerEntity():
return $default(_that.serverId,_that.name,_that.description,_that.iconUrl,_that.ownerId,_that.memberIds,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverId,  String name,  String description,  String? iconUrl,  String ownerId,  List<String> memberIds,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ServerEntity() when $default != null:
return $default(_that.serverId,_that.name,_that.description,_that.iconUrl,_that.ownerId,_that.memberIds,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ServerEntity implements ServerEntity {
  const _ServerEntity({required this.serverId, required this.name, required this.description, this.iconUrl, required this.ownerId, required final  List<String> memberIds, required this.createdAt, required this.updatedAt}): _memberIds = memberIds;
  

@override final  String serverId;
@override final  String name;
@override final  String description;
@override final  String? iconUrl;
@override final  String ownerId;
 final  List<String> _memberIds;
@override List<String> get memberIds {
  if (_memberIds is EqualUnmodifiableListView) return _memberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberIds);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ServerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerEntityCopyWith<_ServerEntity> get copyWith => __$ServerEntityCopyWithImpl<_ServerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerEntity&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other._memberIds, _memberIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,serverId,name,description,iconUrl,ownerId,const DeepCollectionEquality().hash(_memberIds),createdAt,updatedAt);

@override
String toString() {
  return 'ServerEntity(serverId: $serverId, name: $name, description: $description, iconUrl: $iconUrl, ownerId: $ownerId, memberIds: $memberIds, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ServerEntityCopyWith<$Res> implements $ServerEntityCopyWith<$Res> {
  factory _$ServerEntityCopyWith(_ServerEntity value, $Res Function(_ServerEntity) _then) = __$ServerEntityCopyWithImpl;
@override @useResult
$Res call({
 String serverId, String name, String description, String? iconUrl, String ownerId, List<String> memberIds, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ServerEntityCopyWithImpl<$Res>
    implements _$ServerEntityCopyWith<$Res> {
  __$ServerEntityCopyWithImpl(this._self, this._then);

  final _ServerEntity _self;
  final $Res Function(_ServerEntity) _then;

/// Create a copy of ServerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverId = null,Object? name = null,Object? description = null,Object? iconUrl = freezed,Object? ownerId = null,Object? memberIds = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ServerEntity(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,memberIds: null == memberIds ? _self._memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
