import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/inputField.dart';

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
          hint: AppLocalizations.instance!.translate('teamPlayer') + " " + (i + 1).toString(),
          model: playerControllers[i],
        ),
      );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.instance!.translate('teamCreation')),
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
            InputField(hint: AppLocalizations.instance!.translate('teamName'), model: teamName),
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
                  title: Text(AppLocalizations.instance!.translate('teamNotEnoughPlayers')),
                  content: Text(AppLocalizations.instance!.translate('teamMinPlayers', {'minPlayer': minPlayer.toString()})),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(AppLocalizations.instance!.translate('commonOk').toUpperCase()),
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
        tooltip: AppLocalizations.instance!.translate('teamSave'),
        child: Icon(Icons.save),
      ),
    );
  }
}
