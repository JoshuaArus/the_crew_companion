import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_crew_companion/story.dart';

import 'constant.dart';
import 'controller.dart';
import 'entities/team.dart';
import 'views/teamList.dart';

void main() {
  runApp(TheCrewCompanionApp());
}

class TheCrewCompanionApp extends StatelessWidget {

  final String appTitle = 'The Crew Companion';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Team cg = Team();
    cg.name = "Crazy Geeks";
    cg.players = ["Joshua", "Régis", "Charlotte", "Sarah"];
    cg.achievedMissions = Story.missions.getRange(0,5).toList();
    
    Controller controller = Controller();

    controller.teams.add(cg);

    return MaterialApp(
      
      title: appTitle,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
      ),
      home: TeamList(controller: controller, title: appTitle),
    );
  }
}
