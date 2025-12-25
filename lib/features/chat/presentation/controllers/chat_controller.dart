import 'package:chat_app/features/chat/presentation/controllers/chat_providers.dart';
import 'package:chat_app/features/chat/presentation/states/chat_state.dart'
    show ChatState;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatController extends _$ChatController {
  late String _serverId;
  late String _channelId;

  @override
  Stream<ChatState> build({
    required String serverId,
    required String channelId,
  }) async* {
    _serverId = serverId;
    _channelId = channelId;

    final streamMessageUseCase = ref.read(streamMessagesUseCaseProvider);
    final messagesStream = streamMessageUseCase(
      serverId: serverId,
      channelId: channelId,
    );

    await for (final result in messagesStream) {
      yield result.fold(
        (failure) => throw failure,
        (messages) => ChatState(messages: messages),
      );
    }
  }


  Future<String?> sendMessage(String content) async {
    final currentState = state.value;
    if (currentState == null) return 'State not loaded!';

    state = AsyncValue.data(currentState.copyWith(isSending: true));

    final sendUseCase = ref.read(sendMessageUseCaseProvider);
    final result = await sendUseCase(
      serverId: _serverId,
      channelId: _channelId,
      content: content.trim(),
    );

    return result.fold(
      (failure) {
        state = AsyncValue.data(currentState.copyWith(isSending: false));
        return failure.message;
      },
      (_) {
        state = AsyncValue.data(currentState.copyWith(isSending: false));
        return null;
      },
    );
  }
}
