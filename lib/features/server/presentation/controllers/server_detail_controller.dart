import 'package:chat_app/features/server/presentation/controllers/server_list_controller.dart';
import 'package:chat_app/features/server/presentation/controllers/server_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:chat_app/features/server/presentation/states/server_detail_state.dart';

part 'server_detail_controller.g.dart';

@riverpod
class ServerDetailController extends _$ServerDetailController {
  @override
  Stream<ServerDetailState> build(String serverId) async* {
    final getServerUseCase = await ref.read(getServerUseCaseProvider.future);

    final stream = getServerUseCase(serverId);

    await for (final result in stream) {
      yield result.fold(
        (failure) => throw failure,
        (server) => ServerDetailState(server: server),
      );
    }
  }

  Future<bool> updateServer({
    required String serverId,
    String? name,
    String? description,
    String? iconUrl,
  }) async {
    final currentState = state.value;
    if (currentState == null) return false;

    state = AsyncValue.data(currentState.copyWith(isDeleting: true));

    final updateServerUseCase = await ref.read(
      updateServerUseCaseProvider.future,
    );
    final result = await updateServerUseCase(
      serverId: serverId,
      name: name,
      description: description,
      iconUrl: iconUrl,
    );

    return result.fold(
      (failure) {
        state = AsyncValue.data(currentState.copyWith(isDeleting: false));
        throw failure;
      },
      (_) {
        ref.invalidateSelf();
        return true;
      },
    );
  }

  Future<String?> deleteServer(String serverId) async {
    final currentState = state.value;
    if (currentState == null) return 'State not loaded!';

    state = AsyncValue.data(currentState.copyWith(isDeleting: true));

    final deleteServerUseCase = await ref.read(
      deleteServerUseCaseProvider.future,
    );
    final result = await deleteServerUseCase(serverId);

    return result.fold((failure) {
      state = AsyncValue.data(currentState.copyWith(isDeleting: false));
      return failure.message;
    }, (_) {
      ref.invalidate(serverListControllerProvider);
      ref.invalidateSelf();
      return null;
    });
  }
}
