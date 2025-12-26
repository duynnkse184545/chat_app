import 'package:chat_app/features/chat/data/datasources/message_dao.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';


abstract class MessageLocalDatasource {
  Future<void> cacheMessages(List<MessageModel> messages);
  Future<void> cacheMessage(MessageModel message);
  Future<List<MessageModel>> getCachedMessages(String channelId);
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
  Future<List<MessageModel>> getCachedMessages(String channelId) {
    return _dao.getMessages(channelId);
  }
}