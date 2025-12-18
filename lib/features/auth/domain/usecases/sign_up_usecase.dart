import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:chat_app/core/constants/app_constants.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';

class SignUpUseCase{
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  FutureEither<UserEntity> call({
    required String email,
    required String password,
    required String username,
  }) async {
    if(email.isEmpty){
      return const Left(Failure.authFailure('Email is required!'));
    }
    if(password.isEmpty){
      return const Left(Failure.authFailure('Password is missing!'));
    }
    if (password.length < AppConstants.passwordMinLength) {
      return const Left(Failure.authFailure(
        'Password must be at least ${AppConstants.passwordMinLength} characters',
      ));
    }

    if (username.isEmpty) {
      return const Left(Failure.authFailure('Username is required'));
    }

    if (username.length < AppConstants.usernameMinLength) {
      return const Left(Failure.authFailure(
        'Username must be at least ${AppConstants.usernameMinLength} characters',
      ));
    }

    if (username.length > AppConstants.usernameMaxLength) {
      return const Left(Failure.authFailure(
        'Username must be less than ${AppConstants.usernameMaxLength} characters',
      ));
    }
    return authRepository.signUpWithEmailAndPassword(
        email: email.trim(),
        password: password,
        username: username.trim()
    );
  }
}