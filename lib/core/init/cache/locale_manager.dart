import 'package:deskmate/core/constants/enums/shared_preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final LocaleManager _instance = LocaleManager._init();

  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;
  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> clearAllSaveFirst() async {
    if (_preferences != null) {
      await _preferences!.clear();
      await setBoolValue(SharedPreferenceKey.IS_FIRST_APP, true);
    }
  }

  Future<void> setStringValue(SharedPreferenceKey key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBoolValue(SharedPreferenceKey key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  String getStringValue(SharedPreferenceKey key) =>
      _preferences?.getString(key.toString()) ?? '';

  bool getBoolValue(SharedPreferenceKey key) =>
      _preferences!.getBool(key.toString()) ?? false;
}
