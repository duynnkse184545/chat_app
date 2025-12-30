import 'package:chat_app/core/database/drift_db.dart';
import 'package:chat_app/features/friends/data/models/conversation_model_extensions.dart';
import 'package:chat_app/features/friends/data/models/conversation_model.dart';
import 'package:drift/drift.dart';

part 'conversation_dao.g.dart';

@DriftAccessor(tables: [Conversations])
class ConversationDao extends DatabaseAccessor<AppDb> with _$ConversationDaoMixin {
  ConversationDao(super.attachedDatabase);

  // Get all cached conversations
  Future<List<ConversationModel>> getCachedConversations() async {
    final query = select(conversations)
      ..orderBy([(tbl) => OrderingTerm(
        expression: tbl.lastMessageAt,
        mode: OrderingMode.desc,
      )]);

    final rows = await query.get();
    return rows.map((row) => row.toModel()).toList();
  }

  // Watch conversations (real-time)
  Stream<List<ConversationModel>> watchConversations() {
    final query = select(conversations)
      ..orderBy([(tbl) => OrderingTerm(
        expression: tbl.lastMessageAt,
        mode: OrderingMode.desc,
      )]);

    return query.watch().map((rows) => rows.map((row) => row.toModel()).toList());
  }

  // Get single conversation
  Future<ConversationModel?> getConversation(String conversationId) async {
    final query = select(conversations)
      ..where((tbl) => tbl.conversationId.equals(conversationId));

    final row = await query.getSingleOrNull();
    return row?.toModel();
  }

  // Cache single conversation
  Future<void> cacheConversation(ConversationModel conversation) async {
    await into(conversations).insertOnConflictUpdate(conversation.toCompanion());
  }

  // Cache multiple conversations
  Future<void> cacheConversations(List<ConversationModel> conversationList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        conversations,
        conversationList.map((conv) => conv.toCompanion()),
      );
    });
  }

  // Update last message
  Future<void> updateLastMessage(
      String conversationId,
      String lastMessage,
      DateTime lastMessageAt,
      ) async {
    await (update(conversations)
      ..where((tbl) => tbl.conversationId.equals(conversationId)))
        .write(ConversationsCompanion(
      lastMessage: Value(lastMessage),
      lastMessageAt: Value(lastMessageAt),
    ));
  }

  // Delete conversation
  Future<void> deleteConversation(String conversationId) async {
    await (delete(conversations)
      ..where((tbl) => tbl.conversationId.equals(conversationId))).go();
  }

  // Clear all conversations
  Future<void> clearAllConversations() async {
    await delete(conversations).go();
  }
}