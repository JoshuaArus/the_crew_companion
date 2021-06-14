import 'dart:convert';

import 'package:localstorage/localstorage.dart';

import 'entities/mission.dart';
import 'entities/team.dart';
import 'story.dart';

class Controller {
  final List<Team> teams = [];
  final List<Mission> missions = Story.missions;
  final LocalStorage storage = LocalStorage("the_crew_companion");

  Future saveDatas() {
    final serializedTeams = jsonEncode(teams);
    return storage.setItem("teams", serializedTeams);
  }

  void readDatas() {
    teams.clear();
    String data = storage.getItem("teams") ?? "";
    if (data != "") {
      List<Team> teams = jsonDecode(data).map((t) => Team.fromJson(t)).toList();
      teams.addAll(teams);
    }
  }
}