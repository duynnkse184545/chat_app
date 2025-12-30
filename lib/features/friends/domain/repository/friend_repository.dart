import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/friends/domain/entities/conversation_entity.dart';
import 'package:chat_app/features/friends/domain/entities/friend_request_entity.dart';
import 'package:chat_app/features/friends/domain/entities/friendship_entity.dart';

abstract class FriendRepository {
  // Friend Requests
  FutureEither<FriendRequestEntity> sendFriendRequest({
    required String targetUsername,
  });

  FutureVoid acceptFriendRequest({
    required String requestId,
  });

  FutureVoid rejectFriendRequest({
    required String requestId,
  });

  StreamEither<List<FriendRequestEntity>> streamIncomingRequests();

  StreamEither<List<FriendRequestEntity>> streamOutgoingRequests();

  // Friends Management
  StreamEither<List<FriendshipEntity>> streamFriends();

  FutureVoid removeFriend({
    required String friendId,
  });

  // Conversations
  FutureEither<ConversationEntity> getOrCreateConversation({
    required String friendId,
  });

  StreamEither<List<ConversationEntity>> streamConversations();
}