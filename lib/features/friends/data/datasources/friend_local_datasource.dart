import 'package:chat_app/features/friends/data/datasources/daos/conversation_dao.dart';
import 'package:chat_app/features/friends/data/datasources/daos/friend_dao.dart';
import 'package:chat_app/features/friends/data/models/conversation_model.dart';
import 'package:chat_app/features/friends/data/models/friendship_model.dart';

abstract class FriendLocalDatasource {
  // Friends
  Future<void> cacheFriends(List<FriendshipModel> friends);

  Future<List<FriendshipModel>> getCachedFriends();

  Stream<List<FriendshipModel>> watchFriends();

  Future<void> removeFriend(String userId);

  Future<void> clearFriends();

  // Conversations
  Future<void> cacheConversations(List<ConversationModel> conversations);

  Future<List<ConversationModel>> getCachedConversations();

  Stream<List<ConversationModel>> watchConversations();

  Future<void> cacheConversation(ConversationModel conversation);

  Future<void> updateLastMessage(
    String conversationId,
    String lastMessage,
    DateTime lastMessageAt,
  );

  Future<void> clearConversations();
}

class FriendLocalDatasourceImpl implements FriendLocalDatasource {
  final FriendDao _friendDao;
  final ConversationDao _conversationDao;

  FriendLocalDatasourceImpl({
    required FriendDao friendDao,
    required ConversationDao conversationDao,
  }) : _friendDao = friendDao,
       _conversationDao = conversationDao;

  // Friends
  @override
  Future<void> cacheFriends(List<FriendshipModel> friends) {
    return _friendDao.cacheFriends(friends);
  }

  @override
  Future<List<FriendshipModel>> getCachedFriends() {
    return _friendDao.getCachedFriends();
  }

  @override
  Stream<List<FriendshipModel>> watchFriends() {
    return _friendDao.watchFriends();
  }

  @override
  Future<void> removeFriend(String userId) {
    return _friendDao.removeFriend(userId);
  }

  @override
  Future<void> clearFriends() {
    return _friendDao.clearAllFriends();
  }

  // Conversations
  @override
  Future<void> cacheConversations(List<ConversationModel> conversations) {
    return _conversationDao.cacheConversations(conversations);
  }

  @override
  Future<List<ConversationModel>> getCachedConversations() {
    return _conversationDao.getCachedConversations();
  }

  @override
  Stream<List<ConversationModel>> watchConversations() {
    return _conversationDao.watchConversations();
  }

  @override
  Future<void> cacheConversation(ConversationModel conversation) {
    return _conversationDao.cacheConversation(conversation);
  }

  @override
  Future<void> updateLastMessage(
    String conversationId,
    String lastMessage,
    DateTime lastMessageAt,
  ) {
    return _conversationDao.updateLastMessage(
      conversationId,
      lastMessage,
      lastMessageAt,
    );
  }

  @override
  Future<void> clearConversations() {
    return _conversationDao.clearAllConversations();
  }
}
