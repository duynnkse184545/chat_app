import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';

class WatchLocalMessagesUseCase {
  final MessageRepository _repository;

  WatchLocalMessagesUseCase(this._repository);

  StreamEither<List<MessageEntity>> call({
    required String chatId,
    required bool isDirectMessage,
  }) {
    if (isDirectMessage) {
      return _repository.watchLocalDirectMessages(chatId);
    } else {
      return _repository.watchLocalChannelMessages(chatId);
    }
  }
}