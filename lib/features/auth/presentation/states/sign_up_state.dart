import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
abstract class SignUpState with _$SignUpState{
  const factory SignUpState({
    @Default('') String username,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isConfirmPasswordVisible,
    @Default(false) bool isLoading,
    String? usernameError,
    String? emailError,
    String? passwordError,
    String? generalError,
}) = _SignUpState;
}