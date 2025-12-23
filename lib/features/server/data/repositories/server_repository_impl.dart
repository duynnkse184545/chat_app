import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/utils/error_handler.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/server/data/datasources/server_local_datasource.dart';
import 'package:chat_app/features/server/data/datasources/server_remote_datasource.dart';
import 'package:chat_app/features/server/domain/entities/server_entity.dart';
import 'package:chat_app/features/server/domain/repository/server_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseException;
import 'package:flutter/foundation.dart';

class ServerRepositoryImpl implements ServerRepository {
  final ServerRemoteDatasource _remoteDatasource;
  final ServerLocalDatasource _localDatasource;

  ServerRepositoryImpl({
    required ServerRemoteDatasource remoteDatasource,
    required ServerLocalDatasource localDatasource,
  }) : _remoteDatasource = remoteDatasource,
       _localDatasource = localDatasource;

  /// Converts Firebase exceptions to server-specific failures.
  Failure _convertFirebaseException(FirebaseException e) {
    debugPrint('🔴 Firebase Error (Server): ${e.code} - ${e.message}');

    return switch (e.code) {
      'permission-denied' => const Failure.permissionFailure(
        'You do not have permission to perform this action.',
      ),
      'not-found' => const Failure.notFoundFailure('Server not found.'),
      'already-exists' => const Failure.serverFailure(
        'Server with this name already exists.',
      ),
      'unavailable' => const Failure.serverFailure(
        'Service temporarily unavailable. Please try again.',
      ),
      'unauthenticated' => const Failure.authFailure(
        'Please sign in to access servers.',
      ),
      'resource-exhausted' => const Failure.serverFailure(
        'Too many servers. Please delete some before creating new ones.',
      ),
      _ => Failure.serverFailure(e.message ?? 'Server operation failed.'),
    };
  }

  @override
  FutureEither<ServerEntity> createServer({
    required String name,
    required String description,
    String? iconUrl,
  }) async {
    try {
      final serverModel = await _remoteDatasource.createServer(
        name: name,
        description: description,
        iconUrl: iconUrl,
      );

      await ErrorHandler.handleSafely(
        () => _localDatasource.cacheServer(serverModel),
        'Cache new server',
      );

      await ErrorHandler.handleSafely(() async {
        final currentServers = await _localDatasource.getCachedServers();
        if (!currentServers.any((s) => s.serverId == serverModel.serverId)) {
          final updatedServers = [...currentServers, serverModel];
          await _localDatasource.cacheServers(updatedServers);
        }
      }, 'Update server list cache');

      return Right(serverModel.toEntity());
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  StreamEither<List<ServerEntity>> getUserServers() async* {
    // 1. Emit Cache First
    try {
      final cachedServers = await _localDatasource.getCachedServers();
      if (cachedServers.isNotEmpty) {
        debugPrint('✅ Yielding Cached Servers: ${cachedServers.length}');
        yield Right(cachedServers.map((model) => model.toEntity()).toList());
      }
    } catch (e) {
      debugPrint('⚠️ Cache read failed: $e');
    }

    // 2. Fetch Network, Cache, and Emit
    try {
      final serverModels = await _remoteDatasource.getUserServers();

      await ErrorHandler.handleSafely(
        () => _localDatasource.cacheServers(serverModels),
        'Cache user servers',
      );

      debugPrint('✅ Yielding Fresh Servers: ${serverModels.length}');
      yield Right(serverModels.map((model) => model.toEntity()).toList());
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  StreamEither<ServerEntity> getServer(String serverId) async* {
    // 1. Emit Cache First
    try {
      final cachedServer = await _localDatasource.getCachedServer(serverId);
      if (cachedServer != null) {
        yield Right(cachedServer.toEntity());
      }
    } catch (e) {
      debugPrint('⚠️ Cache read failed: $e');
    }

    // 2. Fetch Network, Cache, and Emit
    try {
      final serverModel = await _remoteDatasource.getServer(serverId);

      await ErrorHandler.handleSafely(
        () => _localDatasource.cacheServer(serverModel),
        'Cache server',
      );

      yield Right(serverModel.toEntity());
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureVoid updateServer({
    required String serverId,
    String? name,
    String? description,
    String? iconUrl,
  }) async {
    try {
      await _remoteDatasource.updateServer(
        serverId: serverId,
        name: name,
        description: description,
        iconUrl: iconUrl,
      );

      await ErrorHandler.handleSafely(() async {
        final currentServers = await _localDatasource.getCachedServers();
        final index = currentServers.indexWhere((s) => s.serverId == serverId);

        if (index != -1) {
          final oldServer = currentServers[index];
          final updatedServer = oldServer.copyWith(
            name: name ?? oldServer.name,
            description: description ?? oldServer.description,
            iconUrl: iconUrl ?? oldServer.iconUrl,
          );
          
          final updatedList = List.of(currentServers);
          updatedList[index] = updatedServer;
          
          await _localDatasource.cacheServers(updatedList);
          await _localDatasource.cacheServer(updatedServer);
        }
      }, 'Update server cache');

      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureVoid deleteServer(String serverId) async {
    try {
      await _remoteDatasource.deleteServer(serverId);

      await ErrorHandler.handleSafely(() async {
        final servers = await _localDatasource.getCachedServers();
        final updatedServers = servers
            .where((server) => server.serverId != serverId)
            .toList();
        await _localDatasource.cacheServers(updatedServers);
      }, 'Remove deleted server from cache');

      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureEither<void> addMember({
    required String serverId,
    required String userId,
  }) async {
    try {
      await _remoteDatasource.addMember(serverId: serverId, userId: userId);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureEither<void> removeMember({
    required String serverId,
    required String userId,
  }) async {
    try {
      await _remoteDatasource.removeMember(serverId: serverId, userId: userId);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }
}
