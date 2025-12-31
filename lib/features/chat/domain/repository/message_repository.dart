import 'package:chat_app/core/utils/enums.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';

abstract class MessageRepository {
  // --- CHANNEL MESSAGES ---

  FutureEither<MessageEntity> sendMessage({
    required String serverId,
    required String channelId,
    required String content,
    required String messageId,
  });

  StreamEither<List<MessageEntity>> streamMessages({
    required String serverId,
    required String channelId,
  });

  // --- DIRECT MESSAGES (NEW) ---

  FutureEither<MessageEntity> sendDirectMessage({
    required String conversationId,
    required String content,
    required String messageId,
  });

  StreamEither<List<MessageEntity>> streamDirectMessages({
    required String conversationId,
  });

  // ADD: Watch local DB (for optimistic UI)
  StreamEither<List<MessageEntity>> watchLocalChannelMessages(String channelId);

  StreamEither<List<MessageEntity>> watchLocalDirectMessages(
    String conversationId,
  );

  // ADD: Save optimistic message
  FutureEither<MessageEntity> saveOptimisticMessage(
    MessageEntity message, {
    required String serverId,
    required String channelId,
  });

  FutureVoid updateMessageStatus({
    required String messageId,
    required MessageStatus status,
    String? errorMessage,
  });
}
