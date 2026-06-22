import 'package:bloom/features/breathing/model/breathing_model.dart';

class BreathingExercises {
  static const List<BreathingModel> exercises = [
    BreathingModel(
      id: 'calm',
      name: 'Calm Breathing',
      description: 'Relax and reduce stress',
      inhale: 5,
      hold1: 0,
      exhale: 5,
      hold2: 0,
    ),

    BreathingModel(
      id: 'box',
      name: 'Box Breathing',
      description: 'Improve focus and concentration',
      inhale: 4,
      hold1: 4,
      exhale: 4,
      hold2: 4,
    ),

    BreathingModel(
      id: 'sleep',
      name: '4-7-8 Breathing',
      description: 'Help you fall asleep faster',
      inhale: 4,
      hold1: 7,
      exhale: 8,
      hold2: 0,
    ),

    BreathingModel(
      id: 'belly',
      name: 'Deep Belly Breathing',
      description: 'Reduce anxiety and stress',
      inhale: 4,
      hold1: 0,
      exhale: 6,
      hold2: 0,
    ),

    BreathingModel(
      id: 'focus',
      name: 'Focus Breathing',
      description: 'Increase attention and productivity',
      inhale: 6,
      hold1: 2,
      exhale: 6,
      hold2: 0,
    ),
  ];
}
