import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'settings_repository.dart';

class SettingsViewModel extends AsyncNotifier<bool> {
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
    } else if (isDarkMode == false) {
      _themeMode = ThemeMode.light;
    }
  }

  Future<void> toggleTheme() async {
    state = const AsyncValue.loading();
    switch (_themeMode) {
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        _themeMode = ThemeMode.light;
        break;
      case ThemeMode.system:
        _themeMode = ThemeMode.light;
        break;
    }
    var value = _themeMode == ThemeMode.dark;
    await _localDb.setTheme(value);
    state = AsyncValue.data(value);
  }

  @override
  FutureOr<bool> build() async {
    var isDark = await _localDb.isDarkMode();
    print("$isDark from settings_view_model.dart");
    return isDark;
  }
}

final settingProvider = AsyncNotifierProvider<SettingsViewModel, bool>(
  () => throw UnimplementedError(),
);
