// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDbHash() => r'2e34c4691928c82ec414f76d9641607eb1fa4e46';

/// See also [appDb].
@ProviderFor(appDb)
final appDbProvider = Provider<AppDb>.internal(
  appDb,
  name: r'appDbProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appDbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDbRef = ProviderRef<AppDb>;
String _$messageDaoHash() => r'30c23e6b4a8f81d2af99d33e430007c43aaf4415';

/// See also [messageDao].
@ProviderFor(messageDao)
final messageDaoProvider = AutoDisposeProvider<MessageDao>.internal(
  messageDao,
  name: r'messageDaoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messageDaoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MessageDaoRef = AutoDisposeProviderRef<MessageDao>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
