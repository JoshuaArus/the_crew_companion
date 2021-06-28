import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(Locale locale) {
    _locale = locale;
  }

  static final Locale fallbackLocale = Locale(LanguageCodes.fr.value);

  static final List<Locale> supportedLocales = [
    Locale(LanguageCodes.fr.value),
    Locale(LanguageCodes.en.value)
  ];

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  AppLocalizations._init(Locale locale) {
    _locale = locale;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static late Locale _locale;
  static Map<String, String> _localizedStrings = {};
  static Map<String, String> _fallbackLocalizedStrings = {};

  Future<void> load() async {
    _localizedStrings = await _loadLocalizedStrings(_locale);
    _fallbackLocalizedStrings = {};

    if (_locale != fallbackLocale) {
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

  static String translate(String key,
      [Map<String, String> arguments = const {}]) {
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

  static String getCurrentLanguage() {
    return _locale.languageCode.toLowerCase().split('_').first;
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

enum LanguageCodes {
  fr,
  en,
}

extension LanguagesCodeExtension on LanguageCodes {
  String get value => describeEnum(this);

  String get displayValue {
    switch (this) {
      case LanguageCodes.fr:
        return AppLocalizations.translate('settingsLanguageFr');

      case LanguageCodes.en:
        return AppLocalizations.translate('settingsLanguageEn');

      default:
        return this.value;
    }
  }
}
