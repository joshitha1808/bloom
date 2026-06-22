// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breathing_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BreathingViewModel)
final breathingViewModelProvider = BreathingViewModelProvider._();

final class BreathingViewModelProvider
    extends
        $NotifierProvider<
          BreathingViewModel,
          AsyncValue<List<BreathingModel>>
        > {
  BreathingViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'breathingViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$breathingViewModelHash();

  @$internal
  @override
  BreathingViewModel create() => BreathingViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<BreathingModel>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<BreathingModel>>>(
        value,
      ),
    );
  }
}

String _$breathingViewModelHash() =>
    r'c337d915150f3e7aaa9c2411616fe40216f75ba7';

abstract class _$BreathingViewModel
    extends $Notifier<AsyncValue<List<BreathingModel>>> {
  AsyncValue<List<BreathingModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<BreathingModel>>,
              AsyncValue<List<BreathingModel>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<BreathingModel>>,
                AsyncValue<List<BreathingModel>>
              >,
              AsyncValue<List<BreathingModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
