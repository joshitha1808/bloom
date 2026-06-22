import 'package:bloom/features/breathing/model/breathing_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bloom/init_dependencies.dart';

part 'breathing_local_repository.g.dart';

@riverpod
BreathingRepository breathingRepository(Ref ref) {
  final firestore = serviceLocator<FirebaseFirestore>();

  return BreathingRepository(firestore: firestore);
}

class BreathingRepository {
  final FirebaseFirestore firestore;

  BreathingRepository({required this.firestore});

  Future<List<BreathingModel>> getExercises() async {
    final snapshot = await firestore.collection('breathing_exercises').get();

    return snapshot.docs
        .map((doc) => BreathingModel.fromMap(doc.data()))
        .toList();
  }
}
