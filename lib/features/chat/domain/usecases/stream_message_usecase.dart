import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';

class StreamMessagesUseCase {
  final MessageRepository _repository;

  StreamMessagesUseCase(this._repository);

  StreamEither<List<MessageEntity>> call({
    required String serverId,
    required String channelId,
  }) {
    return _repository.streamMessages(
      serverId: serverId,
      channelId: channelId,
    );
  }
}