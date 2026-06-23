import 'dart:async';

import 'package:bloom/core/services/breathing_engine.dart';
import 'package:bloom/features/breathing/model/breathing_model.dart';
import 'package:flutter/material.dart';

class BreathingSessionPage extends StatefulWidget {
  final BreathingModel exercise;

  const BreathingSessionPage({super.key, required this.exercise});

  @override
  State<BreathingSessionPage> createState() => _BreathingSessionPageState();
}

class _BreathingSessionPageState extends State<BreathingSessionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _circleController;

  StreamSubscription<BreathPhase>? _subscription;

  String phaseText = 'READY';

  bool isRunning = false;

  int currentCycle = 0;

  double sliderValue = 0;

  @override
  void initState() {
    super.initState();

    _circleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.exercise.inhale),
      lowerBound: 0.8,
      upperBound: 1.25,
    );
  }

  void startSession() {
    if (isRunning) return;

    isRunning = true;

    final engine = BreathingEngine(
      inhale: widget.exercise.inhale,
      hold1: widget.exercise.hold1,
      exhale: widget.exercise.exhale,
      hold2: widget.exercise.hold2,
    );

    _subscription = engine.start().listen((phase) {
      if (!mounted) return;

      switch (phase) {
        case BreathPhase.inhale:
          setState(() {
            phaseText = 'INHALE';
          });

          _circleController.forward();

          break;

        case BreathPhase.holdAfterInhale:
          setState(() {
            phaseText = 'HOLD';
          });

          break;

        case BreathPhase.exhale:
          setState(() {
            phaseText = 'EXHALE';
          });

          _circleController.reverse();

          setState(() {
            sliderValue += 1 / widget.exercise.totalCycles;

            if (sliderValue > 1) {
              sliderValue = 1;
            }

            currentCycle = (sliderValue * widget.exercise.totalCycles).ceil();

            if (currentCycle > widget.exercise.totalCycles) {
              currentCycle = widget.exercise.totalCycles;
            }
          });

          break;

        case BreathPhase.holdAfterExhale:
          setState(() {
            phaseText = 'HOLD';
          });

          break;
      }
    });

    setState(() {});
  }

  void stopSession() {
    _subscription?.cancel();

    isRunning = false;

    phaseText = 'READY';

    _circleController.reset();

    setState(() {});
  }

  @override
  void dispose() {
    _subscription?.cancel();

    _circleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayCycle = currentCycle == 0 ? 1 : currentCycle;

    return Scaffold(
      appBar: AppBar(title: Text(widget.exercise.name)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$displayCycle OF ${widget.exercise.totalCycles}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Slider(
                value: sliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _circleController,
                      builder: (context, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 280 * _circleController.value,
                              height: 280 * _circleController.value,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.withValues(alpha: 0.15),
                              ),
                            ),

                            Image.asset(
                              'assets/images/breathing/breathing.png',
                              height: 280,
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 40),

                    Text(
                      phaseText,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isRunning ? stopSession : startSession,
                  child: Text(isRunning ? 'STOP' : 'START'),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
