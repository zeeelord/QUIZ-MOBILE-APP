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
    scaffoldBackgroundColor: Colors.red,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 100,
        color: Colors.white,
      ), // Apply font size change
    ),
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

// theme: ThemeData(
      //   brightness: Brightness.light,
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      //   textTheme: TextTheme(
      //     headlineLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      //     bodyLarge: TextStyle(fontSize: 16.9, color: Colors.white),
      //   )