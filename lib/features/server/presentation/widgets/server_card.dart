import 'package:chat_app/features/server/domain/entities/server_entity.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/theme/app_colors.dart';

class ServerCard extends StatelessWidget {
  final ServerEntity server;

  const ServerCard({super.key, required this.server});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(server.iconUrl!),
          child: server.iconUrl != null
              ? Image.network(server.iconUrl!)
              : Text(
                  server.name[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        title: Text(
          server.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          server.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          '${server.memberIds.length} members',
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
        onTap: () => Routes.goToServerDetails(context, server.serverId),
      ),
    );
  }
}
