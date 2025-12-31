import 'package:chat_app/core/utils/enums.dart';
import 'package:chat_app/features/auth/presentation/controllers/auth_providers.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app/features/chat/presentation/controllers/chat_providers.dart';
import 'package:chat_app/features/chat/presentation/models/chat_params.dart';
import 'package:chat_app/features/chat/presentation/states/chat_state.dart'
    show ChatState, ChatType;
import 'package:chat_app/features/friends/presentation/controllers/friend_providers.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_controller.g.dart';

@riverpod
class ChatController extends _$ChatController {
  // Use lesser var unlike chatParam and if else to determine
  String? _conversationId;
  late final ChatParams _params;

  @override
  Stream<ChatState> build({required ChatParams params}) async* {
    _params = params; // Initialize once

    yield* params.when(
      channel: (serverId, channelId, channelName) =>
          _buildChannelChat(serverId, channelId, channelName),
      directMessage: (friendId, friendName) =>
          _buildDirectMessageChat(friendId, friendName),
    );
  }

  Stream<ChatState> _buildChannelChat(
    String serverId,
    String channelId,
    String channelName,
  ) async* {
    _syncFirebaseToLocal(channelId: channelId, serverId: serverId);

    final streamMessageUseCase = ref.read(streamMessagesUseCaseProvider);
    final messagesStream = streamMessageUseCase(
      serverId: serverId,
      channelId: channelId,
    );

    await for (final result in messagesStream) {
      yield result.fold(
        (failure) => throw failure,
        (messages) => ChatState(
          messages: messages,
          chatType: ChatType.channel,
          displayName: channelName,
        ),
      );
    }
  }

  Stream<ChatState> _buildDirectMessageChat(
    String friendId,
    String friendName,
  ) async* {
    yield ChatState(
      messages: const [],
      chatType: ChatType.directMessage,
      displayName: friendName,
    );

    // Get or create conversation
    final conversationUseCase = ref.read(
      getOrCreateConversationUseCaseProvider,
    );
    final conversationResult = await conversationUseCase(friendId: friendId);

    yield* conversationResult.fold(
      (failure) async* {
        debugPrint('Error creating conversation: ${failure.message}');
        throw failure;
      },
      (conversation) async* {
        _conversationId = conversation.conversationId;
        debugPrint('Conversation ID: $_conversationId');

        _syncFirebaseToLocal(conversationId: _conversationId);

        // Stream messages from this conversation
        final streamUseCase = ref.read(streamDirectMessageUseCaseProvider);
        final messagesStream = streamUseCase(conversationId: _conversationId!);

        await for (final result in messagesStream) {
          yield result.fold(
            (failure) => throw failure,
            (messages) => ChatState(
              messages: messages,
              chatType: ChatType.directMessage,
              conversationId: _conversationId,
              displayName: friendName,
            ),
          );
        }
      },
    );
  }

  void _syncFirebaseToLocal({
    String? channelId,
    String? serverId,
    String? conversationId,
  }) {
    if (channelId != null && serverId != null) {
      final streamUseCase = ref.read(streamMessagesUseCaseProvider);
      streamUseCase(serverId: serverId, channelId: channelId).listen((result) {
        // Repository already caches to DB automatically in streamMessages
      }, onError: (e) => debugPrint('🔴 Firebase sync error (channel): $e'));
    } else if (conversationId != null) {
      final streamUseCase = ref.read(streamDirectMessageUseCaseProvider);
      streamUseCase(conversationId: conversationId).listen((result) {
        // Repository already caches to DB automatically
      }, onError: (e) => debugPrint('🔴 Firebase sync error (DM): $e'));
    }
  }

  Future<String?> sendMessage(String content) async {
    final currentUser = ref.read(currentUserProvider);
    if (currentUser == null) return 'User not logged in';

    // Extract chat context from params
    String serverId = '';
    String channelId = '';
    bool isDirectMessage = false;

    _params.when(
      channel: (sId, cId, _) {
        serverId = sId;
        channelId = cId;
        isDirectMessage = false;
      },
      directMessage: (_, _) {
        channelId = _conversationId ?? '';
        isDirectMessage = true;
      },
    );

    if (channelId.isEmpty) return 'Chat not initialized';

    // Create message WITHOUT ID - repository will get Firebase ID
    final optimisticMessage = MessageEntity(
      messageId: '',  // Empty - Firebase will generate
      senderId: currentUser.uid,
      senderName: currentUser.username,
      content: content,
      createdAt: DateTime.now(),
      channelId: channelId,
      isDirectMessage: isDirectMessage,
      status: MessageStatus.sending,
    );

    // 1. Save optimistically (repository gets ID from Firebase)
    final saveOptimisticUseCase = ref.read(saveOptimisticMessageUseCaseProvider);

    // Note: For DMs, conversationId IS the channelId (per your schema design)
    // So channelId works for both channel and DM cases
    final saveResult = await saveOptimisticUseCase(
      optimisticMessage,
      serverId: serverId,  // Empty string for DMs
      channelId: channelId,  // conversationId for DMs, channelId for channels
    );

    final messageWithId = saveResult.fold(
          (failure) => null,
          (entity) => entity,  // Entity now has Firebase-generated ID
    );

    if (messageWithId == null) {
      return 'Failed to save message locally';
    }

    // 2. Send to server with Firebase-generated ID
    String? error = await _params.when(
      channel: (sId, cId, _) =>
          _sendChannelMessage(sId, cId, content, messageWithId.messageId),
      directMessage: (_, _) =>
          _sendDirectMessage(content, messageWithId.messageId),
    );

    // 3. Update status if failed
    if (error != null) {
      final updateStatusUseCase = ref.read(updateMessageStatusUseCaseProvider);
      await updateStatusUseCase(
        messageId: messageWithId.messageId,
        status: MessageStatus.failed,
        errorMessage: error,
      );
      return error;
    }

    return null;
  }

  Future<String?> _sendChannelMessage(
    String serverId,
    String channelId,
    String content,
    String messageId,
  ) async {
    final sendUseCase = ref.read(sendMessageUseCaseProvider);
    final result = await sendUseCase(
      serverId: serverId,
      channelId: channelId,
      content: content.trim(),
      messageId: messageId,
    );

    return result.fold((failure) => failure.message, (_) => null);
  }

  Future<String?> _sendDirectMessage(String content, String messageId) async {
    if (_conversationId == null) {
      return 'Conversation not initialized';
    }

    final sendUseCase = ref.read(sendDirectMessageUseCaseProvider);
    final result = await sendUseCase(
      conversationId: _conversationId!,
      content: content,
      messageId: messageId,
    );

    return result.fold((failure) => failure.message, (_) => null);
  }
}
