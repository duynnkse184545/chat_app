// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChannelEntity {

 String get id; String get name; String get description; String get serverId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ChannelEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChannelEntityCopyWith<ChannelEntity> get copyWith => _$ChannelEntityCopyWithImpl<ChannelEntity>(this as ChannelEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChannelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,serverId,createdAt,updatedAt);

@override
String toString() {
  return 'ChannelEntity(id: $id, name: $name, description: $description, serverId: $serverId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChannelEntityCopyWith<$Res>  {
  factory $ChannelEntityCopyWith(ChannelEntity value, $Res Function(ChannelEntity) _then) = _$ChannelEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String serverId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ChannelEntityCopyWithImpl<$Res>
    implements $ChannelEntityCopyWith<$Res> {
  _$ChannelEntityCopyWithImpl(this._self, this._then);

  final ChannelEntity _self;
  final $Res Function(ChannelEntity) _then;

/// Create a copy of ChannelEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? serverId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChannelEntity].
extension ChannelEntityPatterns on ChannelEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChannelEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChannelEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChannelEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChannelEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChannelEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChannelEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String serverId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChannelEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.serverId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String serverId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChannelEntity():
return $default(_that.id,_that.name,_that.description,_that.serverId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String serverId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChannelEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.serverId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ChannelEntity implements ChannelEntity {
  const _ChannelEntity({required this.id, required this.name, required this.description, required this.serverId, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String serverId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ChannelEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChannelEntityCopyWith<_ChannelEntity> get copyWith => __$ChannelEntityCopyWithImpl<_ChannelEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChannelEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,serverId,createdAt,updatedAt);

@override
String toString() {
  return 'ChannelEntity(id: $id, name: $name, description: $description, serverId: $serverId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChannelEntityCopyWith<$Res> implements $ChannelEntityCopyWith<$Res> {
  factory _$ChannelEntityCopyWith(_ChannelEntity value, $Res Function(_ChannelEntity) _then) = __$ChannelEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String serverId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ChannelEntityCopyWithImpl<$Res>
    implements _$ChannelEntityCopyWith<$Res> {
  __$ChannelEntityCopyWithImpl(this._self, this._then);

  final _ChannelEntity _self;
  final $Res Function(_ChannelEntity) _then;

/// Create a copy of ChannelEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? serverId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ChannelEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
