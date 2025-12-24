// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChannelListState {

 List<ChannelEntity> get channels; bool get isDeleting;
/// Create a copy of ChannelListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChannelListStateCopyWith<ChannelListState> get copyWith => _$ChannelListStateCopyWithImpl<ChannelListState>(this as ChannelListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChannelListState&&const DeepCollectionEquality().equals(other.channels, channels)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(channels),isDeleting);

@override
String toString() {
  return 'ChannelListState(channels: $channels, isDeleting: $isDeleting)';
}


}

/// @nodoc
abstract mixin class $ChannelListStateCopyWith<$Res>  {
  factory $ChannelListStateCopyWith(ChannelListState value, $Res Function(ChannelListState) _then) = _$ChannelListStateCopyWithImpl;
@useResult
$Res call({
 List<ChannelEntity> channels, bool isDeleting
});




}
/// @nodoc
class _$ChannelListStateCopyWithImpl<$Res>
    implements $ChannelListStateCopyWith<$Res> {
  _$ChannelListStateCopyWithImpl(this._self, this._then);

  final ChannelListState _self;
  final $Res Function(ChannelListState) _then;

/// Create a copy of ChannelListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? channels = null,Object? isDeleting = null,}) {
  return _then(_self.copyWith(
channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as List<ChannelEntity>,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChannelListState].
extension ChannelListStatePatterns on ChannelListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChannelListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChannelListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChannelListState value)  $default,){
final _that = this;
switch (_that) {
case _ChannelListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChannelListState value)?  $default,){
final _that = this;
switch (_that) {
case _ChannelListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChannelEntity> channels,  bool isDeleting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChannelListState() when $default != null:
return $default(_that.channels,_that.isDeleting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChannelEntity> channels,  bool isDeleting)  $default,) {final _that = this;
switch (_that) {
case _ChannelListState():
return $default(_that.channels,_that.isDeleting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChannelEntity> channels,  bool isDeleting)?  $default,) {final _that = this;
switch (_that) {
case _ChannelListState() when $default != null:
return $default(_that.channels,_that.isDeleting);case _:
  return null;

}
}

}

/// @nodoc


class _ChannelListState implements ChannelListState {
  const _ChannelListState({final  List<ChannelEntity> channels = const [], this.isDeleting = false}): _channels = channels;
  

 final  List<ChannelEntity> _channels;
@override@JsonKey() List<ChannelEntity> get channels {
  if (_channels is EqualUnmodifiableListView) return _channels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_channels);
}

@override@JsonKey() final  bool isDeleting;

/// Create a copy of ChannelListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChannelListStateCopyWith<_ChannelListState> get copyWith => __$ChannelListStateCopyWithImpl<_ChannelListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChannelListState&&const DeepCollectionEquality().equals(other._channels, _channels)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_channels),isDeleting);

@override
String toString() {
  return 'ChannelListState(channels: $channels, isDeleting: $isDeleting)';
}


}

/// @nodoc
abstract mixin class _$ChannelListStateCopyWith<$Res> implements $ChannelListStateCopyWith<$Res> {
  factory _$ChannelListStateCopyWith(_ChannelListState value, $Res Function(_ChannelListState) _then) = __$ChannelListStateCopyWithImpl;
@override @useResult
$Res call({
 List<ChannelEntity> channels, bool isDeleting
});




}
/// @nodoc
class __$ChannelListStateCopyWithImpl<$Res>
    implements _$ChannelListStateCopyWith<$Res> {
  __$ChannelListStateCopyWithImpl(this._self, this._then);

  final _ChannelListState _self;
  final $Res Function(_ChannelListState) _then;

/// Create a copy of ChannelListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? channels = null,Object? isDeleting = null,}) {
  return _then(_ChannelListState(
channels: null == channels ? _self._channels : channels // ignore: cast_nullable_to_non_nullable
as List<ChannelEntity>,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
