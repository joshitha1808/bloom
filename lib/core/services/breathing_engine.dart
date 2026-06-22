enum BreathPhase { inhale, hold, exhale }

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
      yield BreathPhase.inhale;

      await Future.delayed(Duration(seconds: inhale));

      if (hold1 > 0) {
        yield BreathPhase.hold;

        await Future.delayed(Duration(seconds: hold1));
      }

      yield BreathPhase.exhale;

      await Future.delayed(Duration(seconds: exhale));

      if (hold2 > 0) {
        yield BreathPhase.hold;

        await Future.delayed(Duration(seconds: hold2));
      }
    }
  }
}
