import 'package:bloom/features/mood/model/mood_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bloom/init_dependencies.dart';

part 'mood_repository.g.dart';

@riverpod
MoodRepository moodRepository(Ref ref) {
  final firestore = serviceLocator<FirebaseFirestore>();
  return MoodRepository(firestore: firestore);
}

class MoodRepository {
  final FirebaseFirestore firestore;

  MoodRepository({required this.firestore});

  Future<void> saveMood({required String uid, required MoodModel mood}) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('moods')
        .doc(mood.id)
        .set(mood.toMap());
  }

  Future<List<MoodModel>> getMoods(String uid) async {
    final snapshot = await firestore
        .collection('users')
        .doc(uid)
        .collection('moods')
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) => MoodModel.fromMap(doc.data())).toList();
  }

  Future<void> deleteMood({required String uid, required String moodId}) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('moods')
        .doc(moodId)
        .delete();
  }
}
