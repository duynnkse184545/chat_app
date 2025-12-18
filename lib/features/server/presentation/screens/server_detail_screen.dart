import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/widgets/error_text.dart';
import 'package:chat_app/core/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/features/server/presentation/controllers/server_detail_controller.dart';

class ServerDetailScreen extends ConsumerWidget {
  final String serverId;

  const ServerDetailScreen({super.key, required this.serverId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(serverDetailControllerProvider(serverId));

    return Scaffold(
      appBar: AppBar(
        title: Text(state.server?.name ?? 'Server'),
        actions: [
          if (state.server != null)
            PopupMenuButton<String>(
              onSelected: (value) async {
                if (value == 'delete') {
                  final confirmed = await _showDeleteDialog(context);
                  if (confirmed && context.mounted) {
                    final success = await ref
                        .read(serverDetailControllerProvider(serverId).notifier)
                        .deleteServer(serverId);
                    if (success && context.mounted) {
                      Routes.goBack(context);
                    }
                  }
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: AppColors.dangerColor),
                      SizedBox(width: 8),
                      Text('Delete Server'),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
      body: state.isLoading
          ? const Loader()
          : state.errorMessage != null
          ? ErrorText(message: state.errorMessage!)
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.accentColor,
                      child: state.server!.iconUrl != null
                          ? Image.network(state.server!.iconUrl!)
                          : Text(
                              state.server!.name[0].toUpperCase(),
                              style: const TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    state.server!.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    'Members (${state.server!.memberIds.length})',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  ...state.server!.memberIds.map(
                    (memberId) => ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text(memberId),
                    ),
                  ),
                  const SizedBox(height: 24),

                  ElevatedButton.icon(
                    onPressed: () {
                      // Will implement in Tutorial 06
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Channels coming in Tutorial 06!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.tag),
                    label: const Text('View Channels'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<bool> _showDeleteDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Server'),
            content: const Text('Are you sure you want to delete this server?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.dangerColor,
                ),
                child: const Text('Delete'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
