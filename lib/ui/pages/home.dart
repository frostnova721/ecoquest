import 'package:ecoquest/core/ranks.dart';
import 'package:ecoquest/db/challenge_modal.dart';
import 'package:ecoquest/core/challenges.dart';
import 'package:ecoquest/core/users.dart';
import 'package:ecoquest/ui/pages/challenge_info.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = Users().users.first;
  List<ChallengeModal> get challenges => Challenges.getAll();

  void addPoints() {}

  ColorScheme get _colorScheme => Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EcoQuest",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: _colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(child: Icon(Icons.person)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(Ranks.getRank(user.points)),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Your Profile",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.qr_code_2, size: 160),
                                Text(
                                  user.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.qr_code),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(padding: EdgeInsetsGeometry.only(left: 15, right: 15, bottom: 15,), child: Text("Recent Challenges", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
          ListView.builder(
            itemCount: challenges.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ChallengeInfo(id: challenges[index].id,))).then((val) => setState(() {
                    
                  }));
                },
                child: _challengeItem(challenges[index]));
            },
          ),
        ],
      ),
    );
  }

  Container _challengeItem(ChallengeModal modal) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: _colorScheme.primaryContainer.withAlpha(110),
      ),
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(modal.title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text("status: " + modal.status.name),
        ],
      ),
    );
  }
}
