import 'package:flutter/material.dart';
import 'package:the_crew_companion/entities/team.dart';

import '../constant.dart';
import 'components/inputField.dart';

class TeamCreation extends StatelessWidget {
  final Team team;

  TeamCreation({required this.team});

  @override
  Widget build(BuildContext context) {
    final teamName = TextEditingController(text: team.name);

    final List<TextEditingController> playerControllers =
        team.players.map((p) => TextEditingController(text: p)).toList();

    while (playerControllers.length < 5)
      playerControllers.add(TextEditingController());

    final List<Widget> playerFields = [];
    for (int i = 0; i < playerControllers.length; i++)
      playerFields.add(
        InputField(
          hint: "Joueur " + (i + 1).toString(),
          model: playerControllers[i],
        ),
      );

    return Scaffold(
      appBar: AppBar(
        title: Text("Création d'équipe"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputField(hint: "Nom de l'équipe", model: teamName),
            Divider(),
          ]..addAll(playerFields),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final playerList = playerControllers
              .where((p) => p.text != "")
              .map((p) => p.text)
              .toList();

          if (playerList.length < minPlayer) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Pas assez de joueurs"),
                  content: Text("Il faut au moins " +
                      minPlayer.toString() +
                      " pour triompher du jeu"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("OK"),
                    )
                  ],
                );
              },
            );
            return; //cancel save
          }

          team.name = teamName.text;
          team.players = playerList;

          Navigator.pop(context, true);
        },
        tooltip: "Enregistrer l'équipe",
        child: Icon(Icons.save),
      ),
    );
  }
}
