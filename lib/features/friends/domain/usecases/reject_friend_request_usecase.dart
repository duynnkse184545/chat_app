import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/friends/domain/repository/friend_repository.dart';

class RejectFriendRequestUseCase {
  final FriendRepository _repository;

  RejectFriendRequestUseCase(this._repository);

  FutureEither<void> call({
    required String requestId,
  }) {
    return _repository.rejectFriendRequest(requestId: requestId);
  }
}