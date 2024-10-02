import 'package:flutter/material.dart';

class FocusSyncPage extends StatelessWidget {
  const FocusSyncPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FocusSync Study Rituals'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Schedule Overview
              const Text(
                'Your Study Schedule',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildScheduleOverview(),
              const SizedBox(height: 20),

              // Reminders & Notifications
              const Text(
                'Reminders & Notifications',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildRemindersSection(),
              const SizedBox(height: 20),

              // Study Activity Tracker
              const Text(
                'Study Activity Tracker',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildActivityTracker(),
              const SizedBox(height: 20),

              // AI Suggestions
              const Text(
                'AI Suggestions for Your Next Study',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildAISuggestions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleOverview() {
    // Placeholder for personalized study schedule
    return Container(
      height: 150,
      color: Colors.grey[200],
      child: const Center(child: Text('Personalized Study Schedule (to be implemented)')),
    );
  }

  Widget _buildRemindersSection() {
    return ListTile(
      leading: const Icon(Icons.notifications_active),
      title: const Text('Next Study Session: 3:00 PM'),
      subtitle: const Text('Breaks: 10 minutes after every 45 minutes of study'),
      trailing: ElevatedButton(
        onPressed: () {
          // Implement logic to adjust reminders
        },
        child: const Text('Edit'),
      ),
    );
  }

  Widget _buildActivityTracker() {
    // Placeholder for past study sessions and productivity levels
    return Container(
      height: 150,
      color: Colors.grey[200],
      child: const Center(child: Text('Study Activity Tracker (to be implemented)')),
    );
  }

  Widget _buildAISuggestions() {
    // Example of AI study suggestions
    final suggestions = [
      'Review Flutter State Management',
      'Practice Data Structures Algorithms',
      'Revise notes on Machine Learning',
      'Take a short break to refresh energy',
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Text(suggestions[index]),
          ),
        );
      },
    );
  }
}
