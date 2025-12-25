import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';

abstract class MessageRepository {
  // Send a message to a channel
  FutureEither<MessageEntity> sendMessage({
    required String serverId,
    required String channelId,
    required String content,
  });

  // Stream messages from a channel (real-time)
  StreamEither<List<MessageEntity>> streamMessages({
    required String serverId,
    required String channelId,
  });
}