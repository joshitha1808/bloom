import 'package:bloom/features/journal/viewmodel/journal_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddJournalPage extends ConsumerStatefulWidget {
  final String uid;

  const AddJournalPage({super.key, required this.uid});

  @override
  ConsumerState<AddJournalPage> createState() => _AddJournalPageState();
}

class _AddJournalPageState extends ConsumerState<AddJournalPage> {
  final titleController = TextEditingController();

  final contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  Future<void> saveJournal() async {
    if (titleController.text.trim().isEmpty ||
        contentController.text.trim().isEmpty) {
      return;
    }

    await ref
        .read(journalViewModelProvider.notifier)
        .addJournal(
          uid: widget.uid,
          title: titleController.text.trim(),
          content: contentController.text.trim(),
        );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Journal')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  hintText: 'Write your thoughts...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveJournal,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
