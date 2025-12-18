import 'package:chat_app/core/utils/validators.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:chat_app/features/auth/presentation/states/sign_in_state.dart';
import 'package:chat_app/features/auth/presentation/controllers/auth_use_case_providers.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  SignInState build() {
    return const SignInState();
  }

  void setEmail(String email) {
    state = state.copyWith(email: email, emailError: null);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password, passwordError: null);
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  bool _validate() {
    final emailError = Validators.email(state.email);
    final passwordError = Validators.password(state.password);

    state = state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
      generalError: null,
    );

    return emailError == null && passwordError == null;
  }

  Future<bool> signIn() async {
    if (!_validate()) return false;

    state = state.copyWith(isLoading: true, generalError: null);

    final signInUseCase = await ref.read(signInUseCaseProvider.future);
    final result = await signInUseCase(
      email: state.email.trim(),
      password: state.password,
    );

    return result.fold(
      (failure) {
        debugPrint('🔴 Sign-in failed: ${failure.message}');
        state = state.copyWith(isLoading: false, generalError: failure.message);
        return false;
      },
      (user) {
        debugPrint('✅ Sign-in successful: ${user.email}');
        state = state.copyWith(isLoading: false);
        return true;
      },
    );
  }

  void reset() {
    state = const SignInState();
  }
}
