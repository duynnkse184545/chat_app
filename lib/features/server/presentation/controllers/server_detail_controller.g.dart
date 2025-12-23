// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serverDetailControllerHash() =>
    r'116de1320626f11aa9dc27adeff4684b1bc9ab73';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ServerDetailController
    extends BuildlessAutoDisposeStreamNotifier<ServerDetailState> {
  late final String serverId;

  Stream<ServerDetailState> build(String serverId);
}

/// See also [ServerDetailController].
@ProviderFor(ServerDetailController)
const serverDetailControllerProvider = ServerDetailControllerFamily();

/// See also [ServerDetailController].
class ServerDetailControllerFamily
    extends Family<AsyncValue<ServerDetailState>> {
  /// See also [ServerDetailController].
  const ServerDetailControllerFamily();

  /// See also [ServerDetailController].
  ServerDetailControllerProvider call(String serverId) {
    return ServerDetailControllerProvider(serverId);
  }

  @override
  ServerDetailControllerProvider getProviderOverride(
    covariant ServerDetailControllerProvider provider,
  ) {
    return call(provider.serverId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'serverDetailControllerProvider';
}

/// See also [ServerDetailController].
class ServerDetailControllerProvider
    extends
        AutoDisposeStreamNotifierProviderImpl<
          ServerDetailController,
          ServerDetailState
        > {
  /// See also [ServerDetailController].
  ServerDetailControllerProvider(String serverId)
    : this._internal(
        () => ServerDetailController()..serverId = serverId,
        from: serverDetailControllerProvider,
        name: r'serverDetailControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$serverDetailControllerHash,
        dependencies: ServerDetailControllerFamily._dependencies,
        allTransitiveDependencies:
            ServerDetailControllerFamily._allTransitiveDependencies,
        serverId: serverId,
      );

  ServerDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.serverId,
  }) : super.internal();

  final String serverId;

  @override
  Stream<ServerDetailState> runNotifierBuild(
    covariant ServerDetailController notifier,
  ) {
    return notifier.build(serverId);
  }

  @override
  Override overrideWith(ServerDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ServerDetailControllerProvider._internal(
        () => create()..serverId = serverId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        serverId: serverId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<
    ServerDetailController,
    ServerDetailState
  >
  createElement() {
    return _ServerDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ServerDetailControllerProvider &&
        other.serverId == serverId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, serverId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ServerDetailControllerRef
    on AutoDisposeStreamNotifierProviderRef<ServerDetailState> {
  /// The parameter `serverId` of this provider.
  String get serverId;
}

class _ServerDetailControllerProviderElement
    extends
        AutoDisposeStreamNotifierProviderElement<
          ServerDetailController,
          ServerDetailState
        >
    with ServerDetailControllerRef {
  _ServerDetailControllerProviderElement(super.provider);

  @override
  String get serverId => (origin as ServerDetailControllerProvider).serverId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
