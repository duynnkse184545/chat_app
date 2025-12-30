import 'package:chat_app/core/database/drift_db.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:chat_app/features/chat/data/models/message_model_extensions.dart'; // Import extension
import 'package:drift/drift.dart';

part 'message_dao.g.dart';

@DriftAccessor(tables: [Messages])
class MessageDao extends DatabaseAccessor<AppDb> with _$MessageDaoMixin{
  MessageDao(super.attachedDatabase);

  // Get channel messages (existing)
  Future<List<MessageModel>> getChannelMessages(String channelId) async {
    final query = select(messages)
      ..where((tbl) => tbl.channelId.equals(channelId) & tbl.isDirectMessage.equals(false))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]);

    final rows = await query.get();
    return rows.map((row) => row.toModel()).toList();
  }

  // NEW: Get direct messages
  Future<List<MessageModel>> getDirectMessages(String conversationId) async {
    final query = select(messages)
      ..where((tbl) => tbl.channelId.equals(conversationId) & tbl.isDirectMessage.equals(true))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]);

    final rows = await query.get();
    return rows.map((row) => row.toModel()).toList();
  }

  // NEW: Get all messages (channel or DM) for a channelId/conversationId
  Future<List<MessageModel>> getMessages(String channelId) async {
    final query = select(messages)
      ..where((tbl) => tbl.channelId.equals(channelId))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]);

    final rows = await query.get();
    return rows.map((row) => row.toModel()).toList();
  }

  // Watch channel messages (existing, updated)
  Stream<List<MessageModel>> watchChannelMessages(String channelId) {
    final query = select(messages)
      ..where((tbl) => tbl.channelId.equals(channelId) & tbl.isDirectMessage.equals(false))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]);

    return query.watch().map((rows) => rows.map((row) => row.toModel()).toList());
  }

  // NEW: Watch direct messages
  Stream<List<MessageModel>> watchDirectMessages(String conversationId) {
    final query = select(messages)
      ..where((tbl) => tbl.channelId.equals(conversationId) & tbl.isDirectMessage.equals(true))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]);

    return query.watch().map((rows) => rows.map((row) => row.toModel()).toList());
  }

  // Save single message
  Future<void> saveMessage(MessageModel message) async {
    await into(messages).insertOnConflictUpdate(message.toCompanion());
  }

  // Save multiple messages
  Future<void> saveMessages(List<MessageModel> messageList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        messages,
        messageList.map((message) => message.toCompanion()),
      );
    });
  }

  // NEW: Clear messages for a specific channel/conversation
  Future<void> clearMessages(String channelId) async {
    await (delete(messages)..where((tbl) => tbl.channelId.equals(channelId))).go();
  }

  // NEW: Clear all direct messages (for logout/cache clear)
  Future<void> clearAllDirectMessages() async {
    await (delete(messages)..where((tbl) => tbl.isDirectMessage.equals(true))).go();
  }
}