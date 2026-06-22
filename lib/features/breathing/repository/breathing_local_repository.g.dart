// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breathing_local_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(breathingRepository)
final breathingRepositoryProvider = BreathingRepositoryProvider._();

final class BreathingRepositoryProvider
    extends
        $FunctionalProvider<
          BreathingRepository,
          BreathingRepository,
          BreathingRepository
        >
    with $Provider<BreathingRepository> {
  BreathingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'breathingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$breathingRepositoryHash();

  @$internal
  @override
  $ProviderElement<BreathingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BreathingRepository create(Ref ref) {
    return breathingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BreathingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BreathingRepository>(value),
    );
  }
}

String _$breathingRepositoryHash() =>
    r'baa7152db1ebc4d6190f8875e93e84414a45554b';
