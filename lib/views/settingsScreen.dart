import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/customThemes.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';

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
  void initState() {
    super.initState();

    currentLanguage = AppLocalizations.getCurrentLanguage();
    currentTheme = CustomThemes.Dark;
  }

  @override
  Widget build(BuildContext context) {
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
                        //TODO save language, reload translations, etc...
                        setState(() {
                          currentLanguage = newLanguage ??
                              AppLocalizations.fallbackLocale.languageCode;
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
                        //TODO save theme, reload interface, etc...
                        setState(() {
                          currentTheme = newTheme ?? CustomThemes.Dark;
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
