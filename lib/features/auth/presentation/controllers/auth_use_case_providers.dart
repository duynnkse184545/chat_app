import 'package:chat_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:chat_app/features/auth/presentation/controllers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:chat_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_use_case_providers.g.dart';

@riverpod
Future<SignInUseCase> signInUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return SignInUseCase(repository);
}

@riverpod
Future<SignUpUseCase> signUpUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return SignUpUseCase(repository);
}

@riverpod
Future<SignOutUseCase> signOutUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return SignOutUseCase(repository);
}

@riverpod
Future<GetCurrentUserUseCase> getCurrentUserUseCase(Ref ref) async {
  final repository = await ref.watch(authRepositoryProvider.future);
  return GetCurrentUserUseCase(repository);
}


