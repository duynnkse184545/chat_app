import 'package:chat_app/features/chat/data/datasources/drift_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_providers.g.dart';

@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return await SharedPreferences.getInstance();
}

@Riverpod(keepAlive: true)
AppDb appDb(Ref ref){
  final db = AppDb();
  ref.onDispose(() => db.close());
  return db;
}