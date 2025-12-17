// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerModel _$ServerModelFromJson(Map<String, dynamic> json) => _ServerModel(
  serverId: json['serverId'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  iconUrl: json['iconUrl'] as String?,
  ownerId: json['ownerId'] as String,
  memberIds: (json['memberIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
);

Map<String, dynamic> _$ServerModelToJson(_ServerModel instance) =>
    <String, dynamic>{
      'serverId': instance.serverId,
      'name': instance.name,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'ownerId': instance.ownerId,
      'memberIds': instance.memberIds,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
