// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_channel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateChannelState {

 String get name; String get description; bool get isLoading; String? get nameError; String? get descriptionError; String? get generalError;
/// Create a copy of CreateChannelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateChannelStateCopyWith<CreateChannelState> get copyWith => _$CreateChannelStateCopyWithImpl<CreateChannelState>(this as CreateChannelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateChannelState&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.descriptionError, descriptionError) || other.descriptionError == descriptionError)&&(identical(other.generalError, generalError) || other.generalError == generalError));
}


@override
int get hashCode => Object.hash(runtimeType,name,description,isLoading,nameError,descriptionError,generalError);

@override
String toString() {
  return 'CreateChannelState(name: $name, description: $description, isLoading: $isLoading, nameError: $nameError, descriptionError: $descriptionError, generalError: $generalError)';
}


}

/// @nodoc
abstract mixin class $CreateChannelStateCopyWith<$Res>  {
  factory $CreateChannelStateCopyWith(CreateChannelState value, $Res Function(CreateChannelState) _then) = _$CreateChannelStateCopyWithImpl;
@useResult
$Res call({
 String name, String description, bool isLoading, String? nameError, String? descriptionError, String? generalError
});




}
/// @nodoc
class _$CreateChannelStateCopyWithImpl<$Res>
    implements $CreateChannelStateCopyWith<$Res> {
  _$CreateChannelStateCopyWithImpl(this._self, this._then);

  final CreateChannelState _self;
  final $Res Function(CreateChannelState) _then;

/// Create a copy of CreateChannelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? isLoading = null,Object? nameError = freezed,Object? descriptionError = freezed,Object? generalError = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,descriptionError: freezed == descriptionError ? _self.descriptionError : descriptionError // ignore: cast_nullable_to_non_nullable
as String?,generalError: freezed == generalError ? _self.generalError : generalError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateChannelState].
extension CreateChannelStatePatterns on CreateChannelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateChannelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateChannelState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateChannelState value)  $default,){
final _that = this;
switch (_that) {
case _CreateChannelState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateChannelState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateChannelState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  bool isLoading,  String? nameError,  String? descriptionError,  String? generalError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateChannelState() when $default != null:
return $default(_that.name,_that.description,_that.isLoading,_that.nameError,_that.descriptionError,_that.generalError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  bool isLoading,  String? nameError,  String? descriptionError,  String? generalError)  $default,) {final _that = this;
switch (_that) {
case _CreateChannelState():
return $default(_that.name,_that.description,_that.isLoading,_that.nameError,_that.descriptionError,_that.generalError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  bool isLoading,  String? nameError,  String? descriptionError,  String? generalError)?  $default,) {final _that = this;
switch (_that) {
case _CreateChannelState() when $default != null:
return $default(_that.name,_that.description,_that.isLoading,_that.nameError,_that.descriptionError,_that.generalError);case _:
  return null;

}
}

}

/// @nodoc


class _CreateChannelState implements CreateChannelState {
  const _CreateChannelState({this.name = '', this.description = '', this.isLoading = false, this.nameError, this.descriptionError, this.generalError});
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  bool isLoading;
@override final  String? nameError;
@override final  String? descriptionError;
@override final  String? generalError;

/// Create a copy of CreateChannelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateChannelStateCopyWith<_CreateChannelState> get copyWith => __$CreateChannelStateCopyWithImpl<_CreateChannelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateChannelState&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.descriptionError, descriptionError) || other.descriptionError == descriptionError)&&(identical(other.generalError, generalError) || other.generalError == generalError));
}


@override
int get hashCode => Object.hash(runtimeType,name,description,isLoading,nameError,descriptionError,generalError);

@override
String toString() {
  return 'CreateChannelState(name: $name, description: $description, isLoading: $isLoading, nameError: $nameError, descriptionError: $descriptionError, generalError: $generalError)';
}


}

/// @nodoc
abstract mixin class _$CreateChannelStateCopyWith<$Res> implements $CreateChannelStateCopyWith<$Res> {
  factory _$CreateChannelStateCopyWith(_CreateChannelState value, $Res Function(_CreateChannelState) _then) = __$CreateChannelStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, bool isLoading, String? nameError, String? descriptionError, String? generalError
});




}
/// @nodoc
class __$CreateChannelStateCopyWithImpl<$Res>
    implements _$CreateChannelStateCopyWith<$Res> {
  __$CreateChannelStateCopyWithImpl(this._self, this._then);

  final _CreateChannelState _self;
  final $Res Function(_CreateChannelState) _then;

/// Create a copy of CreateChannelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? isLoading = null,Object? nameError = freezed,Object? descriptionError = freezed,Object? generalError = freezed,}) {
  return _then(_CreateChannelState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,descriptionError: freezed == descriptionError ? _self.descriptionError : descriptionError // ignore: cast_nullable_to_non_nullable
as String?,generalError: freezed == generalError ? _self.generalError : generalError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
