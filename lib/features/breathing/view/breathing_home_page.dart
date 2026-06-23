import 'package:bloom/features/breathing/view/breathing_session_page.dart';
import 'package:bloom/features/breathing/viewmodel/breathing_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BreathingHomePage extends ConsumerStatefulWidget {
  const BreathingHomePage({super.key});

  @override
  ConsumerState<BreathingHomePage> createState() => _BreathingHomePageState();
}

class _BreathingHomePageState extends ConsumerState<BreathingHomePage> {
  @override
  void initState() {
    super.initState();
      ref.read(breathingViewModelProvider.notifier).fetchExercises();
    
  }

  @override
  Widget build(BuildContext context) {
    final exercises = ref.watch(breathingViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Breathing')),
      body: exercises.when(
        data: (list) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final exercise = list[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  title: Text(exercise.name),
                  subtitle: Text(exercise.description),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            BreathingSessionPage(exercise: exercise),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
