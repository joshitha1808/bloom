import 'package:flutter/material.dart';

enum Mood { sad, anxious, angry, happy, calm }

extension MoodPresentation on Mood {
  String get label {
    switch (this) {
      case Mood.sad:
        return 'Sad';
      case Mood.anxious:
        return 'Anxious';
      case Mood.angry:
        return 'Angry';
      case Mood.happy:
        return 'Happy';
      case Mood.calm:
        return 'Calm';
    }
  }

  IconData get icon {
    switch (this) {
      case Mood.sad:
        return Icons.sentiment_dissatisfied;
      case Mood.anxious:
        return Icons.psychology;
      case Mood.angry:
        return Icons.sentiment_very_dissatisfied;
      case Mood.happy:
        return Icons.sentiment_satisfied;
      case Mood.calm:
        return Icons.self_improvement;
    }
  }
}

class MoodSuggestionEngine {
  const MoodSuggestionEngine();

  static const Map<Mood, List<String>> _suggestions = {
    Mood.sad: [
      '2 min breathing exercise',
      'Write thoughts in journal',
      'Talk to AI coach',
    ],
    Mood.anxious: [
      'Box breathing (1 min)',
      '5 min meditation session',
      'Listen to calming sound',
    ],
    Mood.angry: [
      'Deep breathing reset',
      'Count to 10 exercise',
      'Write trigger journal',
    ],
    Mood.happy: [
      'Gratitude journaling',
      'Save moment in journal',
      'Share happiness reflection',
    ],
    Mood.calm: [
      'Mindfulness check-in',
      'Channel energy journaling',
      'Set a goal for today',
    ],
  };

  List<String> suggestionsFor(Mood mood) {
    return _suggestions[mood] ?? const [];
  }
}

void showMoodSuggestions(BuildContext context, Mood mood) {
  Future.microtask(() {
    if (!context.mounted) {
      return;
    }

    final engine = MoodSuggestionEngine();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        final suggestions = engine.suggestionsFor(mood);

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '${mood.label} suggestions',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Try one of these simple next steps.',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 16),
                ...suggestions.map(
                  (suggestion) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.check_circle_outline),
                    title: Text(suggestion),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(sheetContext).pop(),
                    child: const Text('Got it'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  });
}
