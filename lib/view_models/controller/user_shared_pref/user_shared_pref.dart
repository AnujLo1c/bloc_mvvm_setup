import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/models/user.dart';
import '../../../domain/models/google_user_model.dart';

class UserSharedPref{

  static const String _userKey = "userData";


  static Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userData = jsonEncode(user.toMap());
    await prefs.setString(_userKey, userData);
  }


  static Future<UserModel?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString(_userKey);

      print(userData);
    if (userData != null) {
      Map<String, dynamic> userMap = jsonDecode(userData);
      return UserModel.fromMap(userMap);
    }
    return null;
  }

  static Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  //google
  static const String _googleUserKey = "googleUser";


  static Future<void> saveGoogleUser(GoogleUserModel user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String userData = jsonEncode(user.toMap());
  await prefs.setString(_googleUserKey, userData);
  }


  static Future<GoogleUserModel?> getGoogleUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userData = prefs.getString(_googleUserKey);
print(userData);
  if (userData != null) {
  Map<String, dynamic> userMap = jsonDecode(userData);
  return GoogleUserModel.fromMap(userMap);
  }
  return null;
  }


  static Future<void> clearGoogleUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(_googleUserKey);
  }


}