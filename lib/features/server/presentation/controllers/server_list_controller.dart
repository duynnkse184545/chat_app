import 'package:chat_app/features/server/presentation/controllers/server_providers.dart';
import 'package:chat_app/features/server/presentation/states/server_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'server_list_controller.g.dart';

@riverpod
class ServerListController extends _$ServerListController {
  @override
  ServerListState build() {
    loadServers();
    return const ServerListState();
  }

  Future<void> loadServers() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final getUserServersUseCase = await ref.read(
      getUserServersUseCaseProvider.future,
    );
    final result = await getUserServersUseCase();

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (servers) => state = state.copyWith(
        isLoading: false,
        servers: servers,
        errorMessage: null,
      ),
    );
  }

  Future<bool> createServer({
    required String name,
    required String description,
    String? iconUrl,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final createServerUseCase = await ref.read(
      createServerUseCaseProvider.future,
    );
    final result = await createServerUseCase(
      name: name,
      description: description,
      iconUrl: iconUrl,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: true, errorMessage: failure.message);
        return false;
      },
      (_) {
        loadServers();
        return true;
      },
    );
  }
}
