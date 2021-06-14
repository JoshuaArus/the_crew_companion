import 'package:flutter/material.dart';

class Team {
  
  String name;
  List<String> players;
  List<Mission> achievedMission;
  int test;
  Int test2;
  
  Team(this.name){
    players = List<String>();
    achievedMission = List<Mission>();
  }

  Team(this.name, this.players, this.achievedMission);
}