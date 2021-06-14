import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/entities/aimOption.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/team.dart';

import '../controller.dart';
import 'components/playGameComponents.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({ Key? key, required this.team, required this.controller}) : super(key: key);

  final Team team;
  final Controller controller;
  
  @override
  PlayGameState createState() => PlayGameState();
}

class PlayGameState extends State<PlayGame> {

  TextEditingController attempts = TextEditingController(text: "1");
  bool satUsed = true;

  void _endCurrentMission(Mission mission) async {
    bool confirmed = await confirm(
      context,
      content: Text("Valider avec cette saisie ?"),
      textOK: Text("Oui"),
      textCancel: Text("Non"),
      title: Text("Valider la mission")
    );

    if (confirmed == true) {
      mission.attempts = int.parse(attempts.text);
      mission.satelliteUsed = satUsed;
      widget.team.achievedMissions.add(mission);
      setState(() {});
    }
  }
  
  @override
  Widget build(BuildContext context) {
    Mission currentMission = widget.controller.missions.firstWhere((element) => element.id == widget.team.achievedMissions.length);

    return Scaffold(
      appBar: AppBar(
        title: Text(currentMission.title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Text(
              currentMission.description,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5,
            ),
            Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AimButton(text: currentMission.aimCount > 0 ? currentMission.aimCount.toString() : "-")
              ]..addAll(currentMission.aimOptions.map((ao) => GoalButton(text: ao.displayValue)).toList()),
            ),
            Divider(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nombre d'essais : "),
                    Container(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(defaultPadding),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            )
                          ),
                          
                        ),
                        textAlign: TextAlign.right,
                        controller: attempts,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ]
                      )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Utilisation du satellite : "),
                    Switch(
                      activeColor: primaryColor,
                      value: satUsed,
                      onChanged: (value) {
                        setState(() {
                          satUsed = value;
                        });
                      }
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        onPressed: (){_endCurrentMission(currentMission);},
        label: Text(
          "Valider la mission",
        ),
        icon: Icon(Icons.check)
      ),
    );
  }
}