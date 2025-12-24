import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/channel/domain/repository/channel_repository.dart';

class DeleteChannelUseCase {
  final ChannelRepository _repository;
  DeleteChannelUseCase(this._repository);

  FutureVoid call({
    required String serverId,
    required String channelId,
  }) {
    return _repository.deleteChannel(serverId: serverId, channelId: channelId);
  }
}