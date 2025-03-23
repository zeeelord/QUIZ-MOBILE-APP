import 'package:flutter/material.dart';
import 'package:quiz_app/util/hexcolor.dart';

Color ScaffoldColor = HexColor("#FC3503");
Color LabelColor = HexColor("#FEF1E1");
final ThemeData appTheme = buildAppTheme();

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 249, 249, 249),
    ),
    scaffoldBackgroundColor: ScaffoldColor,
    textTheme: appTextTheme(base.textTheme),
    appBarTheme: _AppBarTheme(base.appBarTheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LabelColor,
        foregroundColor: const Color.fromARGB(255, 15, 15, 15),
        iconColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 5.0,
        textStyle: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
_AppBarTheme(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

appTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineLarge: base.headlineLarge?.copyWith(
          fontSize: 34.0,
          fontWeight: FontWeight.w500,
          // backgroundColor: Colors.black,
          color: Colors.white,
        ),
        titleLarge: base.titleLarge?.copyWith(
          fontSize: 35.0,
          color: Colors.white,
        ),
        titleSmall: base.titleSmall?.copyWith(
          fontSize: 20.0,
          color: Colors.white,
        ),
        bodySmall: base.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyLarge: base.bodyLarge?.copyWith(
          fontSize: 16.9,
          fontFamily: "Lobster",
          color: Colors.white,
        ),
        //labelLarge: base.labelLarge?.copyWith(fontSize: 16.0),
      )
      .apply(
        // fontFamily: "Lobster",
        displayColor: const Color.fromARGB(255, 0, 0, 0),
        bodyColor: const Color.fromARGB(255, 255, 255, 255),
      );
}
