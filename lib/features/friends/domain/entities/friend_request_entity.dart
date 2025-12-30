import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_request_entity.freezed.dart';

enum FriendRequestStatus {
  pending,
  accepted,
  rejected,
}

@freezed
abstract class FriendRequestEntity with _$FriendRequestEntity {
  const factory FriendRequestEntity({
    required String requestId,
    required String fromUserId,
    required String fromUsername,
    required String toUserId,
    required String toUsername,
    required FriendRequestStatus status,
    required DateTime createdAt,
    DateTime? respondedAt,
  }) = _FriendRequestEntity;
}