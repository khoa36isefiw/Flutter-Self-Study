import 'package:flutter/material.dart';
import 'package:lesson52_dark_theme/Theme/theme_preference.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark; // check case is dark or not
  late ThemePreference _preference;

  // constructor
  ThemeModel() {
    _isDark = false;
    _preference = ThemePreference();
  }

  // getter
  bool get isDark {
    return _isDark;
  }

  // setter
  set isDark(bool value) {
    _isDark = value;
    _preference.setTheme(value);
    notifyListeners(); // listen everything change
  }

  getPreference() async {
    _isDark = await _preference.getTheme();
    notifyListeners();
  }
}
