import 'package:chat_app/core/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/features/server/presentation/controllers/create_server_controller.dart';

class CreateServerScreen extends ConsumerWidget {
  const CreateServerScreen({super.key});

  Future<void> _handleCreateServer(BuildContext context, WidgetRef ref) async {
    final success = await ref
        .read(createServerControllerProvider.notifier)
        .createServer();

    if (success && context.mounted) {
      Routes.goBack(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Server created successfully'),
          backgroundColor: AppColors.successColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createServerControllerProvider);
    final controller = ref.read(createServerControllerProvider.notifier);

    ref.listen(createServerControllerProvider, (previous, next) {
      if (next.generalError != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.generalError!),
            backgroundColor: AppColors.dangerColor,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Server'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Routes.goBack(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create your server',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Give your server a name and description to get started.',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 32),
            TextField(
              onChanged: controller.setName,
              decoration: InputDecoration(
                labelText: 'Server Name',
                hintText: 'Enter server name',
                prefixIcon: const Icon(Icons.dns),
                errorText: state.nameError,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: controller.setDescription,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter server description',
                prefixIcon: const Icon(Icons.description),
                errorText: state.descriptionError,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () => _handleCreateServer(context, ref),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: state.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Create Server'),
            ),
          ],
        ),
      ),
    );
  }
}
