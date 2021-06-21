import 'package:flutter/material.dart';
import 'package:the_crew_companion/customThemes.dart';
import 'package:the_crew_companion/views/homeScreen.dart';
import 'package:the_crew_companion/views/splashScreen.dart';

import 'controller.dart';

void main() async {
  runApp(TheCrewCompanionApp());
}

class TheCrewCompanionApp extends StatelessWidget {

  final Controller controller = Controller();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Crew Companion",
      theme: CustomThemes.dark(),
      home: FutureBuilder(
        future: Future.wait([
          controller.init(),
          controller.readDatas()
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return HomeScreen(controller: controller);
          else
            return SplashScreen();
        }
      )
    );
  }
}
