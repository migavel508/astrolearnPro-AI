import 'package:flutter/material.dart';

class appTheme {
  // Light theme data
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light, // Required parameter
    primaryColor: Colors.blue, // Required parameter
    secondaryHeaderColor: Colors.orange, // Use secondaryHeaderColor for accent color
    backgroundColor: Colors.white, // Background color
    scaffoldBackgroundColor: Colors.white, // Scaffold background color
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black54),
      headline1: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    // Define more properties as needed
  );

  // Dark theme data
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark, // Required parameter
    primaryColor: Colors.black, // Required parameter
    secondaryHeaderColor: Colors.orange, // Use secondaryHeaderColor for accent color
    backgroundColor: Colors.grey[850], // Background color
    scaffoldBackgroundColor: Colors.grey[900], // Scaffold background color
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white70),
      headline1: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    // Define more properties as needed
  );
}
