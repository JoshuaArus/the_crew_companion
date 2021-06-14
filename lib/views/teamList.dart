import 'package:flutter/material.dart';

import '../constant.dart';
import '../entities/mission.dart';
import '../entities/team.dart';
import 'teamCreation.dart';
import 'teamStats.dart';
import 'teamSummary.dart';

class TeamList extends StatefulWidget {
  TeamList({Key? key, required this.title, required this.existingTeams, required this.availableMissions}) : super(key: key);

  final String title;
  final List<Mission> availableMissions;
  final List<Team> existingTeams;

  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {

  void _addTeam() async {
    final newTeam = Team();
    final created = await Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => TeamCreation(team: newTeam)));
    if (created) widget.existingTeams.add(newTeam);
    setState(() {});//refresh UI
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => TeamStats(team: team)));
                    },
                    child: TeamSummary(team: team),
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