import 'package:flutter/material.dart';

/// Defines the main color of the application
const MaterialColor primaryColor = Colors.deepPurple;

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: primaryColor,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: primaryColor,
);
