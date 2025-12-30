import 'package:chat_app/core/database/drift_db.dart';
import 'package:chat_app/features/friends/data/models/conversation_model.dart';
import 'package:drift/drift.dart';

// Model -> Companion (Writing to DB)
extension ConversationModelDriftExtension on ConversationModel {
  ConversationsCompanion toCompanion() {
    return ConversationsCompanion.insert(
      conversationId: conversationId,
      type: type,
      participantIds: participantIds,
      participantNames: participantNames,
      lastMessage: Value(lastMessage),
      lastMessageAt: Value(lastMessageAt),
      createdAt: createdAt,
      cachedAt: DateTime.now(),
    );
  }
}

// Row -> Model (Reading from DB)
extension ConversationRowExtension on Conversation {
  ConversationModel toModel() {
    return ConversationModel(
      conversationId: conversationId,
      type: type,
      participantIds: participantIds,
      participantNames: participantNames,
      lastMessage: lastMessage,
      lastMessageAt: lastMessageAt,
      createdAt: createdAt,
    );
  }
}