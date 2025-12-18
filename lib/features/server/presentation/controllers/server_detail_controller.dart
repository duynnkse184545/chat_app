import 'package:chat_app/features/server/presentation/controllers/server_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:chat_app/features/server/presentation/states/server_detail_state.dart';

part 'server_detail_controller.g.dart';

@riverpod
class ServerDetailController extends _$ServerDetailController {
  @override
  ServerDetailState build(String serverId) {
    loadServer(serverId);
    return const ServerDetailState();
  }

  Future<void> loadServer(String serverId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final getServerUseCase = await ref.read(getServerUseCaseProvider.future);
    final result = await getServerUseCase(serverId);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (server) => state = state.copyWith(
        isLoading: false,
        server: server,
        errorMessage: null,
      ),
    );
  }

  Future<bool> updateServer({
    required String serverId,
    String? name,
    String? description,
    String? iconUrl,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final updateServerUseCase = await ref.read(updateServerUseCaseProvider.future);
    final result = await updateServerUseCase(
      serverId: serverId,
      name: name,
      description: description,
      iconUrl: iconUrl,
    );

    return result.fold(
          (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
        return false;
      },
          (_) {
        loadServer(serverId);
        return true;
      },
    );
  }

  Future<bool> deleteServer(String serverId) async {
    state = state.copyWith(isDeleting: true, errorMessage: null);

    final deleteServerUseCase = await ref.read(deleteServerUseCaseProvider.future);
    final result = await deleteServerUseCase(serverId);

    return result.fold(
          (failure) {
        state = state.copyWith(
          isDeleting: false,
          errorMessage: failure.message,
        );
        return false;
      },
          (_) {
        return true;
      },
    );
  }
}
