import 'package:freezed_annotation/freezed_annotation.dart';

part 'friendship_entity.freezed.dart';

@freezed
abstract class FriendshipEntity with _$FriendshipEntity {
  const factory FriendshipEntity({
    required String userId,
    required String username,
    required String email,
    String? avatarUrl,
    String? bio,
    required DateTime friendsSince,
  }) = _FriendshipEntity;
}