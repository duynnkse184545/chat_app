import 'package:chat_app/features/server/domain/repository/server_repository.dart';

import '../../../../core/utils/type_defs.dart';
import '../entities/server_entity.dart';

class GetServerUseCase {
  final ServerRepository _repository;

  GetServerUseCase(this._repository);

  FutureEither<ServerEntity> call(String serverId) {
    return _repository.getServer(serverId);
  }
}
