import 'package:chat_app/core/database/drift_db.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:drift/drift.dart';

part 'message_dao.g.dart';

@DriftAccessor(tables: [Messages])
class MessageDao extends DatabaseAccessor<AppDb> with _$MessageDaoMixin{
  MessageDao(super.attachedDatabase);

  Future<List<MessageModel>> getMessages(String channelId) async {
    final query = select(messages)
      ..where((tbl) => tbl.channelId.equals(channelId))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]);

    final rows = await query.get();

    return rows
        .map(
          (row) => MessageModel(
        messageId: row.messageId,
        content: row.content,
        senderId: row.senderId,
        senderName: row.senderName,
        channelId: row.channelId,
        createdAt: row.createdAt,
      ),
    )
        .toList();
  }

  Stream<List<MessageModel>> watchMessages(String channelId) {
    final query = select(messages)
      ..where((tbl) => tbl.channelId.equals(channelId))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.createdAt)]);

    return query.watch().map((rows) {
      return rows
          .map(
            (row) => MessageModel(
          messageId: row.messageId,
          content: row.content,
          senderId: row.senderId,
          senderName: row.senderName,
          channelId: row.channelId,
          createdAt: row.createdAt,
        ),
      )
          .toList();
    });
  }

  Future<void> saveMessage(MessageModel message) async {
    await into(messages).insertOnConflictUpdate(
      MessagesCompanion.insert(
        messageId: message.messageId,
        content: message.content,
        senderId: message.senderId,
        senderName: message.senderName,
        channelId: message.channelId,
        createdAt: message.createdAt,
      ),
    );
  }

  Future<void> saveMessages(List<MessageModel> messageList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        messages,
        (messageList).map(
              (message) => MessagesCompanion.insert(
            messageId: message.messageId,
            content: message.content,
            senderId: message.senderId,
            senderName: message.senderName,
            channelId: message.channelId,
            createdAt: message.createdAt,
          ),
        ),
      );
    });
  }
}