import 'package:chat_app/core/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../controllers/server_list_controller.dart';

class CreateServerScreen extends ConsumerStatefulWidget {
  const CreateServerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateServerScreenState();
}

class _CreateServerScreenState extends ConsumerState<CreateServerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _handleCreateServer() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref
        .read(serverListControllerProvider.notifier)
        .createServer(
      name: _nameController.text,
      description: _descriptionController.text,
    );

    if (success && mounted) {
      Routes.goBack(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Server created successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(serverListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Server'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create your server',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                'Give your server a name and description to get started.',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 32),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Server Name',
                  hintText: 'Enter server name',
                  prefixIcon: Icon(Icons.dns),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Server name is required';
                  }
                  if (value.trim().length < 3) {
                    return 'Server name must be at least 3 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Server Description
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter server description',
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Error Message
              if (state.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    state.errorMessage!,
                    style: const TextStyle(color: AppColors.dangerColor),
                    textAlign: TextAlign.center,
                  ),
                ),

              // Create Button
              ElevatedButton(
                onPressed: state.isLoading ? null : _handleCreateServer,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: state.isLoading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : const Text('Create Server'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}