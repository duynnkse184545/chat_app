// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      messageId: json['messageId'] as String,
      content: json['content'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      channelId: json['channelId'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      isDirectMessage: json['isDirectMessage'] as bool? ?? false,
      status:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sent,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'content': instance.content,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'channelId': instance.channelId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'isDirectMessage': instance.isDirectMessage,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'errorMessage': instance.errorMessage,
    };

const _$MessageStatusEnumMap = {
  MessageStatus.sending: 'sending',
  MessageStatus.sent: 'sent',
  MessageStatus.failed: 'failed',
};
