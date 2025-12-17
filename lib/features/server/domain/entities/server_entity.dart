import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_entity.freezed.dart';

@freezed
abstract class ServerEntity with _$ServerEntity {
  const factory ServerEntity({
    required String serverId,
    required String name,
    required String description,
    String? iconUrl,
    required String ownerId,
    required List<String> memberIds,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ServerEntity;
}