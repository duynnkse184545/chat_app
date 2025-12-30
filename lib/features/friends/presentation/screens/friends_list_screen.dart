import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/widgets/error_text.dart';
import 'package:chat_app/core/widgets/loader.dart';
import 'package:chat_app/features/friends/presentation/controllers/friends_controller.dart';
import 'package:chat_app/features/friends/presentation/widgets/friend_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsListScreen extends ConsumerWidget {
  const FriendsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendsAsync = ref.watch(friendsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () => Routes.goToAddFriend(context),
            tooltip: 'Add Friend',
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => Routes.goToFriendRequests(context),
            tooltip: 'Friend Requests',
          ),
        ],
      ),
      body: friendsAsync.when(
        data: (state) {
          if (state.friends.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.people_outline,
                    size: 64,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No friends yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Add friends to start chatting!',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => Routes.goToAddFriend(context),
                    icon: const Icon(Icons.person_add),
                    label: const Text('Add Friend'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: state.friends.length,
            itemBuilder: (context, index) {
              final friend = state.friends[index];
              return FriendListItem(
                friend: friend,
                onTap: () async {
                  // Start DM conversation
                  Routes.goToDirectMessage(
                    context,
                    friendId: friend.userId,
                    friendName: friend.username,
                  );
                },
                onRemove: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Remove Friend'),
                      content: Text(
                        'Are you sure you want to remove ${friend.username} from your friends?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                          child: const Text('Remove'),
                        ),
                      ],
                    ),
                  );

                  if (confirm == true && context.mounted) {
                    final error = await ref
                        .read(friendsControllerProvider.notifier)
                        .removeFriend(friend.userId);

                    if (error != null && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error), backgroundColor: AppColors.dangerColor),
                      );
                    }
                  }
                },
              );
            },
          );
        },
        error: (error, stack) => ErrorText(message: error.toString()),
        loading: () => const Loader(),
      ),
    );
  }
}
