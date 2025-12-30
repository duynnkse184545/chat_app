import 'package:chat_app/core/database/drift_db.dart';
import 'package:chat_app/features/friends/data/models/friendship_model.dart';
import 'package:chat_app/features/friends/data/models/friendship_model_extensions.dart';
import 'package:drift/drift.dart';

part 'friend_dao.g.dart';

@DriftAccessor(tables: [Friends])
class FriendDao extends DatabaseAccessor<AppDb> with _$FriendDaoMixin {
  FriendDao(super.attachedDatabase);

  // Get all cached friends
  Future<List<FriendshipModel>> getCachedFriends() async {
    final rows = await select(friends).get();
    return rows.map((row) => row.toModel()).toList();
  }

  // Watch friends (real-time updates)
  Stream<List<FriendshipModel>> watchFriends() {
    return select(friends).watch().map((rows) {
      return rows.map((row) => row.toModel()).toList();
    });
  }

  /// Cache single friend
  Future<void> cacheFriend(FriendshipModel friend) async {
    await into(friends).insertOnConflictUpdate(friend.toCompanion());
  }

  /// Cache multiple friends
  Future<void> cacheFriends(List<FriendshipModel> friendList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        friends,
        friendList.map((friend) => friend.toCompanion()),
      );
    });
  }

  // Remove friend from cache
  Future<void> removeFriend(String userId) async {
    await (delete(friends)..where((tbl) => tbl.userId.equals(userId))).go();
  }

  // Clear all friends (for logout)
  Future<void> clearAllFriends() async {
    await delete(friends).go();
  }

  // Get friend count
  Future<int> getFriendCount() async {
    final count = await (selectOnly(friends)
      ..addColumns([friends.userId.count()]))
        .getSingle();
    return count.read(friends.userId.count()) ?? 0;
  }
}