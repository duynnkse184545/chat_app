import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chat_app/core/utils/json_converters.dart';
import 'package:chat_app/features/server/domain/entities/server_entity.dart';

part 'server_model.freezed.dart';
part 'server_model.g.dart';

@freezed
abstract class ServerModel with _$ServerModel {
  const ServerModel._();

  const factory ServerModel({
    required String serverId,
    required String name,
    required String description,
    String? iconUrl,
    required String ownerId,
    required List<String> memberIds,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _ServerModel;

  // Convert from JSON
  factory ServerModel.fromJson(Map<String, dynamic> json) =>
      _$ServerModelFromJson(json);

  // Convert from Firestore DocumentSnapshot
  factory ServerModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ServerModel.fromJson({
      'serverId': doc.id,
      ...data,
    });
  }

  // Convert to Entity
  ServerEntity toEntity() {
    return ServerEntity(
      serverId: serverId,
      name: name,
      description: description,
      iconUrl: iconUrl,
      ownerId: ownerId,
      memberIds: memberIds,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  // Convert to Firestore Map (for creating/updating)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'iconUrl': iconUrl,
      'ownerId': ownerId,
      'memberIds': memberIds,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}