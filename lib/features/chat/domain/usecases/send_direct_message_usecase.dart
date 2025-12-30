import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';

class SendDirectMessageUseCase {
  final MessageRepository _repository;

  SendDirectMessageUseCase(this._repository);

  FutureEither<MessageEntity> call({
    required String conversationId,
    required String content,
  }) {
    return _repository.sendDirectMessage(
      conversationId: conversationId,
      content: content,
    );
  }
}
