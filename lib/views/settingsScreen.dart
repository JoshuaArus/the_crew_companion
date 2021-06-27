import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/customThemes.dart';

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

    currentLanguage = "fr";
    currentTheme = CustomThemes.Dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paramètres",
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
                    "Langue",
                  ),
                  Container(
                    width: dropdownButtonWidth,
                    child: DropdownButton<String>(
                      value: currentLanguage,
                      isExpanded: true,
                      onChanged: (String? newLanguage) {
                        //TODO save language, reload translations, etc...
                        setState(() {
                          currentLanguage = newLanguage ?? "fr";
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: "en",
                          child: Text("Anglais"),
                        ),
                        DropdownMenuItem<String>(
                          value: "fr",
                          child: Text("Français"),
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
                    "Thème",
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
                          child: Text("Dark"),
                        ),
                        DropdownMenuItem<CustomThemes>(
                          value: CustomThemes.Light,
                          child: Text("Light"),
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
