import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'widgets/mood_chip.dart';

class MoodViewPage extends StatefulWidget {
  const MoodViewPage({super.key});

  @override
  State<MoodViewPage> createState() => _MoodViewPageState();
}

class _MoodViewPageState extends State<MoodViewPage> {
  String? selectedMood;
  String userName = "User";

  final moods = const [
    {"label": "Happy", "icon": Icons.sentiment_satisfied},
    {"label": "Sad", "icon": Icons.sentiment_dissatisfied},
    {"label": "Angry", "icon": Icons.sentiment_very_dissatisfied},
    {"label": "Calm", "icon": Icons.self_improvement},
    {"label": "Anxious", "icon": Icons.psychology},
  ];
  @override
  void initState() {
    super.initState();

    // Firebase username
    final user = FirebaseAuth.instance.currentUser;
    userName = user?.displayName ?? "User";
  }

  //Dynamic greeting based on time
  String getMoodPrompt() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good morning ☀️, $userName how are you feeling today?";
    } else if (hour >= 12 && hour < 17) {
      return "Good afternoon 🌤️, $userName how are you feeling today?";
    } else if (hour >= 17 && hour < 21) {
      return "Good evening 🌇, $userName how are you feeling today?";
    } else {
      return "Good night 🌙, $userName how are you feeling today?";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.waving_hand, size: 22),
            const SizedBox(width: 8),
            Text(
              "Hi, $userName",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getMoodPrompt(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: moods.map((mood) {
                return MoodChip(
                  label: mood["label"] as String,
                  icon: mood["icon"] as IconData,
                  isSelected: selectedMood == mood["label"],
                  onTap: () {
                    setState(() {
                      selectedMood = mood["label"] as String;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedMood == null
                    ? null
                    : () {
                        debugPrint("Selected Mood: $selectedMood");
                      },
                child: const Text("Save Mood"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
