import 'package:chat_app/features/server/domain/repository/server_repository.dart';

import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/server/domain/entities/server_entity.dart';

class CreateServerUseCase{
  final ServerRepository _repository;

  CreateServerUseCase(this._repository);

  FutureEither<ServerEntity> call({
    required String name,
    required String description,
    String? iconUrl,
  }){
    return _repository.createServer(
      name: name,
      description: description,
      iconUrl: iconUrl,
    );
  }
}