// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServerListState {

 List<ServerEntity> get servers; bool get isLoading; String? get errorMessage;
/// Create a copy of ServerListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerListStateCopyWith<ServerListState> get copyWith => _$ServerListStateCopyWithImpl<ServerListState>(this as ServerListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerListState&&const DeepCollectionEquality().equals(other.servers, servers)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(servers),isLoading,errorMessage);

@override
String toString() {
  return 'ServerListState(servers: $servers, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ServerListStateCopyWith<$Res>  {
  factory $ServerListStateCopyWith(ServerListState value, $Res Function(ServerListState) _then) = _$ServerListStateCopyWithImpl;
@useResult
$Res call({
 List<ServerEntity> servers, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$ServerListStateCopyWithImpl<$Res>
    implements $ServerListStateCopyWith<$Res> {
  _$ServerListStateCopyWithImpl(this._self, this._then);

  final ServerListState _self;
  final $Res Function(ServerListState) _then;

/// Create a copy of ServerListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? servers = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
servers: null == servers ? _self.servers : servers // ignore: cast_nullable_to_non_nullable
as List<ServerEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerListState].
extension ServerListStatePatterns on ServerListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerListState value)  $default,){
final _that = this;
switch (_that) {
case _ServerListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerListState value)?  $default,){
final _that = this;
switch (_that) {
case _ServerListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ServerEntity> servers,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerListState() when $default != null:
return $default(_that.servers,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ServerEntity> servers,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ServerListState():
return $default(_that.servers,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ServerEntity> servers,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ServerListState() when $default != null:
return $default(_that.servers,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ServerListState implements ServerListState {
  const _ServerListState({final  List<ServerEntity> servers = const [], this.isLoading = false, this.errorMessage}): _servers = servers;
  

 final  List<ServerEntity> _servers;
@override@JsonKey() List<ServerEntity> get servers {
  if (_servers is EqualUnmodifiableListView) return _servers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_servers);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of ServerListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerListStateCopyWith<_ServerListState> get copyWith => __$ServerListStateCopyWithImpl<_ServerListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerListState&&const DeepCollectionEquality().equals(other._servers, _servers)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_servers),isLoading,errorMessage);

@override
String toString() {
  return 'ServerListState(servers: $servers, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ServerListStateCopyWith<$Res> implements $ServerListStateCopyWith<$Res> {
  factory _$ServerListStateCopyWith(_ServerListState value, $Res Function(_ServerListState) _then) = __$ServerListStateCopyWithImpl;
@override @useResult
$Res call({
 List<ServerEntity> servers, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$ServerListStateCopyWithImpl<$Res>
    implements _$ServerListStateCopyWith<$Res> {
  __$ServerListStateCopyWithImpl(this._self, this._then);

  final _ServerListState _self;
  final $Res Function(_ServerListState) _then;

/// Create a copy of ServerListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? servers = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_ServerListState(
servers: null == servers ? _self._servers : servers // ignore: cast_nullable_to_non_nullable
as List<ServerEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
