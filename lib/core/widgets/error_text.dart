import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ErrorText extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorText({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColors.dangerColor,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(
                color: AppColors.dangerColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            if(onRetry != null)...[
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.dangerColor
                )
              )
            ]
          ],
        ),
      )
    );
  }
}

class InlineErrorText extends StatelessWidget {
  final String message;

  const InlineErrorText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColors.dangerColor,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
           child: Text(
             message,
             style: const TextStyle(
               color: AppColors.dangerColor,
               fontSize: 14,
             ),
           ),
          )
        ],
      )
    );
  }
}

