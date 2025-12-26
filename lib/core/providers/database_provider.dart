import 'package:chat_app/core/database/drift_db.dart';
import 'package:chat_app/features/chat/data/datasources/message_dao.dart';
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
