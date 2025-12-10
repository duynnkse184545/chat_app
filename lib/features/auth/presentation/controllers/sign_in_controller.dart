import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../states/sign_in_state.dart';
import 'auth_use_case_providers.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  SignInState build() {
    return const SignInState();
  }

  void setEmail(String email) {
    state = state.copyWith(email: email, errorMessage: null);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password, errorMessage: null);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  Future<bool> signIn() async {
    if (state.email.isEmpty) {
      state = state.copyWith(errorMessage: 'Email is required!');
      return false;
    }

    if (state.password.isEmpty) {
      state = state.copyWith(errorMessage: 'Password is required!');
      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    final signInUseCase = await ref.read(signInUseCaseProvider.future);
    final result = await signInUseCase(
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
    state = const SignInState();
  }
}
