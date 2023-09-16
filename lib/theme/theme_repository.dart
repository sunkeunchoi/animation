import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  final SharedPreferences _preferences;
  static const key = "theme";
  ThemeRepository(this._preferences);
  Future<bool> isDarkMode() async {
    return _preferences.getBool(key) ?? false;
  }

  Future<void> setTheme(bool isDarkMode) async {
    await _preferences.setBool(key, isDarkMode);
  }
}
