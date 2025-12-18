import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';

import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';

class GetCurrentUserUseCase{
  final AuthRepository authRepository;

  GetCurrentUserUseCase(this.authRepository);

  FutureEither<UserEntity?> call(){
    return authRepository.getCurrentUser();
  }
}