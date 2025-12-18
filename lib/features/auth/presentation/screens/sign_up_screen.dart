import 'package:chat_app/features/auth/presentation/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/widgets/loader.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  Future<void> _handleSignUp(BuildContext context, WidgetRef ref) async {
    final success = await ref.read(signUpControllerProvider.notifier).signUp();
    
    if (success && context.mounted) {
      Routes.goToHome(context);
    } else if (!success && context.mounted) {
      final errorMessage = ref
          .read(signUpControllerProvider)
          .generalError;
      if (errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: AppColors.dangerColor,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signUpControllerProvider);
    final controller = ref.watch(signUpControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.chat_bubble,
                  size: 80,
                  color: AppColors.accentColor,
                ),
                const SizedBox(height: 16,),

                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8,),

                const Text(
                  'Join the conversation',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48,),

                TextField(
                    onChanged: controller.setUsername,
                    style: const TextStyle(color: AppColors.textPrimary),
                    decoration: InputDecoration(
                        hintText: 'Username',
                        errorText: state.usernameError,
                        hintStyle: const TextStyle(color: AppColors.textSecondary),
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: AppColors.textMuted,
                        )
                    )
                ),
                const SizedBox(height: 16,),

                TextField(
                  onChanged: controller.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                      hintText: 'Email',
                      errorText: state.emailError,
                      hintStyle: const TextStyle(
                          color: AppColors.textSecondary),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.textMuted,
                      )
                  ),
                ),
                const SizedBox(height: 16,),

                TextField(
                  onChanged: controller.setPassword,
                  obscureText: !state.isPasswordVisible,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(
                        Icons.lock_outline, color: AppColors.textMuted,),
                      suffixIcon: IconButton(
                        onPressed: controller.togglePasswordVisibility,
                        icon: Icon(
                          state.isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.textMuted,
                        ),
                      )
                  ),
                ),
                const SizedBox(height: 24,),

                if(state.generalError != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      state.generalError!,
                      style: const TextStyle(
                        color: AppColors.dangerColor,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: state.isLoading
                        ? null
                        : () => _handleSignUp(context, ref),
                    child: state.isLoading
                        ? const SmallLoader()
                        : const Text('Sign Up'),
                  ),
                ),
                const SizedBox(height: 16,),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already owned an account?',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      GestureDetector(
                        onTap: () => Routes.goToSignIn(context),
                        child: const Text(
                          'Sign In Here',
                          style: TextStyle(
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ]
                )
              ]
          ),
        ),
      ),
    );
  }
}