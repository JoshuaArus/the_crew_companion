import 'mission.dart';

class Team {
  
  String name = "";
  DateTime creationDate = DateTime.now();
  List<String> players = [];
  List<Mission> achievedMissions = [];

  Team();

  Team.withName(this.name);
}