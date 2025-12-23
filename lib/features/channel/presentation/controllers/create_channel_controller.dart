import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/channel/presentation/controllers/channel_list_controller.dart';
import 'package:chat_app/features/channel/presentation/controllers/channel_providers.dart';
import 'package:chat_app/features/channel/presentation/states/create_channel_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_channel_controller.g.dart';

@riverpod
class CreateChannelController extends _$CreateChannelController {
  late final String _serverId;

  @override
  CreateChannelState build(String serverId) {
    _serverId = serverId;
    return const CreateChannelState();
  }

  void setName(String name) {
    state = state.copyWith(name: name, nameError: null);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description, descriptionError: null);
  }

  Future<bool> createChannel() async {
    // Validate inputs using shared validators
    final nameError = Validators.channelName(state.name);
    if (nameError != null) {
      state = state.copyWith(nameError: nameError);
      return false;
    }

    final descError = Validators.channelDescription(state.description);
    if (descError != null) {
      state = state.copyWith(descriptionError: descError);
      return false;
    }

    state = state.copyWith(isLoading: true, generalError: null);

    final useCase = await ref.read(createChannelUseCaseProvider.future);
    final result = await useCase(
      serverId: _serverId,
      name: state.name.trim(),
      description: state.description.trim(),
    );

    return result.fold(
          (failure) {
        state = state.copyWith(
          isLoading: false,
          generalError: failure.message,
        );
        return false;
      },
          (channel) {
        state = state.copyWith(isLoading: false);
        // Trigger channel list refresh
        ref.invalidate(channelListControllerProvider(_serverId));
        return true;
      },
    );
  }
}