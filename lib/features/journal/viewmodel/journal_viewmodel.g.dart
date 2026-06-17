// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(JournalViewModel)
final journalViewModelProvider = JournalViewModelProvider._();

final class JournalViewModelProvider
    extends $NotifierProvider<JournalViewModel, AsyncValue<List<Journal>>> {
  JournalViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'journalViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$journalViewModelHash();

  @$internal
  @override
  JournalViewModel create() => JournalViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Journal>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Journal>>>(value),
    );
  }
}

String _$journalViewModelHash() => r'b5774525677e5c4681209bd3e2e7486f0528a28f';

abstract class _$JournalViewModel extends $Notifier<AsyncValue<List<Journal>>> {
  AsyncValue<List<Journal>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Journal>>, AsyncValue<List<Journal>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Journal>>, AsyncValue<List<Journal>>>,
              AsyncValue<List<Journal>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
