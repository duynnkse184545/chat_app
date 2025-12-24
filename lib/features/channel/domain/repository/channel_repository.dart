import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/channel/domain/entities/channel_entity.dart';

abstract class ChannelRepository{
  FutureEither<ChannelEntity> createChannel({
    required String serverId,
    required String name,
    required String description,
  });

  StreamEither<List<ChannelEntity>> getServerChannels(String serverId);

  StreamEither<ChannelEntity> getChannel({
    required String serverId,
    required String channelId,
  });

  FutureVoid updateChannel({
    required String serverId,
    required String channelId,
    String? name,
    String? description,
  });

  FutureVoid deleteChannel({
    required String serverId,
    required String channelId,
  });
}