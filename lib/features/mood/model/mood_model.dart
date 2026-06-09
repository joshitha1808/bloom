// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MoodModel {
  final String id;
  final String mood;
  final DateTime createdAt;

  MoodModel({required this.id, required this.mood, required this.createdAt});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mood': mood,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory MoodModel.fromMap(Map<String, dynamic> map) {
    return MoodModel(
      id: map['id'] as String,
      mood: map['mood'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory MoodModel.fromJson(String source) =>
      MoodModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
