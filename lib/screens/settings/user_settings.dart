import 'package:flutter/material.dart';

class ThemeConfiguration extends ChangeNotifier {
  bool autoMute = false;
  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
  }
}
