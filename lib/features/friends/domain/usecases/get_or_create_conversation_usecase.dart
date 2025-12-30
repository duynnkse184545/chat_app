import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/friends/domain/entities/conversation_entity.dart';
import 'package:chat_app/features/friends/domain/repository/friend_repository.dart';

class GetOrCreateConversationUseCase {
  final FriendRepository _repository;

  GetOrCreateConversationUseCase(this._repository);

  FutureEither<ConversationEntity> call({
    required String friendId,
  }) {
    return _repository.getOrCreateConversation(friendId: friendId);
  }
}