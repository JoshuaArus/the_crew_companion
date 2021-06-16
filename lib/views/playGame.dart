import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/entities/mission.dart';
import 'package:the_crew_companion/entities/team.dart';

import '../controller.dart';
import 'components/playGameComponents.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({Key? key, required this.team, required this.controller})
      : super(key: key);

  final Team team;
  final Controller controller;

  @override
  PlayGameState createState() => PlayGameState();
}

class PlayGameState extends State<PlayGame> {
  TextEditingController attempts = TextEditingController(text: "");
  bool satUsed = false;

  void _setSwitch(value) {
    setState(() {
      satUsed = value;
    });
  }

  void _endCurrentMission(Mission mission) async {
    bool confirmed = await confirm(context,
        content: Text("Valider avec cette saisie ?"),
        textOK: Text("Oui"),
        textCancel: Text("Non"),
        title: Text("Valider la mission"));

    if (confirmed == true) {
      mission.attempts = int.parse(attempts.text == "" ? "1" : attempts.text);
      mission.satelliteUsed = satUsed;
      widget.team.achievedMissions.add(mission);
      await widget.controller.saveDatas();
      attempts.text = "";
      satUsed = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Mission currentMission = widget.controller.missions
        .firstWhere(
            (element) => element.id == widget.team.achievedMissions.length)
        .copy;

    return Scaffold(
      appBar: AppBar(
        title: Text(currentMission.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            MissionDescription(mission: currentMission),
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
                              hintText: "1",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                              )),
                            ),
                            textAlign: TextAlign.right,
                            controller: attempts,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ])),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Utilisation du satellite : "),
                    Switch(
                        activeColor: primaryColor,
                        value: satUsed,
                        onChanged: _setSwitch)
                  ],
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _endCurrentMission(currentMission);
          },
          label: Text(
            "Valider la mission",
          ),
          icon: Icon(Icons.check)),
    );
  }
}
