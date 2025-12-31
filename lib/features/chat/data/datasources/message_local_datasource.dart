import 'package:chat_app/core/utils/enums.dart';
import 'package:chat_app/features/chat/data/datasources/message_dao.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';

abstract class MessageLocalDatasource {
  Future<void> cacheMessages(List<MessageModel> messages);

  Future<void> cacheMessage(MessageModel message);

  // Channels
  Future<List<MessageModel>> getCachedChannelMessages(String channelId);

  Stream<List<MessageModel>> watchChannelMessages(String channelId);

  // Direct Messages
  Future<List<MessageModel>> getCachedDirectMessages(String conversationId);

  Stream<List<MessageModel>> watchDirectMessages(String conversationId);

  Future<void> clearAllDirectMessages();

  Future<void> updateMessageStatus({
    required String messageId,
    required MessageStatus status,
    String? errorMessage,
  });
}

class MessageLocalDatasourceImpl implements MessageLocalDatasource {
  final MessageDao _dao;

  MessageLocalDatasourceImpl({required MessageDao dao}) : _dao = dao;

  @override
  Future<void> cacheMessage(MessageModel message) {
    return _dao.saveMessage(message);
  }

  @override
  Future<void> cacheMessages(List<MessageModel> messages) {
    return _dao.saveMessages(messages);
  }

  @override
  Future<List<MessageModel>> getCachedChannelMessages(String channelId) {
    return _dao.getChannelMessages(channelId);
  }

  @override
  Stream<List<MessageModel>> watchChannelMessages(String channelId) {
    return _dao.watchChannelMessages(channelId);
  }

  @override
  Future<List<MessageModel>> getCachedDirectMessages(String conversationId) {
    return _dao.getDirectMessages(conversationId);
  }

  @override
  Stream<List<MessageModel>> watchDirectMessages(String conversationId) {
    return _dao.watchDirectMessages(conversationId);
  }

  @override
  Future<void> clearAllDirectMessages() {
    return _dao.clearAllDirectMessages();
  }

  @override
  Future<void> updateMessageStatus({
    required String messageId,
    required MessageStatus status,
    String? errorMessage,
  }) {
    return _dao.updateMessageStatus(
      messageId: messageId,
      status: status.name,
      errorMessage: errorMessage,
    );
  }
}
