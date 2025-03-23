import 'package:flutter/material.dart';
import 'package:quiz_app/Theme/theme.dart';
import 'ui/Home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Quiz(),
    ),
  );
}
