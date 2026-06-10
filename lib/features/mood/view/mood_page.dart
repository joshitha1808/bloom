import 'package:flutter/material.dart';
import 'widgets/mood_chip.dart';
import 'widgets/mood_suggestion_bottom_sheet.dart';

class MoodViewPage extends StatefulWidget {
  const MoodViewPage({super.key});

  @override
  State<MoodViewPage> createState() => _MoodViewPageState();
}

class _MoodViewPageState extends State<MoodViewPage> {
  Mood? selectedMood;
  String userName = "User";

  final moods = const [
    Mood.happy,
    Mood.sad,
    Mood.angry,
    Mood.calm,
    Mood.anxious,
  ];

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
                  label: mood.label,
                  icon: mood.icon,
                  isSelected: selectedMood == mood,
                  onTap: () {
                    setState(() {
                      selectedMood = mood;
                    });
                    showMoodSuggestions(context, mood);
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
                        debugPrint("Selected Mood: ${selectedMood!.label}");
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
