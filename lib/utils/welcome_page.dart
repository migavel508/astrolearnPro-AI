import 'package:astrolearn/screens/auth/login_screen.dart';
import 'package:astrolearn/screens/auth/signup_screen.dart';
import 'package:astrolearn/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // AstroLearn Logo
              Image.asset('assets/logo.png',
                  width: 150), // Ensure you have a logo in the assets
              SizedBox(height: 16),
              Text(
                'Your AI Companion for the Next-Gen Learner',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 32),
              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DashboardScreen()), // Navigate to LoginPage
                  );
                },
                child: Text('Get Started'),
              ),
              SizedBox(height: 16),
              // Quick Introduction Text
              Text(
                'Explore personalized learning paths and connect with peers.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 16),
              // Already have an account? Link
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen()), // Navigate to LoginPage
                  );
                },
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              // Sign Up Button
              
            ],
          ),
        ),
      ),
    );
  }
}
