import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/widgets/error_text.dart';
import 'package:chat_app/core/widgets/loader.dart';
import 'package:chat_app/features/channel/presentation/controllers/channel_list_controller.dart';
import 'package:chat_app/features/channel/presentation/widgets/channel_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChannelListScreen extends ConsumerWidget {
  final String serverId;
  final String serverName;

  const ChannelListScreen({
    super.key,
    required this.serverId,
    required this.serverName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(channelListControllerProvider(serverId));

    return Scaffold(
      appBar: AppBar(
        title: Text('$serverName Channels'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Routes.goToCreateChannel(context, serverId),
          ),
        ],
      ),
      body: stateAsync.when(
        data: (state) => state.channels.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.tag,
                size: 64,
                color: AppColors.textSecondary,
              ),
              const SizedBox(height: 16),
              const Text(
                'No channels yet',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Create your first channel!',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => Routes.goToCreateChannel(context, serverId),
                icon: const Icon(Icons.add),
                label: const Text('Create Channel'),
              ),
            ],
          ),
        )
            : RefreshIndicator(
          onRefresh: () async => await ref
              .refresh(channelListControllerProvider(serverId).future),
          child: ListView.builder(
            itemCount: state.channels.length,
            itemBuilder: (context, index) {
              final channel = state.channels[index];
              return ChannelListItem(
                channel: channel,
                onDelete: () async {
                  final confirmed = await _showDeleteDialog(context);
                  if (confirmed && context.mounted) {
                    await ref
                        .read(channelListControllerProvider(serverId).notifier)
                        .deleteChannel(channel.id);
                  }
                },
              );
            },
          ),
        ),
        error: (error, stack) => ErrorText(message: (error as Failure).message),
        loading: () => const Loader(),
      )
    );
  }

  Future<bool> _showDeleteDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Channel'),
        content: const Text('Are you sure you want to delete this channel?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.dangerColor),
            child: const Text('Delete'),
          ),
        ],
      ),
    ) ??
        false;
  }
}