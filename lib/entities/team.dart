import 'dart:convert';

import 'package:the_crew_companion/entities/achievedMission.dart';

class Team {
  late String name;
  late DateTime creationDate;
  late List<String> players;
  late List<AchievedMission> achievedMissions;

  Team() {
    name = "";
    creationDate = DateTime.now();
    players = [];
    achievedMissions = [];
  }

  Team.fromData(
      {required this.name,
      required this.creationDate,
      required this.players,
      required this.achievedMissions});

  factory Team.fromJson(Map<String, dynamic> json) {
    List<String> players = (jsonDecode(json['players']) as List<dynamic>)
        .map((p) => p.toString())
        .toList();
    List<AchievedMission> achievedMissions =
        (jsonDecode(json['achievedMissions']) as List<dynamic>)
            .map((am) => AchievedMission.fromJson(am))
            .toList();
    return Team.fromData(
        name: json['name'] as String,
        creationDate: DateTime.parse(json['creationDate']),
        players: players,
        achievedMissions: achievedMissions);
  }

  Map toJson() => {
        "name": name,
        "creationDate": creationDate.toString(),
        "players": jsonEncode(players),
        "achievedMissions": jsonEncode(achievedMissions)
      };
}
