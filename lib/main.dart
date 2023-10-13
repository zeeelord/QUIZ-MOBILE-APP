import 'package:flutter/material.dart';
import 'ui/Home.dart';
import 'ui/quote.dart';

void main()=>runApp(MaterialApp(
  home:Quiz()
));
// final ThemeData _appTheme = _buildAppTheme();
//
// ThemeData _buildAppTheme() {
//   final ThemeData base = ThemeData.dark();
//   return base.copyWith(
//       brightness: Brightness.dark,
//       primaryColor: Colors.green,
//       scaffoldBackgroundColor: Colors.red,
//       textTheme: _appTextTheme(base.textTheme),
//       bottomAppBarTheme: BottomAppBarTheme(color: Colors.amber));
// }
//
// TextTheme _appTextTheme(TextTheme base) {
//   return base.copyWith(
//     displayMedium: base.displayMedium?.copyWith(
//       fontWeight: FontWeight.w600,
//     ),
//     titleLarge: base.titleLarge?.copyWith(fontSize: 20.0),
//     labelLarge: base.labelLarge?.copyWith(
//         fontWeight: FontWeight.w500,
//         fontSize: 20.0,
//         letterSpacing: 10.0,
//         backgroundColor: Colors.blue),
//     bodyMedium: base.bodyMedium?.copyWith(fontSize: 20, color: Colors.white),
//   );
// }
//
// void main() => runApp(MaterialApp(
//       theme: _appTheme,
//       //  ThemeData(
//       //    brightness: Brightness.dark,
//       //    primaryColor: Colors.white,
//       // //   scaffoldBackgroundColor: Colors.deepOrange
//       //    textTheme:  TextTheme(
//       //      bodyMedium: TextStyle(
//       //        fontSize: 16.9,
//       //        color: Colors.white
//       //      ),
//       //      displayLarge: TextStyle(
//       //        fontSize: 34,
//       //        fontWeight: FontWeight.bold ,
//       //    ),
//       //
//       //    ),
//       //  ),
//       home: Quiz(),
//
//     ));
