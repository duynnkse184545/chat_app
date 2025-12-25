import 'dart:io';
import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'drift_db.g.dart';

class Messages extends Table {
  TextColumn get messageId => text()();

  TextColumn get content => text()();

  TextColumn get senderId => text()();

  TextColumn get senderName => text()();

  TextColumn get channelId => text()();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {messageId};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Messages])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

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
