import 'package:bloom/features/meditation/model/meditation_model.dart';
import 'package:bloom/features/meditation/repository/meditation_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meditation_viewmodel.g.dart';

@riverpod
class MeditationViewModel extends _$MeditationViewModel {
  late final MeditationRepository _repository;

  @override
  AsyncValue<List<MeditationModel>> build() {
    _repository = ref.watch(
      meditationRepositoryProvider,
    );

    return const AsyncData([]);
  }

  Future<void> fetchMeditations(
    String uid,
  ) async {
    state = const AsyncLoading();

    try {
      final meditations =
          await _repository.getMeditations(uid);

      state = AsyncData(meditations);
    } catch (e) {
      state = AsyncError(
        e,
        StackTrace.current,
      );
    }
  }

  Future<void> addMeditation({
    required String uid,
    required String title,
    required String audioPath,
    required int duration,
  }) async {
    state = const AsyncLoading();

    try {
      final meditation = MeditationModel(
        id: DateTime.now()
            .microsecondsSinceEpoch
            .toString(),
        userId: uid,
        title: title,
        audioPath: audioPath,
        duration: duration,
        completed: true,
        createdAt: DateTime.now(),
      );

      await _repository.saveMeditation(
        uid: uid,
        meditation: meditation,
      );

      final list =
          await _repository.getMeditations(uid);

      state = AsyncData(list);
    } catch (e) {
      state = AsyncError(
        e,
        StackTrace.current,
      );
    }
  }

  Future<void> deleteMeditation({
    required String uid,
    required String meditationId,
  }) async {
    state = const AsyncLoading();

    try {
      await _repository.deleteMeditation(
        uid: uid,
        meditationId: meditationId,
      );

      final list =
          await _repository.getMeditations(uid);

      state = AsyncData(list);
    } catch (e) {
      state = AsyncError(
        e,
        StackTrace.current,
      );
    }
  }
}