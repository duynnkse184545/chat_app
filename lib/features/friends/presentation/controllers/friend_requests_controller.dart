import 'package:chat_app/features/friends/presentation/controllers/friend_providers.dart';
import 'package:chat_app/features/friends/presentation/states/friend_requests_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'friend_requests_controller.g.dart';

@riverpod
class FriendRequestsController extends _$FriendRequestsController {
  @override
  Stream<FriendRequestsState> build() async* {
    final useCase = ref.read(streamFriendRequestsUseCaseProvider);

    // Combine both streams - updates when EITHER stream emits
    final incomingStream = useCase.streamIncoming();
    final outgoingStream = useCase.streamOutgoing();

    yield* Rx.combineLatest2(
      incomingStream,
      outgoingStream,
      (incomingEither, outgoingEither) {
        // Extract or throw - fail fast on any error
        final incoming = incomingEither.fold(
              (failure) => throw failure,  // ← Throw like ChatController
              (requests) => requests,
        );

        final outgoing = outgoingEither.fold(
              (failure) => throw failure,  // ← Throw like ChatController
              (requests) => requests,
        );

        return FriendRequestsState(
          incomingRequests: incoming,
          outgoingRequests: outgoing,
        );
      },
    );
  }

  Future<String?> acceptRequest(String requestId) async {
    final useCase = ref.read(acceptFriendRequestUseCaseProvider);
    final result = await useCase(requestId: requestId);

    return result.fold(
          (failure) => failure.message,
          (_) => null,
    );
  }

  Future<String?> rejectRequest(String requestId) async {
    final useCase = ref.read(rejectFriendRequestUseCaseProvider);
    final result = await useCase(requestId: requestId);

    return result.fold(
          (failure) => failure.message,
          (_) => null,
    );
  }
}