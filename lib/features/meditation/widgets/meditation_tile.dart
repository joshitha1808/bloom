import 'package:flutter/material.dart';
import '../data/meditation_data.dart';

class MeditationTile extends StatelessWidget {
  final MeditationTrack meditation;
  final VoidCallback onTap;

  const MeditationTile({
    super.key,
    required this.meditation,
    required this.onTap,
  });

  String formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;

    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.self_improvement)),
        title: Text(meditation.title),
        subtitle: Text(formatDuration(meditation.duration)),
        trailing: const Icon(Icons.play_arrow),
        onTap: onTap,
      ),
    );
  }
}
