import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/widgets/avatar_widget.dart';
import 'core/widgets/empty_state.dart';
import 'core/widgets/error_text.dart';
import 'core/widgets/loader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App Setup',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: const CoreTestScreen(),
    );
  }
}

class CoreTestScreen extends StatelessWidget {
  const CoreTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Core Components Test'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Avatars:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            children: const [
              AvatarWidget(name: 'John Doe', radius: 24),
              SizedBox(width: 16),
              AvatarWidget(name: 'Jane Smith', radius: 24, showOnlineStatus: true, isOnline: true),
              SizedBox(width: 16),
              AvatarWidget(name: 'Bob', radius: 32),
            ],
          ),
          const SizedBox(height: 32),
          const Text('Loader:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Loader(),
          const SizedBox(height: 32),
          const Text('Error:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const ErrorText(message: 'Something went wrong!'),
          const SizedBox(height: 32),
          const Text('Empty State:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const EmptyState(
            icon: Icons.chat_bubble_outline,
            title: 'No messages yet',
            subtitle: 'Start a conversation!',
          ),
        ],
      ),
    );
  }
}

