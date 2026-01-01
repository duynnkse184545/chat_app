import 'package:chat_app/core/constants/route_constants.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/widgets/loader.dart';
import 'package:chat_app/features/auth/presentation/controllers/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget {

  const SignInScreen({super.key});

  Future<void> _handleSignIn(BuildContext context, WidgetRef ref) async {
    final success = await ref.read(signInControllerProvider.notifier).signIn();

    if (!context.mounted) return;

    if (!success) {
      final errorMessage = ref.read(signInControllerProvider).generalError;
      if (errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: AppColors.dangerColor,
          ),
        );
      }
    }
    // Success is handled by Router redirection via authLoadingProvider
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInControllerProvider);
    final controller = ref.read(signInControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  'assets/app_logo.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16,),

            const Text(
              'Welcome back!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8,),

            const Text(
              'Sign In To Continue',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48,),

            TextField(
              onChanged: controller.setEmail,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: 'Email',
                errorText: state.emailError,
                hintStyle: const TextStyle(color: AppColors.textSecondary),
                prefixIcon: const Icon(Icons.email_outlined, color: AppColors.textMuted ,
                ),
              ),
            ),
            const SizedBox(height: 16,),

            TextField(
              onChanged: controller.setPassword,
              obscureText: !state.isPasswordVisible,
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: 'Password',
                errorText: state.passwordError,
                prefixIcon: const Icon(Icons.lock_outline, color: AppColors.textMuted,),
                suffixIcon: IconButton(
                  onPressed: controller.togglePasswordVisibility,
                  icon: Icon(
                    state.isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
                    : () => _handleSignIn(context, ref),
                child: state.isLoading
                  ? const SmallLoader()
                  : const Text('Sign In'),
              ),
            ),
            const SizedBox(height: 16,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\t have an account yet?',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                GestureDetector(
                  onTap: () => Routes.goToSignUp(context),
                  child: const Text(
                    'Sign Up Now',
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ]
            )
          ],
        ),
      ),
    );
  }

}