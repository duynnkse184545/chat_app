// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerModel {

 String get serverId; String get name; String get description; String? get iconUrl; String get ownerId; List<String> get memberIds;@TimestampConverter() DateTime get createdAt;@TimestampConverter() DateTime get updatedAt;
/// Create a copy of ServerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerModelCopyWith<ServerModel> get copyWith => _$ServerModelCopyWithImpl<ServerModel>(this as ServerModel, _$identity);

  /// Serializes this ServerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerModel&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other.memberIds, memberIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,name,description,iconUrl,ownerId,const DeepCollectionEquality().hash(memberIds),createdAt,updatedAt);

@override
String toString() {
  return 'ServerModel(serverId: $serverId, name: $name, description: $description, iconUrl: $iconUrl, ownerId: $ownerId, memberIds: $memberIds, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ServerModelCopyWith<$Res>  {
  factory $ServerModelCopyWith(ServerModel value, $Res Function(ServerModel) _then) = _$ServerModelCopyWithImpl;
@useResult
$Res call({
 String serverId, String name, String description, String? iconUrl, String ownerId, List<String> memberIds,@TimestampConverter() DateTime createdAt,@TimestampConverter() DateTime updatedAt
});




}
/// @nodoc
class _$ServerModelCopyWithImpl<$Res>
    implements $ServerModelCopyWith<$Res> {
  _$ServerModelCopyWithImpl(this._self, this._then);

  final ServerModel _self;
  final $Res Function(ServerModel) _then;

/// Create a copy of ServerModel
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


/// Adds pattern-matching-related methods to [ServerModel].
extension ServerModelPatterns on ServerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerModel value)  $default,){
final _that = this;
switch (_that) {
case _ServerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String serverId,  String name,  String description,  String? iconUrl,  String ownerId,  List<String> memberIds, @TimestampConverter()  DateTime createdAt, @TimestampConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String serverId,  String name,  String description,  String? iconUrl,  String ownerId,  List<String> memberIds, @TimestampConverter()  DateTime createdAt, @TimestampConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ServerModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String serverId,  String name,  String description,  String? iconUrl,  String ownerId,  List<String> memberIds, @TimestampConverter()  DateTime createdAt, @TimestampConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ServerModel() when $default != null:
return $default(_that.serverId,_that.name,_that.description,_that.iconUrl,_that.ownerId,_that.memberIds,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServerModel extends ServerModel {
  const _ServerModel({required this.serverId, required this.name, required this.description, this.iconUrl, required this.ownerId, required final  List<String> memberIds, @TimestampConverter() required this.createdAt, @TimestampConverter() required this.updatedAt}): _memberIds = memberIds,super._();
  factory _ServerModel.fromJson(Map<String, dynamic> json) => _$ServerModelFromJson(json);

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

@override@TimestampConverter() final  DateTime createdAt;
@override@TimestampConverter() final  DateTime updatedAt;

/// Create a copy of ServerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerModelCopyWith<_ServerModel> get copyWith => __$ServerModelCopyWithImpl<_ServerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerModel&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other._memberIds, _memberIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverId,name,description,iconUrl,ownerId,const DeepCollectionEquality().hash(_memberIds),createdAt,updatedAt);

@override
String toString() {
  return 'ServerModel(serverId: $serverId, name: $name, description: $description, iconUrl: $iconUrl, ownerId: $ownerId, memberIds: $memberIds, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ServerModelCopyWith<$Res> implements $ServerModelCopyWith<$Res> {
  factory _$ServerModelCopyWith(_ServerModel value, $Res Function(_ServerModel) _then) = __$ServerModelCopyWithImpl;
@override @useResult
$Res call({
 String serverId, String name, String description, String? iconUrl, String ownerId, List<String> memberIds,@TimestampConverter() DateTime createdAt,@TimestampConverter() DateTime updatedAt
});




}
/// @nodoc
class __$ServerModelCopyWithImpl<$Res>
    implements _$ServerModelCopyWith<$Res> {
  __$ServerModelCopyWithImpl(this._self, this._then);

  final _ServerModel _self;
  final $Res Function(_ServerModel) _then;

/// Create a copy of ServerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverId = null,Object? name = null,Object? description = null,Object? iconUrl = freezed,Object? ownerId = null,Object? memberIds = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ServerModel(
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
