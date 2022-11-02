import 'package:flutter/material.dart';

import 'constants.dart';

class ThemeConstants {
  static ThemeData light = ThemeData(
    fontFamily: "NunitoSans",
    primaryColor: ColorsConstantsLight.primary,
    brightness: Brightness.light,
    backgroundColor: ColorsConstantsLight.background,
    scaffoldBackgroundColor: ColorsConstantsLight.background,
    cardColor: ColorsConstantsLight.card,
    cardTheme: const CardTheme(
      color: ColorsConstantsLight.card,
    ),
    appBarTheme: const AppBarTheme(
      color: ColorsConstantsLight.appBarBackground,
      iconTheme: IconThemeData(color: ColorsConstantsLight.appBarIcon),
      titleTextStyle: TextStyle(
        color: ColorsConstantsLight.appBarText,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        fontFamily: "NunitoSans",
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: ColorsConstantsLight.tabBarSelectedText,
      unselectedLabelColor: ColorsConstantsLight.tabBarUnselectedText,
      unselectedLabelStyle: TextStyle(
        color: ColorsConstantsLight.tabBarSelectedText,
        fontFamily: "NunitoSans",
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      labelStyle: TextStyle(
        color: ColorsConstantsLight.primary,
        fontFamily: "NunitoSans",
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: ColorsConstantsLight.text,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: "NunitoSans",
      ),
      headline6: TextStyle(
        color: ColorsConstantsLight.text,
        fontWeight: FontWeight.w800,
        fontSize: 24,
        fontFamily: "NunitoSans",
      ),
      subtitle1: TextStyle(
        color: ColorsConstantsLight.text,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        fontFamily: "NunitoSans",
      ),
      subtitle2: TextStyle(
        color: ColorsConstantsLight.textLight,
        fontWeight: FontWeight.normal,
        fontSize: 20,
        fontFamily: "NunitoSans",
      ),
      bodyText1: TextStyle(
        color: ColorsConstantsLight.text,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: "NunitoSans",
      ),
      bodyText2: TextStyle(
        color: ColorsConstantsLight.textLight,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: "NunitoSans",
      ),
      caption: TextStyle(
        color: ColorsConstantsLight.textExtraLight,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontFamily: "NunitoSans",
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    fontFamily: "NunitoSans",
    primaryColor: ColorsConstantsDark.primary,
    brightness: Brightness.dark,
    backgroundColor: ColorsConstantsDark.background,
    scaffoldBackgroundColor: ColorsConstantsDark.background,
    cardColor: ColorsConstantsDark.card,
    cardTheme: const CardTheme(
      color: ColorsConstantsDark.card,
    ),
    appBarTheme: const AppBarTheme(
      color: ColorsConstantsDark.appBarBackground,
      iconTheme: IconThemeData(color: ColorsConstantsDark.appBarIcon),
      titleTextStyle: TextStyle(
        color: ColorsConstantsDark.appBarText,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        fontFamily: "NunitoSans",
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: ColorsConstantsDark.tabBarSelectedText,
      unselectedLabelColor: ColorsConstantsDark.tabBarUnselectedText,
      unselectedLabelStyle: TextStyle(
        color: ColorsConstantsDark.tabBarUnselectedText,
        fontFamily: "NunitoSans",
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      labelStyle: TextStyle(
        color: ColorsConstantsDark.primary,
        fontFamily: "NunitoSans",
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: ColorsConstantsDark.text,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: "NunitoSans",
      ),
      headline6: TextStyle(
        color: ColorsConstantsDark.text,
        fontWeight: FontWeight.w800,
        fontSize: 24,
        fontFamily: "NunitoSans",
      ),
      subtitle1: TextStyle(
        color: ColorsConstantsDark.text,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        fontFamily: "NunitoSans",
      ),
      subtitle2: TextStyle(
        color: ColorsConstantsDark.textLight,
        fontWeight: FontWeight.normal,
        fontSize: 20,
        fontFamily: "NunitoSans",
      ),
      bodyText1: TextStyle(
        color: ColorsConstantsDark.text,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: "NunitoSans",
      ),
      bodyText2: TextStyle(
        color: ColorsConstantsDark.textLight,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: "NunitoSans",
      ),
      caption: TextStyle(
        color: ColorsConstantsDark.textExtraLight,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontFamily: "NunitoSans",
      ),
    ),
  );
}
