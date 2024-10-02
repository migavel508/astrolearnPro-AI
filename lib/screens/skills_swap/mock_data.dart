// mock_data.dart

import 'skill_swap_screen.dart';

class MockData {
  static List<Peer> getMockPeers() {
    return [
      Peer(name: 'Alice', expertise: 'Flutter Development'),
      Peer(name: 'Bob', expertise: 'Blockchain Engineering'),
      Peer(name: 'Charlie', expertise: 'Cybersecurity'),
      Peer(name: 'David', expertise: 'Data Science', ),
      Peer(name: 'Eve', expertise: 'AI & Machine Learning', ),
    ];
  }

  static List<SkillSwapHistory> getMockSkillSwapHistory() {
    return [
      SkillSwapHistory(peerName: 'Alice', date: '2024-09-10'),
      SkillSwapHistory(peerName: 'Bob', date: '2024-09-12'),
      SkillSwapHistory(peerName: 'Charlie', date: '2024-09-15'),
    ];
  }
}
