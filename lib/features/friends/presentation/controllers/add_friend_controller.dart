import 'package:chat_app/features/friends/presentation/controllers/friend_providers.dart';
import 'package:chat_app/features/friends/presentation/states/add_friend_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_friend_controller.g.dart';

@riverpod
class AddFriendController extends _$AddFriendController {
  @override
  AddFriendState build() {
    return const AddFriendState();
  }

  Future<String?> sendRequest(String username) async {
    state = state.copyWith(isSending: true, error: null, isSuccess: false);

    final useCase = ref.read(sendFriendRequestUseCaseProvider);
    final result = await useCase(targetUsername: username);

    return result.fold(
          (failure) {
        state = state.copyWith(
          isSending: false,
          error: failure.message,
          isSuccess: false,
        );
        return failure.message;
      },
          (_) {
        state = state.copyWith(
          isSending: false,
          error: null,
          isSuccess: true,
        );
        return null;
      },
    );
  }

  void reset() {
    state = const AddFriendState();
  }
}