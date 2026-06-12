import 'package:bloom/features/meditation/model/meditation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bloom/init_dependencies.dart';

part 'meditation_remote_repository.g.dart';

@riverpod
MeditationRepository meditationRepository(Ref ref) {
  final firestore = serviceLocator<FirebaseFirestore>();

  return MeditationRepository(firestore: firestore);
}

class MeditationRepository {
  final FirebaseFirestore firestore;

  MeditationRepository({required this.firestore});

  Future<void> saveMeditation({
    required String uid,
    required MeditationModel meditation,
  }) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('meditations')
        .doc(meditation.id)
        .set(meditation.toMap());
  }

  Future<List<MeditationModel>> getMeditations(String uid) async {
    final snapshot = await firestore
        .collection('users')
        .doc(uid)
        .collection('meditations')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => MeditationModel.fromMap(doc.data()))
        .toList();
  }

  Future<void> deleteMeditation({
    required String uid,
    required String meditationId,
  }) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('meditations')
        .doc(meditationId)
        .delete();
  }
}
