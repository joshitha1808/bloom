// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(moodRepository)
final moodRepositoryProvider = MoodRepositoryProvider._();

final class MoodRepositoryProvider
    extends $FunctionalProvider<MoodRepository, MoodRepository, MoodRepository>
    with $Provider<MoodRepository> {
  MoodRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moodRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moodRepositoryHash();

  @$internal
  @override
  $ProviderElement<MoodRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MoodRepository create(Ref ref) {
    return moodRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MoodRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MoodRepository>(value),
    );
  }
}

String _$moodRepositoryHash() => r'c31c09f478af6bee4c0ed4d44ccafc06e06de4ed';
