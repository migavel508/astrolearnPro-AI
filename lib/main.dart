import 'package:astrolearn/utils/theme.dart';
import 'package:astrolearn/utils/welcome_page.dart';
import 'package:flutter/material.dart';
import 'theme.dart'; // Import your theme file
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'firebase_options.dart';  // Ensure this file is generated

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await Gemini.init(apiKey: 'AIzaSyBORnwVH81KUWR1oJ0UnmZNYNUxfut_jug');
  runApp(AstroLearnApp());
}



class AstroLearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AstroLearn',
      theme: appTheme.lightTheme, // Use light theme
      darkTheme: appTheme.darkTheme, // Use dark theme
      home: WelcomePage(), // Replace with your starting screen
    );
  }
}
