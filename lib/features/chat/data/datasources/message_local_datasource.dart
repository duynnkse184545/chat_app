import 'package:chat_app/core/database/dao/message_dao.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';

abstract class MessageLocalDatasource {
  Future<void> cacheMessages(List<MessageModel> messages);
  Future<void> cacheMessage(MessageModel message);
  
  // Channels
  Future<List<MessageModel>> getCachedChannelMessages(String channelId);
  
  // Direct Messages
  Future<List<MessageModel>> getCachedDirectMessages(String conversationId);
  Future<void> clearAllDirectMessages();
}

class MessageLocalDatasourceImpl implements MessageLocalDatasource{
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
  Future<List<MessageModel>> getCachedDirectMessages(String conversationId) {
    return _dao.getDirectMessages(conversationId);
  }

  @override
  Future<void> clearAllDirectMessages() {
    return _dao.clearAllDirectMessages();
  }
}
