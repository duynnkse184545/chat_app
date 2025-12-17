import 'package:chat_app/features/server/domain/repository/server_repository.dart';

import '../../../../core/utils/type_defs.dart';
import '../entities/server_entity.dart';

class GetUserServersUseCase{
  final ServerRepository _repository;

  GetUserServersUseCase(this._repository);

  FutureEither<List<ServerEntity>> call(){
    return _repository.getUserServers();
  }
}