import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';

class StreamDirectMessageUseCase {
  final MessageRepository _repository;

  StreamDirectMessageUseCase(this._repository);

  StreamEither<List<MessageEntity>> call({required String conversationId}) {
    return _repository.streamDirectMessages(conversationId: conversationId);
  }
}
