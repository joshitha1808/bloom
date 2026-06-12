// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MeditationViewModel)
final meditationViewModelProvider = MeditationViewModelProvider._();

final class MeditationViewModelProvider
    extends
        $NotifierProvider<
          MeditationViewModel,
          AsyncValue<List<MeditationModel>>
        > {
  MeditationViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'meditationViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$meditationViewModelHash();

  @$internal
  @override
  MeditationViewModel create() => MeditationViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<MeditationModel>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<MeditationModel>>>(
        value,
      ),
    );
  }
}

String _$meditationViewModelHash() =>
    r'57aec9a80756b272913d4e45fad1621e23eb2807';

abstract class _$MeditationViewModel
    extends $Notifier<AsyncValue<List<MeditationModel>>> {
  AsyncValue<List<MeditationModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<MeditationModel>>,
              AsyncValue<List<MeditationModel>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<MeditationModel>>,
                AsyncValue<List<MeditationModel>>
              >,
              AsyncValue<List<MeditationModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
