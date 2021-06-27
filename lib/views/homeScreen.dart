import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/views/components/fallingAsteroids.dart';
import 'package:the_crew_companion/views/components/customDrawer.dart';
import 'package:the_crew_companion/views/components/delayedAnimation.dart';
import 'package:the_crew_companion/views/components/homeScreenButton.dart';
import 'package:the_crew_companion/views/components/jumpingHomeScreenTitle.dart';
import 'package:the_crew_companion/views/playGame.dart';
import 'package:the_crew_companion/views/teamCreation.dart';
import 'package:the_crew_companion/views/teamList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.controller});

  final Controller controller;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _goToTeamList() async {
    bool? needRefresh = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => TeamList(
          controller: widget.controller,
        ),
      ),
    );
    if (needRefresh == true) setState(() {});
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

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    String version = widget.controller.appVersion;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor.withOpacity(0),
      ),
      drawer: CustomDrawer(controller: widget.controller),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homeScreenBackground.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            FallingAsteroids(asteroidNumber: 5),
            Container(
              padding: EdgeInsets.only(
                top: defaultPadding * 2,
              ),
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
                            text: AppLocalizations.instance!.translate('homeNewGame'),
                            onPressed: _addTeam,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          HomeScreenButton(
                            text: AppLocalizations.instance!.translate('homeLoadGame'),
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
          ],
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
