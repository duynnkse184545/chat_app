// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_requests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendRequestsState {

 List<FriendRequestEntity> get incomingRequests; List<FriendRequestEntity> get outgoingRequests;
/// Create a copy of FriendRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendRequestsStateCopyWith<FriendRequestsState> get copyWith => _$FriendRequestsStateCopyWithImpl<FriendRequestsState>(this as FriendRequestsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendRequestsState&&const DeepCollectionEquality().equals(other.incomingRequests, incomingRequests)&&const DeepCollectionEquality().equals(other.outgoingRequests, outgoingRequests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(incomingRequests),const DeepCollectionEquality().hash(outgoingRequests));

@override
String toString() {
  return 'FriendRequestsState(incomingRequests: $incomingRequests, outgoingRequests: $outgoingRequests)';
}


}

/// @nodoc
abstract mixin class $FriendRequestsStateCopyWith<$Res>  {
  factory $FriendRequestsStateCopyWith(FriendRequestsState value, $Res Function(FriendRequestsState) _then) = _$FriendRequestsStateCopyWithImpl;
@useResult
$Res call({
 List<FriendRequestEntity> incomingRequests, List<FriendRequestEntity> outgoingRequests
});




}
/// @nodoc
class _$FriendRequestsStateCopyWithImpl<$Res>
    implements $FriendRequestsStateCopyWith<$Res> {
  _$FriendRequestsStateCopyWithImpl(this._self, this._then);

  final FriendRequestsState _self;
  final $Res Function(FriendRequestsState) _then;

/// Create a copy of FriendRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? incomingRequests = null,Object? outgoingRequests = null,}) {
  return _then(_self.copyWith(
incomingRequests: null == incomingRequests ? _self.incomingRequests : incomingRequests // ignore: cast_nullable_to_non_nullable
as List<FriendRequestEntity>,outgoingRequests: null == outgoingRequests ? _self.outgoingRequests : outgoingRequests // ignore: cast_nullable_to_non_nullable
as List<FriendRequestEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendRequestsState].
extension FriendRequestsStatePatterns on FriendRequestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendRequestsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendRequestsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendRequestsState value)  $default,){
final _that = this;
switch (_that) {
case _FriendRequestsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendRequestsState value)?  $default,){
final _that = this;
switch (_that) {
case _FriendRequestsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FriendRequestEntity> incomingRequests,  List<FriendRequestEntity> outgoingRequests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendRequestsState() when $default != null:
return $default(_that.incomingRequests,_that.outgoingRequests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FriendRequestEntity> incomingRequests,  List<FriendRequestEntity> outgoingRequests)  $default,) {final _that = this;
switch (_that) {
case _FriendRequestsState():
return $default(_that.incomingRequests,_that.outgoingRequests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FriendRequestEntity> incomingRequests,  List<FriendRequestEntity> outgoingRequests)?  $default,) {final _that = this;
switch (_that) {
case _FriendRequestsState() when $default != null:
return $default(_that.incomingRequests,_that.outgoingRequests);case _:
  return null;

}
}

}

/// @nodoc


class _FriendRequestsState implements FriendRequestsState {
  const _FriendRequestsState({final  List<FriendRequestEntity> incomingRequests = const [], final  List<FriendRequestEntity> outgoingRequests = const []}): _incomingRequests = incomingRequests,_outgoingRequests = outgoingRequests;
  

 final  List<FriendRequestEntity> _incomingRequests;
@override@JsonKey() List<FriendRequestEntity> get incomingRequests {
  if (_incomingRequests is EqualUnmodifiableListView) return _incomingRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incomingRequests);
}

 final  List<FriendRequestEntity> _outgoingRequests;
@override@JsonKey() List<FriendRequestEntity> get outgoingRequests {
  if (_outgoingRequests is EqualUnmodifiableListView) return _outgoingRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outgoingRequests);
}


/// Create a copy of FriendRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendRequestsStateCopyWith<_FriendRequestsState> get copyWith => __$FriendRequestsStateCopyWithImpl<_FriendRequestsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendRequestsState&&const DeepCollectionEquality().equals(other._incomingRequests, _incomingRequests)&&const DeepCollectionEquality().equals(other._outgoingRequests, _outgoingRequests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_incomingRequests),const DeepCollectionEquality().hash(_outgoingRequests));

@override
String toString() {
  return 'FriendRequestsState(incomingRequests: $incomingRequests, outgoingRequests: $outgoingRequests)';
}


}

/// @nodoc
abstract mixin class _$FriendRequestsStateCopyWith<$Res> implements $FriendRequestsStateCopyWith<$Res> {
  factory _$FriendRequestsStateCopyWith(_FriendRequestsState value, $Res Function(_FriendRequestsState) _then) = __$FriendRequestsStateCopyWithImpl;
@override @useResult
$Res call({
 List<FriendRequestEntity> incomingRequests, List<FriendRequestEntity> outgoingRequests
});




}
/// @nodoc
class __$FriendRequestsStateCopyWithImpl<$Res>
    implements _$FriendRequestsStateCopyWith<$Res> {
  __$FriendRequestsStateCopyWithImpl(this._self, this._then);

  final _FriendRequestsState _self;
  final $Res Function(_FriendRequestsState) _then;

/// Create a copy of FriendRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? incomingRequests = null,Object? outgoingRequests = null,}) {
  return _then(_FriendRequestsState(
incomingRequests: null == incomingRequests ? _self._incomingRequests : incomingRequests // ignore: cast_nullable_to_non_nullable
as List<FriendRequestEntity>,outgoingRequests: null == outgoingRequests ? _self._outgoingRequests : outgoingRequests // ignore: cast_nullable_to_non_nullable
as List<FriendRequestEntity>,
  ));
}


}

// dart format on
