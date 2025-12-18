import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/auth/presentation/states/sign_up_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:chat_app/features/auth/presentation/controllers/auth_use_case_providers.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  SignUpState build() {
    return const SignUpState();
  }

  void setUsername(String username) {
    state = state.copyWith(username: username, usernameError: null);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email, emailError: null);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password, passwordError: null);
  }

  void setConfirmPassword(String confirmPassword) {
    state = state.copyWith(
      confirmPassword: confirmPassword,
      generalError: null,
    );
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(
      isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
    );
  }

  bool _validate() {
    final usernameError = Validators.username(state.username);
    final emailError = Validators.email(state.email);
    final passwordError = Validators.password(state.password);

    state = state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
      generalError: null,
    );

    if (state.confirmPassword != state.password) {
      state = state.copyWith(generalError: 'Passwords do not match!');
    }

    return usernameError == null && emailError == null && passwordError == null;
  }

  Future<bool> signUp() async {
    if (!_validate()) return false;

    state = state.copyWith(isLoading: true, generalError: null);

    final signUpUseCase = await ref.read(signUpUseCaseProvider.future);
    final result = await signUpUseCase(
      username: state.username.trim(),
      email: state.email.trim(),
      password: state.password,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, generalError: failure.message);
        return false;
      },
      (user) {
        state = state.copyWith(isLoading: false);
        return true;
      },
    );
  }

  void reset() {
    state = const SignUpState();
  }
}
