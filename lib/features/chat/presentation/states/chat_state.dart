import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

enum ChatType {
  channel,        // Server channel chat
  directMessage,  // Direct message chat
}

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<MessageEntity> messages,
    @Default(false) bool isSending,
    @Default(ChatType.channel) ChatType chatType,
    String? errorMessage,
    String? conversationId,
    String? displayName, // Channel name or friend name
  }) = _ChatState;
}