// lib/models/curiosity_pathway_model.dart

class CuriosityPathway {
  final String id; // Unique identifier for the learning pathway
  final String
      title; // Title of the learning pathway (e.g., "Machine Learning Basics")
  final String description; // A short description of what the pathway covers
  final List<Topic> topics; // List of interconnected topics within the pathway
  final int progress; // Progress tracker (e.g., percentage completed)

  CuriosityPathway({
    required this.id,
    required this.title,
    required this.description,
    required this.topics,
    required this.progress,
  });

  // Convert CuriosityPathway object to Map (for saving to Firestore, etc.)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'topics': topics.map((topic) => topic.toMap()).toList(),
      'progress': progress,
    };
  }

  // Create a CuriosityPathway object from Map
  factory CuriosityPathway.fromMap(Map<String, dynamic> map) {
    return CuriosityPathway(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      topics:
          List<Topic>.from(map['topics'].map((topic) => Topic.fromMap(topic))),
      progress: map['progress'] as int,
    );
  }
}

class Topic {
  final String id; // Unique ID for the topic
  final String name; // Name of the topic (e.g., "Linear Regression")
  final String details; // Detailed description of the topic
  final bool isCompleted; // Whether the topic has been completed by the user
  final List<String> relatedTopics; // List of related topic IDs

  Topic({
    required this.id,
    required this.name,
    required this.details,
    required this.isCompleted,
    required this.relatedTopics,
  });

  // Convert Topic object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'isCompleted': isCompleted,
      'relatedTopics': relatedTopics,
    };
  }

  // Create a Topic object from Map
  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id'] as String,
      name: map['name'] as String,
      details: map['details'] as String,
      isCompleted: map['isCompleted'] as bool,
      relatedTopics: List<String>.from(map['relatedTopics']),
    );
  }
}
