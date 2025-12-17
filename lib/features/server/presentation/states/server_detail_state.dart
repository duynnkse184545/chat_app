import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/server_entity.dart';

part 'server_detail_state.freezed.dart';

@freezed
abstract class ServerDetailState with _$ServerDetailState {
  const factory ServerDetailState({
    ServerEntity? server,
    @Default(false) bool isLoading,
    @Default(false) bool isDeleting,
    String? errorMessage,
  }) = _ServerDetailState;
}