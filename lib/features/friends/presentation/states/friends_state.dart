import 'package:chat_app/features/friends/domain/entities/friendship_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friends_state.freezed.dart';

@freezed
abstract class FriendsState with _$FriendsState {
  const factory FriendsState({
    @Default([]) List<FriendshipEntity> friends,
  }) = _FriendsState;
}