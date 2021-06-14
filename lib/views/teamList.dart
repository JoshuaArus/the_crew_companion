import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../entities/mission.dart';
import '../entities/team.dart';
import 'teamCreation.dart';
import 'teamMission.dart';
import 'teamStats.dart';

class TeamList extends StatefulWidget {
  TeamList(
      {Key? key,
      required this.title,
      required this.existingTeams,
      required this.availableMissions})
      : super(key: key);

  final String title;
  final List<Mission> availableMissions;
  final List<Team> existingTeams;

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
    if (created) {
      widget.existingTeams.add(newTeam);
      setState(() {}); //refresh UI
    } 
  }

  void _editTeam(Team team) async {
    final edited = await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => TeamCreation(team: team)));
    if (edited) setState(() {}); //refresh UI
  }
  
  void _goToStats(Team team) async {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => TeamStats(team: team)));
  }

  void _removeTeam(Team team) async {
    bool confirmed = await confirm(
      context,
      content: Text("Voulez vous vraiment supprimer l'équipe " + team.name + " ?"),
      textOK: Text("Oui"),
      textCancel: Text("Non"),
      title: Text("Suppression de l'équipe")
    );
    if (confirmed) {
      widget.existingTeams.remove(team);
      setState(() {});
    }    
  }

  void _play(Team team) async {
    await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => TeamMission(team: team)));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            new Expanded(
              child: new ListView.builder(
                itemCount: widget.existingTeams.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  final team = widget.existingTeams[index];
                  return Container(
                    margin: EdgeInsets.only(top: defaultPadding),
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: primayColor.withOpacity(0.70),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.circular(defaultPadding)),
                        color: Theme.of(context)
                            .backgroundColor
                            .withOpacity(0.30)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _play(team);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  team.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.headline3,
                                ),
                                Text(
                                  team.players.join(" - "),
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: Colors.white70),
                                ),
                                Text(
                                  team.achievedMissions.last.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(color: Colors.white70),
                                )
                              ],
                            )
                          ),
                          PopupMenuButton(
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
                                  child: Text("Supprimer l'équipe"),
                                  value: 3,
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
                                  _removeTeam(team);
                                  break;
                              }
                            },
                          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addTeam,
        tooltip: 'Ajouter une équipe',
        child: Icon(Icons.add),
      ),
    );
  }
}
