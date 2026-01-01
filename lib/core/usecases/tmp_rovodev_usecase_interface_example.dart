import 'package:chat_app/core/utils/type_defs.dart';

// ============================================
// OPTION 1: Generic UseCase Base Class
// ============================================

/// Base class for all use cases that return Future<Either<Failure, T>>
abstract class UseCase<Type, Params> {
  FutureEither<Type> call(Params params);
}

/// For use cases with no parameters
class NoParams {
  const NoParams();
}

// ============================================
// OPTION 2: Stream UseCase Base Class
// ============================================

/// Base class for use cases that return Stream<Either<Failure, T>>
abstract class StreamUseCase<Type, Params> {
  StreamEither<Type> call(Params params);
}

// ============================================
// EXAMPLES: How your use cases would look
// ============================================

// Example 1: SignInUseCase with parameters
/*
class SignInParams {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});
}

class SignInUseCase implements UseCase<UserEntity, SignInParams> {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  @override
  FutureEither<UserEntity> call(SignInParams params) async {
    if (params.email.isEmpty) {
      return const Left(Failure.authFailure('Email is required!'));
    }
    if (params.password.isEmpty) {
      return const Left(Failure.authFailure('Password is missing!'));
    }
    if (params.password.length < 6) {
      return const Left(Failure.authFailure('Password must be at least 6 characters!'));
    }
    return _authRepository.signInWithEmailAndPassword(
      email: params.email.trim(),
      password: params.password,
    );
  }
}
*/

// Example 2: StreamFriendsUseCase with no parameters
/*
class StreamFriendsUseCase implements StreamUseCase<List<FriendshipEntity>, NoParams> {
  final FriendRepository _repository;

  StreamFriendsUseCase(this._repository);

  @override
  StreamEither<List<FriendshipEntity>> call(NoParams params) {
    return _repository.streamFriends();
  }
}
*/

// ============================================
// OPTION 3: Simpler callable interface (no params class)
// ============================================

/// Even simpler - just enforce the call method without generics
abstract class CallableUseCase {
  // Subclasses define their own call method signature
}

// Then your use cases remain almost the same:
/*
class SignInUseCase extends CallableUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  FutureEither<UserEntity> call({
    required String email,
    required String password,
  }) async {
    // ... same implementation
  }
}
*/
