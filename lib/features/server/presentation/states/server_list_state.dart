import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chat_app/features/server/domain/entities/server_entity.dart';

part 'server_list_state.freezed.dart';

@freezed
abstract class ServerListState with _$ServerListState {
  const factory ServerListState({
    @Default([]) List<ServerEntity> servers,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _ServerListState;
}