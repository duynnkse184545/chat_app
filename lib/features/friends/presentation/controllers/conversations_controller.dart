import 'package:chat_app/features/friends/presentation/controllers/friend_providers.dart';
import 'package:chat_app/features/friends/presentation/states/conversations_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'conversations_controller.g.dart';

@riverpod
class ConversationsController extends _$ConversationsController {
  @override
  Stream<ConversationsState> build() async* {
    final useCase = ref.read(streamConversationsUseCaseProvider);
    final stream = useCase();

    await for (final either in stream) {
      yield either.fold(
            (failure) => throw failure,
            (conversations) => ConversationsState(conversations: conversations),
      );
    }
  }

  Future<String?> startConversation(String friendId) async {
    final useCase = ref.read(getOrCreateConversationUseCaseProvider);
    final result = await useCase(friendId: friendId);

    return result.fold(
          (failure) => failure.message,
          (conversation) {
        // Return conversation ID for navigation
        return null; // Success, no error
      },
    );
  }
}