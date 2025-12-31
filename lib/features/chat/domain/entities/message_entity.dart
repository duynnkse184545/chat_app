import 'package:chat_app/core/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_entity.freezed.dart';

@freezed
abstract class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
    required String messageId,
    required String content,
    required String senderId,
    required String senderName,
    // Dm and channel, determined by isDirectMessage
    required String channelId,
    required DateTime createdAt,
    @Default(false) bool isDirectMessage,
    @Default(MessageStatus.sent) MessageStatus status,
    String? errorMessage,
  }) = _MessageEntity;
}