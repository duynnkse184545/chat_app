import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';

class SaveOptimisticMessageUseCase {
  final MessageRepository _repository;

  SaveOptimisticMessageUseCase(this._repository);

  FutureEither<MessageEntity> call(
    MessageEntity message, {
    required String serverId,
    required String channelId,
  }) {
    return _repository.saveOptimisticMessage(
      message,
      serverId: serverId,
      channelId: channelId,
    );
  }
}
