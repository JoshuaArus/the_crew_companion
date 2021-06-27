import 'package:flutter/material.dart';
import 'package:the_crew_companion/customThemes.dart';

class ThemeNotifier extends ChangeNotifier {
  CustomThemes _theme;

  ThemeNotifier({CustomThemes theme = CustomThemes.Dark}) : this._theme = theme;

  getTheme() {
    return _theme.copy; //copy to avoid ref override
  }

  getThemeData() {
    return _theme.getThemeData();
  }

  setTheme(CustomThemes newTheme) async {
    _theme = newTheme;
    notifyListeners();
  }
}
