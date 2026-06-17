import 'package:bloom/features/journal/model/journal_model.dart';
import 'package:bloom/features/journal/repository/journal_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'journal_viewmodel.g.dart';

@riverpod
class JournalViewModel extends _$JournalViewModel {
  late final JournalRepository _repository;

  @override
  AsyncValue<List<Journal>> build() {
    _repository = ref.watch(journalRepositoryProvider);

    return const AsyncData([]);
  }

  Future<void> fetchJournals(String uid) async {
    state = const AsyncLoading();

    try {
      final journals = await _repository.getJournals(uid);

      state = AsyncData(journals);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> addJournal({
    required String uid,
    required String title,
    required String content,
  }) async {
    state = const AsyncLoading();

    try {
      final journal = Journal(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: title,
        content: content,
        dateTime: DateTime.now(),
      );

      await _repository.saveJournal(uid: uid, journal: journal);

      final journals = await _repository.getJournals(uid);

      state = AsyncData(journals);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> deleteJournal({
    required String uid,
    required String journalId,
  }) async {
    state = const AsyncLoading();

    try {
      await _repository.deleteJournal(uid: uid, journalId: journalId);

      final journals = await _repository.getJournals(uid);

      state = AsyncData(journals);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
