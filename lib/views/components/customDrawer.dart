import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_crew_companion/utils/constant.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/views/components/containerGradient.dart';
import 'package:the_crew_companion/views/components/missionList.dart';
import 'package:the_crew_companion/views/screens/aboutScreen.dart';
import 'package:the_crew_companion/views/screens/rulesScreen.dart';
import 'package:the_crew_companion/views/screens/settingsScreen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({required this.controller, this.shouldPop = true});

  final bool shouldPop;
  final Controller controller;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  void _goto(Widget page) {
    if (widget.shouldPop && Navigator.canPop(context))
      Navigator.pop(context); // hide menu

    Navigator.push(
      context,
      new MaterialPageRoute(builder: (BuildContext context) => page),
    );
  }

  void _goToHome() {
    Navigator.popUntil(context, (route) => !Navigator.canPop(context));
  }

  void _goToMissionList() {
    _goto(MissionList(controller: widget.controller));
  }

  void _goToSettings() {
    _goto(SettingsScreen(controller: widget.controller));
  }

  void _goToAbout() {
    _goto(AboutScreen(controller: widget.controller));
  }

  void _goToRules() {
    _goto(RulesScreen(controller: widget.controller));
  }

  @override
  Widget build(BuildContext context) {
    return ContainerGradient(
      constraints: BoxConstraints(
        maxWidth: 300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(defaultPadding),
            child: Image(
              image: AssetImage("assets/images/astronautHelmet.png"),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      title: Text(
                        AppLocalizations.translate('menuHome'),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      onTap: _goToHome,
                      leading: FaIcon(
                        FontAwesomeIcons.home,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.translate('menuRules'),
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
                        AppLocalizations.translate('menuMissionList'),
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
                        AppLocalizations.translate('menuSettings'),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      onTap: _goToSettings,
                      leading: Icon(
                        Icons.settings,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.translate('menuAbout'),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      onTap: _goToAbout,
                      leading: Icon(
                        Icons.lightbulb_outline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: secondaryColor,
            child: Center(
              child: Text(
                "v " + widget.controller.appVersion,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
