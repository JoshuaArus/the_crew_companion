import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/customThemes.dart';
import 'package:the_crew_companion/views/homeScreen.dart';
import 'package:the_crew_companion/views/splashScreen.dart';

void main() async {
  runApp(TheCrewCompanionApp());
}

class TheCrewCompanionApp extends StatelessWidget {
  final Controller controller = Controller();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fr'),
      ],
      onGenerateTitle: (context) =>
          AppLocalizations.instance.translate('applicationName'),
      theme: CustomTheme.current,
      home: FutureBuilder(
        future: Future.wait(
          [
            controller.init(),
            controller.readDatas(),
            controller.populateMissions()
          ],
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return HomeScreen(controller: controller);
          else
            return SplashScreen();
        },
      ),
    );
  }
}
