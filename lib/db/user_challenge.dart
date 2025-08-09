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