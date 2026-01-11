import 'package:flutter/material.dart';
import 'light_mode.dart';
import 'dark_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  // Direct brightness check karein, ye zyada reliable hai
  bool get isDarkMode => _themeData.brightness == Brightness.dark;

  void toggleTheme() {
    if (isDarkMode) {
      _themeData = lightTheme;
    } else {
      _themeData = darkTheme;
    }
    notifyListeners();
  }
}