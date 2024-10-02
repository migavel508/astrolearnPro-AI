import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts; // For performance graph
import 'package:animate_do/animate_do.dart';

class MindSyncScreen extends StatelessWidget {
  final List<PerformanceData> data = [
    // Sample data for the graph (can be replaced with actual performance data)
    PerformanceData(day: 'Mon', score: 70),
    PerformanceData(day: 'Tue', score: 85),
    PerformanceData(day: 'Wed', score: 60),
    PerformanceData(day: 'Thu', score: 90),
    PerformanceData(day: 'Fri', score: 80),
  ];

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
        title: Text('MindSync AI Reflection',
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
              // Reflection Summary
              FadeInUp(
                duration: Duration(milliseconds: 500),
                child: _buildReflectionSummary(),
              ),
              SizedBox(height: 20),

              // Performance Graph
              FadeInUp(
                duration: Duration(milliseconds: 600),
                child: _buildPerformanceGraph(),
              ),
              SizedBox(height: 20),

              // Micro-feedback
              FadeInUp(
                duration: Duration(milliseconds: 700),
                child: _buildMicroFeedback(),
              ),
              SizedBox(height: 20),

              // Recommendations
              FadeInUp(
                duration: Duration(milliseconds: 800),
                child: _buildRecommendations(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reflection Summary
  Widget _buildReflectionSummary() {
    return Container(
      padding: EdgeInsets.all(16.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reflection Summary',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 10),
          Text('Your recent learning session went well! You performed above average in problem-solving and critical thinking tasks.',
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }

  // Performance Graph (using sample data)
  Widget _buildPerformanceGraph() {
    List<charts.Series<PerformanceData, String>> series = [
      charts.Series(
        id: 'Performance',
        data: data,
        domainFn: (PerformanceData data, _) => data.day,
        measureFn: (PerformanceData data, _) => data.score,
        colorFn: (PerformanceData data, _) =>
            charts.ColorUtil.fromDartColor(Colors.deepPurple),
      ),
    ];

    return Container(
      height: 200,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Performance Graph',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
          SizedBox(height: 10),
          Expanded(
            child: charts.BarChart(
              series,
              animate: true,
              vertical: false,
              barGroupingType: charts.BarGroupingType.grouped,
              behaviors: [
                charts.SeriesLegend(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Micro-feedback Section
  Widget _buildMicroFeedback() {
    return Container(
      padding: EdgeInsets.all(16.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Micro-feedback',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 10),
          Text('Common Mistakes:',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 5),
          Text('1. Overlooking edge cases in problem-solving.',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          Text('2. Lack of clarity in task execution strategies.',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          SizedBox(height: 10),
          Text('Problem-Solving Strategies:',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 5),
          Text('• Break down complex tasks into smaller manageable parts.',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          Text('• Approach problems from multiple angles for a holistic solution.',
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }

  // Recommendations Section
  Widget _buildRecommendations() {
    return Container(
      padding: EdgeInsets.all(16.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recommendations',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 10),
          Text('Based on your recent performance, here are some suggestions for your next learning steps:',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          SizedBox(height: 10),
          Text('1. Focus on advanced problem-solving exercises.',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          Text('2. Engage in peer-to-peer discussions to improve clarity of thought.',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          Text('3. Explore learning modules related to task management and strategy.',
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }
}

// Sample Data Class for Graph
class PerformanceData {
  final String day;
  final int score;

  PerformanceData({required this.day, required this.score});
}
