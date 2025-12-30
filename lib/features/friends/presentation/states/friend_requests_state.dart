import 'package:chat_app/features/friends/domain/entities/friend_request_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_requests_state.freezed.dart';

@freezed
abstract class FriendRequestsState with _$FriendRequestsState {
  const factory FriendRequestsState({
    @Default([]) List<FriendRequestEntity> incomingRequests,
    @Default([]) List<FriendRequestEntity> outgoingRequests,
  }) = _FriendRequestsState;
}