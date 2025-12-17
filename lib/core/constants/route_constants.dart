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
    context.goNamed(servers.name);
  }

  static void goToServerDetails(BuildContext context, String serverId) {
    context.goNamed(
      serverDetails.name,
      pathParameters: {'serverId': serverId},
    );
  }

  static void goToCreateServer(BuildContext context) {
    context.goNamed(createServer.name);
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

  /// Go back to previous route
  static void goBack(BuildContext context) {
    context.pop();
  }

  /// Check if can go back
  static bool canGoBack(BuildContext context) {
    return context.canPop();
  }
}
