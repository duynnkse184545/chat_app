import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/friends/domain/entities/conversation_entity.dart';
import 'package:chat_app/features/friends/domain/repository/friend_repository.dart';

class StreamConversationsUseCase {
  final FriendRepository _repository;

  StreamConversationsUseCase(this._repository);

  StreamEither<List<ConversationEntity>> call() {
    return _repository.streamConversations();
  }
}