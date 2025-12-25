import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/widgets/error_text.dart';
import 'package:chat_app/core/widgets/loader.dart';
import 'package:chat_app/features/chat/presentation/controllers/chat_controller.dart';
import 'package:chat_app/features/chat/presentation/widgets/message_bubble.dart';
import 'package:chat_app/features/chat/presentation/widgets/message_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String serverId;
  final String channelId;
  final String channelName;

  const ChatScreen({
    super.key,
    required this.serverId,
    required this.channelId,
    required this.channelName,
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
      chatControllerProvider(
        serverId: widget.serverId,
        channelId: widget.channelId,
      ),
    );

    // Auto-scroll when new messages arrive
    ref.listen(
      chatControllerProvider(
        serverId: widget.serverId,
        channelId: widget.channelId,
      ),
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.channelName),
            const Text(
              'Real-time chat',
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
      body: stateAsync.when(
        data: (state) {
          return Column(
            children: [
              // Messages list
              Expanded(
                child: state.messages.isEmpty
                    ? const Center(
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
                      )
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
                isSending: state.isSending,
                onSend: (content) async {
                  final error = await ref
                      .read(
                        chatControllerProvider(
                          serverId: widget.serverId,
                          channelId: widget.channelId,
                        ).notifier,
                      )
                      .sendMessage(content);

                  if (error != null && context.mounted) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(error)));
                  }
                  return error == null;
                },
              ),
            ],
          );
        },
        error: (error, stack) => ErrorText(message: (error as Failure).message),
        loading: () => const Loader(),
      ),
    );
  }
}
