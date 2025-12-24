import 'package:chat_app/core/providers/firebase_providers.dart';
import 'package:chat_app/core/providers/shared_providers.dart';
import 'package:chat_app/features/channel/data/datasources/channel_local_datasource.dart';
import 'package:chat_app/features/channel/data/datasources/channel_remote_datasource.dart';
import 'package:chat_app/features/channel/data/repositories/channel_repository_impl.dart';
import 'package:chat_app/features/channel/domain/repository/channel_repository.dart';
import 'package:chat_app/features/channel/domain/usecases/create_channel_usecase.dart';
import 'package:chat_app/features/channel/domain/usecases/delete_channel_usecase.dart';
import 'package:chat_app/features/channel/domain/usecases/get_channel_usecase.dart';
import 'package:chat_app/features/channel/domain/usecases/get_server_channels_usecase.dart';
import 'package:chat_app/features/channel/domain/usecases/update_channel_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_providers.g.dart';

@riverpod
ChannelRemoteDataSource channelRemoteDataSource(Ref ref){
  return ChannelRemoteDataSourceImpl(firestore: ref.watch(firebaseFirestoreProvider));
}

@riverpod
Future<ChannelLocalDatasource> channelLocalDatasource(Ref ref) async {
  final pref = await ref.watch(sharedPreferencesProvider.future);
  return ChannelLocalDatasourceImpl(prefs: pref);
}

@riverpod
Future<ChannelRepository> channelRepository(Ref ref) async {
  final localDatasource = await ref.watch(channelLocalDatasourceProvider.future);
  return ChannelRepositoryImpl(
    remoteDatasource: ref.watch(channelRemoteDataSourceProvider),
    localDatasource: localDatasource,
  );
}

@riverpod
Future<CreateChannelUseCase> createChannelUseCase(Ref ref) async {
  final repository = await ref.watch(channelRepositoryProvider.future);
  return CreateChannelUseCase(repository);
}

@riverpod
Future<GetServerChannelsUseCase> getServerChannelsUseCase(Ref ref) async {
  final repository = await ref.watch(channelRepositoryProvider.future);
  return GetServerChannelsUseCase(repository);
}

@riverpod
Future<GetChannelUseCase> getChannelUseCase(Ref ref) async {
  final repository = await ref.watch(channelRepositoryProvider.future);
  return GetChannelUseCase(repository);
}

@riverpod
Future<UpdateChannelUseCase> updateChannelUseCase(Ref ref) async {
  final repository = await ref.watch(channelRepositoryProvider.future);
  return UpdateChannelUseCase(repository);
}

@riverpod
Future<DeleteChannelUseCase> deleteChannelUseCase(Ref ref) async {
  final repository = await ref.watch(channelRepositoryProvider.future);
  return DeleteChannelUseCase(repository);
}
