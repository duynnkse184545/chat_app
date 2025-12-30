import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/widgets/avatar_widget.dart';
import 'package:chat_app/features/friends/domain/entities/friendship_entity.dart';
import 'package:flutter/material.dart';

class FriendListItem extends StatelessWidget {
  final FriendshipEntity friend;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  const FriendListItem({
    super.key,
    required this.friend,
    required this.onTap,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AvatarWidget(
        imgUrl: friend.avatarUrl,
        name: friend.username,
        radius: 24,
      ),
      title: Text(
        friend.username,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        friend.bio ?? friend.email,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
      trailing: onRemove != null
          ? PopupMenuButton(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'message',
            child: Row(
              children: [
                Icon(Icons.message, size: 20),
                SizedBox(width: 12),
                Text('Send Message'),
              ],
            ),
          ),
          const PopupMenuItem(
            value: 'remove',
            child: Row(
              children: [
                Icon(Icons.person_remove, size: 20, color: Colors.red),
                SizedBox(width: 12),
                Text('Remove Friend', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ],
        onSelected: (value) {
          if (value == 'message') {
            onTap();
          } else if (value == 'remove') {
            onRemove?.call();
          }
        },
      )
          : const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}