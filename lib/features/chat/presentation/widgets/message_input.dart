import 'package:chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  final Future<bool> Function(String content) onSend;
  // REMOVE: final bool isSending;  ❌

  const MessageInput({
    super.key,
    required this.onSend,
    // REMOVE: required this.isSending,  ❌
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();
  bool _isSending = false;  // ← Track locally instead

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final content = _controller.text.trim();
    if (content.isEmpty) return;

    setState(() => _isSending = true);

    final success = await widget.onSend(content);

    if (success) {
      _controller.clear();
    }

    if (mounted) {
      setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: AppColors.secondaryBg,
        border: Border(
          top: BorderSide(color: AppColors.dividerColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              enabled: !_isSending,  // ← Use local state
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: _isSending
                ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
                : const Icon(Icons.send),
            onPressed: _isSending ? null : _sendMessage,
            color: AppColors.primaryBg,
          ),
        ],
      ),
    );
  }
}