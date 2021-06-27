import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_crew_companion/constant.dart';

enum CustomThemes {
  Dark,
  Light,
}

class CustomThemesFactory {
  static CustomThemes fromString(String val) {
    return CustomThemes.values
        .firstWhere((element) => element.toString() == val);
  }
}

extension CustomThemesExtenion on CustomThemes {
  CustomThemes get copy {
    return CustomThemesFactory.fromString(this.toString());
  }

  ThemeData getThemeData() {
    switch (this) {
      case CustomThemes.Dark:
        return ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          canvasColor: secondaryColor,
          primaryTextTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.dark().textTheme,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.dark().textTheme,
          ),
          cardColor: secondaryColor,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
          cardTheme: CardTheme(
            shape: StadiumBorder(),
          ),
        );
      case CustomThemes.Light:
        return ThemeData.light().copyWith(
          // scaffoldBackgroundColor: bgColor,
          // canvasColor: secondaryColor,
          primaryTextTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.light().textTheme,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.light().textTheme,
          ),
          // cardColor: secondaryColor,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
          cardTheme: CardTheme(
            shape: StadiumBorder(),
          ),
        );
    }
  }
}
