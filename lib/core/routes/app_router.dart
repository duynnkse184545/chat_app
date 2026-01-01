import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/widgets/auth_loading_screen.dart';
import 'package:chat_app/features/auth/presentation/controllers/auth_providers.dart';
import 'package:chat_app/features/auth/presentation/screens/home_screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:chat_app/features/channel/presentation/screens/channel_list_screen.dart';
import 'package:chat_app/features/channel/presentation/screens/create_channel_screen.dart';
import 'package:chat_app/features/chat/presentation/models/chat_params.dart'; // Import ChatParams
import 'package:chat_app/features/chat/presentation/screens/chat_screen.dart';
import 'package:chat_app/features/friends/presentation/screens/add_friend_screen.dart';
import 'package:chat_app/features/friends/presentation/screens/friend_requests_screen.dart';
import 'package:chat_app/features/friends/presentation/screens/friends_list_screen.dart';
import 'package:chat_app/features/server/presentation/screens/create_server_screen.dart';
import 'package:chat_app/features/server/presentation/screens/server_detail_screen.dart';
import 'package:chat_app/features/server/presentation/screens/server_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  // Create a notifier to trigger router refreshes
  final notifier = ValueNotifier<int>(0);
  
  // Listen to auth state changes and notify the router
  final sub = ref.listen(authStateChangesProvider, (_, _) {
    notifier.value++;
  });
  
  // Listen to auth loading changes
  final sub2 = ref.listen(authLoadingProvider, (_, _) {
    notifier.value++;
  });
  
  // Cleanup
  ref.onDispose(() {
    sub.close();
    sub2.close();
    notifier.dispose();
  });

  return GoRouter(
    refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: Routes.home.path,
    redirect: (context, state) {
      // Use read instead of watch to avoid rebuilding the provider
      final authState = ref.read(authStateChangesProvider);
      final isGlobalLoading = ref.read(authLoadingProvider);
      
      final isLoading = authState.isLoading;
      final isAuthenticated = authState.value != null;
      final currentPath = state.matchedLocation;
      final isOnAuthPage =
          currentPath == Routes.signIn.path ||
          currentPath == Routes.signUp.path;
      
      debugPrint('🔄 Router redirect - isLoading: $isLoading, isAuthenticated: $isAuthenticated, loading: $isGlobalLoading');

      if (isLoading || isGlobalLoading) {
        return Routes.loading.path;
      }

      // If authenticated and not on home, go to home
      if (isAuthenticated && isOnAuthPage) {
        debugPrint('🏠 Redirecting authenticated user to home');
        return Routes.home.path;
      }

      // If not authenticated and not on auth pages, go to sign-in
      if (!isAuthenticated && !isOnAuthPage) {
        debugPrint('🔐 Redirecting unauthenticated user to sign-in');
        return Routes.signIn.path;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: Routes.loading.path,
        name: Routes.loading.name,
        builder: (context, state) => const AuthLoadingScreen(),
      ),

      GoRoute(
        path: Routes.signIn.path,
        name: Routes.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),

      GoRoute(
        path: Routes.signUp.path,
        name: Routes.signUp.name,
        builder: (context, state) => const SignUpScreen(),
      ),

      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: Routes.servers.path,
        name: Routes.servers.name,
        builder: (context, state) => const ServerListScreen(),
      ),

      GoRoute(
        path: Routes.serverDetails.path,
        name: Routes.serverDetails.name,
        builder: (context, state) {
          final serverId = state.pathParameters['serverId']!;
          return ServerDetailScreen(serverId: serverId);
        },
      ),

      GoRoute(
        path: Routes.createServer.path,
        name: Routes.createServer.name,
        builder: (context, state) => const CreateServerScreen(),
      ),

      GoRoute(
        path: Routes.channelList.path,
        name: Routes.channelList.name,
        builder: (context, state) {
          final serverId = state.pathParameters['serverId']!;
          final extra = state.extra as Map<String, dynamic>?;
          final serverName = extra?['serverName'] ?? 'Server';

          return ChannelListScreen(
            serverId: serverId,
            serverName: serverName,
          );
        },
      ),

      GoRoute(
        path: Routes.createChannel.path,
        name: Routes.createChannel.name,
        builder: (context, state) {
          final serverId = state.pathParameters['serverId']!;
          return CreateChannelScreen(serverId: serverId);
        },
      ),

      GoRoute(
        path: Routes.chat.path,
        name: Routes.chat.name,
        builder: (context, state) {
          final serverId = state.pathParameters['serverId']!;
          final channelId = state.pathParameters['channelId']!;
          final extra = state.extra as Map<String, dynamic>?;
          final channelName = extra?['channelName'] ?? 'Chat';

          return ChatScreen(
            params: ChatParams.channel(
              serverId: serverId,
              channelId: channelId,
              channelName: channelName,
            ),
          );
        },
      ),

      GoRoute(
        path: Routes.friends.path,
        name: Routes.friends.name,
        builder: (context, state) => const FriendsListScreen(),
      ),

      GoRoute(
        path: Routes.friendRequests.path,
        name: Routes.friendRequests.name,
        builder: (context, state) => const FriendRequestsScreen(),
      ),

      GoRoute(
        path: Routes.addFriend.path,
        name: Routes.addFriend.name,
        builder: (context, state) => const AddFriendScreen(),
      ),

      // Friends & DM routes
      GoRoute(
        path: Routes.directMessage.path,
        name: Routes.directMessage.name,
        builder: (context, state) {
          final friendId = state.pathParameters['friendId']!;
          final extra = state.extra as Map<String, dynamic>?;
          final friendName = extra?['friendName'] ?? 'Friend';

          return ChatScreen(
            params: ChatParams.directMessage(
              friendId: friendId,
              friendName: friendName,
            ),
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Page not found! ${state.uri}'),
          ],
        ),
      ),
    ),
  );
});