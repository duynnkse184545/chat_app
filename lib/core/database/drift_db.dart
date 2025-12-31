import 'dart:io';
import 'package:chat_app/core/database/converters/string_list_converter.dart';
import 'package:chat_app/core/database/converters/string_map_converter.dart';
import 'package:chat_app/features/chat/data/datasources/message_dao.dart';
import 'package:chat_app/features/friends/data/datasources/daos/conversation_dao.dart';
import 'package:chat_app/features/friends/data/datasources/daos/friend_dao.dart';
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

  BoolColumn get isDirectMessage =>
      boolean().withDefault(const Constant(false))();

  TextColumn get status => text().withDefault(const Constant('sent'))();

  TextColumn get errorMessage => text().nullable()();

  @override
  Set<Column> get primaryKey => {messageId};
}

class Friends extends Table {
  TextColumn get userId => text()();

  TextColumn get username => text()();

  TextColumn get email => text()();

  TextColumn get avatarUrl => text().nullable()();

  TextColumn get bio => text().nullable()();

  DateTimeColumn get friendsSince => dateTime()();

  DateTimeColumn get cachedAt => dateTime()(); // Track when cached

  @override
  Set<Column> get primaryKey => {userId};
}

class Conversations extends Table {
  TextColumn get conversationId => text()();

  TextColumn get type => text()(); // 'direct' or 'group'
  
  // Use TypeConverter for automatic List<String> conversion
  TextColumn get participantIds => text().map(const StringListConverter())();
  
  // Use TypeConverter for automatic Map<String, String> conversion
  TextColumn get participantNames => text().map(const StringMapConverter())();
  
  TextColumn get lastMessage => text().nullable()();

  DateTimeColumn get lastMessageAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {conversationId};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(
  tables: [Messages, Friends, Conversations],
  daos: [MessageDao, FriendDao, ConversationDao],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.addColumn(messages, messages.isDirectMessage);
          await m.createTable(friends);
          await m.createTable(conversations);
        }

        if (from < 3) {
          await m.addColumn(messages, messages.status);
          await m.addColumn(messages, messages.errorMessage);
        }
      },
    );
  }
}
