import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';

class LanguageNotifier extends ChangeNotifier {
  setLocale(Locale newLocale) async {
    await AppLocalizations.delegate.load(newLocale);
    notifyListeners();
  }
}
