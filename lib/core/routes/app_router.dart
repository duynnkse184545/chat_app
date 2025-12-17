import 'package:chat_app/core/widgets/loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/controllers/auth_providers.dart';
import '../../features/auth/presentation/screens/home_screen.dart';
import '../../features/auth/presentation/screens/sign_in_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../constants/route_constants.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    redirect: (context, state) {
      final isLoading = authState.isLoading;
      final isAuthenticated = authState.value != null;
      final currentPath = state.matchedLocation;
      final isOnAuthPage =
          currentPath == Routes.signIn.path ||
          currentPath == Routes.signUp.path;

      debugPrint('🔄 Router redirect - isLoading: $isLoading, isAuthenticated: $isAuthenticated, path: $currentPath');

      if (isLoading) {
        return Routes.loading.path;
      }

      // If authenticated and not on home, go to home
      if (isAuthenticated && currentPath != Routes.home.path) {
        debugPrint('🏠 Redirecting authenticated user to home');
        return Routes.home.path;
      }

      // If not authenticated and not on auth pages, go to sign-in
      if (!isAuthenticated &&
          !isOnAuthPage &&
          currentPath != Routes.loading.path) {
        debugPrint('🔐 Redirecting unauthenticated user to sign-in');
        return Routes.signIn.path;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: Routes.loading.path,
        name: Routes.loading.name,
        builder: (context, state) => const Scaffold(body: Loader()),
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
