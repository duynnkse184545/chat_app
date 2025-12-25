import 'package:chat_app/core/providers/firebase_providers.dart';
import 'package:chat_app/features/chat/data/datasources/message_local_datasource.dart';
import 'package:chat_app/features/chat/data/datasources/message_remote_datasource.dart';
import 'package:chat_app/features/chat/data/repositories/message_repository_impl.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';
import 'package:chat_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:chat_app/features/chat/domain/usecases/stream_message_usecase.dart';
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
  return MessageLocalDatasourceImpl(db: ref.watch(appDbProvider));
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
