import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/channel/domain/repository/channel_repository.dart';

class UpdateChannelUseCase {
  final ChannelRepository _repository;
  UpdateChannelUseCase(this._repository);

  FutureVoid call({
    required String serverId,
    required String channelId,
    String? name,
    String? description,
  }) {
    return _repository.updateChannel(
      serverId: serverId,
      channelId: channelId,
      name: name,
      description: description,
    );
  }
}