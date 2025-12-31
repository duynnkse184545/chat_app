import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_params.freezed.dart';

@freezed
sealed class ChatParams with _$ChatParams {
  const factory ChatParams.channel({
    required String serverId,
    required String channelId,
    required String channelName,
  }) = ChannelChatParams;

  const factory ChatParams.directMessage({
    required String friendId,
    required String friendName,
  }) = DirectMessageChatParams;
}