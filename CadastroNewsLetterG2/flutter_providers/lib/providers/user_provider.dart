import 'package:flutter/material.dart';
import 'package:flutter_providers/models/user.dart';


class UserProvider extends ChangeNotifier {
  late User user;

  void updateUser(User newUser) {
    user = newUser;
    notifyListeners();
  }
}