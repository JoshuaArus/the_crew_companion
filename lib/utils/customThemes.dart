import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_crew_companion/utils/constant.dart';

enum CustomThemes {
  Dark,
  Light,
}

mixin CustomThemesFactory {
  static bool exist(String val) {
    return CustomThemes.values.any((element) => element.toString() == val);
  }

  static CustomThemes fromString(String val) {
    return CustomThemes.values
        .firstWhere((element) => element.toString() == val);
  }
}

extension CustomThemesExtension on CustomThemes {
  String get value => describeEnum(this);

  CustomThemes get copy {
    return CustomThemesFactory.fromString(toString());
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
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
          cardTheme: const CardTheme(
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
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
          ),
          cardTheme: const CardTheme(
            shape: StadiumBorder(),
          ),
        );
    }
  }
}
