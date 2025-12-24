// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelListControllerHash() =>
    r'39c1cf43705b9485bdee714a3d5edf1e2c8e216e';

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

abstract class _$ChannelListController
    extends BuildlessAutoDisposeStreamNotifier<ChannelListState> {
  late final String serverId;

  Stream<ChannelListState> build(String serverId);
}

/// See also [ChannelListController].
@ProviderFor(ChannelListController)
const channelListControllerProvider = ChannelListControllerFamily();

/// See also [ChannelListController].
class ChannelListControllerFamily extends Family<AsyncValue<ChannelListState>> {
  /// See also [ChannelListController].
  const ChannelListControllerFamily();

  /// See also [ChannelListController].
  ChannelListControllerProvider call(String serverId) {
    return ChannelListControllerProvider(serverId);
  }

  @override
  ChannelListControllerProvider getProviderOverride(
    covariant ChannelListControllerProvider provider,
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
  String? get name => r'channelListControllerProvider';
}

/// See also [ChannelListController].
class ChannelListControllerProvider
    extends
        AutoDisposeStreamNotifierProviderImpl<
          ChannelListController,
          ChannelListState
        > {
  /// See also [ChannelListController].
  ChannelListControllerProvider(String serverId)
    : this._internal(
        () => ChannelListController()..serverId = serverId,
        from: channelListControllerProvider,
        name: r'channelListControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$channelListControllerHash,
        dependencies: ChannelListControllerFamily._dependencies,
        allTransitiveDependencies:
            ChannelListControllerFamily._allTransitiveDependencies,
        serverId: serverId,
      );

  ChannelListControllerProvider._internal(
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
  Stream<ChannelListState> runNotifierBuild(
    covariant ChannelListController notifier,
  ) {
    return notifier.build(serverId);
  }

  @override
  Override overrideWith(ChannelListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChannelListControllerProvider._internal(
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
    ChannelListController,
    ChannelListState
  >
  createElement() {
    return _ChannelListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelListControllerProvider && other.serverId == serverId;
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
mixin ChannelListControllerRef
    on AutoDisposeStreamNotifierProviderRef<ChannelListState> {
  /// The parameter `serverId` of this provider.
  String get serverId;
}

class _ChannelListControllerProviderElement
    extends
        AutoDisposeStreamNotifierProviderElement<
          ChannelListController,
          ChannelListState
        >
    with ChannelListControllerRef {
  _ChannelListControllerProviderElement(super.provider);

  @override
  String get serverId => (origin as ChannelListControllerProvider).serverId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
