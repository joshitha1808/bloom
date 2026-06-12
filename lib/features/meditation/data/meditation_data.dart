class MeditationTrack {
  final String title;
  final String audioPath;
  final int duration;

  const MeditationTrack({
    required this.title,
    required this.audioPath,
    required this.duration,
  });
}

const meditationTracks = [
  MeditationTrack(
    title: 'Stress Relief',
    audioPath: 'assets/audios/meditation1.mp3',
    duration: 306,
  ),
  MeditationTrack(
    title: 'Deep Relaxation',
    audioPath: 'assets/audios/meditation2.mp3',
    duration: 103,
  ),
  MeditationTrack(
    title: 'Mindful Breathing',
    audioPath: 'assets/audios/meditation3.mp3',
    duration: 287,
  ),
  MeditationTrack(
    title: 'Focus Meditation',
    audioPath: 'assets/audios/meditation4.mp3',
    duration: 366,
  ),
  MeditationTrack(
    title: 'Sleep Meditation',
    audioPath: 'assets/audios/meditation5.mp3',
    duration: 390,
  ),
];
