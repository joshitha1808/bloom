import 'dart:convert';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? photoUrl;
  final int streakDays;
  final bool notificationsEnabled;
  final bool isOnboarded;
  final DateTime createdAt;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.streakDays,
    required this.notificationsEnabled,
    required this.isOnboarded,
    required this.createdAt,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? photoUrl,
    int? streakDays,
    bool? notificationsEnabled,
    bool? isOnboarded,
    DateTime? createdAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      streakDays: streakDays ?? this.streakDays,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      isOnboarded: isOnboarded ?? this.isOnboarded,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory UserModel.empty() {
    return UserModel(
      uid: '',
      name: '',
      email: '',
      photoUrl: null,
      streakDays: 0,
      notificationsEnabled: true,
      isOnboarded: false,
      createdAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'streakDays': streakDays,
      'notificationsEnabled': notificationsEnabled,
      'isOnboarded': isOnboarded,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'],
      streakDays: map['streakDays'] ?? 0,
      notificationsEnabled: map['notificationsEnabled'] ?? true,
      isOnboarded: map['isOnboarded'] ?? false,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        map['createdAt'] ?? DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) {
    return UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, photoUrl: $photoUrl, streakDays: $streakDays, notificationsEnabled: $notificationsEnabled, isOnboarded: $isOnboarded, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.photoUrl == photoUrl &&
        other.streakDays == streakDays &&
        other.notificationsEnabled == notificationsEnabled &&
        other.isOnboarded == isOnboarded &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        photoUrl.hashCode ^
        streakDays.hashCode ^
        notificationsEnabled.hashCode ^
        isOnboarded.hashCode ^
        createdAt.hashCode;
  }
}
