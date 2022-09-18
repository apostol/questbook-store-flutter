import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';


class PreferencesProvider {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance()
    .then((value) {
      if (value.getBool('firstStart') == null || kDebugMode) {
        value.setBool('firstStart', false);
        setUID(Uuid().v4());
      }
      return value;
    });

  static void setFirstStart(bool _start) async => await _prefs.then((value) => value.setBool('firstStart', _start));
  static Future<bool> getFirstStart() async => _prefs.then((value)=>Future.value(value.getBool('firstStart')));

  static void setUID(String id) async => await _prefs.then((value) => value.setString('id', id));
  static Future<String> getUID() async => _prefs.then((value) => Future.value(value.getString('id')));

}