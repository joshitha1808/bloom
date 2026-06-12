import 'package:just_audio/just_audio.dart';

class AudioService {
  final AudioPlayer player = AudioPlayer();

  Future<void> loadAsset(String path) async {
    await player.setAsset(path);
  }

  Future<void> play() async {
    await player.play();
  }

  Future<void> pause() async {
    await player.pause();
  }

  Future<void> stop() async {
    await player.stop();
  }

  Future<void> seek(Duration position) async {
    await player.seek(position);
  }

  Stream<Duration> get positionStream => player.positionStream;

  Stream<PlayerState> get playerStateStream => player.playerStateStream;

  Duration? get duration => player.duration;

  bool get isPlaying => player.playing;

  Future<void> dispose() async {
    await player.dispose();
  }
}
