import 'package:astrolearn/screens/curiosity/curiosity_pathways_screen.dart';
import 'package:astrolearn/screens/dashboard/course_page_vid.dart';
import 'package:astrolearn/screens/focus_sync_page/focus_sync_page.dart';
import 'package:astrolearn/screens/mindsync/mindsync_screen.dart';
// Import the Skill Swap Screen
import 'package:astrolearn/screens/skills_swap/skill_swap_screen.dart';
import 'package:astrolearn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('Dashboard',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Progress Summary with smooth animation effect
              FadeInUp(
                duration: Duration(milliseconds: 500),
                child: _buildProgressCard(),
              ),
              SizedBox(height: 20),

              // Featured Modules Section
              Text('Featured Modules',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple)),
              SizedBox(height: 10),

              // Apply slide-up effect to each card and add interaction
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: featuredModules.length,
                itemBuilder: (context, index) {
                  final module = featuredModules[index];
                  return _buildAnimatedModuleCard(context, module, index);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          _buildBottomNavigationBar(context), // Pass context to the method
    );
  }

  // Progress Summary Card with gradient background
  Widget _buildProgressCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Progress',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 15),
            LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.white.withOpacity(0.3),
              color: Colors.orangeAccent,
              minHeight: 10,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Progress: 70%',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                Text('Skill Level: Intermediate',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Module Card with animation on hover/tap
  Widget _buildAnimatedModuleCard(
      BuildContext context, Module module, int index) {
    return GestureDetector(
      onTap: () {
        // Navigate to the course video page on tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseVideoPage(module: module),
          ),
        );
      },
      child: FadeInUp(
        delay: Duration(milliseconds: 100 * index),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(module.image,
                    width: 60, height: 60, fit: BoxFit.cover),
              ),
              title: Text(module.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.deepPurple)),
              subtitle: Text(module.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Progress', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                  Text(module.progress,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Bottom Navigation Bar with smooth hover effect and vibrant colors
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) {
        // Navigate to the respective screen based on index
        switch (index) {
          case 0:
            // Home - Do nothing, it's the current screen
            break;
          case 1:
            // Navigate to Skill Swap Screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SkillSwapScreen()),
            );
            break;
          case 2:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CuriosityPathwaysScreen()));
            break;
            // Navigate to Curiosity Screen
            // Implement navigation to Curiosity screen here
            
          case 3:
           Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FocusSyncPage()));
                    
            // Navigate to Profile Screen
            // Implement navigation to Profile screen here
            break;
          case 4:
          Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MindSyncScreen()));
                    
            // Navigate to Settings Screen
            // Implement navigation to Settings screen here
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded, size: 30),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz_rounded, size: 30),
          label: 'SkillSwap',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_rounded, size: 30),
          label: 'Curiosity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule_rounded, size: 30),
          label: 'Focus Sync',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.psychology_alt_rounded, size: 30),
          label: 'MindSync AI',
        ),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
