import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/features/channel/domain/entities/channel_entity.dart';
import 'package:flutter/material.dart';

class ChannelListItem extends StatelessWidget {
  final ChannelEntity channel;
  final VoidCallback? onDelete;

  const ChannelListItem({
    super.key,
    required this.channel,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.tag, color: AppColors.textSecondary),
      title: Text(
        channel.name,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        channel.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: onDelete != null
          ? IconButton(
        icon: const Icon(Icons.delete, color: AppColors.dangerColor),
        onPressed: onDelete,
      )
          : const Icon(Icons.chevron_right),
      onTap: () => Routes.goToChat(
        context,
        serverId: channel.serverId,
        channelId: channel.id,
        channelName: channel.name,
      ),
    );
  }
}