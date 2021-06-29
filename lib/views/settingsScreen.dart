import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/customThemes.dart';
import 'package:the_crew_companion/languageNotifier.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/themeNotifier.dart';

class SettingsScreen extends StatefulWidget {
  final Controller controller;

  const SettingsScreen({required this.controller});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late String currentLanguage;
  late CustomThemes currentTheme;
  double dropdownButtonWidth = 100;

  @override
  Widget build(BuildContext context) {
    final languageNotifier = Provider.of<LanguageNotifier>(context);
    currentLanguage = AppLocalizations.currentLocale!.languageCode;

    final themeNotifier = Provider.of<ThemeNotifier>(context);
    currentTheme = themeNotifier.getTheme();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.translate('settingsTitle'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.translate('settingsLanguage'),
                  ),
                  Container(
                    width: dropdownButtonWidth,
                    child: DropdownButton<String>(
                      value: currentLanguage,
                      isExpanded: true,
                      onChanged: (String? newLanguage) {
                        if (newLanguage == null) return;
                        languageNotifier.setLocale(Locale(newLanguage));
                        setState(() {
                          currentLanguage = newLanguage;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: LanguageCodes.en.value,
                          child: Text(LanguageCodes.en.displayValue),
                        ),
                        DropdownMenuItem<String>(
                          value: LanguageCodes.fr.value,
                          child: Text(LanguageCodes.fr.displayValue),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.translate('settingsTheme'),
                  ),
                  Container(
                    width: dropdownButtonWidth,
                    child: DropdownButton<CustomThemes>(
                      value: currentTheme,
                      isExpanded: true,
                      onChanged: (CustomThemes? newTheme) {
                        if (newTheme == null) return;
                        themeNotifier.setTheme(newTheme);
                        setState(() {
                          currentTheme = newTheme;
                        });
                      },
                      items: [
                        DropdownMenuItem<CustomThemes>(
                          value: CustomThemes.Dark,
                          child: Text(CustomThemes.Dark.value),
                        ),
                        DropdownMenuItem<CustomThemes>(
                          value: CustomThemes.Light,
                          child: Text(CustomThemes.Light.value),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
