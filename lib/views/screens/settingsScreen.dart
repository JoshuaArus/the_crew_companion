import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/customThemes.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/utils/themeNotifier.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';

class SettingsScreen extends LandscapableScreen {
  const SettingsScreen({required Controller controller})
      : super(controller: controller);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with LandscapableScreenState {
  late String currentLanguage;
  late CustomThemes currentTheme;
  double dropdownButtonWidth = 100;

  @override
  Widget buildBody(BuildContext context) {
    final appLocalizations = Provider.of<AppLocalizations>(context);
    currentLanguage = appLocalizations.getLocale()!.languageCode;

    final themeNotifier = Provider.of<ThemeNotifier>(context);
    currentTheme = themeNotifier.getTheme();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.translate('settingsTitle'),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            ListTile(
              title: Text(
                AppLocalizations.translate('settingsLanguage'),
              ),
              trailing: SizedBox(
                width: dropdownButtonWidth,
                child: DropdownButton<String>(
                  value: currentLanguage,
                  isExpanded: true,
                  onChanged: (String? newLanguage) {
                    if (newLanguage == null) return;
                    appLocalizations.setLocale(Locale(newLanguage));
                    setState(
                      () {
                        currentLanguage = newLanguage;
                      },
                    );
                  },
                  items: LanguageCodes.values
                      .map(
                        (language) => DropdownMenuItem<String>(
                          value: language.value,
                          child: Text(language.displayValue),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            ListTile(
              title: Text(
                AppLocalizations.translate('settingsTheme'),
              ),
              trailing: SizedBox(
                width: dropdownButtonWidth,
                child: DropdownButton<CustomThemes>(
                  value: currentTheme,
                  isExpanded: true,
                  onChanged: (CustomThemes? newTheme) {
                    if (newTheme == null) return;
                    themeNotifier.setTheme(newTheme);
                    setState(
                      () {
                        currentTheme = newTheme;
                      },
                    );
                  },
                  items: CustomThemes.values
                      .map(
                        (theme) => DropdownMenuItem<CustomThemes>(
                          value: theme,
                          child: Text(theme.value),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
