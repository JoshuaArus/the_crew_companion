import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/views/about.dart';
import 'package:the_crew_companion/views/components/containerGradient.dart';
import 'package:the_crew_companion/views/missionList.dart';
import 'package:the_crew_companion/views/rulesScreen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({required this.controller});

  final Controller controller;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  void _goto(Widget page) {
    Navigator.pop(context); // hide menu

    Navigator.push(
      context,
      new MaterialPageRoute(builder: (BuildContext context) => page),
    );
  }

  void _goToMissionList() {
    _goto(MissionList(controller: widget.controller));
  }

  void _goToAbout() {
    _goto(About(controller: widget.controller));
  }

  void _goToRules() {
    _goto(Rules(controller: widget.controller));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ContainerGradient(
        child: ListView(
          children: [
            Container(
              child: DrawerHeader(
                padding: EdgeInsets.all(defaultPadding),
                child: Image(
                  image: AssetImage("assets/images/astronautHelmet.png"),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTile(
                  title: Text(
                    "Les règles",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: _goToRules,
                  leading: FaIcon(
                    FontAwesomeIcons.questionCircle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    "Liste des missions",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: _goToMissionList,
                  leading: FaIcon(
                    FontAwesomeIcons.bookOpen,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    "A propos",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: _goToAbout,
                  leading: Icon(Icons.lightbulb_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
