import 'package:chat_app/core/utils/type_defs.dart';
import 'package:chat_app/features/channel/domain/entities/channel_entity.dart';
import 'package:chat_app/features/channel/domain/repository/channel_repository.dart';

class CreateChannelUseCase {
  final ChannelRepository _repository;
  CreateChannelUseCase(this._repository);

  FutureEither<ChannelEntity> call({
    required String serverId,
    required String name,
    required String description,
  }) {
    return _repository.createChannel(
      serverId: serverId,
      name: name,
      description: description,
    );
  }
}