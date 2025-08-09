import 'package:ecoquest/db/challenge_modal.dart';
import 'package:hive/hive.dart';

class Challenges {
  static const String boxName = "challenges";

  static List<ChallengeModal> defaultChallenges = [
    ChallengeModal(
      id: 0,
      title: "Dispose 5 recyclable plastic waste.",
      desc: "Find and properly dispose 5 recyclable plastic items in designated bins.",
      status: ChallengeStatus.ongoing,
      points: 15,
    ),
    ChallengeModal(
      id: 1,
      title: "Participate in a campus clean-up drive",
      desc: "Join the organized clean-up to collect and sort campus litter.",
      status: ChallengeStatus.upcoming,
      points: 5,
    ),
    ChallengeModal(
      id: 2,
      title: "Plant a sapling in the campus garden",
      desc: "Contribute to greening the campus by planting and watering a sapling.",
      status: ChallengeStatus.upcoming,
      points: 9,
    ),
    ChallengeModal(
      id: 3,
      title: "Use a reusable bottle for 3 days",
      desc: "Avoid single-use plastics by carrying a refillable bottle for 3 days straight.",
      status: ChallengeStatus.expired,
      points: 0,
    ),
    ChallengeModal(
      id: 4,
      title: "Submit 10 used batteries for recycling",
      desc: "Collect and hand over 10 dead batteries to the recycling station.",
      status: ChallengeStatus.upcoming,
      points: 14,
    ),
    ChallengeModal(
      id: 5,
      title: "Reduce electricity use for a day",
      desc: "Turn off unused lights, fans, and devices for a full day to save energy.",
      status: ChallengeStatus.ongoing,
      points: 9,
    ),
    ChallengeModal(
      id: 6,
      title: "Organize a paper recycling drive",
      desc: "Gather unused or waste paper from peers and submit for recycling.",
      status: ChallengeStatus.upcoming,
      points: 0,
    ),
    ChallengeModal(
      id: 7,
      title: "Use public transport for a week",
      desc: "Avoid personal vehicles and use buses or carpools for 7 days.",
      status: ChallengeStatus.expired,
      points: 20,
    ),
  ];

  /// Initialize Hive with default challenges if empty
  static Future<void> init() async {
    var box = await Hive.openBox(boxName);
    if (box.isEmpty) {
      for (var challenge in defaultChallenges) {
        await box.put(challenge.id, challenge.toMap());
      }
    }
  }

  /// Get all challenges
  static List<ChallengeModal> getAll() {
    var box = Hive.box(boxName);
    return box.values
        .map((map) => ChallengeModal.fromMap(Map<String, dynamic>.from(map)))
        .toList();
  }

  /// Get challenge by ID
  static ChallengeModal? getById(int id) {
    var box = Hive.box(boxName);
    var data = box.get(id);
    if (data == null) return null;
    return ChallengeModal.fromMap(Map<String, dynamic>.from(data));
  }

  /// Add or update challenge
  static Future<void> addOrUpdateChallenge(ChallengeModal challenge) async {
    var box = Hive.box(boxName);
    await box.put(challenge.id, challenge.toMap());
  }

  /// Remove challenge by ID
  static Future<void> removeChallenge(int id) async {
    var box = Hive.box(boxName);
    await box.delete(id);
  }
}
