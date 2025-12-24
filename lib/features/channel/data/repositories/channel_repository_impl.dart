import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/utils/error_handler.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/channel/data/datasources/channel_local_datasource.dart';
import 'package:chat_app/features/channel/data/datasources/channel_remote_datasource.dart';
import 'package:chat_app/features/channel/domain/entities/channel_entity.dart';
import 'package:chat_app/features/channel/domain/repository/channel_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ChannelRepositoryImpl implements ChannelRepository {
  final ChannelRemoteDataSource _remoteDatasource;
  final ChannelLocalDatasource _localDatasource;

  ChannelRepositoryImpl({
    required ChannelRemoteDataSource remoteDatasource,
    required ChannelLocalDatasource localDatasource,
  }) : _remoteDatasource = remoteDatasource,
       _localDatasource = localDatasource;

  Failure _convertFirebaseException(FirebaseException e) {
    debugPrint('🔴 Firebase Error (Channel): ${e.code} - ${e.message}');

    return switch (e.code) {
      'permission-denied' => const Failure.permissionFailure(
        'You do not have permission to manage channels.',
      ),
      'not-found' => const Failure.notFoundFailure('Channel not found.'),
      'already-exists' => const Failure.serverFailure(
        'Channel with this name already exists.',
      ),
      'unavailable' => const Failure.serverFailure(
        'Service temporarily unavailable. Please try again.',
      ),
      _ => Failure.serverFailure(e.message ?? 'Channel operation failed.'),
    };
  }

  @override
  FutureEither<ChannelEntity> createChannel({
    required String serverId,
    required String name,
    required String description,
  }) async {
    try {
      final model = await _remoteDatasource.createChannel(
        serverId: serverId,
        name: name,
        description: description,
      );

      // Cache new channel (fire-and-forget)
      await ErrorHandler.handleSafely(
        () => _localDatasource.cacheChannel(model),
        'Cache new channel',
      );

      return Right(model.toEntity());
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  StreamEither<List<ChannelEntity>> getServerChannels(String serverId) async* {
    // Try cache first
    try {
      final cachedChannels = await _localDatasource.getCachedChannels(serverId);
      if (cachedChannels.isNotEmpty) {
        debugPrint('✅ Loaded ${cachedChannels.length} channels from cache');
        yield Right(cachedChannels.map((c) => c.toEntity()).toList());
      }
    } catch (e) {
      debugPrint('⚠️ Cache read failed: $e');
    }

    // Fetch from network
    try {
      final models = await _remoteDatasource.getServerChannels(serverId);

      // Cache them (fire-and-forget)
      await ErrorHandler.handleSafely(
        () => _localDatasource.cacheChannels(serverId, models),
        'Cache server channels',
      );

      yield Right(models.map((m) => m.toEntity()).toList());
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  StreamEither<ChannelEntity> getChannel({
    required String serverId,
    required String channelId,
  }) async* {
    // Try cache first
    try {
      final cachedChannel = await _localDatasource.getCachedChannel(channelId);
      if (cachedChannel != null) {
        yield Right(cachedChannel.toEntity());
      }
    } catch (e) {
      debugPrint('⚠️ Cache read failed: $e');
    }

    // Fetch from network
    try {
      final model = await _remoteDatasource.getChannel(
        serverId: serverId,
        channelId: channelId,
      );

      // Cache it (fire-and-forget)
      await ErrorHandler.handleSafely(
        () => _localDatasource.cacheChannel(model),
        'Cache channel',
      );

      yield Right(model.toEntity());
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureVoid updateChannel({
    required String serverId,
    required String channelId,
    String? name,
    String? description,
  }) async {
    try {
      await _remoteDatasource.updateChannel(
        serverId: serverId,
        channelId: channelId,
        name: name,
        description: description,
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureVoid deleteChannel({
    required String serverId,
    required String channelId,
  }) async {
    try {
      await _remoteDatasource.deleteChannel(
        serverId: serverId,
        channelId: channelId,
      );

      // Remove from cache (fire-and-forget)
      await ErrorHandler.handleSafely(() async {
        final channels = await _localDatasource.getCachedChannels(serverId);
        final updated = channels.where((c) => c.id != channelId).toList();
        await _localDatasource.cacheChannels(serverId, updated);
      }, 'Remove deleted channel from cache');
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }
}
