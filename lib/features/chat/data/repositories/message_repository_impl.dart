import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/utils/error_handler.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/chat/data/datasources/message_local_datasource.dart';
import 'package:chat_app/features/chat/data/datasources/message_remote_datasource.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDatasource _remoteDatasource;
  final MessageLocalDatasource _localDatasource;

  MessageRepositoryImpl({
    required MessageRemoteDatasource remoteDatasource,
    required MessageLocalDatasource localDatasource,
  }) : _remoteDatasource = remoteDatasource,
       _localDatasource = localDatasource;

  Failure _convertFirebaseException(FirebaseException e) {
    debugPrint('🔴 Firebase Error (Message): ${e.code} - ${e.message}');

    return switch (e.code) {
      'permission-denied' => const Failure.permissionFailure(
        'You do not have permission to send messages.',
      ),
      'not-found' => const Failure.notFoundFailure('Conversation or channel not found.'),
      'unavailable' => const Failure.serverFailure(
        'Chat service temporarily unavailable. Please try again.',
      ),
      _ => Failure.serverFailure(e.message ?? 'Failed to send message.'),
    };
  }

  // --- CHANNEL MESSAGES ---

  @override
  FutureEither<MessageEntity> sendMessage({
    required String serverId,
    required String channelId,
    required String content,
  }) async {
    try {
      final model = await _remoteDatasource.sendMessage(
        serverId: serverId,
        channelId: channelId,
        content: content,
      );

      await ErrorHandler.handleSafely(
        () => _localDatasource.cacheMessage(model),
        'Cache sent message',
      );

      return Right(model.toEntity());
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  StreamEither<List<MessageEntity>> streamMessages({
    required String serverId,
    required String channelId,
  }) async* {
    // 1. Yield Cached Channel Messages
    try {
      final cached = await _localDatasource.getCachedChannelMessages(channelId);
      if (cached.isNotEmpty) {
        yield Right(cached.map((e) => e.toEntity()).toList());
      }
    } catch (e) {
      debugPrint('🔴 Error getting cached channel messages: $e');
    }

    // 2. Stream Remote Channel Messages
    try {
      final stream = _remoteDatasource.streamMessages(
        serverId: serverId,
        channelId: channelId,
      );

      await for (final messages in stream) {
        // Cache new messages
        await ErrorHandler.handleSafely(
          () => _localDatasource.cacheMessages(messages),
          'Cache stream messages',
        );
        yield Right(messages.map((e) => e.toEntity()).toList());
      }
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  // --- DIRECT MESSAGES (NEW) ---

  @override
  FutureEither<MessageEntity> sendDirectMessage({
    required String conversationId,
    required String content,
  }) async {
    try {
      // 1. Send to Remote (Firestore)
      final model = await _remoteDatasource.sendDirectMessage(
        conversationId: conversationId,
        content: content,
      );

      // 2. Cache Locally
      await ErrorHandler.handleSafely(
        () => _localDatasource.cacheMessage(model),
        'Cache sent DM',
      );

      return Right(model.toEntity());
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  StreamEither<List<MessageEntity>> streamDirectMessages({
    required String conversationId,
  }) async* {
    // 1. Yield Cached DMs
    try {
      final cached = await _localDatasource.getCachedDirectMessages(conversationId);
      if (cached.isNotEmpty) {
        yield Right(cached.map((e) => e.toEntity()).toList());
      }
    } catch (e) {
      debugPrint('🔴 Error getting cached DMs: $e');
    }

    // 2. Stream Remote DMs
    try {
      final stream = _remoteDatasource.streamDirectMessages(
        conversationId: conversationId,
      );

      await for (final messages in stream) {
        // Cache new messages
        await ErrorHandler.handleSafely(
          () => _localDatasource.cacheMessages(messages),
          'Cache stream DMs',
        );
        yield Right(messages.map((e) => e.toEntity()).toList());
      }
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }
}