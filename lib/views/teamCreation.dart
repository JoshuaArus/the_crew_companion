import 'package:flutter/material.dart';
import 'package:the_crew_companion/entities/team.dart';

class TeamCreation extends StatelessWidget {

  final Team team;

  TeamCreation({required this.team});

  @override
  Widget build(BuildContext context) {
    
    final teamName = TextEditingController(text: team.name);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Création d'équipe"),),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Nom de l'équipe"
            ),
            controller: teamName,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          team.creationDate = DateTime.now();
          team.name = teamName.text;

          Navigator.pop(context, true);
        },
        tooltip: "Enregistrer l'équipe",
        child: Icon(Icons.save),
      )
    );
  }

}