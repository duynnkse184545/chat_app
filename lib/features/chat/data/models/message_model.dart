import 'package:chat_app/core/utils/enums.dart';
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
    // Dm and channel, determind by isDirectMessage
    required String channelId,
    @TimestampConverter() required DateTime createdAt,
    @Default(false) bool isDirectMessage,
    @Default(MessageStatus.sent) MessageStatus status,
    String? errorMessage,
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

  factory MessageModel.fromEntity(MessageEntity entity) {
    return MessageModel(
      messageId: entity.messageId,
      content: entity.content,
      senderId: entity.senderId,
      senderName: entity.senderName,
      createdAt: entity.createdAt,
      channelId: entity.channelId,
      isDirectMessage: entity.isDirectMessage,
      status: entity.status,
      errorMessage: entity.errorMessage,
    );
  }

  MessageEntity toEntity() {
    return MessageEntity(
      messageId: messageId,
      content: content,
      senderId: senderId,
      senderName: senderName,
      channelId: channelId,
      createdAt: createdAt,
      isDirectMessage: isDirectMessage,
      status: status,
      errorMessage: errorMessage,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'content': content,
      'senderId': senderId,
      'senderName': senderName,
      'channelId': channelId,
      'createdAt': Timestamp.fromDate(createdAt),
      'isDirectMessage': isDirectMessage,
      'status': status.name,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}