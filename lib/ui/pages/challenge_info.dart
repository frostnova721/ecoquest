import 'package:ecoquest/core/challenges.dart';
import 'package:ecoquest/db/challenge_modal.dart';
import 'package:flutter/material.dart';

class ChallengeInfo extends StatefulWidget {
  final int id;
  const ChallengeInfo({super.key, required this.id});

  @override
  State<ChallengeInfo> createState() => _ChallengeInfoState();
}

class _ChallengeInfoState extends State<ChallengeInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ChallengeModal get challenge =>
      Challenges.getAll().firstWhere((it) => it.id == widget.id);

  ColorScheme get _colorScheme => Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Challenge info")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Challenge:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              challenge.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 24),
            Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                color: _colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(13),
              ),
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(8),
              child: Text(challenge.desc),
            ),
            SizedBox(height: 24),
            Text(
              "Earned Points: +${challenge.points}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: 24),
            // Text(
            //   "Your status: ",
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
      floatingActionButton: challenge.status != ChallengeStatus.ongoing ? null : FloatingActionButton.extended(
        onPressed: () {
          Challenges.removeChallenge(
            challenge.id,
          );
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Marked Complete!")));
          Navigator.of(context).pop();
        },
        label: Row(children: [Icon(Icons.qr_code), Text("  Scan to complete")]),
      ),
    );
  }
}
