import 'package:chat_app/core/utils/json_converters.dart';
import 'package:chat_app/features/friends/domain/entities/conversation_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
abstract class ConversationModel with _$ConversationModel {
  const ConversationModel._();

  const factory ConversationModel({
    required String conversationId,
    required String type,
    required List<String> participantIds,
    required Map<String, String> participantNames,
    String? lastMessage,
    @TimestampConverter() DateTime? lastMessageAt,
    @TimestampConverter() required DateTime createdAt,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  factory ConversationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ConversationModel.fromJson({
      'conversationId': doc.id,
      ...data,
    });
  }

  Map<String, dynamic> toFirestore() {
    return {
      'type': type,
      'participantIds': participantIds,
      'participantNames': participantNames,
      'lastMessage': lastMessage,
      'lastMessageAt': lastMessageAt != null ? Timestamp.fromDate(lastMessageAt!) : null,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  ConversationEntity toEntity() {
    return ConversationEntity(
      conversationId: conversationId,
      type: _parseType(type),
      participantIds: participantIds,
      participantNames: participantNames,
      lastMessage: lastMessage,
      lastMessageAt: lastMessageAt,
      createdAt: createdAt,
    );
  }

  ConversationType _parseType(String type) {
    return ConversationType.values.firstWhere(
          (e) => e.name == type,
      orElse: () => ConversationType.direct,
    );
  }
}