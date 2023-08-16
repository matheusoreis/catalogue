import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalStorage {
  Future<String?> loadString(String key);
  Future<bool?> loadBool(String key);
  Future<int?> loadInt(String key);
  Future<double?> loadDouble(String key);
  Future<Map<String, dynamic>?> loadMap(String key);

  Future<void> saveString(String key, String value);
  Future<void> saveBool(String key, bool value);
  Future<void> saveInt(String key, int value);
  Future<void> saveDouble(String key, double value);
  Future<void> saveMap(String key, Map<String, dynamic> map);

  Future<void> deleteData(String key);
}

class SharedPreferenceService implements ILocalStorage {
  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  @override
  Future<String?> loadString(String key) async {
    SharedPreferences prefs = await _getInstance();
    return prefs.getString(key);
  }

  @override
  Future<int?> loadInt(String key) async {
    SharedPreferences prefs = await _getInstance();
    return prefs.getInt(key);
  }

  @override
  Future<double?> loadDouble(String key) async {
    SharedPreferences prefs = await _getInstance();
    return prefs.getDouble(key);
  }

  @override
  Future<Map<String, dynamic>?> loadMap(String key) async {
    SharedPreferences prefs = await _getInstance();
    String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      return json.decode(jsonString);
    } else {
      return null;
    }
  }

  @override
  Future<void> saveString(String key, String value) async {
    SharedPreferences prefs = await _getInstance();
    prefs.setString(key, value);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    SharedPreferences prefs = await _getInstance();
    prefs.setBool(key, value);
  }

  @override
  Future<bool?> loadBool(String key) async {
    SharedPreferences prefs = await _getInstance();
    return prefs.getBool(key);
  }

  @override
  Future<void> saveInt(String key, int value) async {
    SharedPreferences prefs = await _getInstance();
    prefs.setInt(key, value);
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    SharedPreferences prefs = await _getInstance();
    prefs.setDouble(key, value);
  }

  @override
  Future<void> saveMap(String key, Map<String, dynamic> map) async {
    SharedPreferences prefs = await _getInstance();
    prefs.setString(key, json.encode(map));
  }

  @override
  Future<void> deleteData(String key) async {
    SharedPreferences prefs = await _getInstance();
    prefs.remove(key);
  }
}
