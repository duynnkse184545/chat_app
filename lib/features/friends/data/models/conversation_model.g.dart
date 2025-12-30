// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    _ConversationModel(
      conversationId: json['conversationId'] as String,
      type: json['type'] as String,
      participantIds: (json['participantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      participantNames: Map<String, String>.from(
        json['participantNames'] as Map,
      ),
      lastMessage: json['lastMessage'] as String?,
      lastMessageAt: const TimestampConverter().fromJson(json['lastMessageAt']),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$ConversationModelToJson(_ConversationModel instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'type': instance.type,
      'participantIds': instance.participantIds,
      'participantNames': instance.participantNames,
      'lastMessage': instance.lastMessage,
      'lastMessageAt': _$JsonConverterToJson<dynamic, DateTime>(
        instance.lastMessageAt,
        const TimestampConverter().toJson,
      ),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
