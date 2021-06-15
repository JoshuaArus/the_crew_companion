import 'package:flutter/material.dart';
import 'package:the_crew_companion/views/splashScreen.dart';

import 'constant.dart';
import 'controller.dart';
import 'views/teamList.dart';

void main() {
  runApp(TheCrewCompanionApp());
}

class TheCrewCompanionApp extends StatelessWidget {

  final Controller controller = Controller();
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: secondaryColor,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 18
          )
        )
      ),
      home: FutureBuilder<bool>(
        future: controller.readDatas(),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return TeamList(controller: controller, title: appTitle);
          else
            return SplashScreen();
        }
      )
    );
  }
}
