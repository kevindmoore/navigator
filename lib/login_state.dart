
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class LoginState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _loggedIn = false;

  LoginState(this.prefs) {
    loggedIn = prefs.getBool(loggedInKey) ?? false;
  }

  bool get loggedIn => _loggedIn;
  set loggedIn(bool value) {
    _loggedIn = value;
    notifyListeners();
  }

  void checkLoggedIn() {
    loggedIn = prefs.getBool(loggedInKey) ?? false;
  }
}