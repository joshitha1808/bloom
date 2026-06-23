import 'package:bloom/features/breathing/model/breathing_model.dart';
import 'package:bloom/features/breathing/repository/breathing_local_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'breathing_viewmodel.g.dart';

@riverpod
class BreathingViewModel extends _$BreathingViewModel {
  @override
  AsyncValue<List<BreathingModel>> build() {
    return const AsyncData([]);
  }

  Future<void> fetchExercises() async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(breathingRepositoryProvider);

      final exercises = await repository.getExercises();

      state = AsyncData(exercises);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
