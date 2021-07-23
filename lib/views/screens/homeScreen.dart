import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/views/components/fallingAsteroids.dart';
import 'package:the_crew_companion/views/components/customDrawer.dart';
import 'package:the_crew_companion/views/components/delayedAnimation.dart';
import 'package:the_crew_companion/views/components/homeScreenButton.dart';
import 'package:the_crew_companion/views/components/jumpingHomeScreenTitle.dart';
import 'package:the_crew_companion/views/screens/landscapableScreen.dart';
import 'package:the_crew_companion/views/screens/playGameScreen.dart';
import 'package:the_crew_companion/views/screens/teamCreationScreen.dart';
import 'package:the_crew_companion/views/screens/teamListScreen.dart';

class HomeScreen extends LandscapableScreen {
  const HomeScreen({required Controller controller})
      : super(controller: controller);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with LandscapableScreenState {
  void _goToTeamList() async {
    bool? needRefresh = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => TeamListScreen(
          controller: widget.controller,
        ),
      ),
    );
    if (needRefresh == true) setState(() {});
  }

  void _addTeam() async {
    final newTeam = Team.empty();
    final created = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => TeamCreationScreen(
          controller: widget.controller,
          team: newTeam,
        ),
      ),
    );
    if (created == true) {
      widget.controller.teams.add(newTeam);
      await widget.controller.saveTeams();

      await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => PlayGameScreen(
            controller: widget.controller,
            team: newTeam,
          ),
        ),
      );

      setState(() {});
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor.withOpacity(0),
      ),
      drawer: MediaQuery.of(context).orientation == Orientation.landscape
          ? null
          : Drawer(
              child: CustomDrawer(
                controller: widget.controller,
              ),
            ),
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
                            text: AppLocalizations.translate('homeNewGame'),
                            onPressed: _addTeam,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          HomeScreenButton(
                            text: AppLocalizations.translate('homeLoadGame'),
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
    );
  }
}
