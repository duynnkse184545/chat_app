import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/features/channel/presentation/controllers/create_channel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateChannelScreen extends ConsumerWidget {
  final String serverId;

  const CreateChannelScreen({super.key, required this.serverId});

  Future<void> _handleCreateChannel(BuildContext context, WidgetRef ref) async {
    final success = await ref.read(createChannelControllerProvider(serverId).notifier).createChannel();

    if (success && context.mounted) {
      Routes.goBack(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Channel created successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createChannelControllerProvider(serverId));
    final controller = ref.watch(createChannelControllerProvider(serverId).notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Channel'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create a new channel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Channels are where conversations happen.',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 32),

            // Channel Name
            TextField(
              onChanged: controller.setName,
              decoration: InputDecoration(
                labelText: 'Channel Name',
                hintText: 'general',
                prefixIcon: const Icon(Icons.tag),
                errorText: state.nameError,
              ),
            ),
            const SizedBox(height: 16),

            // Channel Description
            TextField(
              onChanged: controller.setDescription,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'What is this channel about?',
                prefixIcon: const Icon(Icons.description),
                errorText: state.descriptionError,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            // Error Message
            if (state.generalError != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  state.generalError!,
                  style: const TextStyle(color: AppColors.dangerColor),
                  textAlign: TextAlign.center,
                ),
              ),

            // Create Button
            ElevatedButton(
              onPressed: state.isLoading ? null : () => _handleCreateChannel(context, ref),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: state.isLoading
                  ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Text('Create Channel'),
            ),
          ],
        ),
      ),
    );
  }
}