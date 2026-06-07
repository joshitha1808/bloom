import 'package:bloom/features/onboarding/view/pages/onboarding_page.dart';
import 'package:bloom/init_dependencies.dart';
import 'package:flutter/material.dart';

void main() async{
  await initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: OnboardingPage());
  }
}
