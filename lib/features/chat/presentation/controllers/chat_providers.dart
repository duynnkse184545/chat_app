import 'package:chat_app/core/providers/database_provider.dart';
import 'package:chat_app/core/providers/firebase_providers.dart';
import 'package:chat_app/features/chat/data/datasources/message_local_datasource.dart';
import 'package:chat_app/features/chat/data/datasources/message_remote_datasource.dart';
import 'package:chat_app/features/chat/data/repositories/message_repository_impl.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';
import 'package:chat_app/features/chat/domain/usecases/save_optimistic_message_usecase.dart';
import 'package:chat_app/features/chat/domain/usecases/send_direct_message_usecase.dart';
import 'package:chat_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:chat_app/features/chat/domain/usecases/stream_direct_message_usecase.dart';
import 'package:chat_app/features/chat/domain/usecases/stream_message_usecase.dart';
import 'package:chat_app/features/chat/domain/usecases/update_message_status_usecase.dart';
import 'package:chat_app/features/chat/domain/usecases/watch_local_messages_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_providers.g.dart';

@riverpod
MessageRemoteDatasource messageRemoteDatasource(Ref ref) {
  return MessageRemoteDatasourceImpl(
    firestore: ref.watch(firebaseFirestoreProvider),
    auth: ref.watch(firebaseAuthProvider),
  );
}

@riverpod
MessageLocalDatasource messageLocalDatasource(Ref ref) {
  return MessageLocalDatasourceImpl(dao: ref.watch(messageDaoProvider));
}

@riverpod
MessageRepository messageRepository(Ref ref) {
  return MessageRepositoryImpl(
    remoteDatasource: ref.watch(messageRemoteDatasourceProvider),
    localDatasource: ref.watch(messageLocalDatasourceProvider),
  );
}

@riverpod
SendMessageUseCase sendMessageUseCase(Ref ref) {
  return SendMessageUseCase(ref.watch(messageRepositoryProvider));
}

@riverpod
StreamMessagesUseCase streamMessagesUseCase(Ref ref) {
  return StreamMessagesUseCase(ref.watch(messageRepositoryProvider));
}

@riverpod
SendDirectMessageUseCase sendDirectMessageUseCase(Ref ref) {
  return SendDirectMessageUseCase(ref.watch(messageRepositoryProvider));
}

@riverpod
StreamDirectMessageUseCase streamDirectMessageUseCase(Ref ref) {
  return StreamDirectMessageUseCase(ref.watch(messageRepositoryProvider));
}

@riverpod
WatchLocalMessagesUseCase watchLocalMessagesUseCase(Ref ref) {
  return WatchLocalMessagesUseCase(ref.watch(messageRepositoryProvider));
}

@riverpod
SaveOptimisticMessageUseCase saveOptimisticMessageUseCase(Ref ref) {
  return SaveOptimisticMessageUseCase(ref.watch(messageRepositoryProvider));
}

@riverpod
UpdateMessageStatusUseCase updateMessageStatusUseCase(Ref ref) {
  return UpdateMessageStatusUseCase(ref.watch(messageRepositoryProvider));
}