import 'package:chat_app/core/database/drift_db.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:drift/drift.dart';

// Model -> Companion (Writing to DB)
extension MessageModelExtension on MessageModel {
  MessagesCompanion toCompanion() {
    return MessagesCompanion.insert(
      messageId: messageId,
      content: content,
      senderId: senderId,
      senderName: senderName,
      channelId: channelId,
      createdAt: createdAt,
      isDirectMessage: Value(isDirectMessage),
    );
  }
}

// Row -> Model (Reading from DB)
extension MessageRowExtension on Message {
  MessageModel toModel() {
    return MessageModel(
      messageId: messageId,
      content: content,
      senderId: senderId,
      senderName: senderName,
      channelId: channelId,
      createdAt: createdAt,
      isDirectMessage: isDirectMessage,
    );
  }
}