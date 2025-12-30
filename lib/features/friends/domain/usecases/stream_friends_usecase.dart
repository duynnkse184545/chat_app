import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/friends/domain/entities/friendship_entity.dart';
import 'package:chat_app/features/friends/domain/repository/friend_repository.dart';

class StreamFriendsUseCase {
  final FriendRepository _repository;

  StreamFriendsUseCase(this._repository);

  StreamEither<List<FriendshipEntity>> call() {
    return _repository.streamFriends();
  }
}