import 'package:flutter/material.dart';

class CuriosityPathwaysScreen extends StatelessWidget {
  const CuriosityPathwaysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curiosity Pathways'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              _buildSearchBar(),
              const SizedBox(height: 20),

              // Interactive Learning Map
              _buildLearningMap(),
              const SizedBox(height: 20),

              // Recommended Topics
              const Text(
                'Recommended Topics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildRecommendedTopics(),
              const SizedBox(height: 20),

              // Progress Tracker
              const Text(
                'Your Progress',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildProgressTracker(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Ask a question...',
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Implement search functionality
          },
        ),
      ),
    );
  }

  Widget _buildLearningMap() {
    // Placeholder for the learning map
    return Container(
      height: 200,
      color: Colors.grey[200],
      child: const Center(child: Text('Interactive Learning Map (to be implemented)')),
    );
  }

  Widget _buildRecommendedTopics() {
    // Example of recommended topics
    final topics = ['Flutter Basics', 'State Management', 'Networking', 'UI Design'];
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Text(topics[index]),
            onTap: () {
              // Navigate to the lesson or more details
            },
          ),
        );
      },
    );
  }

  Widget _buildProgressTracker() {
    // Placeholder for the progress tracker
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: const Center(child: Text('Progress Tracker (to be implemented)')),
    );
  }
}
