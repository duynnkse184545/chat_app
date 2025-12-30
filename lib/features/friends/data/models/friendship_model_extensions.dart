import 'package:chat_app/core/database/drift_db.dart';
import 'package:chat_app/features/friends/data/models/friendship_model.dart';
import 'package:drift/drift.dart';

// Model -> Companion (Writing to DB)
extension FriendshipModelDriftExtension on FriendshipModel {
  FriendsCompanion toCompanion() {
    return FriendsCompanion.insert(
      userId: userId,
      username: username,
      email: email,
      avatarUrl: Value(avatarUrl),
      bio: Value(bio),
      friendsSince: friendsSince,
      cachedAt: DateTime.now(),
    );
  }
}

// Row -> Model (Reading from DB)
extension FriendRowExtension on Friend {
  FriendshipModel toModel() {
    return FriendshipModel(
      userId: userId,
      username: username,
      email: email,
      avatarUrl: avatarUrl,
      bio: bio,
      friendsSince: friendsSince,
    );
  }
}