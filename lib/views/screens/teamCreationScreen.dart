import 'package:flutter/material.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/inputField.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';

class TeamCreationScreen extends StatelessWidget {
  final Team team;
  final Controller controller;

  TeamCreationScreen({required this.team, required this.controller});

  @override
  Widget build(BuildContext context) {
    final teamName = TextEditingController(text: team.name);

    final List<TextEditingController> playerControllers = team.players
        .map(
          (p) => TextEditingController(text: p),
        )
        .toList();

    while (playerControllers.length < 5)
      playerControllers.add(
        TextEditingController(),
      );

    final List<Widget> playerFields = [];
    for (int i = 0; i < playerControllers.length; i++)
      playerFields.add(
        InputField(
          hint: AppLocalizations.translate(
              'teamPlayer', {'number': (i + 1).toString()}),
          model: playerControllers[i],
        ),
      );

    return LandscapableScreen(
      controller: controller,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.translate('teamCreation')),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InputField(
                  hint: AppLocalizations.translate('teamName'),
                  model: teamName),
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
                    title: Text(
                        AppLocalizations.translate('teamNotEnoughPlayers')),
                    content: Text(AppLocalizations.translate(
                        'teamMinPlayers', {'minPlayer': minPlayer.toString()})),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.translate('commonOk')
                            .toUpperCase()),
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
          tooltip: AppLocalizations.translate('teamSave'),
          child: Icon(Icons.save),
        ),
      ),
    );
  }
}
