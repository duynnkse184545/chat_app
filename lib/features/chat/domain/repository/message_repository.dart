import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';

abstract class MessageRepository {
  // --- CHANNEL MESSAGES ---
  
  FutureEither<MessageEntity> sendMessage({
    required String serverId,
    required String channelId,
    required String content,
  });

  StreamEither<List<MessageEntity>> streamMessages({
    required String serverId,
    required String channelId,
  });

  // --- DIRECT MESSAGES (NEW) ---

  FutureEither<MessageEntity> sendDirectMessage({
    required String conversationId,
    required String content,
  });

  StreamEither<List<MessageEntity>> streamDirectMessages({
    required String conversationId,
  });
}
