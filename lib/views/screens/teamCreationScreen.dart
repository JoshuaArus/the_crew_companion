import 'package:flutter/material.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/inputField.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';

class TeamCreationScreen extends LandscapableScreen {
  final Team team;

  const TeamCreationScreen({required this.team, required Controller controller})
      : super(controller: controller);

  @override
  _TeamCreationScreenState createState() => _TeamCreationScreenState();
}

class _TeamCreationScreenState extends State<TeamCreationScreen>
    with LandscapableScreenState {
  @override
  Widget buildBody(BuildContext context) {
    final teamName = TextEditingController(text: widget.team.name);

    final List<TextEditingController> playerControllers = widget.team.players
        .map(
          (p) => TextEditingController(text: p),
        )
        .toList();

    while (playerControllers.length < 5) {
      playerControllers.add(
        TextEditingController(),
      );
    }

    final List<Widget> playerFields = [];
    for (int i = 0; i < playerControllers.length; i++) {
      playerFields.add(
        InputField(
          hint: AppLocalizations.translate(
              'teamPlayer', {'number': (i + 1).toString()}),
          model: playerControllers[i],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate('teamCreation')),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputField(
                hint: AppLocalizations.translate('teamName'), model: teamName),
            const Divider(),
            ...playerFields,
          ],
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
                  title:
                      Text(AppLocalizations.translate('teamNotEnoughPlayers')),
                  content: Text(AppLocalizations.translate(
                      'teamMinPlayers', {'minPlayer': minPlayer.toString()})),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                          AppLocalizations.translate('commonOk').toUpperCase()),
                    )
                  ],
                );
              },
            );
            return; //cancel save
          }

          widget.team.name = teamName.text;
          widget.team.players = playerList;

          Navigator.pop(context, true);
        },
        tooltip: AppLocalizations.translate('teamSave'),
        child: const Icon(Icons.save),
      ),
    );
  }
}
