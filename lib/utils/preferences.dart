import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences instance = Preferences._internal();
  static SharedPreferences? _prefs;

  Preferences._internal();

  factory Preferences() {
    return instance;
  }

  FutureOr<SharedPreferences> get prefs async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  // set

  void setString(String key, String value) async {
    var x = await prefs;
    await x.setString(key, value);
  }

  void setBool(String key, bool value) async {
    var x = await prefs;
    await x.setBool(key, value);
  }

  void setAsJson(String key, Map<String, dynamic> json) async {
    var x = await prefs;
    await x.setString(key, jsonEncode(json));
  }

  // get

  FutureOr<String?> getString(String key) async {
    var x = await prefs;
    return x.getString(key);
  }

  FutureOr<bool?> getBool(String key) async {
    var x = await prefs;
    return x.getBool(key);
  }

  FutureOr<Map<String, dynamic>?> getAsJson(String key) async {
    var x = await prefs;
    var jsonData = x.getString(key);
    if (jsonData != null) return jsonDecode(jsonData);
    return null;
  }

  // hapus

  void remove(String key) async {
    var x = await prefs;
    await x.remove(key);
  }
}
