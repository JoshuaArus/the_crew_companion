import 'package:flutter/material.dart';

import 'constant.dart';
import 'controller.dart';
import 'views/teamList.dart';

void main() {
  runApp(TheCrewCompanionApp());
}

class TheCrewCompanionApp extends StatelessWidget {

  final String appTitle = 'The Crew Companion';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Controller controller = Controller();
    controller.readDatas();

    return MaterialApp(
      
      title: appTitle,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
      ),
      home: TeamList(controller: controller, title: appTitle),
    );
  }
}
