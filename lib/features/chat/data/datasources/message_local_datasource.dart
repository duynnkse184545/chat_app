import 'package:chat_app/features/chat/data/datasources/drift_db.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appDbProvider = Provider<AppDb>((ref) => AppDb());

abstract class MessageLocalDatasource {
  Future<void> cacheMessages(List<MessageModel> messages);
  Future<void> cacheMessage(MessageModel message);
  Future<List<MessageModel>> getCachedMessages(String channelId);
}

class MessageLocalDatasourceImpl implements MessageLocalDatasource{
  final AppDb _db;

  MessageLocalDatasourceImpl({required AppDb db}) : _db = db;
  
  @override
  Future<void> cacheMessage(MessageModel message) {
    return _db.saveMessage(message);
  }

  @override
  Future<void> cacheMessages(List<MessageModel> messages) {
    return _db.saveMessages(messages);
  }

  @override
  Future<List<MessageModel>> getCachedMessages(String channelId) {
    return _db.getMessages(channelId);
  }
}