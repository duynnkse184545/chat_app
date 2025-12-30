import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_entity.freezed.dart';

@freezed
abstract class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
    required String messageId,
    required String content,
    required String senderId,
    required String senderName,
    required String channelId,
    required DateTime createdAt,
    @Default(false) bool isDirectMessage,
  }) = _MessageEntity;
}