import 'package:flutter/material.dart';

class AudioWaveWidget extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<double> onChanged;

  const AudioWaveWidget({
    super.key,
    required this.position,
    required this.duration,
    required this.onChanged,
  });

  String format(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final maxSeconds = duration.inSeconds == 0 ? 1 : duration.inSeconds;

    return Column(
      children: [
        Slider(
          value: position.inSeconds.toDouble().clamp(0, maxSeconds.toDouble()),
          min: 0,
          max: maxSeconds.toDouble(),
          onChanged: onChanged,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(format(position)), Text(format(duration))],
          ),
        ),
      ],
    );
  }
}
