import 'package:bloom/core/services/audio_service.dart';
import 'package:bloom/features/meditation/viewmodel/meditation_viewmodel.dart';
import 'package:bloom/features/meditation/widgets/audio_wave.dart';
import 'package:bloom/features/meditation/widgets/player_control.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MeditationPlayerPage extends ConsumerStatefulWidget {
  final String title;
  final String audioPath;
  final int duration;

  const MeditationPlayerPage({
    super.key,
    required this.title,
    required this.audioPath,
    required this.duration,
  });

  @override
  ConsumerState<MeditationPlayerPage> createState() =>
      _MeditationPlayerPageState();
}

class _MeditationPlayerPageState extends ConsumerState<MeditationPlayerPage> {
  final AudioService _audioService = AudioService();

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  bool _sessionSaved = false;

  @override
  void initState() {
    super.initState();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    await _audioService.loadAsset(widget.audioPath);

    setState(() {
      _duration = _audioService.duration ?? Duration.zero;
    });

    _audioService.positionStream.listen((position) {
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    });

    _audioService.playerStateStream.listen((state) async {
      if (state.processingState.name == 'completed' && !_sessionSaved) {
        _sessionSaved = true;

        final uid = FirebaseAuth.instance.currentUser?.uid;

        if (uid != null) {
          await ref
              .read(meditationViewModelProvider.notifier)
              .addMeditation(
                uid: uid,
                title: widget.title,
                audioPath: widget.audioPath,
                duration: widget.duration,
              );
        }
      }
    });
  }

  Future<void> _togglePlayPause() async {
    if (_audioService.isPlaying) {
      await _audioService.pause();
    } else {
      await _audioService.play();
    }

    setState(() {});
  }

  Future<void> _forward15Seconds() async {
    await _audioService.seek(_position + const Duration(seconds: 15));
  }

  void _playNextSong() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Next meditation will be added later')),
    );
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 12),

              /// TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey.shade100,
                    child: IconButton(
                      iconSize: 18,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade100,
                        child: const Icon(Icons.search, size: 18),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade100,
                        child: const Icon(Icons.notifications_none, size: 18),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// POWERED BY AI
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      size: 14,
                      color: Color(0xFF42C7D6),
                    ),
                    SizedBox(width: 5),
                    Text('Powered by AI', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// TITLE
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              /// WAVE + SEEK BAR
              AudioWaveWidget(
                position: _position,
                duration: _duration,
                onChanged: (value) {
                  _audioService.seek(Duration(seconds: value.toInt()));
                },
              ),

              const SizedBox(height: 30),

              /// ARTWORK
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/meditation/meditation2.png',
                    fit: BoxFit.contain,
                    height: 320,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// CONTROLS
              PlayerControls(
                isPlaying: _audioService.isPlaying,
                onPlayPause: _togglePlayPause,
                onForward15: _forward15Seconds,
                onNextSong: _playNextSong,
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
