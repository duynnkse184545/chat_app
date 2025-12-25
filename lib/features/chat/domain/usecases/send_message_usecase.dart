import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';

class SendMessageUseCase {
  final MessageRepository _repository;

  SendMessageUseCase(this._repository);

  FutureEither<MessageEntity> call({
    required String serverId,
    required String channelId,
    required String content,
  }) {
    return _repository.sendMessage(
      serverId: serverId,
      channelId: channelId,
      content: content,
    );
  }
}