import 'package:chat_app/features/friends/domain/entities/conversation_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversations_state.freezed.dart';

@freezed
abstract class ConversationsState with _$ConversationsState {
  const factory ConversationsState({
    @Default([]) List<ConversationEntity> conversations,
  }) = _ConversationsState;
}