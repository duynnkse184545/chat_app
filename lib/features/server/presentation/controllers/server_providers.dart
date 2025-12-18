import 'package:chat_app/features/server/data/datasources/server_remote_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:chat_app/core/providers/firebase_providers.dart';
import 'package:chat_app/core/providers/shared_providers.dart';
import 'package:chat_app/features/server/data/datasources/server_local_datasource.dart';
import 'package:chat_app/features/server/data/repositories/server_repository_impl.dart';
import 'package:chat_app/features/server/domain/repository/server_repository.dart';
import 'package:chat_app/features/server/domain/usecases/create_server_usecase.dart';
import 'package:chat_app/features/server/domain/usecases/delete_server_usecase.dart';
import 'package:chat_app/features/server/domain/usecases/get_server_usecase.dart';
import 'package:chat_app/features/server/domain/usecases/get_user_servers_usecase.dart';
import 'package:chat_app/features/server/domain/usecases/update_server_usecase.dart';

part 'server_providers.g.dart';

@riverpod
ServerRemoteDatasource serverRemoteDatasource(Ref ref) {
  return ServerRemoteDatasourceImpl(
    firestore: ref.watch(firebaseFirestoreProvider),
    auth: ref.watch(firebaseAuthProvider),
  );
}

@riverpod
Future<ServerLocalDatasource> serverLocalDatasource(Ref ref) async {
  final pref = await ref.watch(sharedPreferencesProvider.future);
  return ServerLocalDatasourceImpl(sharedPreferences: pref);
}

@riverpod
Future<ServerRepository> serverRepository(Ref ref) async {
  final localDatasource = await ref.watch(serverLocalDatasourceProvider.future);
  return ServerRepositoryImpl(
    remoteDatasource: ref.watch(serverRemoteDatasourceProvider),
    localDatasource: localDatasource,
  );
}

@riverpod
Future<CreateServerUseCase> createServerUseCase(Ref ref) async {
  final repository = await ref.watch(serverRepositoryProvider.future);
  return CreateServerUseCase(repository);
}

@riverpod
Future<GetUserServersUseCase> getUserServersUseCase(Ref ref) async {
  final repository = await ref.watch(serverRepositoryProvider.future);
  return GetUserServersUseCase(repository);
}

@riverpod
Future<GetServerUseCase> getServerUseCase(Ref ref) async {
  final repository = await ref.watch(serverRepositoryProvider.future);
  return GetServerUseCase(repository);
}

@riverpod
Future<UpdateServerUseCase> updateServerUseCase(Ref ref) async {
  final repository = await ref.watch(serverRepositoryProvider.future);
  return UpdateServerUseCase(repository);
}

@riverpod
Future<DeleteServerUseCase> deleteServerUseCase(Ref ref) async {
  final repository = await ref.watch(serverRepositoryProvider.future);
  return DeleteServerUseCase(repository);
}
