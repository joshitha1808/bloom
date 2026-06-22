import 'package:bloom/features/journal/view/add_journal_page.dart';
import 'package:bloom/features/journal/viewmodel/journal_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JournalPage extends ConsumerStatefulWidget {
  final String uid;

  const JournalPage({super.key, required this.uid});

  @override
  ConsumerState<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends ConsumerState<JournalPage> {
  @override
  @override
  void initState() {
    super.initState();
    ref.read(journalViewModelProvider.notifier).fetchJournals(widget.uid); 
  }
  
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(journalViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Journal')),
      body: state.when(
        data: (journals) {
          if (journals.isEmpty) {
            return const Center(child: Text('No journal entries yet'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: journals.length,
            itemBuilder: (context, index) {
              final journal = journals[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(journal.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        journal.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${journal.dateTime.day}/${journal.dateTime.month}/${journal.dateTime.year}',
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await ref
                          .read(journalViewModelProvider.notifier)
                          .deleteJournal(
                            uid: widget.uid,
                            journalId: journal.id,
                          );
                    },
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddJournalPage(uid: widget.uid)),
          );

          ref.read(journalViewModelProvider.notifier).fetchJournals(widget.uid);
        },
      ),
    );
  }
}
