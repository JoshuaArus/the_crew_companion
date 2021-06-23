import 'package:flutter/material.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/views/components/jumpingHomeScreenTitle.dart';
import 'package:the_crew_companion/views/teamCreation.dart';
import 'package:the_crew_companion/views/teamList.dart';

import '../controller.dart';
import 'components/delayedAnimation.dart';
import 'components/homeScreenButton.dart';
import 'components/customDrawer.dart';
import 'playGame.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.controller}) : super(key: key);

  final Controller controller;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _goToTeamList() {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => TeamList(
          controller: widget.controller,
        ),
      ),
    );
  }

  void _addTeam() async {
    final newTeam = Team();
    final created = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => TeamCreation(team: newTeam),
      ),
    );
    if (created == true) {
      widget.controller.teams.add(newTeam);
      await widget.controller.saveDatas();

      await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              PlayGame(controller: widget.controller, team: newTeam),
        ),
      );

      setState(() {}); //refresh UI
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.controller.appName;
    String version = widget.controller.appVersion;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      drawer: CustomDrawer(controller: widget.controller),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homeScreenBackground.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: DelayedAnimation(
                    delay: 1000,
                    child: JumpingHomeScreenTitle(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeScreenButton(
                        text: "Nouvelle partie",
                        onPressed: _addTeam,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      HomeScreenButton(
                        text: "Charger une partie",
                        onPressed: _goToTeamList,
                        disabled: widget.controller.teams.length == 0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "v " + version,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
