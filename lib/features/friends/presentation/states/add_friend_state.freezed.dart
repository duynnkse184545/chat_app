// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_friend_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddFriendState {

 bool get isSending; bool get isSuccess; String? get error;
/// Create a copy of AddFriendState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddFriendStateCopyWith<AddFriendState> get copyWith => _$AddFriendStateCopyWithImpl<AddFriendState>(this as AddFriendState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddFriendState&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isSending,isSuccess,error);

@override
String toString() {
  return 'AddFriendState(isSending: $isSending, isSuccess: $isSuccess, error: $error)';
}


}

/// @nodoc
abstract mixin class $AddFriendStateCopyWith<$Res>  {
  factory $AddFriendStateCopyWith(AddFriendState value, $Res Function(AddFriendState) _then) = _$AddFriendStateCopyWithImpl;
@useResult
$Res call({
 bool isSending, bool isSuccess, String? error
});




}
/// @nodoc
class _$AddFriendStateCopyWithImpl<$Res>
    implements $AddFriendStateCopyWith<$Res> {
  _$AddFriendStateCopyWithImpl(this._self, this._then);

  final AddFriendState _self;
  final $Res Function(AddFriendState) _then;

/// Create a copy of AddFriendState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSending = null,Object? isSuccess = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddFriendState].
extension AddFriendStatePatterns on AddFriendState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddFriendState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddFriendState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddFriendState value)  $default,){
final _that = this;
switch (_that) {
case _AddFriendState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddFriendState value)?  $default,){
final _that = this;
switch (_that) {
case _AddFriendState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSending,  bool isSuccess,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddFriendState() when $default != null:
return $default(_that.isSending,_that.isSuccess,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSending,  bool isSuccess,  String? error)  $default,) {final _that = this;
switch (_that) {
case _AddFriendState():
return $default(_that.isSending,_that.isSuccess,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSending,  bool isSuccess,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _AddFriendState() when $default != null:
return $default(_that.isSending,_that.isSuccess,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AddFriendState implements AddFriendState {
  const _AddFriendState({this.isSending = false, this.isSuccess = false, this.error});
  

@override@JsonKey() final  bool isSending;
@override@JsonKey() final  bool isSuccess;
@override final  String? error;

/// Create a copy of AddFriendState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddFriendStateCopyWith<_AddFriendState> get copyWith => __$AddFriendStateCopyWithImpl<_AddFriendState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddFriendState&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isSending,isSuccess,error);

@override
String toString() {
  return 'AddFriendState(isSending: $isSending, isSuccess: $isSuccess, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AddFriendStateCopyWith<$Res> implements $AddFriendStateCopyWith<$Res> {
  factory _$AddFriendStateCopyWith(_AddFriendState value, $Res Function(_AddFriendState) _then) = __$AddFriendStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSending, bool isSuccess, String? error
});




}
/// @nodoc
class __$AddFriendStateCopyWithImpl<$Res>
    implements _$AddFriendStateCopyWith<$Res> {
  __$AddFriendStateCopyWithImpl(this._self, this._then);

  final _AddFriendState _self;
  final $Res Function(_AddFriendState) _then;

/// Create a copy of AddFriendState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSending = null,Object? isSuccess = null,Object? error = freezed,}) {
  return _then(_AddFriendState(
isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
