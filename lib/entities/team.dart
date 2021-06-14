import 'dart:convert';

import 'mission.dart';

class Team {
  
  String name = "";
  DateTime creationDate = DateTime.now();
  List<String> players = [];
  List<Mission> achievedMissions = [];

  Team();

  Team.fromData({
    required this.name,
    required this.creationDate,
    required this.players,
    required this.achievedMissions
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    List<String> players = (jsonDecode(json['players']) as List<dynamic>).map((p) => p.toString()).toList();
    List<Mission> achievedMissions = (jsonDecode(json['achievedMissions']) as List<dynamic>).map((am) => Mission.fromJson(am)).toList();
    return Team.fromData(
      name : json['name'] as String,
      creationDate : DateTime.parse(json['creationDate']),
      players : players,
      achievedMissions : achievedMissions
    );
  }

  Map toJson() => {
    "name": name,
    "creationDate": creationDate.toString(),
    "players": jsonEncode(players),
    "achievedMissions": jsonEncode(achievedMissions)
  };
}