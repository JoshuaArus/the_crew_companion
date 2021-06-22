import 'package:flutter/material.dart';

import 'constant.dart';

class  CustomThemes {

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bgColor,
      canvasColor: secondaryColor,
      textTheme: TextTheme(
        bodyText2: TextStyle(
          fontSize: 18
        )
      ),
      cardColor: secondaryColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      cardTheme: CardTheme(
        shape: StadiumBorder(),
      )
    );
  }

}