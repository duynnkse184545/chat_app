import 'package:chat_app/features/auth/presentation/states/sign_up_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_use_case_providers.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  SignUpState build() {
    return const SignUpState();
  }

  void setUserName(String username) {
    state = state.copyWith(username: username, errorMessage: null);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email, errorMessage: null);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password, errorMessage: null);
  }

  void setConfirmPassword(String confirmPassword) {
    state = state.copyWith(
      confirmPassword: confirmPassword,
      errorMessage: null,
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

  Future<bool> signUp() async {
    if (state.username.isEmpty) {
      state = state.copyWith(errorMessage: 'Username is required!');
      return false;
    }
    if (state.email.isEmpty) {
      state = state.copyWith(errorMessage: 'Email is required!');
      return false;
    }

    if (state.password.isEmpty) {
      state = state.copyWith(errorMessage: 'Password is required!');
      return false;
    }

    if (state.confirmPassword != state.password) {
      state = state.copyWith(errorMessage: 'Passwords do not match!');
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    final signUpUseCase = await ref.read(signUpUseCaseProvider.future);
    final result = await signUpUseCase(
      username: state.username.trim(),
      email: state.email.trim(),
      password: state.password,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, errorMessage: failure.message);
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
