import 'package:ecoquest/db/user_modal.dart';

class Users {
  final _box = "user";

  List<UserModal> users = [
    UserModal(name: "Alice", id: 0, points: 120, email: "alice@alice.com", password: "alice123"),
    UserModal(name: "John", id: 1, points: 60, email: "john@john.com", password: "john123"),
  ];

  UserModal getUser(String name, String password) {
    return users.firstWhere((it) => it.name == name && it.password == password);
  }

  Future<void> addUser(UserModal user) async {
    users.add(user);
  }
}