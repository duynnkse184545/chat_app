import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/widgets/error_text.dart';
import 'package:chat_app/core/widgets/loader.dart';
import 'package:chat_app/features/friends/presentation/controllers/friend_requests_controller.dart';
import 'package:chat_app/features/friends/presentation/widgets/friend_request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chat_app/features/friends/presentation/states/friend_requests_state.dart';

class FriendRequestsScreen extends ConsumerWidget {
  const FriendRequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestsAsync = ref.watch(friendRequestsControllerProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Friend Requests'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Incoming'),
              Tab(text: 'Outgoing'),
            ],
          ),
        ),
        body: requestsAsync.when(
          data: (FriendRequestsState state) { // Strong typing here
            return TabBarView(
              children: [
                _buildIncomingRequests(context, ref, state),
                _buildOutgoingRequests(context, state),
              ],
            );
          },
          error: (error, stack) => ErrorText(message: error.toString()),
          loading: () => const Loader(),
        ),
      ),
    );
  }

  Widget _buildIncomingRequests(
    BuildContext context,
    WidgetRef ref,
    FriendRequestsState state, // Strong typing here
  ) {
    if (state.incomingRequests.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 64,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: 16),
            Text(
              'No incoming requests',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: state.incomingRequests.length,
      itemBuilder: (context, index) {
        final request = state.incomingRequests[index];
        return FriendRequestItem(
          request: request,
          isIncoming: true,
          onAccept: () async {
            final error = await ref
                .read(friendRequestsControllerProvider.notifier)
                .acceptRequest(request.requestId);

            if (error != null && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error), backgroundColor: AppColors.dangerColor),
              );
            } else if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('You are now friends with ${request.fromUsername}!'),
                  backgroundColor: AppColors.successColor,
                ),
              );
            }
          },
          onReject: () async {
            final error = await ref
                .read(friendRequestsControllerProvider.notifier)
                .rejectRequest(request.requestId);

            if (error != null && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error), backgroundColor: AppColors.dangerColor),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildOutgoingRequests(BuildContext context, FriendRequestsState state) {
    if (state.outgoingRequests.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.outbox_outlined,
              size: 64,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: 16),
            Text(
              'No outgoing requests',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: state.outgoingRequests.length,
      itemBuilder: (context, index) {
        final request = state.outgoingRequests[index];
        return FriendRequestItem(
          request: request,
          isIncoming: false,
        );
      },
    );
  }
}
