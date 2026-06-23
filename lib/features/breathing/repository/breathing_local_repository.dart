import 'package:bloom/core/constants/breathing_exercises.dart';
import 'package:bloom/features/breathing/model/breathing_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'breathing_local_repository.g.dart';

@riverpod
BreathingRepository breathingRepository(Ref ref) {
  return BreathingRepository();
}

class BreathingRepository {
  Future<List<BreathingModel>> getExercises() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return breathingExercises;
  }
}
