import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:the_crew_companion/views/playGame.dart';

import '../constant.dart';
import '../controller.dart';
import '../entities/team.dart';
import 'components/teamListComponents.dart';
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
    final newTeam = Team();
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
    if (edited == true) setState(() {}); //refresh UI
  }

  void _goToStats(Team team) async {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => TeamStats(team: team)));
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
      setState(() {});
    }
  }

  void _play(Team team) async {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => PlayGame(controller: widget.controller, team: team)));

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            new Expanded(
              child: new ListView.builder(
                itemCount: widget.controller.teams.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  final team = widget.controller.teams[index];
                  return Container(
                    padding: EdgeInsets.all(defaultPadding),
                    child: OutlinedButton(
                      onPressed: (){
                        _play(team);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.30),
                        padding: EdgeInsets.all(defaultPadding*2),
                        elevation: 10,
                        side: BorderSide(
                          width: 2,
                          color: primaryColor.withOpacity(0.70),
                        ),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(defaultPadding)))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TeamName(team: team),
                              Padding(padding: EdgeInsets.all(8)),
                              TeamPlayers(team: team),
                              Padding(padding: EdgeInsets.all(8)),
                              TeamProgress(team: team)
                            ],
                          ),
                          PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text("Editer l'équipe"),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: Text(
                                      "Voir les statistiques l'équipe"),
                                  value: 2,
                                ),
                                PopupMenuItem(
                                  child: Text("Supprimer l'équipe"),
                                  value: 3,
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
                                  _removeTeam(team);
                                  break;
                              }
                            },
                          ),
                        ],
                      )
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