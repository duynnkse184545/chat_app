// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_channel_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createChannelControllerHash() =>
    r'89d61950c72b9462b63588e4a332d74a334b5dbc';

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

abstract class _$CreateChannelController
    extends BuildlessAutoDisposeNotifier<CreateChannelState> {
  late final String serverId;

  CreateChannelState build(String serverId);
}

/// See also [CreateChannelController].
@ProviderFor(CreateChannelController)
const createChannelControllerProvider = CreateChannelControllerFamily();

/// See also [CreateChannelController].
class CreateChannelControllerFamily extends Family<CreateChannelState> {
  /// See also [CreateChannelController].
  const CreateChannelControllerFamily();

  /// See also [CreateChannelController].
  CreateChannelControllerProvider call(String serverId) {
    return CreateChannelControllerProvider(serverId);
  }

  @override
  CreateChannelControllerProvider getProviderOverride(
    covariant CreateChannelControllerProvider provider,
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
  String? get name => r'createChannelControllerProvider';
}

/// See also [CreateChannelController].
class CreateChannelControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          CreateChannelController,
          CreateChannelState
        > {
  /// See also [CreateChannelController].
  CreateChannelControllerProvider(String serverId)
    : this._internal(
        () => CreateChannelController()..serverId = serverId,
        from: createChannelControllerProvider,
        name: r'createChannelControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$createChannelControllerHash,
        dependencies: CreateChannelControllerFamily._dependencies,
        allTransitiveDependencies:
            CreateChannelControllerFamily._allTransitiveDependencies,
        serverId: serverId,
      );

  CreateChannelControllerProvider._internal(
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
  CreateChannelState runNotifierBuild(
    covariant CreateChannelController notifier,
  ) {
    return notifier.build(serverId);
  }

  @override
  Override overrideWith(CreateChannelController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CreateChannelControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<
    CreateChannelController,
    CreateChannelState
  >
  createElement() {
    return _CreateChannelControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateChannelControllerProvider &&
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
mixin CreateChannelControllerRef
    on AutoDisposeNotifierProviderRef<CreateChannelState> {
  /// The parameter `serverId` of this provider.
  String get serverId;
}

class _CreateChannelControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          CreateChannelController,
          CreateChannelState
        >
    with CreateChannelControllerRef {
  _CreateChannelControllerProviderElement(super.provider);

  @override
  String get serverId => (origin as CreateChannelControllerProvider).serverId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
