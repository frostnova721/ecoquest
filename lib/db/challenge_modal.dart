class ChallengeModal {
  final int id;
  final String title;
  final ChallengeStatus status;
  final int points;
  final String desc;

  ChallengeModal({
    required this.id,
    required this.title,
    required this.status,
    this.points = 10,
    required this.desc,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'status': status.index,
      'points': points,
    };
  }

  factory ChallengeModal.fromMap(Map<String, dynamic> map) {
    return ChallengeModal(
      id: map['id'],
      title: map['title'],
      desc: map['desc'],
      status: ChallengeStatus.values[map['status']],
      points: map['points'],
    );
  }
}

enum ChallengeStatus {
  ongoing, expired, upcoming,
}