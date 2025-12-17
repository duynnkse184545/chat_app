// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRemoteDatasourceHash() =>
    r'5d05965213cbd1732616190c1d8144f6f27b1d14';

/// See also [authRemoteDatasource].
@ProviderFor(authRemoteDatasource)
final authRemoteDatasourceProvider =
    AutoDisposeProvider<AuthRemoteDatasource>.internal(
      authRemoteDatasource,
      name: r'authRemoteDatasourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authRemoteDatasourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRemoteDatasourceRef = AutoDisposeProviderRef<AuthRemoteDatasource>;
String _$authLocalDatasourceHash() =>
    r'05d3ff463badc8671b22fc7c9d03e432c7ac94b5';

/// See also [authLocalDatasource].
@ProviderFor(authLocalDatasource)
final authLocalDatasourceProvider =
    AutoDisposeFutureProvider<AuthLocalDatasource>.internal(
      authLocalDatasource,
      name: r'authLocalDatasourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authLocalDatasourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthLocalDatasourceRef =
    AutoDisposeFutureProviderRef<AuthLocalDatasource>;
String _$authRepositoryHash() => r'749a1d70a5c238b14cfd49961d691103cec311b4';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider =
    AutoDisposeFutureProvider<AuthRepository>.internal(
      authRepository,
      name: r'authRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = AutoDisposeFutureProviderRef<AuthRepository>;
String _$authStateChangesHash() => r'f3dfd3721f2466cab54ca9dc1f01fb620d1d1394';

/// See also [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider =
    AutoDisposeStreamProvider<UserEntity?>.internal(
      authStateChanges,
      name: r'authStateChangesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authStateChangesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateChangesRef = AutoDisposeStreamProviderRef<UserEntity?>;
String _$currentUserHash() => r'29da32173fa8b08266416ab0ba1398689a3a9517';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeProvider<UserEntity?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserRef = AutoDisposeProviderRef<UserEntity?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
