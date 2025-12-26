// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatControllerHash() => r'7328bb472b62d4f9b6c3772ebbff9a04a5780e99';

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

abstract class _$ChatController
    extends BuildlessAutoDisposeStreamNotifier<ChatState> {
  late final String serverId;
  late final String channelId;

  Stream<ChatState> build({
    required String serverId,
    required String channelId,
  });
}

/// See also [ChatController].
@ProviderFor(ChatController)
const chatControllerProvider = ChatControllerFamily();

/// See also [ChatController].
class ChatControllerFamily extends Family<AsyncValue<ChatState>> {
  /// See also [ChatController].
  const ChatControllerFamily();

  /// See also [ChatController].
  ChatControllerProvider call({
    required String serverId,
    required String channelId,
  }) {
    return ChatControllerProvider(serverId: serverId, channelId: channelId);
  }

  @override
  ChatControllerProvider getProviderOverride(
    covariant ChatControllerProvider provider,
  ) {
    return call(serverId: provider.serverId, channelId: provider.channelId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatControllerProvider';
}

/// See also [ChatController].
class ChatControllerProvider
    extends AutoDisposeStreamNotifierProviderImpl<ChatController, ChatState> {
  /// See also [ChatController].
  ChatControllerProvider({required String serverId, required String channelId})
    : this._internal(
        () => ChatController()
          ..serverId = serverId
          ..channelId = channelId,
        from: chatControllerProvider,
        name: r'chatControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$chatControllerHash,
        dependencies: ChatControllerFamily._dependencies,
        allTransitiveDependencies:
            ChatControllerFamily._allTransitiveDependencies,
        serverId: serverId,
        channelId: channelId,
      );

  ChatControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.serverId,
    required this.channelId,
  }) : super.internal();

  final String serverId;
  final String channelId;

  @override
  Stream<ChatState> runNotifierBuild(covariant ChatController notifier) {
    return notifier.build(serverId: serverId, channelId: channelId);
  }

  @override
  Override overrideWith(ChatController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatControllerProvider._internal(
        () => create()
          ..serverId = serverId
          ..channelId = channelId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        serverId: serverId,
        channelId: channelId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<ChatController, ChatState>
  createElement() {
    return _ChatControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatControllerProvider &&
        other.serverId == serverId &&
        other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, serverId.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatControllerRef on AutoDisposeStreamNotifierProviderRef<ChatState> {
  /// The parameter `serverId` of this provider.
  String get serverId;

  /// The parameter `channelId` of this provider.
  String get channelId;
}

class _ChatControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ChatController, ChatState>
    with ChatControllerRef {
  _ChatControllerProviderElement(super.provider);

  @override
  String get serverId => (origin as ChatControllerProvider).serverId;
  @override
  String get channelId => (origin as ChatControllerProvider).channelId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
