import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  final SharedPreferences _preferences;
  static const _theme = "thtme";
  SettingsRepository(this._preferences);
  Future<void> setTheme(bool value) async => _preferences.setBool(_theme, value);
  bool get getTheme => _preferences.getBool(_theme) ?? false;
}
