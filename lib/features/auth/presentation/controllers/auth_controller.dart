import 'package:chat_app/features/auth/presentation/controllers/auth_use_case_providers.dart';
import 'package:chat_app/features/auth/presentation/states/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_providers.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    ref.listen(authStateChangesProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            state = AuthState.authenticated(user);
          } else {
            state = const AuthState.unauthenticated();
          }
        },
        loading: () => state = const AuthState.loading(),
        error: (error, _) => state = AuthState.error(error.toString()),
      );
    });
    return const AuthState.initial();
  }

  Future<void> signOut() async {
    state = const AuthState.loading();

    final signOutUseCase = await ref.watch(signOutUseCaseProvider.future);
    final result = await signOutUseCase();

    result.fold(
      (failure) => state = AuthState.error(failure.message),
      (_) => state = const AuthState.unauthenticated(),
    );
  }

  Future<void> updateProfile({
    required String uid,
    String? username,
    String? avatarUrl,
    String? bio,
}) async {
    state = const AuthState.loading();

    final repository = await ref.read(authRepositoryProvider.future);
    final result = await repository.updateProfile(
      uid: uid,
      username: username,
      avatarUrl: avatarUrl,
      bio: bio,
    );

    result.fold(
        (failure) => state = AuthState.error(failure.message),
        (user) => state = AuthState.authenticated(user)
    );
  }
}
