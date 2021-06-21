import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';
import 'package:the_crew_companion/views/about.dart';

import '../../controller.dart';
import '../missionList.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({ Key? key, required this.controller }) : super(key: key);

  final Controller controller;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  
  void _goto(Widget page) {
    Navigator.pop(context);// hide menu

    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => page));
  }

  void _goToMissionList() {
    _goto(MissionList(controller: widget.controller));
  }

  void _goToAbout() {
    _goto(About(controller: widget.controller));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            Container(
              child: DrawerHeader(
                padding: EdgeInsets.all(defaultPadding),
                child: Image(
                  image: AssetImage("assets/images/astronautHelmet.png")
                ),
              )
            ),
            ListTile(
              title: Text(
                "Liste des missions",
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: _goToMissionList,
              leading: Icon(Icons.article_outlined),
            ),
            Padding(padding: EdgeInsets.only(top:10)),
            ListTile(
              title: Text(
                "A propos",
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: _goToAbout,
              leading: Icon(Icons.lightbulb_outline),
            ),
          ],
        )
      );
  }
}