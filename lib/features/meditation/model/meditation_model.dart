// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MeditationModel {
  final String id;
  final String userId;
  final String title;
  final String audioPath;
  final int duration;
  final bool completed;
  final DateTime createdAt;

  MeditationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.audioPath,
    required this.duration,
    required this.completed,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'audioPath': audioPath,
      'duration': duration,
      'completed': completed,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory MeditationModel.fromMap(Map<String, dynamic> map) {
    return MeditationModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      title: map['title'] as String,
      audioPath: map['audioPath'] as String,
      duration: map['duration'] as int,
      completed: map['completed'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory MeditationModel.fromJson(String source) =>
      MeditationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
