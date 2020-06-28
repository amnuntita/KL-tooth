import 'package:flutter/material.dart';
import 'package:khunlook/themes/app_themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme;

  ThemeProvider(AppTheme theme) : _currentTheme = appThemeData[theme];

  get currentTheme => _currentTheme;

  void setTheme(AppTheme theme) {
    _currentTheme = appThemeData[theme];
    notifyListeners();
  }
}
