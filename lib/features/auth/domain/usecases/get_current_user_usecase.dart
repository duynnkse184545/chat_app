import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/utils/type_defs.dart';
import '../entities/user_entity.dart';

class GetCurrentUserUseCase{
  final AuthRepository authRepository;

  GetCurrentUserUseCase(this.authRepository);

  FutureEither<UserEntity?> call(){
    return authRepository.getCurrentUser();
  }
}