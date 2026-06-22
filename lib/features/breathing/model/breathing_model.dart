// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class BreathingModel {
  final String id;
  final String name;
  final String description;

  final int inhale;
  final int hold1;
  final int exhale;
  final int hold2;

  const BreathingModel({
    required this.id,
    required this.name,
    required this.description,
    required this.inhale,
    required this.hold1,
    required this.exhale,
    required this.hold2,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'inhale': inhale,
      'hold1': hold1,
      'exhale': exhale,
      'hold2': hold2,
    };
  }

  factory BreathingModel.fromMap(Map<String, dynamic> map) {
    return BreathingModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      inhale: map['inhale'] as int,
      hold1: map['hold1'] as int,
      exhale: map['exhale'] as int,
      hold2: map['hold2'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BreathingModel.fromJson(String source) =>
      BreathingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
