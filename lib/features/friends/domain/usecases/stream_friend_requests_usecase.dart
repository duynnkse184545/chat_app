import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/friends/domain/entities/friend_request_entity.dart';
import 'package:chat_app/features/friends/domain/repository/friend_repository.dart';

class StreamFriendRequestsUseCase {
  final FriendRepository _repository;

  StreamFriendRequestsUseCase(this._repository);

  // Stream incoming requests (requests sent TO current user)
  StreamEither<List<FriendRequestEntity>> streamIncoming() {
    return _repository.streamIncomingRequests();
  }

  // Stream outgoing requests (requests sent BY current user)
  StreamEither<List<FriendRequestEntity>> streamOutgoing() {
    return _repository.streamOutgoingRequests();
  }
}
