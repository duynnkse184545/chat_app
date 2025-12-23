import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/server/domain/entities/server_entity.dart';

abstract class ServerRepository{
  FutureEither<ServerEntity> createServer({
    required String name,
    required String description,
    String? iconUrl,
  });

  StreamEither<List<ServerEntity>> getUserServers();

  StreamEither<ServerEntity> getServer(String serverId);

  FutureVoid updateServer({
    required String serverId,
    String? name,
    String? description,
    String? iconUrl,
  });

  FutureVoid deleteServer(String serverId);

  FutureVoid addMember({
    required String serverId,
    required String userId,
  });

  FutureVoid removeMember({
    required String serverId,
    required String userId,
  });
}