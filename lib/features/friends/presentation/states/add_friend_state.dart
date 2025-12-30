import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_friend_state.freezed.dart';

@freezed
abstract class AddFriendState with _$AddFriendState {
  const factory AddFriendState({
    @Default(false) bool isSending,
    @Default(false) bool isSuccess,
    String? error,
  }) = _AddFriendState;
}