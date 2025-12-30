import 'package:chat_app/features/friends/domain/entities/friendship_entity.dart';
import 'package:chat_app/features/friends/presentation/controllers/friend_providers.dart';
import 'package:chat_app/features/friends/presentation/states/friends_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friends_controller.g.dart';

@riverpod
class FriendsController extends _$FriendsController {
  @override
  Stream<FriendsState> build() async* {
    final useCase = ref.read(streamFriendsUseCaseProvider);
    final stream = useCase();

    await for (final either in stream) {
      yield either.fold(
            (failure) => throw failure,
            (friends) => FriendsState(friends: friends),
      );
    }
  }

  Future<String?> removeFriend(String friendId) async {
    final useCase = ref.read(removeFriendUseCaseProvider);
    final result = await useCase(friendId: friendId);

    return result.fold(
          (failure) => failure.message,
          (_) => null,
    );
  }

  List<FriendshipEntity> get friends {
    return state.value?.friends ?? [];
  }
}