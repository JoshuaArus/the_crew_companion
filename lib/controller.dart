import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_crew_companion/customThemes.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/story.dart';

class Controller {
  late PackageInfo infos;

  CustomThemes currentTheme = CustomThemes.Dark;
  String get storageKey => infos.packageName;
  String get developper => "Joshua Arus";
  String get appName => infos.appName;
  String get appVersion => infos.version;
  String get buildNumber => infos.buildNumber;

  Future<void> init() async {
    infos = await PackageInfo.fromPlatform();
  }

  List<Team> teams = [];
  final List<Mission> missions = Story.missions;

  Future<void> saveDatas() async {
    final serializedTeams = jsonEncode(teams);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(storageKey, serializedTeams);
  }

  Future<bool> readDatas() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(storageKey) ?? "";
    if (data != "") {
      this.teams = (jsonDecode(data) as List<dynamic>)
          .map(
            (t) => Team.fromJson(t),
          )
          .toList();
    }
    return true;
  }

  void setCurrentTheme(CustomThemes newTheme) {
    if (newTheme == currentTheme) return;

    currentTheme = newTheme;
    //TODO refresh UI
  }

  ThemeData getCurrentTheme() {
    switch (currentTheme) {
      case CustomThemes.Dark:
        return CustomTheme.dark;
      case CustomThemes.Light:
        return CustomTheme.light;
    }
  }
}
