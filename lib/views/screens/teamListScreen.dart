import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/teamName.dart';
import 'package:the_crew_companion/views/components/teamPlayers.dart';
import 'package:the_crew_companion/views/components/teamProgress.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';
import 'package:the_crew_companion/views/screens/playGameScreen.dart';
import 'package:the_crew_companion/views/screens/teamCreationScreen.dart';
import 'package:the_crew_companion/views/screens/teamStatsScreen.dart';

class TeamListScreen extends StatefulWidget {
  TeamListScreen({required this.controller});

  final Controller controller;

  @override
  _TeamListScreenState createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  void _editTeam(Team team) async {
    final edited = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) =>
            TeamCreationScreen(controller: widget.controller, team: team),
      ),
    );
    if (edited == true) {
      await widget.controller.saveTeams();
      setState(() {}); //refresh UI
    }
  }

  void _resetProgress(Team team) async {
    bool confirmed = await confirm(
      context,
      content: Text(AppLocalizations.translate(
          'teamReinitializeConfirmation', {'teamName': team.name})),
      textOK: Text(AppLocalizations.translate('commonYes')),
      textCancel: Text(AppLocalizations.translate('commonNo')),
      title: Text(AppLocalizations.translate('teamReinitializeProgression')),
    );
    if (confirmed == true) {
      team.achievedMissions.clear();
      await widget.controller.saveTeams();
      setState(() {});
    }
  }

  void _goToStats(Team team) async {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) =>
            TeamStatsScreen(controller: widget.controller, team: team),
      ),
    );
  }

  void _removeTeam(Team team) async {
    bool confirmed = await confirm(
      context,
      content: Text(AppLocalizations.translate(
          'teamDeleteConfirmation', {'teamName': team.name})),
      textOK: Text(AppLocalizations.translate('commonYes')),
      textCancel: Text(AppLocalizations.translate('commonNo')),
      title: Text(AppLocalizations.translate('teamDeletion')),
    );
    if (confirmed == true) {
      widget.controller.teams.remove(team);
      await widget.controller.saveTeams();

      if (widget.controller.teams.length == 0)
        Navigator.pop(context, true);
      else
        setState(() {});
    }
  }

  void _play(Team team) async {
    Navigator.pop(context, false);
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) =>
            PlayGameScreen(controller: widget.controller, team: team),
      ),
    );
  }

  Widget buildTeamMenu(Team team) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Text(AppLocalizations.translate('teamEdit')),
            value: 1,
          ),
          PopupMenuItem(
            child: Text(AppLocalizations.translate('teamSeeStatistics')),
            value: 2,
          ),
          PopupMenuItem(
            child:
                Text(AppLocalizations.translate('teamReinitializeProgression')),
            value: 3,
          ),
          PopupMenuItem(
            child: Text(AppLocalizations.translate('teamDelete')),
            value: 4,
          ),
        ];
      },
      icon: Icon(Icons.more_vert, color: Colors.white54),
      onSelected: (value) async {
        switch (value) {
          case 1:
            _editTeam(team);
            break;
          case 2:
            _goToStats(team);
            break;
          case 3:
            _resetProgress(team);
            break;
          case 4:
            _removeTeam(team);
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LandscapableScreen(
      controller: widget.controller,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.controller.appName),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
          child: Column(
            children: [
              Expanded(
                child: new ListView.builder(
                  itemCount: widget.controller.teams.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    final team = widget.controller.teams[index];
                    return Container(
                      padding: EdgeInsets.fromLTRB(
                          defaultPadding,
                          defaultPadding / 2,
                          defaultPadding,
                          defaultPadding / 2),
                      child: OutlinedButton(
                        onPressed: () {
                          _play(team);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .backgroundColor
                              .withOpacity(0.30),
                          padding: EdgeInsets.all(defaultPadding),
                          elevation: 10,
                          side: BorderSide(
                            width: 2,
                            color: primaryColor.withOpacity(0.70),
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: TeamName(team: team),
                              trailing: buildTeamMenu(team),
                            ),
                            TeamPlayers(team: team),
                            Padding(
                              padding: EdgeInsets.only(top: defaultPadding),
                            ),
                            TeamProgress(team: team)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
