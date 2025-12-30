// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendshipModel _$FriendshipModelFromJson(Map<String, dynamic> json) =>
    _FriendshipModel(
      userId: json['userId'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      bio: json['bio'] as String?,
      friendsSince: const TimestampConverter().fromJson(json['friendsSince']),
    );

Map<String, dynamic> _$FriendshipModelToJson(_FriendshipModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'friendsSince': const TimestampConverter().toJson(instance.friendsSince),
    };
