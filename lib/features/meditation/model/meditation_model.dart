// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MeditationSession {
  final String id;
  final String userId;
  final int duration; // seconds
  final bool completed;
  final DateTime createdAt;

  MeditationSession({
    required this.id,
    required this.userId,
    required this.duration,
    required this.completed,
    required this.createdAt,
  });

  // Convert object → Map (for Firebase)
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'duration': duration,
      'completed': completed,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  // Convert Map → object (from Firebase)
  factory MeditationSession.fromMap(Map<String, dynamic> map) {
    return MeditationSession(
      id: map['id'] as String,
      userId: map['userId'] as String,
      duration: map['duration'] as int,
      completed: map['completed'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  // Convert object → JSON string
  String toJson() => json.encode(toMap());

  // Convert JSON string → object
  factory MeditationSession.fromJson(String source) =>
      MeditationSession.fromMap(json.decode(source) as Map<String, dynamic>);
}
