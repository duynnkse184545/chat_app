import 'package:chat_app/features/server/domain/repository/server_repository.dart';

import '../../../../core/utils/type_defs.dart';

class DeleteServerUseCase {
  final ServerRepository _repository;

  DeleteServerUseCase(this._repository);

  FutureEither<void> call(String serverId) {
    return _repository.deleteServer(serverId);
  }
}