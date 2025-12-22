import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/widgets/error_text.dart';
import 'package:chat_app/core/widgets/loader.dart';
import 'package:chat_app/features/server/presentation/controllers/server_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/features/server/presentation/widgets/server_card.dart';

class ServerListScreen extends ConsumerWidget {
  const ServerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(serverListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Servers'),
        actions: [
          IconButton(
            onPressed: () => Routes.goToCreateServer(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: stateAsync.when(
        data: (state) => state.servers.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.dns_outlined,
                      size: 64,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(height: 16),

                    Text(
                      'No Servers Yet',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                      'Create Your First Server!',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                child: ListView.builder(
                  itemCount: state.servers.length,
                  itemBuilder: (context, index) {
                    final server = state.servers[index];
                    return ServerCard(server: server);
                  },
                ),
                onRefresh: () =>
                    ref.read(serverListControllerProvider.notifier).refresh(),
              ),
        error: (error, stack) => ErrorText(message: (error as Failure).message),
        loading: () => const Loader(),
      ),
    );
  }
}
