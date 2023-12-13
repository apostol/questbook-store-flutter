import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class PreferencesProvider {
  static PreferencesProvider get instance => _instance;
  static PreferencesProvider _instance = PreferencesProvider._();
  SharedPreferences? _sharedPreferences;
  PreferencesProvider._() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
      if (value.getBool('firstStart') == null || kDebugMode) {
        value.setBool('firstStart', false);
        setUID(Uuid().v4());
      }
    });
  }
  Future<void> get waitInit => Future.doWhile(() async {
        if (_sharedPreferences != null) {
          return false;
        }
        await Future.delayed(Duration(milliseconds: 100));
        return _sharedPreferences == null;
      });

  Future<void> setFirstStart(bool start) async {
    await _sharedPreferences!.setBool('firstStart', start);
  }

  Future<bool?> getFirstStart() async {
    return _sharedPreferences!.getBool('firstStart');
  }

  Future<void> setUID(String id) async {
    await _sharedPreferences!.setString('id', id);
  }

  Future<String?> getUID() async {
    return _sharedPreferences!.getString('id');
  }
}
