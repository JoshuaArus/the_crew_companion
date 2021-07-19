//ignore_for_file: ARGUMENT_TYPE_NOT_ASSIGNABLE
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:the_crew_companion/entities/achievedMission.dart';

class Team {
  String name = "";
  DateTime creationDate = DateTime.now();
  List<String> players = [];
  List<AchievedMission> achievedMissions = [];

  Team.empty();

  Team({
    required this.name,
    required this.creationDate,
    required this.players,
    required this.achievedMissions,
  });

  Team copyWith({
    String? name,
    DateTime? creationDate,
    List<String>? players,
    List<AchievedMission>? achievedMissions,
  }) {
    return Team(
      name: name ?? this.name,
      creationDate: creationDate ?? this.creationDate,
      players: players ?? this.players,
      achievedMissions: achievedMissions ?? this.achievedMissions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'players': players,
      'achievedMissions': achievedMissions.map((x) => x.toMap()).toList(),
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      name: map['name'],
      creationDate: DateTime.fromMillisecondsSinceEpoch(map['creationDate']),
      players: List<String>.from(map['players']),
      achievedMissions: List<AchievedMission>.from(
          map['achievedMissions']?.map((x) => AchievedMission.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Team(name: $name, creationDate: $creationDate, players: $players, achievedMissions: $achievedMissions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Team &&
        other.name == name &&
        other.creationDate == creationDate &&
        listEquals(other.players, players) &&
        listEquals(other.achievedMissions, achievedMissions);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        creationDate.hashCode ^
        players.hashCode ^
        achievedMissions.hashCode;
  }
}
