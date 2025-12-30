import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/friends/domain/repository/friend_repository.dart';

class RemoveFriendUseCase {
  final FriendRepository _repository;

  RemoveFriendUseCase(this._repository);

  FutureEither<void> call({
    required String friendId,
  }) {
    return _repository.removeFriend(friendId: friendId);
  }
}