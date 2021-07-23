import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/missionExpansionPanelList.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:darq/darq.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';

class TeamStatsScreen extends LandscapableScreen {
  const TeamStatsScreen({required Controller controller, required this.team})
      : super(controller: controller);

  final Team team;

  @override
  _TeamStatsScreenState createState() => _TeamStatsScreenState();
}

class _TeamStatsScreenState extends State<TeamStatsScreen>
    with LandscapableScreenState {
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
  Widget buildBody(BuildContext context) {
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
                  child: Text(AppLocalizations.translate('teamPlayers') +
                      " : " +
                      widget.team.players.join(", ")),
                ),
                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Text(AppLocalizations.translate('teamNoMission')),
                ),
              ])
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text(AppLocalizations.translate('teamPlayers') +
                        " : " +
                        widget.team.players.join(", ")),
                  ),
                  Container(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Text(AppLocalizations.translate(
                        'teamMissionsAchievedOnTotal', {
                      'missionAchievedCount':
                          widget.team.achievedMissions.length.toString(),
                      'missionTotalCount':
                          widget.controller.missions.length.toString()
                    })),
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
                        Text(AppLocalizations.translate(
                                'teamTotalAttemptsCount') +
                            " : "),
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
