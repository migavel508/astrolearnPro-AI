import 'package:flutter/material.dart';
import 'mock_data.dart'; // Import the mock data
import 'chat_screen.dart'; // Import the chat screen

class SkillSwapScreen extends StatelessWidget {
  SkillSwapScreen({Key? key}) 
      : availablePeers = MockData.getMockPeers(), // Assign mock data
        skillSwapHistory = MockData.getMockSkillSwapHistory(), // Assign mock data
        super(key: key);

  final List<Peer> availablePeers; // List of available peers for skill exchange
  final List<SkillSwapHistory> skillSwapHistory; // History of past exchanges

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill Swap'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // List of available peers for skill exchange
              const Text(
                'Available Peers for Skill Exchange',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildPeerList(context), // Pass context here
              const SizedBox(height: 20),

              // Skill Swap history
              const Text(
                'Skill Swap History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildSwapHistory(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeerList(BuildContext context) { // Accept context as parameter
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: availablePeers.length,
      itemBuilder: (context, index) {
        final peer = availablePeers[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Text(peer.name),
            subtitle: Text('Expertise: ${peer.expertise}'),
            trailing: ElevatedButton(
              onPressed: () {
                _initiateChat(context, peer); // Pass context here
              },
              child: const Text('Chat'),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSwapHistory() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skillSwapHistory.length,
      itemBuilder: (context, index) {
        final history = skillSwapHistory[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Text('Swapped with: ${history.peerName}'),
            subtitle: Text('Date: ${history.date}'),
          ),
        );
      },
    );
  }

  void _initiateChat(BuildContext context, Peer peer) { // Receive context here
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(peer: peer), // Navigate to chat screen
      ),
    );
  }
}

// Peer model
class Peer {
  final String name;
  final String expertise;

  Peer({required this.name, required this.expertise});
}

// SkillSwapHistory model
class SkillSwapHistory {
  final String peerName;
  final String date;

  SkillSwapHistory({required this.peerName, required this.date});
}
