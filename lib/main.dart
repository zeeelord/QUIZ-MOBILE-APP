import 'package:flutter/material.dart';
import 'ui/Home.dart';

final ThemeData _appTheme = buildAppTheme();

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 39, 3, 244),
      primary: const Color.fromARGB(255, 10, 208, 26), // Set the primary color
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 0, 0),
    textTheme: _appTextTheme(base.textTheme),
  );
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineLarge: base.headlineLarge?.copyWith(
          fontSize: 34.0,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge?.copyWith(fontSize: 18.0),
        bodySmall: base.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyLarge: base.bodyLarge?.copyWith(
          fontSize: 16.9,
          fontFamily: "Lobster",
          color: Colors.blue,
        ),
        labelLarge: base.labelLarge?.copyWith(
          fontSize: 14.0,
          backgroundColor: const Color.fromARGB(255, 67, 54, 244),
        ),
      )
      .apply(
        fontFamily: "Lobster",
        displayColor: Colors.amber,
        bodyColor: const Color.fromARGB(255, 255, 255, 255),
      );
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _appTheme,
      home: Quiz(),
    ),
  );
}
