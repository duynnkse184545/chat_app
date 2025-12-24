import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_entity.freezed.dart';

@freezed
abstract class ChannelEntity with _$ChannelEntity {
  const factory ChannelEntity({
    required String id,
    required String name,
    required String description,
    required String serverId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChannelEntity;
}