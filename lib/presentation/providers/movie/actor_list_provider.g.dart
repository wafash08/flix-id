// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$actorListHash() => r'8e993777eea08e29f03dc40826075ba66b6c6bfd';

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

/// See also [actorList].
@ProviderFor(actorList)
const actorListProvider = ActorListFamily();

/// See also [actorList].
class ActorListFamily extends Family<AsyncValue<List<Actor>>> {
  /// See also [actorList].
  const ActorListFamily();

  /// See also [actorList].
  ActorListProvider call({required int movieId}) {
    return ActorListProvider(movieId: movieId);
  }

  @override
  ActorListProvider getProviderOverride(covariant ActorListProvider provider) {
    return call(movieId: provider.movieId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'actorListProvider';
}

/// See also [actorList].
class ActorListProvider extends AutoDisposeFutureProvider<List<Actor>> {
  /// See also [actorList].
  ActorListProvider({required int movieId})
    : this._internal(
        (ref) => actorList(ref as ActorListRef, movieId: movieId),
        from: actorListProvider,
        name: r'actorListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$actorListHash,
        dependencies: ActorListFamily._dependencies,
        allTransitiveDependencies: ActorListFamily._allTransitiveDependencies,
        movieId: movieId,
      );

  ActorListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<List<Actor>> Function(ActorListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ActorListProvider._internal(
        (ref) => create(ref as ActorListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Actor>> createElement() {
    return _ActorListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActorListProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ActorListRef on AutoDisposeFutureProviderRef<List<Actor>> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _ActorListProviderElement
    extends AutoDisposeFutureProviderElement<List<Actor>>
    with ActorListRef {
  _ActorListProviderElement(super.provider);

  @override
  int get movieId => (origin as ActorListProvider).movieId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
