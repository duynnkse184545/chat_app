import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_channel_state.freezed.dart';

@freezed
abstract class CreateChannelState with _$CreateChannelState {
  const factory CreateChannelState({
    @Default('') String name,
    @Default('') String description,
    @Default(false) bool isLoading,
    String? nameError,
    String? descriptionError,
    String? generalError,
  }) = _CreateChannelState;
}