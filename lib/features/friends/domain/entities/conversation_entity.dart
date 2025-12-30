import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_entity.freezed.dart';

enum ConversationType {
  direct,
  group, // For future group DMs
}

@freezed
abstract class ConversationEntity with _$ConversationEntity {
  const factory ConversationEntity({
    required String conversationId,
    required ConversationType type,
    required List<String> participantIds,
    required Map<String, String> participantNames,
    String? lastMessage,
    DateTime? lastMessageAt,
    required DateTime createdAt,
  }) = _ConversationEntity;
}