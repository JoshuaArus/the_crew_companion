import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:the_crew_companion/views/playGame.dart';

import '../constant.dart';
import '../controller.dart';
import '../entities/team.dart';
import 'components/menu.dart';
import 'components/teamName.dart';
import 'components/teamPlayers.dart';
import 'components/teamProgress.dart';
import 'teamCreation.dart';
import 'teamStats.dart';

class TeamList extends StatefulWidget {
  TeamList(
      {Key? key,
      required this.title,
      required this.controller})
      : super(key: key);

  final String title;
  final Controller controller;
  
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  void _addTeam() async {
    final newTeam = Team.empty();
    final created = await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => TeamCreation(team: newTeam)));
    if (created == true) {
      widget.controller.teams.add(newTeam);
      await widget.controller.saveDatas();
      setState(() {}); //refresh UI
    }
  }

  void _editTeam(Team team) async {
    final edited = await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => TeamCreation(team: team)));
    if (edited == true) {
      await widget.controller.saveDatas();
      setState(() {}); //refresh UI
    }
  }

  void _resetProgress(Team team) async {
    bool confirmed = await confirm(context,
        content:
            Text("Voulez vous vraiment réinitialiser la progression de l'équipe " + team.name + " ?"),
        textOK: Text("Oui"),
        textCancel: Text("Non"),
        title: Text("Réinitialisation de la progression"));
    if (confirmed == true) {
      team.achievedMissions.clear();
      await widget.controller.saveDatas();
      setState(() {});
    }
  }

  void _goToStats(Team team) async {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => TeamStats(controller: widget.controller, team: team)));
  }

  void _removeTeam(Team team) async {
    bool confirmed = await confirm(context,
        content:
            Text("Voulez vous vraiment supprimer l'équipe " + team.name + " ?"),
        textOK: Text("Oui"),
        textCancel: Text("Non"),
        title: Text("Suppression de l'équipe"));
    if (confirmed == true) {
      widget.controller.teams.remove(team);
      await widget.controller.saveDatas();
      setState(() {});
    }
  }

  void _play(Team team) async {
    await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => PlayGame(controller: widget.controller, team: team)));

    setState(() {});
  }

  Widget buildTeamMenu(Team team) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Text("Editer l'équipe"),
            value: 1,
          ),
          PopupMenuItem(
            child: Text("Voir les statistiques l'équipe"),
            value: 2,
          ),
          PopupMenuItem(
            child: Text("Réinitialiser la progression"),
            value: 3,
          ),
          PopupMenuItem(
            child: Text("Supprimer l'équipe"),
            value: 4,
          ),
        ];
      },
      icon: Icon(Icons.more_vert,
          color: Colors.white54),
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
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(controller: widget.controller),
      appBar: AppBar(
        title:  Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: defaultPadding/2),
        child: Column(
          children: [
            Expanded(
              child: new ListView.builder(
                itemCount: widget.controller.teams.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  final team = widget.controller.teams[index];
                  return Container(
                    padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding/2, defaultPadding, defaultPadding/2),
                    child: OutlinedButton(
                      onPressed: (){
                        _play(team);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.30),
                        padding: EdgeInsets.all(defaultPadding),
                        elevation: 10,
                        side: BorderSide(
                          width: 2,
                          color: primaryColor.withOpacity(0.70),
                        ),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.ac_unit, color: primaryColor.withAlpha(0),),
                            title : TeamName(team: team),
                            trailing: buildTeamMenu(team),                            
                          ),
                          TeamPlayers(team: team),
                          Padding(padding: EdgeInsets.only(top: defaultPadding)),
                          TeamProgress(team: team)
                        ],
                      ),
                    )
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTeam,
        tooltip: 'Ajouter une équipe',
        child: Icon(Icons.add),
      ),
    );
  }
}