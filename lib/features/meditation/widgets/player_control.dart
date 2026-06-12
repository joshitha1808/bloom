import 'package:flutter/material.dart';

class PlayerControls extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onForward15;
  final VoidCallback onNextSong;

  const PlayerControls({
    super.key,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onForward15,
    required this.onNextSong,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onForward15,
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: const Center(
              child: Text('+15', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ),

        const SizedBox(width: 30),

        GestureDetector(
          onTap: onPlayPause,
          child: Container(
            width: 75,
            height: 75,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF42C7D6),
            ),
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 38,
            ),
          ),
        ),

        const SizedBox(width: 30),

        GestureDetector(
          onTap: onNextSong,
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade100,
            ),
            child: const Icon(Icons.skip_next, size: 28),
          ),
        ),
      ],
    );
  }
}
