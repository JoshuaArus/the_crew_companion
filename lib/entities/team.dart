import 'dart:convert';

import 'package:collection/collection.dart';

import 'mission.dart';

class Team {
  
  String name = "";
  DateTime creationDate = DateTime.now();
  List<String> players = [];
  List<Mission> achievedMissions = [];

  Team.empty();

  Team(
    this.name,
    this.players,
    this.achievedMissions,
  );

  Team copyWith({
    String? name,
    List<String>? players,
    List<Mission>? achievedMissions,
  }) {
    return Team(
      name ?? this.name,
      players ?? this.players,
      achievedMissions ?? this.achievedMissions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'players': players,
      'achievedMissions': achievedMissions.map((x) => x.toMap()).toList(),
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      map['name'],
      List<String>.from(map['players']),
      List<Mission>.from(map['achievedMissions']?.map((x) => Mission.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source));

  @override
  String toString() => 'Team(name: $name, players: $players, achievedMissions: $achievedMissions)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is Team &&
      other.name == name &&
      listEquals(other.players, players) &&
      listEquals(other.achievedMissions, achievedMissions);
  }

  @override
  int get hashCode => name.hashCode ^ players.hashCode ^ achievedMissions.hashCode;
}
