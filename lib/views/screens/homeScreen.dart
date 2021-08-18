import 'package:flutter/material.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/entities/team.dart';
import 'package:the_crew_companion/views/components/deepSpace.dart';
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
  Future<void> _goToTeamList() async {
    final bool? needRefresh = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => TeamListScreen(
          controller: widget.controller,
        ),
      ),
    );
    if (needRefresh == true) setState(() {});
  }

  Future<void> _addTeam() async {
    final newTeam = Team.empty();
    final created = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => TeamCreationScreen(
          controller: widget.controller,
          team: newTeam,
        ),
      ),
    );
    if (created == true) {
      widget.controller.teams.add(newTeam);
      await widget.controller.saveTeams();

      // ignore: use_build_context_synchronously
      await Navigator.push(
        context,
        MaterialPageRoute(
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
      body: Stack(
        children: [
          const DeepSpace(),
          const FallingAsteroids(asteroidNumber: 5),
          Container(
            padding: const EdgeInsets.only(
              top: defaultPadding * 2,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: const DelayedAnimation(
                      delay: 1000,
                      child: JumpingHomeScreenTitle(),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeScreenButton(
                        text: AppLocalizations.translate('homeNewGame'),
                        onPressed: _addTeam,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      HomeScreenButton(
                        text: widget.controller.teams.isEmpty
                            ? AppLocalizations.translate('teamLoadQrCode')
                            : AppLocalizations.translate('homeLoadGame'),
                        onPressed: _goToTeamList,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
