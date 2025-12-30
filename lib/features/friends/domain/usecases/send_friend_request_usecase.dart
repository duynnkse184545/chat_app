import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/friends/domain/entities/friend_request_entity.dart';
import 'package:chat_app/features/friends/domain/repository/friend_repository.dart';

class SendFriendRequestUseCase {
  final FriendRepository _repository;

  SendFriendRequestUseCase(this._repository);

  FutureEither<FriendRequestEntity> call({
    required String targetUsername,
  }) {
    return _repository.sendFriendRequest(targetUsername: targetUsername);
  }
}