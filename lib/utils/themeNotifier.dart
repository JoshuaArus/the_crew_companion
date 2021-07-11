import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/customThemes.dart';

class ThemeNotifier extends ChangeNotifier {
  CustomThemes _theme;

  ThemeNotifier({required CustomThemes theme}) : this._theme = theme;

  CustomThemes getTheme() {
    return _theme.copy; //copy to avoid ref override
  }

  ThemeData getThemeData() {
    return _theme.getThemeData();
  }

  void setTheme(CustomThemes newTheme) async {
    _theme = newTheme;
    notifyListeners();
  }
}
