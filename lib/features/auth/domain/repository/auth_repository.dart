import 'package:chat_app/core/utils/type_defs.dart';

import 'package:chat_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  FutureEither<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  FutureEither<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });

  FutureVoid signOut();

  FutureEither<UserEntity?> getCurrentUser();

  Stream<UserEntity?> authStateChanges();

  FutureEither<UserEntity> updateProfile({
    required String uid,
    String? username,
    String? avatarUrl,
    String? bio,
  });
}
