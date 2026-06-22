import 'package:bloom/features/breathing/model/breathing_model.dart';
import 'package:bloom/features/breathing/repository/breathing_local_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'breathing_viewmodel.g.dart';

@riverpod
class BreathingViewModel extends _$BreathingViewModel {
  late final BreathingRepository _repository;

  @override
  AsyncValue<List<BreathingModel>> build() {
    _repository = ref.watch(breathingRepositoryProvider);

    return const AsyncData([]);
  }

  Future<void> fetchExercises() async {
    state = const AsyncLoading();

    try {
      final exercises = await _repository.getExercises();

      state = AsyncData(exercises);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
