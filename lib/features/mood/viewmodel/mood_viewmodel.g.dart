// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MoodViewModel)
final moodViewModelProvider = MoodViewModelProvider._();

final class MoodViewModelProvider
    extends $NotifierProvider<MoodViewModel, AsyncValue<List<MoodModel>>> {
  MoodViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moodViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moodViewModelHash();

  @$internal
  @override
  MoodViewModel create() => MoodViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<MoodModel>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<MoodModel>>>(value),
    );
  }
}

String _$moodViewModelHash() => r'569f073046e74ec9e6ab2a9f91504f3939d741a7';

abstract class _$MoodViewModel extends $Notifier<AsyncValue<List<MoodModel>>> {
  AsyncValue<List<MoodModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<MoodModel>>, AsyncValue<List<MoodModel>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<MoodModel>>,
                AsyncValue<List<MoodModel>>
              >,
              AsyncValue<List<MoodModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
