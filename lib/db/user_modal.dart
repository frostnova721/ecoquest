// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModal {
  final String name;
  final int id;
  final int points;
  final String email;
  final String password;

  UserModal({
    required this.name,
    required this.id,
    required this.points,
    required this.email,
    required this.password,
  });

  

  UserModal copyWith({
    String? name,
    int? id,
    int? points,
    String? email,
    String? password,
  }) {
    return UserModal(
      name: name ?? this.name,
      id: id ?? this.id,
      points: points ?? this.points,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'points': points,
      'email': email,
      'password': password,
    };
  }

  factory UserModal.fromMap(Map<String, dynamic> map) {
    return UserModal(
      name: map['name'] as String,
      id: map['id'] as int,
      points: map['points'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModal.fromJson(String source) => UserModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModal(name: $name, id: $id, points: $points, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant UserModal other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.id == id &&
      other.points == points &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      id.hashCode ^
      points.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}
