import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/channel/domain/entities/channel_entity.dart';
import 'package:chat_app/features/channel/domain/repository/channel_repository.dart';

class GetServerChannelsUseCase {
  final ChannelRepository _repository;
  GetServerChannelsUseCase(this._repository);

  StreamEither<List<ChannelEntity>> call(String serverId) {
    return _repository.getServerChannels(serverId);
  }
}