import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_crew_companion/utils/appLocalizations.dart';
import 'package:the_crew_companion/controller.dart';
import 'package:the_crew_companion/utils/themeNotifier.dart';
import 'package:the_crew_companion/views/screens/homeScreen.dart';
import 'package:the_crew_companion/views/screens/splashScreen.dart';

void main() {
  runApp(TheCrewCompanionApp());
}

class TheCrewCompanionApp extends StatelessWidget {
  final Controller controller = Controller();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait(
        [
          controller.init(),
        ],
      ),
      builder: (ctx, snpsht) {
        if (snpsht.hasData) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => AppLocalizations(controller.defaultLocale),
              ),
              ChangeNotifierProvider(
                create: (context) =>
                    ThemeNotifier(theme: controller.defaultTheme),
              ),
            ],
            child: MainWindows(controller: controller),
          );
        } else
          return SplashScreen();
      },
    );
  }
}

class MainWindows extends StatelessWidget {
  const MainWindows({
    required this.controller,
  });

  final Controller controller;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final appLocalizations = Provider.of<AppLocalizations>(context);

    return MaterialApp(
      theme: themeNotifier.getThemeData(),
      locale: appLocalizations.getLocale(),
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
            controller.populateRules(),
            controller.populateMissions(),
            controller.saveSettings(context),
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
