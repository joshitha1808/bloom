// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Journal copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? dateTime,
  }) {
    return Journal(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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

  @override
  String toString() {
    return 'Journal(id: $id, title: $title, content: $content, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant Journal other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.title == title &&
        other.content == content &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ content.hashCode ^ dateTime.hashCode;
  }
}
