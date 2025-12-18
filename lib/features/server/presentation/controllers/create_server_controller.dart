import 'package:chat_app/features/server/presentation/states/create_server_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:chat_app/core/utils/validators.dart';
import 'package:chat_app/features/server/presentation/controllers/server_list_controller.dart';
import 'package:chat_app/features/server/presentation/controllers/server_providers.dart';

part 'create_server_controller.g.dart';

@riverpod
class CreateServerController extends _$CreateServerController {
  @override
  CreateServerState build() {
    return const CreateServerState();
  }

  void setName(String name) {
    state = state.copyWith(name: name, nameError: null);
  }

  void setDescription(String description) {
    state = state.copyWith(
      description: description,
      descriptionError: null,
      generalError: null,
    );
  }

  Future<bool> createServer() async {
    if (!_validate()) return false;

    state = state.copyWith(isLoading: true, generalError: null);

    final createServerUseCase = await ref.read(
      createServerUseCaseProvider.future,
    );
    final result = await createServerUseCase(
      name: state.name,
      description: state.description,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          generalError: failure.message,
        );
        return false;
      },
      (_) {
        ref.invalidate(serverListControllerProvider);
        state = state.copyWith(isLoading: false);
        return true;
      },
    );
  }

  bool _validate() {
    final nameError = Validators.serverName(state.name);
    final descriptionError = Validators.serverDescription(state.description);

    state = state.copyWith(
      nameError: nameError,
      descriptionError: descriptionError,
      generalError: null,
    );
    return nameError == null && descriptionError == null;
  }
}
