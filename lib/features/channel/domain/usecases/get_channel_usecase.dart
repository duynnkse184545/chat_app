import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/channel/domain/entities/channel_entity.dart';
import 'package:chat_app/features/channel/domain/repository/channel_repository.dart';

class GetChannelUseCase {
  final ChannelRepository _repository;
  GetChannelUseCase(this._repository);

  StreamEither<ChannelEntity> call({
    required String serverId,
    required String channelId,
  }) {
    return _repository.getChannel(serverId: serverId, channelId: channelId);
  }
}