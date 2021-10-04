import 'dart:async';

import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/entities/achievedMission.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/views/components/customDrawer.dart';
import 'package:the_crew_companion/views/components/missionDescription.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';
import 'package:the_crew_companion/views/screens/teamStatsScreen.dart';

class PlayGameScreen extends LandscapableScreen {
  const PlayGameScreen({required this.team, required Controller controller})
      : super(controller: controller);

  final Team team;

  @override
  _PlayGameScreenState createState() => _PlayGameScreenState();
}

class _PlayGameScreenState extends State<PlayGameScreen>
    with LandscapableScreenState {
  TextEditingController comment = TextEditingController(text: "");
  TextEditingController attempts = TextEditingController(text: "");
  bool satUsed = false;
  DateTime? missionStartDate;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (_) => setState(() {}));
  }

  void _startTimer() {
    setState(() {
      missionStartDate = DateTime.now();
    });
  }

  void _setSwitch(bool value) {
    setState(() {
      satUsed = value;
    });
  }

  Future<void> _endCurrentMission(Mission mission) async {
    final bool confirmed = await confirm(
      context,
      content: Text(AppLocalizations.translate('commonValidateEntry')),
      textOK: Text(AppLocalizations.translate('commonYes')),
      textCancel: Text(AppLocalizations.translate('commonNo')),
      title: Text(AppLocalizations.translate('gameValidateMission')),
    );

    if (confirmed == true) {
      widget.team.achievedMissions.add(
        AchievedMission(
          id: mission.id,
          attempts: int.parse(attempts.text == "" ? "1" : attempts.text),
          satelliteUsed: satUsed,
          comment: comment.text,
          durationInSeconds: missionStartDate == null
              ? null
              : DateTime.now().difference(missionStartDate!).inSeconds,
        ),
      );
      missionStartDate = null;
      comment.text = "";
      await widget.controller.saveTeams();
      attempts.text = "";
      satUsed = false;
      setState(() {});
    }
  }

  String _printDuration() {
    final Duration d = DateTime.now().difference(missionStartDate!);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget buildBody(BuildContext context) {
    final Mission currentMission = widget.controller.missions
        .firstWhere(
            (element) => element.id == widget.team.achievedMissions.length)
        .copyWith();

    return Scaffold(
      drawer: MediaQuery.of(context).orientation == Orientation.landscape
          ? null
          : Drawer(
              child: CustomDrawer(
                controller: widget.controller,
              ),
            ),
      appBar: AppBar(
        title: Text(currentMission.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeamStatsScreen(
                      controller: widget.controller, team: widget.team),
                ),
              );
            },
            icon: const FaIcon(
              FontAwesomeIcons.calculator,
            ),
            tooltip: AppLocalizations.translate('gameTeamStatistics'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
            defaultPadding, defaultPadding, defaultPadding, 100),
        child: Column(
          children: [
            MissionDescription(mission: currentMission),
            const Divider(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "${AppLocalizations.translate('gameAttemptsCount')} : "),
                    SizedBox(
                      width: 70,
                      child: TextField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(defaultPadding),
                          hintText: "1",
                          border: OutlineInputBorder(),
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
                    Text(
                        "${AppLocalizations.translate('gameSatelliteUsage')} : "),
                    Switch(
                      activeColor: primaryColor,
                      value: satUsed,
                      onChanged: _setSwitch,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${AppLocalizations.translate('gameTimeElapsed')} : "),
                    Text(
                      missionStartDate == null ? "-" : _printDuration(),
                    ),
                  ],
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${AppLocalizations.translate('commonComments')} : "),
                    SizedBox(
                      height: 100,
                      child: TextField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(defaultPadding),
                          hintText: "",
                          border: OutlineInputBorder(),
                        ),
                        controller: comment,
                        maxLines: 5,
                        minLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: missionStartDate == null
          ? FloatingActionButton.extended(
              onPressed: () {
                _startTimer();
              },
              label: Text(AppLocalizations.translate('gameStartTimer')),
              icon: const FaIcon(FontAwesomeIcons.clock),
            )
          : FloatingActionButton.extended(
              onPressed: () {
                _endCurrentMission(currentMission);
              },
              label: Text(AppLocalizations.translate('gameValidateMission')),
              icon: const Icon(Icons.check),
            ),
    );
  }
}
