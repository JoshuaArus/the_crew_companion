import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/teamName.dart';
import 'package:the_crew_companion/views/components/teamPlayers.dart';
import 'package:the_crew_companion/views/components/teamProgress.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';
import 'package:the_crew_companion/views/screens/playGameScreen.dart';
import 'package:the_crew_companion/views/screens/qrCodeScanner.dart';
import 'package:the_crew_companion/views/screens/teamCreationScreen.dart';
import 'package:the_crew_companion/views/screens/teamStatsScreen.dart';

class TeamListScreen extends LandscapableScreen {
  TeamListScreen({required Controller controller})
      : super(controller: controller);

  @override
  _TeamListScreenState createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen>
    with LandscapableScreenState {
  @override
  void initState() {
    super.initState();

    if (widget.controller.teams.isEmpty) {
      Future.delayed(Duration(milliseconds: 100), () {
        _goToScanQrCode();
      });
    }
  }

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

  void _shareTeam(Team team) {
    showDialog(
      context: context,
      builder: (_) => new Dialog(
        child: Container(
          width: 300,
          height: 300,
          child: QrImage(
            data: team.toJson(),
            size: 200,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
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

  void _goToScanQrCode() async {
    String? serializedTeam = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => QrCodeScannerScreen(),
      ),
    );

    if (serializedTeam != null && serializedTeam != "") {
      Team newTeam = Team.fromJson(serializedTeam);
      widget.controller.teams.add(newTeam);
      await widget.controller.saveTeams();
    }

    setState(() {});
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
            child: Text(AppLocalizations.translate('teamShare')),
            value: 4,
          ),
          PopupMenuItem(
            child: Text(AppLocalizations.translate('teamDelete')),
            value: 5,
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
            _shareTeam(team);
            break;
          case 5:
            _removeTeam(team);
            break;
        }
      },
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.controller.appName),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _goToScanQrCode,
            icon: Icon(
              Icons.qr_code_2,
            ),
            tooltip: AppLocalizations.translate('teamLoadQrCode'),
          ),
        ],
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
                    padding: EdgeInsets.fromLTRB(defaultPadding,
                        defaultPadding / 2, defaultPadding, defaultPadding / 2),
                    child: OutlinedButton(
                      onPressed: () {
                        _play(team);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).backgroundColor.withOpacity(0.30),
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
    );
  }
}
