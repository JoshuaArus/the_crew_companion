import 'dart:convert';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/ruleChapter.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/services/missionService.dart';
import 'package:the_crew_companion/services/ruleService.dart';

class Controller {
  late PackageInfo infos;

  String get storageKey => infos.packageName;
  String get appName => infos.appName;
  String get appVersion => infos.version;
  String get buildNumber => infos.buildNumber;

  Future<void> init() async {
    infos = await PackageInfo.fromPlatform();
  }

  List<Team> teams = [];
  final List<Mission> missions = [];
  final List<RuleChapter> rules = [];

  Future<void> saveTeams() async {
    final serializedTeams = jsonEncode(teams);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(storageKey, serializedTeams);
  }

  Future<bool> readTeams() async {
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

  Future<void> populateRules() async {
    if (this.rules.isNotEmpty) {
      return;
    }
    this.rules.addAll(RuleService.getChapters());
  }

  Future<void> populateMissions() async {
    if (this.missions.isNotEmpty) {
      return;
    }
    this.missions.addAll(MissionService.getMissions());
  }
}
