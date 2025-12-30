import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Route information containing both name and path
class RouteInfo {
  final String name;
  final String path;

  const RouteInfo({required this.name, required this.path});
}

class Routes {
  // Prevent instantiation
  Routes._();

  static const RouteInfo loading = RouteInfo(
    name: 'loading',
    path: '/loading',
  );

  static const RouteInfo signIn = RouteInfo(
    name: 'sign-in',
    path: '/sign-in',
  );

  static const RouteInfo signUp = RouteInfo(
    name: 'sign-up',
    path: '/sign-up',
  );

  static const RouteInfo home = RouteInfo(
    name: 'home',
    path: '/home',
  );

  // Server routes (will be added in Tutorial 05)
  static const RouteInfo servers = RouteInfo(
    name: 'servers',
    path: '/servers',
  );

  static const RouteInfo serverDetails = RouteInfo(
    name: 'server-details',
    path: '/servers/:serverId',
  );

  static const RouteInfo createServer = RouteInfo(
    name: 'create-server',
    path: '/create-server',
  );

  // Channel routes (will be added in Tutorial 06)
  static const RouteInfo channelView = RouteInfo(
    name: 'channel',
    path: '/servers/:serverId/channels/:channelId',
  );

  static const RouteInfo channelList = RouteInfo(
    name: 'channel-list',
    path: '/servers/:serverId/channels',
  );

  static const RouteInfo createChannel = RouteInfo(
    name: 'create-channel',
    path: '/servers/:serverId/create-channel',
  );

  static const RouteInfo chat = RouteInfo(
    name: 'chat',
    path: '/servers/:serverId/channels/:channelId/chat',
  );

  // Friends & DM routes
  static const RouteInfo friends = RouteInfo(
    name: 'friends',
    path: '/friends',
  );

  static const RouteInfo friendRequests = RouteInfo(
    name: 'friend-requests',
    path: '/friend-requests',
  );

  static const RouteInfo addFriend = RouteInfo(
    name: 'add-friend',
    path: '/add-friend',
  );

  static const RouteInfo directMessage = RouteInfo(
    name: 'direct-message',
    path: '/dm/:friendId',
  );

  // Auth navigation
  static void goToLoading(BuildContext context) {
    context.goNamed(loading.name);
  }

  static void goToSignIn(BuildContext context) {
    context.goNamed(signIn.name);
  }

  static void goToSignUp(BuildContext context) {
    context.goNamed(signUp.name);
  }

  static void goToHome(BuildContext context) {
    context.goNamed(home.name);
  }

  // Server navigation (will be added in Tutorial 05)
  static void goToServers(BuildContext context) {
    context.pushNamed(servers.name);
  }

  static void goToServerDetails(BuildContext context, String serverId) {
    context.pushNamed(
      serverDetails.name,
      pathParameters: {'serverId': serverId},
    );
  }

  static void goToCreateServer(BuildContext context) {
    context.pushNamed(createServer.name);
  }

  static void goToChannel(
    BuildContext context, {
    required String serverId,
    required String channelId,
  }) {
    context.goNamed(
      channelView.name,
      pathParameters: {
        'serverId': serverId,
        'channelId': channelId,
      },
    );
  }

  static void pushServerDetails(BuildContext context, String serverId) {
    context.pushNamed(
      serverDetails.name,
      pathParameters: {'serverId': serverId},
    );
  }

  static void pushChannel(
    BuildContext context, {
    required String serverId,
    required String channelId,
  }) {
    context.pushNamed(
      channelView.name,
      pathParameters: {
        'serverId': serverId,
        'channelId': channelId,
      },
    );
  }

  static void goToChannelList(
      BuildContext context, {
        required String serverId,
        required String serverName,
      }) {
    context.pushNamed(
      channelList.name,
      pathParameters: {'serverId': serverId},
      extra: {'serverName': serverName},
    );
  }

  static void goToCreateChannel(BuildContext context, String serverId) {
    context.pushNamed(
      createChannel.name,
      pathParameters: {'serverId': serverId},
    );
  }

  static void goToChat(
      BuildContext context, {
        required String serverId,
        required String channelId,
        required String channelName,
      }) {
    context.pushNamed(
      chat.name,
      pathParameters: {
        'serverId': serverId,
        'channelId': channelId,
      },
      extra: {'channelName': channelName},
    );
  }

  /// Go back to previous route
  static void goBack(BuildContext context) {
    context.pop();
  }

  /// Check if can go back
  static bool canGoBack(BuildContext context) {
    return context.canPop();
  }

  // Friends & DM navigation
  static void goToFriends(BuildContext context) {
    context.pushNamed(friends.name);
  }

  static void goToFriendRequests(BuildContext context) {
    context.pushNamed(friendRequests.name);
  }

  static void goToAddFriend(BuildContext context) {
    context.pushNamed(addFriend.name);
  }

  static void goToDirectMessage(
    BuildContext context, {
    required String friendId,
    required String friendName,
  }) {
    context.pushNamed(
      directMessage.name,
      pathParameters: {'friendId': friendId},
      extra: {'friendName': friendName},
    );
  }
}
