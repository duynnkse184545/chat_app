import 'package:chat_app/core/database/drift_db.dart';
import 'package:chat_app/core/database/dao/message_dao.dart';
import 'package:chat_app/features/friends/data/datasources/daos/conversation_dao.dart';
import 'package:chat_app/features/friends/data/datasources/daos/friend_dao.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDb appDb(Ref ref){
  final db = AppDb();
  ref.onDispose(() => db.close());
  return db;
}

@riverpod
MessageDao messageDao(Ref ref) {
  final db = ref.watch(appDbProvider);
  return db.messageDao;
}

@riverpod
FriendDao friendDao(Ref ref) {
  final db = ref.watch(appDbProvider);
  return db.friendDao;
}

@riverpod
ConversationDao conversationDao(Ref ref) {
  final db = ref.watch(appDbProvider);
  return db.conversationDao;
}
