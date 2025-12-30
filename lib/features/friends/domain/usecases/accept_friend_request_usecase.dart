import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/friends/domain/repository/friend_repository.dart';

class AcceptFriendRequestUseCase {
  final FriendRepository _repository;

  AcceptFriendRequestUseCase(this._repository);

  FutureEither<void> call({
    required String requestId,
  }) {
    return _repository.acceptFriendRequest(requestId: requestId);
  }
}