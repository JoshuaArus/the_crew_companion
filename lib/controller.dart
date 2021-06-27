import 'dart:convert';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/story.dart';

class Controller {
  late PackageInfo infos;

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
      this.teams = List<Team>.from(jsonDecode(data).map((t) => Team.fromMap(t)));
    }
    return true;
  }
}
