import 'package:flutter/material.dart';
import '../data/meditation_data.dart';
import '../widgets/meditation_tile.dart';
import 'meditation_player_page.dart';

class MeditationListPage extends StatelessWidget {
  const MeditationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meditation'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: meditationTracks.length,
        itemBuilder: (context, index) {
          final meditation = meditationTracks[index];

          return MeditationTile(
            meditation: meditation,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MeditationPlayerPage(
                    title: meditation.title,
                    audioPath: meditation.audioPath,
                    duration: meditation.duration,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
