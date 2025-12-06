import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AvatarWidget extends StatelessWidget {
  final String? imgUrl;
  final String name;
  final double radius;
  final Color? backgroundColor;
  final bool showOnlineStatus;
  final bool isOnline;

  const AvatarWidget({
    super.key,
    this.imgUrl,
    required this.name,
    this.radius = 20,
    this.backgroundColor,
    this.showOnlineStatus = false,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: backgroundColor ?? AppColors.accentColor,
          backgroundImage: imgUrl != null && imgUrl!.isNotEmpty
              ? CachedNetworkImageProvider(imgUrl!)
              : null,
          child: imgUrl == null || imgUrl!.isEmpty
          ? Text(
            _getInitials(name),
            style: TextStyle(
              color: Colors.white,
              fontSize: radius * 0.8,
              fontWeight: FontWeight.bold,
            ),
          )
          : null,
        ),
        if(showOnlineStatus)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: radius * 0.4,
              height: radius * 0.4,
              decoration: BoxDecoration(
                color: isOnline ? AppColors.onlineStatus : AppColors.offlineStatus,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryBg,
                  width: 2,
                )
              )
            )
          )
      ],
    );
  }

  String _getInitials(String name){
    if(name.isEmpty) return '?';

    final parts = name.trim().split(' ');
    if(parts.length >= 2){
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }
}
