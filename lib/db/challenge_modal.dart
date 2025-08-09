class ChallengeModal {
  final int id;
  final String title;
  final ChallengeStatus status;

  ChallengeModal({
    required this.id,
    required this.title,
    required this.status,
  });
}

enum ChallengeStatus {
  ongoing, expired, upcoming,
}