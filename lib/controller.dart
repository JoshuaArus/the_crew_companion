import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/ruleChapter.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/services/missionService.dart';
import 'package:the_crew_companion/services/ruleService.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/utils/customThemes.dart';
import 'package:the_crew_companion/utils/themeNotifier.dart';

class Controller {
  late PackageInfo infos;

  String get storageKey => "com.joshuaarus.the_crew_companion";
  // ignore: prefer_interpolation_to_compose_strings
  String get settingsKey => storageKey + "_settings";
  // ignore: prefer_interpolation_to_compose_strings
  String get teamsKey => storageKey + "_teams";
  String get appName => infos.appName;
  String get appVersion => infos.version;
  String get buildNumber => infos.buildNumber;

  CustomThemes defaultTheme = CustomThemes.Dark;
  Locale defaultLocale = AppLocalizations.supportedLocales.first;

  List<Team> teams = [];
  final List<Mission> missions = [];
  final List<RuleChapter> rules = [];

  Future<void> init() async {
    infos = await PackageInfo.fromPlatform();

    await Future.wait(
      [
        readSettings(),
        readTeams(),
      ],
    );
  }

  Future<void> saveSettings(BuildContext context) async {
    final appLocalizations = Provider.of<AppLocalizations>(context);
    final String currentLanguage = appLocalizations.getLocale()!.languageCode;

    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final String currentTheme = themeNotifier.getTheme().toString();

    final String serializedSettings = json.encode({
      "language": currentLanguage,
      "theme": currentTheme,
    });

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(settingsKey, serializedSettings);
  }

  Future<bool> readSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(settingsKey) ?? "";
    if (data != "") {
      final Map<String, dynamic> serializedSettings =
          jsonDecode(data) as Map<String, dynamic>;
      final String language = serializedSettings["language"].toString();
      final String theme = serializedSettings["theme"].toString();

      if (CustomThemesFactory.exist(theme)) {
        defaultTheme = CustomThemesFactory.fromString(theme);
      }
      defaultLocale = Locale(language);
    }
    return true;
  }

  Future<void> saveTeams() async {
    final serializedTeams = jsonEncode(teams);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(teamsKey, serializedTeams);
  }

  Future<bool> readTeams() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(teamsKey) ?? "";
    if (data != "") {
      teams = (jsonDecode(data) as List<dynamic>)
          .map(
            (dynamic t) => Team.fromJson(t.toString()),
          )
          .toList();
    }
    return true;
  }

  Future<void> populateRules() async {
    if (rules.isNotEmpty) {
      return;
    }
    rules.addAll(GetIt.instance<RuleService>().getChapters());
  }

  Future<void> populateMissions() async {
    if (missions.isNotEmpty) {
      return;
    }
    missions.addAll(GetIt.instance<MissionService>().getMissions());
  }
}
