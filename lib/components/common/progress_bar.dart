import 'package:flutter/material.dart';

class UserProgressSummary extends StatelessWidget {
  final double currentSkillLevel;
  final double curiosityPathProgress;
  final double skillSwapProgress;

  UserProgressSummary({
    required this.currentSkillLevel,
    required this.curiosityPathProgress,
    required this.skillSwapProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Progress',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        _buildProgressBar('Current Skill Level', currentSkillLevel),
        SizedBox(height: 10),
        _buildProgressBar('Curiosity Path Progress', curiosityPathProgress),
        SizedBox(height: 10),
        _buildProgressBar('SkillSwap Progress', skillSwapProgress),
      ],
    );
  }

  Widget _buildProgressBar(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: value,
          minHeight: 10,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        ),
        SizedBox(height: 5),
        Text(
          '${(value * 100).toStringAsFixed(0)}%',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
