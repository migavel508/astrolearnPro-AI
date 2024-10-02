// lib/models/skill_swap_model.dart

class SkillSwapSession {
  final String sessionId;                // Unique identifier for each SkillSwap session
  final String studentId;                // ID of the current user/student
  final String peerId;                   // ID of the paired peer/tutor
  final String subject;                  // The subject for the session (e.g., "Mathematics", "Physics")
  final String region;                   // The geographical region of the peer
  final String sessionType;              // Type of session (e.g., "chat", "video_call")
  final bool isActive;                   // Status of the session (whether it's ongoing)
  final DateTime sessionDate;            // Date and time of the SkillSwap session
  final int studentRating;               // Rating given by the student to the peer
  final int peerRating;                  // Rating given by the peer to the student

  SkillSwapSession({
    required this.sessionId,
    required this.studentId,
    required this.peerId,
    required this.subject,
    required this.region,
    required this.sessionType,
    required this.isActive,
    required this.sessionDate,
    this.studentRating = 0,
    this.peerRating = 0,
  });

  // Convert SkillSwapSession object to Map (for saving to Firestore, etc.)
  Map<String, dynamic> toMap() {
    return {
      'sessionId': sessionId,
      'studentId': studentId,
      'peerId': peerId,
      'subject': subject,
      'region': region,
      'sessionType': sessionType,
      'isActive': isActive,
      'sessionDate': sessionDate.toIso8601String(),
      'studentRating': studentRating,
      'peerRating': peerRating,
    };
  }

  // Create a SkillSwapSession object from Map
  factory SkillSwapSession.fromMap(Map<String, dynamic> map) {
    return SkillSwapSession(
      sessionId: map['sessionId'] as String,
      studentId: map['studentId'] as String,
      peerId: map['peerId'] as String,
      subject: map['subject'] as String,
      region: map['region'] as String,
      sessionType: map['sessionType'] as String,
      isActive: map['isActive'] as bool,
      sessionDate: DateTime.parse(map['sessionDate'] as String),
      studentRating: map['studentRating'] as int? ?? 0,
      peerRating: map['peerRating'] as int? ?? 0,
    );
  }
}

class Peer {
  final String peerId;                   // Unique ID of the peer/tutor
  final String name;                     // Peer/tutor name
  final String subjectExpertise;         // Expertise subject of the peer (e.g., "Biology", "History")
  final String region;                   // Geographical region of the peer
  final int rating;                      // Rating given by students

  Peer({
    required this.peerId,
    required this.name,
    required this.subjectExpertise,
    required this.region,
    this.rating = 0, required String expertise,
  });

  // Convert Peer object to Map
  Map<String, dynamic> toMap() {
    return {
      'peerId': peerId,
      'name': name,
      'subjectExpertise': subjectExpertise,
      'region': region,
      'rating': rating,
    };
  }

  // Create a Peer object from Map
  factory Peer.fromMap(Map<String, dynamic> map) {
    return Peer(
      peerId: map['peerId'] as String,
      name: map['name'] as String,
      subjectExpertise: map['subjectExpertise'] as String,
      region: map['region'] as String,
      rating: map['rating'] as int? ?? 0, expertise: '',
    );
  }
}

class Feedback {
  final String sessionId;                // The session the feedback is associated with
  final String feedbackText;             // Feedback text provided by the student or peer
  final String givenBy;                  // Indicates whether feedback is from the student or peer (e.g., "student", "peer")

  Feedback({
    required this.sessionId,
    required this.feedbackText,
    required this.givenBy,
  });

  // Convert Feedback object to Map
  Map<String, dynamic> toMap() {
    return {
      'sessionId': sessionId,
      'feedbackText': feedbackText,
      'givenBy': givenBy,
    };
  }

  // Create Feedback object from Map
  factory Feedback.fromMap(Map<String, dynamic> map) {
    return Feedback(
      sessionId: map['sessionId'] as String,
      feedbackText: map['feedbackText'] as String,
      givenBy: map['givenBy'] as String,
    );
  }
}
