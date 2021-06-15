import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';
import 'entities/mission.dart';
import 'entities/team.dart';
import 'story.dart';

class Controller {
  
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
      this.teams = (jsonDecode(data) as List<dynamic>).map((t) => Team.fromJson(t)).toList();
    }
    return true;
  }
}