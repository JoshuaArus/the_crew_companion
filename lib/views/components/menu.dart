import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';

import '../../controller.dart';
import '../missionList.dart';


class Menu extends StatefulWidget {
  const Menu({ Key? key, required this.controller }) : super(key: key);

  final Controller controller;

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  
  void _goToMissionList() async {
    Navigator.pop(context);// hide menu

    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => MissionList(controller: widget.controller)));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            Container(
              height: 0,
              child: DrawerHeader(
                child: Text(""),//en attente d'une image
              )
            ),
            ListTile(
              title: Text(
                "Liste des missions",
                style: Theme.of(context).textTheme.headline6,
              ),
              tileColor: primaryColor,
              onTap: _goToMissionList,
            )
          ],
        )
      );
  }
}