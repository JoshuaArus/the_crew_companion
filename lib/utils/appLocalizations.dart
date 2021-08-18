import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations extends ChangeNotifier {
  static Locale? _locale;
  static Map<String, String> _localizedStrings = {};

  static final List<Locale> supportedLocales = LanguageCodes.values
      .map((languageCode) => Locale(languageCode.value))
      .toList();

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  AppLocalizations(Locale locale) {
    AppLocalizations._init(locale);
  }

  AppLocalizations._init(Locale locale) {
    _locale = locale;
  }

  Locale? getLocale() {
    return _locale;
  }

  Future<void> setLocale(Locale newLocale) async {
    await delegate.load(newLocale);
    notifyListeners();
  }

  Future<void> load() async {
    final String jsonString = await rootBundle
        .loadString('assets/locales/${_locale!.languageCode}.json');

    final Map<String, dynamic> jsonMap =
        json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  static String translate(String key,
      [Map<String, String> arguments = const {}]) {
    String translation = _localizedStrings[key] ?? key;

    if (arguments.isEmpty) {
      return translation;
    }

    arguments.forEach((argumentKey, value) {
      if (value.isEmpty) {
        assert(() {
          //assert run only in debug mode
          // ignore: avoid_print
          print(
            'Value for "$argumentKey" is null in call of translate(\'$key\')',
          );
          return true;
        }());

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
    final isSupported = LanguageCodes.values
        .map((languageCode) => languageCode.value)
        .contains(
            locale.languageCode.toLowerCase().split('_').first.toLowerCase());
    return isSupported;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations._init(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

enum LanguageCodes {
  en,
  fr,
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
        return value;
    }
  }
}
