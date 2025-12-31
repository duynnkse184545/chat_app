import 'package:chat_app/core/utils/enums.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';

class UpdateMessageStatusUseCase {
  final MessageRepository _repository;

  UpdateMessageStatusUseCase(this._repository);

  FutureEither<void> call({
    required String messageId,
    required MessageStatus status,
    String? errorMessage,
  }) {
    return _repository.updateMessageStatus(
      messageId: messageId,
      status: status,
      errorMessage: errorMessage,
    );
  }
}