import 'package:chat_app/features/server/presentation/controllers/server_providers.dart';
import 'package:chat_app/features/server/presentation/states/server_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'server_list_controller.g.dart';

@riverpod
class ServerListController extends _$ServerListController {
  @override
  Future<ServerListState> build() async {
    final getUserServersUseCase = await ref.read(
      getUserServersUseCaseProvider.future,
    );
    final result = await getUserServersUseCase();

    return result.fold(
      (failure) => throw failure,
      (servers) => ServerListState(servers: servers),
    );
  }

  Future<void> refresh() async {
    // Still showing old state while loading
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => build());

    // Clear all while loading
    // ref.invalidateSelf();
    // await Future;
  }
}
