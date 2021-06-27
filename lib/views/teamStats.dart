import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/views/components/missionExpansionPanelList.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:darq/darq.dart';

class TeamStats extends StatefulWidget {
  const TeamStats({required this.controller, required this.team});

  final Team team;
  final Controller controller;

  @override
  _TeamStatsState createState() => _TeamStatsState();
}

class _TeamStatsState extends State<TeamStats> {
  late List<Mission> achievedMissions;

  @override
  void initState() {
    super.initState();

    achievedMissions = widget.team.achievedMissions.select<Mission>(
      (achievedMission, i) {
        Mission mission = widget.controller.missions
            .firstWhere((m) => m.id == achievedMission.id)
            .copyWith();
        mission.attempts = achievedMission.attempts;
        mission.satelliteUsed = achievedMission.satelliteUsed;
        return mission;
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: (widget.team.achievedMissions.length == 0)
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Text(
                    "Joueurs : " + widget.team.players.join(", "),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Text("Aucune mission réalisée jusqu'à présent"),
                ),
              ])
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text(
                      "Joueurs : " + widget.team.players.join(", "),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text(
                      "Missions réalisées : " +
                          widget.team.achievedMissions.length.toString() +
                          " / " +
                          widget.controller.missions.length.toString(),
                    ),
                  ),
                  MissionExpansionPanelList(
                    missions: achievedMissions,
                    expandedMissionId: widget.team.achievedMissions.last.id,
                  ),
                  Container(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nombre de tentatives totales : "),
                        Text(
                          widget.team.achievedMissions
                              .map((e) => e.attempts)
                              .reduce(
                                  (value, element) => value = value + element)
                              .toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
