import 'package:chat_app/core/utils/json_converters.dart';
import 'package:chat_app/features/channel/domain/entities/channel_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_model.freezed.dart';
part 'channel_model.g.dart';

@freezed
abstract class ChannelModel with _$ChannelModel {
  const ChannelModel._();

  const factory ChannelModel({
    required String id,
    required String name,
    required String description,
    required String serverId,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _ChannelModel;

  factory ChannelModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelModelFromJson(json);

  factory ChannelModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ChannelModel.fromJson({
      'id': doc.id,
      ...data,
    });
  }

  ChannelEntity toEntity() {
    return ChannelEntity(
      id: id,
      name: name,
      description: description,
      serverId: serverId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'serverId': serverId,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}