import 'package:flutter/material.dart';

import 'settings_repository.dart';

class SettingsViewModel extends ChangeNotifier {
  final SettingsRepository _localDb;
  SettingsViewModel(this._localDb) {
    _getThemeMode();
  }
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  Future<void> _getThemeMode() async {
    final isDarkMode = await _localDb.isDarkMode();
    if (isDarkMode == true) {
      _themeMode = ThemeMode.dark;
      notifyListeners();
    } else if (isDarkMode == false) {
      _themeMode = ThemeMode.light;
      notifyListeners();
    }
  }

  Future<void> toggleTheme(BuildContext context) async {
    switch (_themeMode) {
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        _themeMode = ThemeMode.light;
        break;
      case ThemeMode.system:
        if (Theme.of(context).scaffoldBackgroundColor == Colors.white) {
          _themeMode = ThemeMode.dark;
        } else {
          _themeMode = ThemeMode.light;
        }
    }

    notifyListeners();
    await _localDb.setTheme(_themeMode == ThemeMode.dark);
  }
}
