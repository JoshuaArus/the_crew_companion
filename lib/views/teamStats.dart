import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
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
        title: Text(widget.team.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Joueurs : " + widget.team.players.join(", ")),
            Row(
              children: [
                Text("Dernière mission terminée : "),
                Text(
                  widget.team.achievedMissions.last.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text(widget.team.achievedMissions.last.description),
            Text("Nombre d'essais de la mission : " + (widget.team.achievedMissions.length > 0 ? widget.team.achievedMissions.last.attempts.toString() : "0")),
            Text("Nombre d'essais totaux : " + widget.team.achievedMissions.map((e) => e.attempts).reduce((value, element) => value = value + element).toString()),
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