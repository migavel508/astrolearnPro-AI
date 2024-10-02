// lib/models/user_model.dart

class User {
  final String id; // Unique identifier (e.g., Firebase UID)
  final String name; // Full name of the user
  final String email; // Email address of the user
  final String profilePic; // URL for the user's profile picture
  final List<String>
      learningPathways; // IDs of learning pathways the user is enrolled in
  final List<String> skillSwapHistory; // History of completed skill swaps
  final DateTime createdAt; // Date when the user account was created
  final List<String> completedQuizzes; // List of completed quiz IDs
  final String bio; // Optional bio for the user's profile

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePic,
    required this.learningPathways,
    required this.skillSwapHistory,
    required this.createdAt,
    required this.completedQuizzes,
    this.bio = '',
  });

  // Convert a User object to a Map (useful for storing in Firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePic': profilePic,
      'learningPathways': learningPathways,
      'skillSwapHistory': skillSwapHistory,
      'createdAt': createdAt.toIso8601String(),
      'completedQuizzes': completedQuizzes,
      'bio': bio,
    };
  }

  // Create a User object from a Map (useful for fetching from Firestore)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      profilePic: map['profilePic'] as String,
      learningPathways: List<String>.from(map['learningPathways']),
      skillSwapHistory: List<String>.from(map['skillSwapHistory']),
      createdAt: DateTime.parse(map['createdAt'] as String),
      completedQuizzes: List<String>.from(map['completedQuizzes']),
      bio: map['bio'] as String? ?? '',
    );
  }
}
