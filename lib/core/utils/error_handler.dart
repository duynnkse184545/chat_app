import 'dart:async' as async_timeout;
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';

/// Centralized error handling utility for repositories.
/// 
/// Handles GENERIC exceptions that are common across all repositories.
/// Domain-specific exceptions (e.g., FirebaseAuthException) should be
/// handled in the respective repositories for custom error conversion.
/// 
/// Provides two types of error handling:
/// 1. [handle] - For critical operations that should fail if errors occur
/// 2. [handleSafely] - For optional operations (like caching) that should not block the main flow
class ErrorHandler {
  ErrorHandler._();

  /// Converts generic exceptions to domain-specific failures.
  /// 
  /// This only handles common exceptions. Domain-specific exceptions
  /// should be caught and converted in the repository layer.
  static Failure convertException(Object e, [StackTrace? stackTrace]) {
    if (stackTrace != null) {
      debugPrint('🔴 Exception caught: $e');
      debugPrintStack(stackTrace: stackTrace, maxFrames: 3);
    }

    return switch (e) {
      // App-specific exceptions (already converted in datasources)
      AuthException(:final message) => Failure.authFailure(message),
      ServerException(:final message) => Failure.serverFailure(message),
      CacheException(:final message) => Failure.cacheFailure(message),
      NetworkException(:final message) => Failure.networkFailure(message),
      NotFoundException(:final message) => Failure.notFoundFailure(message),
      PermissionException(:final message) => Failure.permissionFailure(message),
      ValidationException(:final message) => Failure.validationFailure(message),
      TimeoutException(:final message) => Failure.timeoutFailure(message),
      StorageException(:final message) => Failure.storageFailure(message),
      
      // Dart core exceptions (generic, applies to all repositories)
      SocketException() => const Failure.networkFailure(
        'No internet connection. Please check your network.',
      ),
      HttpException(:final message) => Failure.networkFailure(message),
      FormatException(:final message) => Failure.validationFailure(
        'Invalid data format: $message',
      ),
      async_timeout.TimeoutException() => const Failure.timeoutFailure(
        'Request timed out. Please try again.',
      ),
      
      // Fallback for unknown exceptions
      _ => Failure.unknownFailure('Unexpected error: ${e.toString()}'),
    };
  }

  /// Handles critical operations that should fail if errors occur.
  /// 
  /// Wraps the operation in try-catch and converts exceptions to Failures.
  /// Use this for operations where errors should stop the flow (e.g., authentication, data fetching).
  /// 
  /// For domain-specific exceptions (e.g., FirebaseAuthException), catch them
  /// in the repository before calling this method for custom error conversion.
  /// 
  /// Example:
  /// ```dart
  /// return ErrorHandler.handle(() async {
  ///   final user = await remoteDatasource.signIn(...);
  ///   return user.toEntity();
  /// });
  /// ```
  static Future<Either<Failure, T>> handle<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final result = await operation();
      return Right(result);
    } catch (e, stackTrace) {
      return Left(convertException(e, stackTrace));
    }
  }

  /// Handles void operations that should fail if errors occur.
  /// 
  /// Similar to [handle] but for operations that don't return a value.
  /// 
  /// Example:
  /// ```dart
  /// return ErrorHandler.handleVoid(() async {
  ///   await remoteDatasource.signOut();
  /// });
  /// ```
  static Future<Either<Failure, Unit>> handleVoid(
    Future<void> Function() operation,
  ) async {
    try {
      await operation();
      return const Right(unit);
    } catch (e, stackTrace) {
      return Left(convertException(e, stackTrace));
    }
  }

  /// Handles optional operations that should not block the main flow.
  /// 
  /// Swallows exceptions and logs them for debugging. Use this for non-critical
  /// operations like caching where failure should not affect the main functionality.
  /// 
  /// Example:
  /// ```dart
  /// await ErrorHandler.handleSafely(
  ///   () => localDatasource.cacheUser(user),
  ///   'Cache user on sign-in',
  /// );
  /// ```
  static Future<void> handleSafely(
    Future<void> Function() operation,
    String context,
  ) async {
    try {
      await operation();
    } catch (e, stackTrace) {
      debugPrint('⚠️ $context failed: $e');
      debugPrintStack(stackTrace: stackTrace, maxFrames: 2);
    }
  }
}
