import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';

import 'package:chat_app/core/utils/type_defs.dart';

class SignOutUseCase{
  final AuthRepository authRepository;

  SignOutUseCase(this.authRepository);

  FutureVoid call() async {
    return authRepository.signOut();
  }
}