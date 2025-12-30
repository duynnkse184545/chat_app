// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendRequestModel _$FriendRequestModelFromJson(Map<String, dynamic> json) =>
    _FriendRequestModel(
      requestId: json['requestId'] as String,
      fromUserId: json['fromUserId'] as String,
      fromUsername: json['fromUsername'] as String,
      toUserId: json['toUserId'] as String,
      toUsername: json['toUsername'] as String,
      status: json['status'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      respondedAt: const TimestampConverter().fromJson(json['respondedAt']),
    );

Map<String, dynamic> _$FriendRequestModelToJson(_FriendRequestModel instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'fromUserId': instance.fromUserId,
      'fromUsername': instance.fromUsername,
      'toUserId': instance.toUserId,
      'toUsername': instance.toUsername,
      'status': instance.status,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'respondedAt': _$JsonConverterToJson<dynamic, DateTime>(
        instance.respondedAt,
        const TimestampConverter().toJson,
      ),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
