import 'package:bloom/features/journal/model/journal_model.dart';
import 'package:bloom/init_dependencies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'journal_remote_repository.g.dart';

@riverpod
JournalRepository journalRepository(Ref ref) {
  final firestore = serviceLocator<FirebaseFirestore>();

  return JournalRepository(firestore: firestore);
}

class JournalRepository {
  final FirebaseFirestore firestore;

  JournalRepository({required this.firestore});

  Future<void> saveJournal({
    required String uid,
    required Journal journal,
  }) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('journals')
        .doc(journal.id)
        .set(journal.toMap());
  }

  Future<List<Journal>> getJournals(String uid) async {
    final snapshot = await firestore
        .collection('users')
        .doc(uid)
        .collection('Journals')
        .orderBy('dateTime', descending: true)
        .get();

    return snapshot.docs.map((doc) => Journal.fromMap(doc.data())).toList();
  }

  Future<void> deleteJournal({
    required String uid,
    required String journalId,
  }) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('journals')
        .doc(journalId)
        .delete();
  }
}
