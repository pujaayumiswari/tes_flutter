
import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/src/models/user.dart';


class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}
