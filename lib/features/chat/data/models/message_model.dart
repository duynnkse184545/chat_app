import 'package:chat_app/core/utils/json_converters.dart';
import 'package:chat_app/features/chat/domain/entities/message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const MessageModel._();

  const factory MessageModel({
    required String messageId,
    required String content,
    required String senderId,
    required String senderName,
    required String channelId,
    @TimestampConverter() required DateTime createdAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  factory MessageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageModel.fromJson({
      'messageId': doc.id,
      ...data,
    });
  }

  MessageEntity toEntity() {
    return MessageEntity(
      messageId: messageId,
      content: content,
      senderId: senderId,
      senderName: senderName,
      channelId: channelId,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'content': content,
      'senderId': senderId,
      'senderName': senderName,
      'channelId': channelId,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}