import 'package:flutter/material.dart';
import 'package:astrolearn/screens/home/home_screen.dart';
import 'package:astrolearn/utils/theme.dart'; // Add theme later if needed

class AstroLearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AstroLearn',
      theme: appTheme.lightTheme, // Define this later in utils/theme.dart
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        // Define other routes here
      },
    );
  }
}
