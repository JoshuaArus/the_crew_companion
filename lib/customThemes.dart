import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_crew_companion/constant.dart';

class CustomTheme {
  static ThemeData current = dark;

  static final ThemeData dark = ThemeData.dark().copyWith(
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

  static final ThemeData light = ThemeData.light().copyWith(
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
}

enum CustomThemes {
  Dark,
  Light,
}
