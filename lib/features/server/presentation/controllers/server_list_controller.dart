import 'package:chat_app/features/server/presentation/controllers/server_providers.dart';
import 'package:chat_app/features/server/presentation/states/server_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'server_list_controller.g.dart';

@riverpod
class ServerListController extends _$ServerListController {
  @override
  Stream<ServerListState> build() async* {
    final getUserServersUseCase = await ref.read(
      getUserServersUseCaseProvider.future,
    );

    final stream = getUserServersUseCase();

    await for (final result in stream) {
      yield result.fold(
        (failure) => throw failure,
        (servers) => ServerListState(servers: servers),
      );
    }
  }
}
