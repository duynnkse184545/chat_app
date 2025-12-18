import 'package:chat_app/core/constants/app_constants.dart';

/// Centralized validation utilities for form inputs.
/// 
/// Provides consistent validation logic across Create and Update operations.
/// All validation methods return `null` if valid, or an error message string if invalid.
/// 
/// Usage:
/// ```dart
/// final error = Validators.serverName(name);
/// if (error != null) {
///   state = state.copyWith(errorMessage: error);
///   return false;
/// }
/// ```
class Validators {
  Validators._(); // Private constructor - utility class

  // ========================================
  // Common Validators
  // ========================================

  /// Validates that a string is not empty after trimming.
  static String? required(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validates minimum length after trimming.
  static String? minLength(String? value, int min, String fieldName) {
    if (value == null || value.trim().length < min) {
      return '$fieldName must be at least $min characters';
    }
    return null;
  }

  /// Validates maximum length after trimming.
  static String? maxLength(String? value, int max, String fieldName) {
    if (value == null || value.trim().length > max) {
      return '$fieldName must not exceed $max characters';
    }
    return null;
  }

  /// Validates email format.
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // ========================================
  // Auth Validators
  // ========================================

  /// Validates username (3-20 characters, alphanumeric + underscore).
  static String? username(String? value) {
    final requiredError = required(value, 'Username');
    if (requiredError != null) return requiredError;

    final trimmed = value!.trim();
    if (trimmed.length < AppConstants.usernameMinLength) {
      return 'Username must be at least ${AppConstants.usernameMinLength} characters';
    }
    if (trimmed.length > AppConstants.usernameMaxLength) {
      return 'Username must not exceed ${AppConstants.usernameMaxLength} characters';
    }

    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(trimmed)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }

  /// Validates password (minimum 6 characters).
  static String? password(String? value) {
    final requiredError = required(value, 'Password');
    if (requiredError != null) return requiredError;

    if (value!.length < AppConstants.passwordMinLength) {
      return 'Password must be at least ${AppConstants.passwordMinLength} characters';
    }
    return null;
  }

  // ========================================
  // Server Validators
  // ========================================

  /// Validates server name (3-50 characters).
  static String? serverName(String? value) {
    final requiredError = required(value, 'Server name');
    if (requiredError != null) return requiredError;

    final trimmed = value!.trim();
    if (trimmed.length < 3) {
      return 'Server name must be at least 3 characters';
    }
    if (trimmed.length > AppConstants.serverNameMaxLength) {
      return 'Server name must not exceed ${AppConstants.serverNameMaxLength} characters';
    }
    return null;
  }

  /// Validates server description.
  static String? serverDescription(String? value) {
    return required(value, 'Description');
  }

  // ========================================
  // Channel Validators
  // ========================================

  /// Validates channel name (2-30 characters).
  static String? channelName(String? value) {
    final requiredError = required(value, 'Channel name');
    if (requiredError != null) return requiredError;

    final trimmed = value!.trim();
    if (trimmed.length < 2) {
      return 'Channel name must be at least 2 characters';
    }
    if (trimmed.length > AppConstants.channelNameMaxLength) {
      return 'Channel name must not exceed ${AppConstants.channelNameMaxLength} characters';
    }
    return null;
  }

  /// Validates channel description.
  static String? channelDescription(String? value) {
    return required(value, 'Description');
  }

  // ========================================
  // Message Validators
  // ========================================

  /// Validates message content (not empty, max 2000 chars).
  static String? messageContent(String? value) {
    final requiredError = required(value, 'Message');
    if (requiredError != null) return requiredError;

    if (value!.trim().length > AppConstants.messageMaxLength) {
      return 'Message must not exceed ${AppConstants.messageMaxLength} characters';
    }
    return null;
  }
}
