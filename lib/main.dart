import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_crew_companion/languageNotifier.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/themeNotifier.dart';
import 'package:the_crew_companion/views/homeScreen.dart';
import 'package:the_crew_companion/views/splashScreen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LanguageNotifier()),
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
  ], child: TheCrewCompanionApp()));
}

class TheCrewCompanionApp extends StatelessWidget {
  final Controller controller = Controller();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      theme: themeNotifier.getThemeData(),
      locale: AppLocalizations.currentLocale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations
          .supportedLocales, // first element of supportedLocales as a fallback
      onGenerateTitle: (context) =>
          AppLocalizations.translate('applicationName'),
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
