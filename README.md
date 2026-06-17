# Bloom

Bloom is a Flutter + Firebase mental health and self-care app designed for people who want a lightweight way to check in with their mood, reflect in a journal, calm down with guided exercises, and review simple trends over time.

It is not a replacement for therapy, diagnosis, or emergency support.

## What Bloom is for

Bloom focuses on everyday stress, low mood, anxiety, and habit building for students and early-career professionals who want short, low-friction self-help tools rather than clinical treatment.

## Core Features

### Onboarding and Profile

- Simple onboarding that explains what the app does and what it does not do.
- Optional profile details such as name, avatar, language, and reminder preferences.
- Consent and privacy messaging that explains Firebase storage and user data control.

### Daily Mood Check-In

- Quick mood logging with a small set of emotions such as stressed, anxious, calm, okay, and great.
- Optional tags like Study, Friends, Family, Sleep, and custom tags.
- Optional short notes for context.
- Mood history and trend views so users can notice patterns over time.

### Guided Breathing and Meditation

- Short exercises such as box breathing, 4-7-8 breathing, and grounding sessions.
- A breathing reset flow that can map a selected state like anxious, tired, or overwhelmed to a suggested exercise.
- Audio-based or text-based guided sessions with play/pause and progress feedback.

### Journaling

- Daily or ad-hoc journal entries with simple prompts.
- Mood-linked journaling so users can open a reflection prompt immediately after a check-in.
- Search and filter support by date or tags.

### Analytics and Insights

- Mood trends, streaks, and simple statistics like most frequent moods or tags.
- Weekly or monthly summary cards.
- Gentle insights framed as reflections, not diagnoses.

### Reminders and Notifications

- Optional reminders for daily check-ins.
- Optional breathing or reset reminders at chosen times.
- Configurable frequency with a compassionate tone.

### Safety and Crisis Support

- A prominent help-now section that links to verified crisis support.
- Clear guidance that the app should not be used as a substitute for emergency care.
- Crisis support references for India such as KIRAN, Tele-MANAS, AASRA, and iCALL.

## Safety and Privacy

Bloom is designed with clear boundaries:

- It does not diagnose conditions.
- It does not replace therapy or emergency services.
- It keeps data minimal and stores user records under authenticated user IDs.
- It should support data export and account deletion from settings.
- Any future AI suggestions should be labeled clearly and should never replace human help for high-risk situations.

## Tech Stack

| Layer | Technology |
| --- | --- |
| Framework | Flutter |
| Language | Dart |
| State Management | Riverpod |
| Dependency Injection | GetIt |
| Authentication | Firebase Auth |
| Database | Cloud Firestore |
| Core Firebase Setup | firebase_core |
| Audio Playback | just_audio |
| Audio Visualization | audio_waveforms |
| UI Helpers | carousel_slider |
| Connectivity | internet_connection_checker_plus |


## Project Structure

```text
lib/
├── core/
├── features/
├── firebase_options.dart
├── init_dependencies.dart
├── init_dependencies.main.dart
└── main.dart
```

## Setup

### Prerequisites

- Flutter SDK
- Dart SDK
- Firebase project configured for Android and iOS
- Android Studio or VS Code

### Run locally

```bash
flutter pub get
flutter run
```

### Optional checks

```bash
flutter test
flutter analyze
dart format .
```

## Notes

- The app is intended for self-help and habit support.
- Users in distress should be directed to local emergency services or verified crisis helplines immediately.

## License

MIT License.
