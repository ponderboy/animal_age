import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  static final Color _primaryColor = Colors.brown[700];
  static final Color _accentColor = Colors.deepPurple[600];

  static final ThemeData myTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: _primaryColor,
    accentColor: _accentColor,

    // Define the default font family.
    fontFamily: 'Caladea',

    textTheme: _myTextTheme,
  );

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  static final TextTheme _myTextTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: 'Contrail',
      fontSize: 64.0,
      color: _accentColor,
      letterSpacing: -1,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontFamily: 'Contrail',
      fontSize: 42.0,
      // color: _accentColor,
      letterSpacing: -1,
      // fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      fontFamily: 'Contrail',
      fontSize: 24.0,
      color: _accentColor,
    ),
    bodyText1: TextStyle(
      fontSize: 28.0,
      color: _primaryColor,
      height: 1.5,
    ),
    button: TextStyle(
      fontFamily: 'Contrail',
      fontSize: 32.0,
      color: Colors.white,
    ),
  );
}
