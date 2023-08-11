import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Navigation
void navigateWithPushNamedAndRemoveUntil(
    BuildContext context, String newRouteName) {
  Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false);
}

Future<bool?> setSignInStatus(bool status) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setBool('IS_SIGN_IN', status);
}

Future<bool?> getSignInStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('IS_SIGN_IN');
}
