import 'package:bloom/features/breathing/model/breathing_model.dart';

final List<BreathingModel> breathingExercises = [
  BreathingModel(
    id: 'box',
    name: 'Box Breathing',
    description: 'Improve focus and concentration',
    inhale: 4,
    hold1: 4,
    exhale: 4,
    hold2: 4,
    totalCycles: 5,
  ),

  BreathingModel(
    id: '478',
    name: '4-7-8 Breathing',
    description: 'Relax and sleep better',
    inhale: 4,
    hold1: 7,
    exhale: 8,
    hold2: 0,
    totalCycles: 5,
  ),

  BreathingModel(
    id: 'calm',
    name: 'Calm Breathing',
    description: 'Reduce stress and anxiety',
    inhale: 5,
    hold1: 0,
    exhale: 5,
    hold2: 0,
    totalCycles: 5,
  ),

  BreathingModel(
    id: 'belly',
    name: 'Deep Belly Breathing',
    description: 'Promotes relaxation',
    inhale: 4,
    hold1: 0,
    exhale: 6,
    hold2: 0,
    totalCycles: 5,
  ),
];
