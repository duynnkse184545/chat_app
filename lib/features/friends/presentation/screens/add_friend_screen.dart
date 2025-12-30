import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:chat_app/features/friends/presentation/controllers/add_friend_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFriendScreen extends ConsumerStatefulWidget {
  const AddFriendScreen({super.key});

  @override
  ConsumerState<AddFriendScreen> createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends ConsumerState<AddFriendScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _sendRequest() async {
    if (!_formKey.currentState!.validate()) return;

    final username = _usernameController.text.trim();
    // Dismiss keyboard
    FocusScope.of(context).unfocus();
    
    final error = await ref
        .read(addFriendControllerProvider.notifier)
        .sendRequest(username);

    if (!mounted) return;

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: AppColors.dangerColor,
        ),
      );
    } else {
      // Success is handled by the UI reacting to state.isSuccess
      // But we can also show a snackbar here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Friend request sent!'),
          backgroundColor: AppColors.successColor,
        ),
      );
      _usernameController.clear();
      // Optional: Reset state after a delay or let user see success message
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
           ref.read(addFriendControllerProvider.notifier).reset();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addFriendControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Friend'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.person_add,
                size: 80,
                color: AppColors.primaryBg,
              ),
              const SizedBox(height: 24),
              const Text(
                'Send Friend Request',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter the username of the person you want to add',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 32),
              AuthField(
                controller: _usernameController,
                hintText: 'Username',
                prefixIcon: Icons.person,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a username';
                  }
                  if (value.trim().length < 3) {
                    return 'Username must be at least 3 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: state.isSending ? null : _sendRequest,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: state.isSending
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Send Request'),
              ),
              if (state.isSuccess) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.successColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.successColor),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.check_circle, color: AppColors.successColor),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Friend request sent successfully!',
                          style: TextStyle(color: AppColors.successColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
