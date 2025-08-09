// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserChallenge {
  final String userId;
  final UserChallengeStatus status;
  final int completed;
  final int inProgress;
  // others are considered expired or missed

  UserChallenge({
    required this.userId,
    required this.status,
    required this.completed,
    required this.inProgress,
  });


  UserChallenge copyWith({
    String? userId,
    UserChallengeStatus? status,
    int? completed,
    int? inProgress,
  }) {
    return UserChallenge(
      userId: userId ?? this.userId,
      status: status ?? this.status,
      completed: completed ?? this.completed,
      inProgress: inProgress ?? this.inProgress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'status': status.index,
      'completed': completed,
      'inProgress': inProgress,
    };
  }

  factory UserChallenge.fromMap(Map<String, dynamic> map) {
    return UserChallenge(
      userId: map['userId'] as String,
      status: UserChallengeStatus.values[map['status']],
      completed: map['completed'] as int,
      inProgress: map['inProgress'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserChallenge.fromJson(String source) => UserChallenge.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserChallenge(userId: $userId, status: $status, completed: $completed, inProgress: $inProgress)';
  }

  @override
  bool operator ==(covariant UserChallenge other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.status == status &&
      other.completed == completed &&
      other.inProgress == inProgress;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      status.hashCode ^
      completed.hashCode ^
      inProgress.hashCode;
  }
}

class UserChallengeItem {
  final int id;
  final UserChallengeStatus status;

  UserChallengeItem({
    required this.id,
    required this.status,
  });
}

enum UserChallengeStatus {
  ongoing, completed, failed,
}