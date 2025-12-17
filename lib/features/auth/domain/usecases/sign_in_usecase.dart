import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';

class SignInUseCase{
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  FutureEither<UserEntity> call({
    required String email,
    required String password,
}) async {
    if(email.isEmpty){
      return const Left(Failure.authFailure('Email is required!'));
    }
    if(password.isEmpty){
      return const Left(Failure.authFailure('Password is missing!'));
    }
    if(password.length < 6){
      return const Left(Failure.authFailure('Password must be at least 6 characters!'));
    }
    return _authRepository.signInWithEmailAndPassword(email: email.trim(), password: password);
  }
}