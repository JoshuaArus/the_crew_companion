import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class CustomThemes {
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
}
