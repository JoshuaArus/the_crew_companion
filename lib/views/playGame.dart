import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/entities/achievedMission.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/customDrawer.dart';
import 'package:the_crew_companion/views/components/missionDescription.dart';
import 'package:the_crew_companion/views/teamStats.dart';
import 'package:the_crew_companion/controller.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({required this.team, required this.controller});

  final Team team;
  final Controller controller;

  @override
  PlayGameState createState() => PlayGameState();
}

class PlayGameState extends State<PlayGame> {
  TextEditingController attempts = TextEditingController(text: "");
  bool satUsed = false;

  void _setSwitch(value) {
    setState(() {
      satUsed = value;
    });
  }

  void _endCurrentMission(Mission mission) async {
    bool confirmed = await confirm(
      context,
      content: Text(AppLocalizations.instance!.translate('commonValidateEntry')),
      textOK: Text(AppLocalizations.instance!.translate('commonYes')),
      textCancel: Text(AppLocalizations.instance!.translate('commonNo')),
      title: Text(AppLocalizations.instance!.translate('gameValidateMission')),
    );

    if (confirmed == true) {
      widget.team.achievedMissions.add(
        AchievedMission(
          mission.id,
          int.parse(attempts.text == "" ? "1" : attempts.text),
          satUsed,
        ),
      );
      await widget.controller.saveDatas();
      attempts.text = "";
      satUsed = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Mission currentMission = widget.controller.missions
        .firstWhere(
            (element) => element.id == widget.team.achievedMissions.length)
        .copy;

    return Scaffold(
      drawer: CustomDrawer(controller: widget.controller),
      appBar: AppBar(
        title: Text(currentMission.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeamStats(
                      controller: widget.controller, team: widget.team),
                ),
              );
            },
            icon: FaIcon(
              FontAwesomeIcons.calculator,
            ),
            tooltip: AppLocalizations.instance!.translate('gameTeamStatistics'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
            defaultPadding, defaultPadding, defaultPadding, 100),
        child: Column(
          children: [
            MissionDescription(mission: currentMission),
            Divider(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.instance!.translate('gameAttemptsCount') + " : "),
                    Container(
                      width: 70,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(defaultPadding),
                          hintText: "1",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                          ),
                        ),
                        textAlign: TextAlign.right,
                        controller: attempts,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.instance!.translate('gameSatelliteUsage') + " : "),
                    Switch(
                      activeColor: primaryColor,
                      value: satUsed,
                      onChanged: _setSwitch,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _endCurrentMission(currentMission);
        },
        label: Text(AppLocalizations.instance!.translate('gameValidateMission')),
        icon: Icon(Icons.check),
      ),
    );
  }
}
