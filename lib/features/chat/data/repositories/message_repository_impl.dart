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
        'You do not have permission to send messages in this channel.',
      ),
      'not-found' => const Failure.notFoundFailure('Channel not found.'),
      'unavailable' => const Failure.serverFailure(
        'Chat service temporarily unavailable. Please try again.',
      ),
      _ => Failure.serverFailure(e.message ?? 'Failed to send message.'),
    };
  }

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

      // Cache the sent message (fire-and-forget)
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
    try {
      final cached = await _localDatasource.getCachedMessages(channelId);

      if (cached.isNotEmpty) {
        yield Right(cached.map((e) => e.toEntity()).toList());
      }
    } catch (e) {
      debugPrint('🔴 Error getting cached messages: $e');
    }

    try{
      final stream = _remoteDatasource.streamMessages(
        serverId: serverId,
        channelId: channelId,
      );

      await for(final messages in stream){
        _localDatasource.cacheMessages(messages);
        yield Right(messages.map((e) => e.toEntity()).toList());
      }
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }
}
