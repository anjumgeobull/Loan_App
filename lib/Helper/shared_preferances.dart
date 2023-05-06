import 'package:shared_preferences/shared_preferences.dart';

import 'String_constant.dart';

class   SPManager {
  static final SPManager _singleton = SPManager();

  static SPManager get instance => _singleton;

  late SharedPreferences sp;

  Future<bool> _setInt(String key, int value) async {
    sp = await SharedPreferences.getInstance();
    return sp.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    sp = await SharedPreferences.getInstance();
    return sp.getInt(key)??0;
  }

  Future<bool> setUser(String key, String value) async {
    sp = await SharedPreferences.getInstance();
    return sp.setString(key, value);
  }

  Future<String?> getUser(String key) async {
    sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  Future<bool> setUserId(String key, String value) async {
    sp = await SharedPreferences.getInstance();
    return sp.setString(key, value);
  }

  Future<bool> setCompletionStatus(String key, String value) async {
    sp = await SharedPreferences.getInstance();
    return sp.setString(key, value);
  }

  Future<String?> getUserId(String key) async {
    sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  Future<String?> getCompletionStatus(String key) async {
    sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  Future<bool> setProfile(String key, bool value) async {
    sp = await SharedPreferences.getInstance();
    return sp.setBool(key, value);
  }

  Future<bool?> getProfile(String key) async {
    sp = await SharedPreferences.getInstance();
    return sp.getBool(key);
  }

  Future<bool> logout() async {
    sp = await SharedPreferences.getInstance();
    return sp.remove(LOGIN_KEY);
  }

  // Future<bool> setCompletionStatus(String key, String value) async {
  //   sp = await SharedPreferences.getInstance();
  //   return sp.setString(key, value);
  // }
  //
  // Future<String?> getCompletionStatus(String key) async {
  //   sp = await SharedPreferences.getInstance();
  //   return sp.getString(key);
  // }

}