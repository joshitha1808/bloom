import 'dart:convert';

class Journal {
  final String id;
  final String title;
  final String content;
  final DateTime dateTime;

  const Journal({
    required this.id,
    required this.title,
    required this.content,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Journal.fromMap(Map<String, dynamic> map) {
    return Journal(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Journal.fromJson(String source) =>
      Journal.fromMap(json.decode(source) as Map<String, dynamic>);
}
