enum BreathPhase { inhale, holdAfterInhale, exhale, holdAfterExhale }

class BreathingEngine {
  final int inhale;
  final int hold1;
  final int exhale;
  final int hold2;

  BreathingEngine({
    required this.inhale,
    required this.hold1,
    required this.exhale,
    required this.hold2,
  });

  Stream<BreathPhase> start() async* {
    while (true) {
      // Inhale
      yield BreathPhase.inhale;

      await Future.delayed(Duration(seconds: inhale));

      // Hold after inhale
      if (hold1 > 0) {
        yield BreathPhase.holdAfterInhale;

        await Future.delayed(Duration(seconds: hold1));
      }

      // Exhale
      yield BreathPhase.exhale;

      await Future.delayed(Duration(seconds: exhale));

      // Hold after exhale
      if (hold2 > 0) {
        yield BreathPhase.holdAfterExhale;

        await Future.delayed(Duration(seconds: hold2));
      }
    }
  }
}
