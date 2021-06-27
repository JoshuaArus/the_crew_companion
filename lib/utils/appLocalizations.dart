import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale);
  final Locale fallbackLocale = Locale('fr');

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static late AppLocalizations instance;

  AppLocalizations._init(this.locale) {
    instance = this;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Locale locale;
  Map<String, String> _localizedStrings = {};
  Map<String, String> _fallbackLocalizedStrings = {};

  Future<void> load() async {
    _localizedStrings = await _loadLocalizedStrings(locale);
    _fallbackLocalizedStrings = {};

    if (locale != fallbackLocale) {
      _fallbackLocalizedStrings = await _loadLocalizedStrings(fallbackLocale);
    }
  }

  Future<Map<String, String>> _loadLocalizedStrings(
      Locale localeToBeLoaded) async {
    String jsonString;
    Map<String, String> localizedStrings = {};

    try {
      jsonString = await rootBundle
          .loadString('assets/locales/${localeToBeLoaded.languageCode}.json');
    } catch (exception) {
      print(exception);
      return localizedStrings;
    }

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return localizedStrings;
  }

  String translate(String key, [Map<String, String> arguments = const {}]) {
    String translation = _localizedStrings[key] ?? "";
    translation = translation.isEmpty
        ? _fallbackLocalizedStrings[key] ?? ""
        : translation;

    if (arguments.length == 0) {
      return translation;
    }

    arguments.forEach((argumentKey, value) {
      if (value.isEmpty) {
        print(
            'Value for "$argumentKey" is null in call of translate(\'$key\')');
        value = '';
      }
      translation = translation.replaceAll("\$$argumentKey", value);
    });

    return translation;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations._init(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
