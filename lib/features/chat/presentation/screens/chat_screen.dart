import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/widgets/error_text.dart';
import 'package:chat_app/core/widgets/loader.dart';
import 'package:chat_app/features/chat/presentation/controllers/chat_controller.dart';
import 'package:chat_app/features/chat/presentation/models/chat_params.dart';
import 'package:chat_app/features/chat/presentation/states/chat_state.dart';
import 'package:chat_app/features/chat/presentation/widgets/message_bubble.dart';
import 'package:chat_app/features/chat/presentation/widgets/message_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final ChatParams params;

  const ChatScreen({
    super.key,
    required this.params,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(
      chatControllerProvider(params: widget.params),
    );

    // Auto-scroll when new messages arrive
    ref.listen(
      chatControllerProvider(params: widget.params),
          (previous, next) {
        final prevLen = previous?.valueOrNull?.messages.length ?? 0;
        final nextLen = next.valueOrNull?.messages.length ?? 0;

        if (nextLen > prevLen) {
          _scrollToBottom();
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Routes.goBack(context),
        ),
        title: stateAsync.when(
          data: (state) => _buildAppBarTitle(state),
          error: (_, _) => const Text('Chat'),
          loading: () => const Text('Chat'),
        ),
      ),
      body: stateAsync.when(
        data: (state) => _buildChatBody(state),
        error: (error, stack) => ErrorText(
          message: error is Failure ? error.message : error.toString(),
        ),
        loading: () => const Loader(),
      ),
    );
  }

  Widget _buildAppBarTitle(ChatState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(state.displayName ?? 'Chat'),
        Text(
          state.chatType == ChatType.channel
              ? 'Real-time chat'
              : 'Direct Message',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildChatBody(ChatState state) {
    // For DMs, wait for conversation to be created
    if (state.chatType == ChatType.directMessage &&
        state.conversationId == null) {
      return const Center(child: Text('Creating conversation...'));
    }

    return Column(
      children: [
        // Messages list
        Expanded(
          child: state.messages.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: state.messages.length,
            itemBuilder: (context, index) {
              final message = state.messages[index];
              return MessageBubble(message: message);
            },
          ),
        ),

        // Message input
        MessageInput(
          onSend: (content) async {
            final error = await ref
                .read(chatControllerProvider(params: widget.params).notifier)
                .sendMessage(content);

            if (error != null && mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
            }
            return error == null;
          },
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 64,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: 16),
          Text(
            'No messages yet',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Start the conversation!',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}