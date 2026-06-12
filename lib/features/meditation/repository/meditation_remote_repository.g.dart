// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_remote_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(meditationRepository)
final meditationRepositoryProvider = MeditationRepositoryProvider._();

final class MeditationRepositoryProvider
    extends
        $FunctionalProvider<
          MeditationRepository,
          MeditationRepository,
          MeditationRepository
        >
    with $Provider<MeditationRepository> {
  MeditationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'meditationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$meditationRepositoryHash();

  @$internal
  @override
  $ProviderElement<MeditationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MeditationRepository create(Ref ref) {
    return meditationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MeditationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MeditationRepository>(value),
    );
  }
}

String _$meditationRepositoryHash() =>
    r'cbae448a99075aa7a525c431b320f87777ab59a5';
