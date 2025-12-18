import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/server/domain/repository/server_repository.dart';

class UpdateServerUseCase {
  final ServerRepository _repository;

  UpdateServerUseCase(this._repository);

  FutureEither<void> call({
    required String serverId,
    String? name,
    String? description,
    String? iconUrl,
  }) {
    return _repository.updateServer(
      serverId: serverId,
      name: name,
      description: description,
      iconUrl: iconUrl,
    );
  }
}
