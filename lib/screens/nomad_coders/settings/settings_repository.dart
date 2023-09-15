import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  final SharedPreferences _preferences;
  static const key = "theme";
  SettingsRepository(this._preferences);
  Future<bool> isDarkMode() async {
    return _preferences.getBool(key) ?? false;
  }

  Future<void> setTheme(bool isDarkMode) async {
    await _preferences.setBool(key, isDarkMode);
  }
}
