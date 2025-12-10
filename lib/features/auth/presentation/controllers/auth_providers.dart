import 'package:chat_app/core/providers/firebase_providers.dart';
import 'package:chat_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:chat_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:chat_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repository/auth_repository.dart';

part 'auth_providers.g.dart';

@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return await SharedPreferences.getInstance();
}

@riverpod
AuthRemoteDatasource authRemoteDatasource(Ref ref) {
  return AuthRemoteDatasourceImpl(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseFirestore: ref.watch(firebaseFirestoreProvider),
  );
}

@riverpod
Future<AuthLocalDatasource> authLocalDatasource(Ref ref) async {
  final pref = await ref.watch(sharedPreferencesProvider.future);
  return AuthLocalDatasourceImpl(sharedPreferences: pref);
}

@riverpod
Future<AuthRepository> authRepository(Ref ref) async {
  final localDatasource = await ref.watch(authLocalDatasourceProvider.future);
  return AuthRepositoryImpl(
    remoteDatasource: ref.watch(authRemoteDatasourceProvider),
    localDatasource: localDatasource,
  );
}

@riverpod
Stream<UserEntity?> authStateChanges(Ref ref) {
  return ref.watch(authRepositoryProvider).when(
    data: (repository) => repository.authStateChanges(),
    loading: () => Stream.value(null),
    error: (_, __) => Stream.value(null),
  );
}

@riverpod
UserEntity? currentUser(Ref ref){
  return ref.watch(authStateChangesProvider).value;
}
