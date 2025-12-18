import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_server_state.freezed.dart';

@freezed
abstract class CreateServerState with _$CreateServerState {
  const factory CreateServerState({
    @Default('') String name,
    @Default('') String description,
    @Default(false) bool isLoading,
    String? nameError,
    String? descriptionError,
    String? generalError,
  }) = _CreateServerState;
}
