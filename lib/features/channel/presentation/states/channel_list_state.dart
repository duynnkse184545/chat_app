import 'package:chat_app/features/channel/domain/entities/channel_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_list_state.freezed.dart';

@freezed
abstract class ChannelListState with _$ChannelListState {
  const factory ChannelListState({
    @Default([]) List<ChannelEntity> channels,
    @Default(false) bool isDeleting,
  }) = _ChannelListState;
}