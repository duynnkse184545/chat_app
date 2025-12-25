import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<MessageEntity> messages,
    @Default(false) bool isSending,
    String? errorMessage,
  }) = _ChatState;
}