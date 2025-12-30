import 'package:chat_app/core/providers/database_provider.dart';
import 'package:chat_app/core/providers/firebase_providers.dart';
import 'package:chat_app/features/friends/data/datasources/friend_local_datasource.dart';
import 'package:chat_app/features/friends/data/datasources/friend_remote_datasource.dart';
import 'package:chat_app/features/friends/data/repositories/friend_repository_impl.dart';
import 'package:chat_app/features/friends/domain/repository/friend_repository.dart';
import 'package:chat_app/features/friends/domain/usecases/accept_friend_request_usecase.dart';
import 'package:chat_app/features/friends/domain/usecases/get_or_create_conversation_usecase.dart';
import 'package:chat_app/features/friends/domain/usecases/reject_friend_request_usecase.dart';
import 'package:chat_app/features/friends/domain/usecases/remove_friend_request_usecase.dart';
import 'package:chat_app/features/friends/domain/usecases/send_friend_request_usecase.dart';
import 'package:chat_app/features/friends/domain/usecases/stream_conversations_usecase.dart';
import 'package:chat_app/features/friends/domain/usecases/stream_friend_requests_usecase.dart';
import 'package:chat_app/features/friends/domain/usecases/stream_friends_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'friend_providers.g.dart';

// ============================================================================
// DATA SOURCES
// ============================================================================

@riverpod
FriendRemoteDatasource friendRemoteDatasource(Ref ref) {
  return FriendRemoteDatasourceImpl(
    firestore: ref.watch(firebaseFirestoreProvider),
    auth: ref.watch(firebaseAuthProvider),
  );
}

@riverpod
FriendLocalDatasource friendLocalDatasource(Ref ref) {
  return FriendLocalDatasourceImpl(
    friendDao: ref.watch(friendDaoProvider),
    conversationDao: ref.watch(conversationDaoProvider),
  );
}

// ============================================================================
// REPOSITORY
// ============================================================================

@riverpod
FriendRepository friendRepository(Ref ref) {
  return FriendRepositoryImpl(
    remoteDatasource: ref.watch(friendRemoteDatasourceProvider),
    localDatasource: ref.watch(friendLocalDatasourceProvider),
  );
}

// ============================================================================
// USE CASES
// ============================================================================

@riverpod
SendFriendRequestUseCase sendFriendRequestUseCase(Ref ref) {
  return SendFriendRequestUseCase(ref.watch(friendRepositoryProvider));
}

@riverpod
AcceptFriendRequestUseCase acceptFriendRequestUseCase(Ref ref) {
  return AcceptFriendRequestUseCase(ref.watch(friendRepositoryProvider));
}

@riverpod
RejectFriendRequestUseCase rejectFriendRequestUseCase(Ref ref) {
  return RejectFriendRequestUseCase(ref.watch(friendRepositoryProvider));
}

@riverpod
StreamFriendsUseCase streamFriendsUseCase(Ref ref) {
  return StreamFriendsUseCase(ref.watch(friendRepositoryProvider));
}

@riverpod
StreamFriendRequestsUseCase streamFriendRequestsUseCase(Ref ref) {
  return StreamFriendRequestsUseCase(ref.watch(friendRepositoryProvider));
}

@riverpod
RemoveFriendUseCase removeFriendUseCase(Ref ref) {
  return RemoveFriendUseCase(ref.watch(friendRepositoryProvider));
}

@riverpod
GetOrCreateConversationUseCase getOrCreateConversationUseCase(Ref ref) {
  return GetOrCreateConversationUseCase(ref.watch(friendRepositoryProvider));
}

@riverpod
StreamConversationsUseCase streamConversationsUseCase(Ref ref) {
  return StreamConversationsUseCase(ref.watch(friendRepositoryProvider));
}