import 'package:chat_app/features/channel/presentation/controllers/channel_providers.dart';
import 'package:chat_app/features/channel/presentation/states/channel_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_list_controller.g.dart';

@riverpod
class ChannelListController extends _$ChannelListController {
  late String _serverId;

  @override
  Stream<ChannelListState> build(String serverId) async* {
    _serverId = serverId;
    final getServerChannelUseCase = await ref.read(
      getServerChannelsUseCaseProvider.future,
    );
    final results = getServerChannelUseCase(_serverId);

    await for (final result in results) {
      yield result.fold(
        (failure) => throw failure,
        (channels) => ChannelListState(channels: channels)
      );
    }
  }

  // online only not hybrid
  // Future<void> refresh(String serverId) async {
  //   // Still showing old state while loading
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() => build(serverId));
  //
  //   // Clear all while loading
  //   // ref.invalidateSelf();
  //   // await Future;
  // }

  Future<String?> deleteChannel(String channelId) async {
    final currentState = state.value;
    if (currentState == null) return 'State not loaded!';

    state = AsyncValue.data(currentState.copyWith(isDeleting: true));

    final deleteChannelUseCase = await ref.read(
      deleteChannelUseCaseProvider.future,
    );
    final result = await deleteChannelUseCase(channelId: channelId, serverId: _serverId);

    return result.fold((failure) {
      state = AsyncValue.data(currentState.copyWith(isDeleting: false));
      return failure.message;
    }, (_) {
      ref.invalidateSelf();
      return null;
    });
  }
}
