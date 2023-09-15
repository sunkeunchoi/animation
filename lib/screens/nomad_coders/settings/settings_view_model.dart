import 'package:flutter/material.dart';

import 'settings_repository.dart';

class SettingsViewModel extends ChangeNotifier {
  final SettingsRepository _repository;
  SettingsViewModel(this._repository);
  late final bool theme = _repository.getTheme;
  void setTheme(bool value) {
    _repository.setTheme(value);
    notifyListeners();
  }

  void toggleTheme() => setTheme(!theme);
  bool get isDark => theme;
}
