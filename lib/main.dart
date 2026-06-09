import 'package:bloom/features/mood/view/mood_page.dart';
import 'package:bloom/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await initDependencies();
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MoodViewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
