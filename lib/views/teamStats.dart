import 'package:flutter/material.dart';
import '../entities/team.dart';
import 'teamCreation.dart';

class TeamStats extends StatefulWidget {
  const TeamStats({ Key? key, required this.team }) : super(key: key);

  final Team team;

  @override
  _TeamStatsState createState() => _TeamStatsState();
}

class _TeamStatsState extends State<TeamStats> {

  void editTeam() async {
    final edited = await Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => TeamCreation(team: widget.team)));
    if (edited == true)
      setState(() {});//refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.team.name),),
      ),
      body: Container(
        
        child : Column(
          children: [
            Text("Joueurs : " + widget.team.players.join(", ")),
            Text("Dernière mission : " + widget.team.achievedMissions.last.title),
            Text(widget.team.achievedMissions.last.description),
            Text("Nombre d'essais : " + widget.team.achievedMissions.map((e) => e.attempts).reduce((value, element) => value = value + element).toString()),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: editTeam,
        tooltip: "Modifier l'équipe",
        child: Icon(Icons.edit)
      ),
    );
  }

}