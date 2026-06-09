import 'package:bloom/features/mood/model/mood_model.dart';
import 'package:bloom/features/mood/repository/mood_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mood_viewmodel.g.dart';

@riverpod
class MoodViewModel extends _$MoodViewModel {
  late final MoodRepository _moodRepository;

  @override
  AsyncValue<List<MoodModel>> build() {
    _moodRepository = ref.watch(moodRepositoryProvider);
    return const AsyncData([]);
  }

  Future<void> fetchMoods(String uid) async {
    state = const AsyncLoading();
    try {
      final moods = await _moodRepository.getMoods(uid);
      state = AsyncData(moods);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> addMood({required String uid, required String moodValue}) async {
    state = const AsyncLoading();
    try {
      final mood = MoodModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        mood: moodValue,
        createdAt: DateTime.now(),
      );
      await _moodRepository.saveMood(uid: uid, mood: mood);
      final list = await _moodRepository.getMoods(uid);
      state = AsyncData(list);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> deleteMood({required String uid, required String moodId}) async {
    state = const AsyncLoading();
    try {
      await _moodRepository.deleteMood(uid: uid, moodId: moodId);
      final list = await _moodRepository.getMoods(uid);
      state = AsyncData(list);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
