import 'package:chat_app/core/error/failures.dart';
import 'package:chat_app/core/utils/error_handler.dart';
import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/friends/data/datasources/friend_local_datasource.dart';
import 'package:chat_app/features/friends/data/datasources/friend_remote_datasource.dart';
import 'package:chat_app/features/friends/domain/entities/conversation_entity.dart';
import 'package:chat_app/features/friends/domain/entities/friend_request_entity.dart';
import 'package:chat_app/features/friends/domain/entities/friendship_entity.dart';
import 'package:chat_app/features/friends/domain/repository/friend_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FriendRepositoryImpl implements FriendRepository {
  final FriendRemoteDatasource _remoteDatasource;
  final FriendLocalDatasource _localDatasource;

  FriendRepositoryImpl({
    required FriendRemoteDatasource remoteDatasource,
    required FriendLocalDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  Failure _convertFirebaseException(FirebaseException e) {
    debugPrint('🔴 Firebase Error (Friends): ${e.code} - ${e.message}');

    return switch (e.code) {
      'permission-denied' => const Failure.permissionFailure(
        'You do not have permission to perform this action.',
      ),
      'not-found' => const Failure.notFoundFailure('User or request not found.'),
      'unavailable' => const Failure.serverFailure(
        'Service temporarily unavailable. Please try again.',
      ),
      _ => Failure.serverFailure(e.message ?? 'An error occurred.'),
    };
  }

  @override
  FutureEither<FriendRequestEntity> sendFriendRequest({
    required String targetUsername,
  }) async {
    try {
      final model = await _remoteDatasource.sendFriendRequest(
        targetUsername: targetUsername,
      );
      return Right(model.toEntity());
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureVoid acceptFriendRequest({required String requestId}) async {
    try {
      await _remoteDatasource.acceptFriendRequest(requestId: requestId);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureVoid rejectFriendRequest({required String requestId}) async {
    try {
      await _remoteDatasource.rejectFriendRequest(requestId: requestId);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  StreamEither<List<FriendRequestEntity>> streamIncomingRequests() async* {
    try {
      final stream = _remoteDatasource.streamIncomingRequests();
      await for (final requests in stream) {
        yield Right(requests.map((e) => e.toEntity()).toList());
      }
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  StreamEither<List<FriendRequestEntity>> streamOutgoingRequests() async* {
    try {
      final stream = _remoteDatasource.streamOutgoingRequests();
      await for (final requests in stream) {
        yield Right(requests.map((e) => e.toEntity()).toList());
      }
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  StreamEither<List<FriendshipEntity>> streamFriends() async* {
    // Try to yield cached friends first
    try {
      final cached = await _localDatasource.getCachedFriends();
      if (cached.isNotEmpty) {
        yield Right(cached.map((e) => e.toEntity()).toList());
      }
    } catch (e) {
      debugPrint('🔴 Error getting cached friends: $e');
    }

    // Stream from remote
    try {
      final stream = _remoteDatasource.streamFriends();
      await for (final friends in stream) {
        // Cache friends
        await ErrorHandler.handleSafely(
              () => _localDatasource.cacheFriends(friends),
          'Cache friends',
        );
        yield Right(friends.map((e) => e.toEntity()).toList());
      }
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureVoid removeFriend({required String friendId}) async {
    try {
      await _remoteDatasource.removeFriend(friendId: friendId);
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  FutureEither<ConversationEntity> getOrCreateConversation({
    required String friendId,
  }) async {
    try {
      final model = await _remoteDatasource.getOrCreateConversation(
        friendId: friendId,
      );
      return Right(model.toEntity());
    } on FirebaseException catch (e) {
      return Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      return Left(ErrorHandler.convertException(e, stackTrace));
    }
  }

  @override
  StreamEither<List<ConversationEntity>> streamConversations() async* {
    try {
      final stream = _remoteDatasource.streamConversations();
      await for (final conversations in stream) {
        yield Right(conversations.map((e) => e.toEntity()).toList());
      }
    } on FirebaseException catch (e) {
      yield Left(_convertFirebaseException(e));
    } catch (e, stackTrace) {
      yield Left(ErrorHandler.convertException(e, stackTrace));
    }
  }
}