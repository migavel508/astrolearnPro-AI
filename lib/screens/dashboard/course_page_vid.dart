// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:astrolearn/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:open_file/open_file.dart';
// import 'package:flutter_gemini/flutter_gemini.dart'; // Import Gemini package

// class CourseVideoPage extends StatefulWidget {
//   final Module module;

//   CourseVideoPage({required this.module});

//   @override
//   _CourseVideoPageState createState() => _CourseVideoPageState();
// }

// class _CourseVideoPageState extends State<CourseVideoPage> {
//   late VideoPlayerController _controller;
//   String _audioExtractMessage = "Extracting audio...";
//   String _transcription = "Waiting for transcription...";
//   String _aiResponse = "Waiting for AI analysis...";
//   bool _isExtracting = false;
//   bool _isTranscribing = false;
//   bool _isAnalyzing = false;
//   final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
//   stt.SpeechToText _speech = stt.SpeechToText();
//   bool _speechAvailable = false;
//   File? _extractedAudioFile;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoAndAudio();
//     _initSpeech();
//   }

//   Future<void> _initSpeech() async {
//     _speechAvailable = await _speech.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> _initializeVideoAndAudio() async {
//     setState(() {
//       _extractedAudioFile = null;
//       _audioExtractMessage = "Extracting audio...";
//       _transcription = "Waiting for transcription...";
//       _aiResponse = "Waiting for AI analysis...";
//     });

//     // Correct initialization of the video player controller
//     _controller = VideoPlayerController.network(widget.module.videoUrl)
//       ..initialize().then((_) {
//         setState(() {}); // Trigger UI update after video initialization
//         _extractAudioFromVideo(widget.module.videoUrl);
//       }).catchError((error) {
//         setState(() {
//           _audioExtractMessage = 'Failed to load video: $error';
//         });
//       });
//   }

//   Future<void> _extractAudioFromVideo(String videoUrl) async {
//     setState(() {
//       _isExtracting = true;
//     });

//     try {
//       final videoFile = await _downloadVideo(videoUrl);
//       final audioFile = await _extractAudio(videoFile);

//       setState(() {
//         _extractedAudioFile = audioFile;
//         _audioExtractMessage = "Audio extracted successfully.";
//         _isExtracting = false;
//       });

//       _transcribeAudio(audioFile);
//     } catch (e) {
//       setState(() {
//         _audioExtractMessage = 'Error extracting audio: $e';
//         _isExtracting = false;
//       });
//     }
//   }

//   Future<File> _downloadVideo(String videoUrl) async {
//     final response = await http.get(Uri.parse(videoUrl));
//     final documentDirectory = await getApplicationDocumentsDirectory();
//     final file = File('${documentDirectory.path}/temp_video_${DateTime.now().millisecondsSinceEpoch}.mp4');
//     file.writeAsBytesSync(response.bodyBytes);
//     return file;
//   }

//   Future<File> _extractAudio(File videoFile) async {
//     final documentDirectory = await getApplicationDocumentsDirectory();
//     final audioOutputPath = '${documentDirectory.path}/output_audio_${DateTime.now().millisecondsSinceEpoch}.wav';
//     await _flutterFFmpeg.execute('-i ${videoFile.path} -q:a 0 -map a $audioOutputPath');
//     return File(audioOutputPath);
//   }

//   Future<void> _transcribeAudio(File audioFile) async {
//     setState(() {
//       _isTranscribing = true;
//       _transcription = "Transcribing audio...";
//     });

//     try {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('http://192.168.39.36:5000/transcribe'),
//       );
//       request.files.add(await http.MultipartFile.fromPath('file', audioFile.path));

//       var response = await request.send();
//       if (response.statusCode == 200) {
//         final responseData = await http.Response.fromStream(response);
//         final data = jsonDecode(responseData.body);

//         setState(() {
//           _transcription = data['transcription'] ?? "Transcription failed";
//           _isTranscribing = false;
//         });

//         _analyzeTranscription(_transcription); // Analyze the transcribed text
//       } else {
//         setState(() {
//           _transcription = "Failed to transcribe audio.";
//           _isTranscribing = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _transcription = "Error transcribing audio: $e";
//         _isTranscribing = false;
//       });
//     }
//   }

// Future<void> _analyzeTranscription(String transcribedText) async {
//   setState(() {
//     _isAnalyzing = true;
//     _aiResponse = "Analyzing with AI...";
//   });

//   final gemini = Gemini.instance;

//   // Log the transcription being sent to Gemini
//   log('Sending transcription to Gemini: $transcribedText');

//   try {
//     final response = await gemini.text(transcribedText);

//     // Log the response from Gemini
//     log('Received response from Gemini: ${response?.output}');

//     // Use null-aware operator to assign a fallback value if 'output' is null
//     String aiResponse = response?.output ?? "No response from DBOT";

//     // Replace "Gemini" with "DBOT" in the response
//     aiResponse = aiResponse.replaceAll("Gemini", "DBOT");

//     setState(() {
//       _aiResponse = aiResponse;
//       _isAnalyzing = false;
//     });
//   } catch (e) {
//     log('Error analyzing transcription: $e');

//     setState(() {
//       _aiResponse = "Error analyzing transcription: $e";
//       _isAnalyzing = false;
//     });
//   }
// }

//   void _openExtractedAudio() async {
//     if (_extractedAudioFile != null && await _extractedAudioFile!.exists()) {
//       final result = await OpenFile.open(_extractedAudioFile!.path);
//       if (result.type == ResultType.noAppToOpen) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('No app installed to open the audio file.')),
//         );
//       } else if (result.type != ResultType.done) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to open the audio file: ${result.message}')),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Audio file not available or not found.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.module.title),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: _controller.value.isInitialized
//                       ? AspectRatio(
//                           aspectRatio: _controller.value.aspectRatio,
//                           child: VideoPlayer(_controller),
//                         )
//                       : Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       _controller.value.isPlaying
//                           ? _controller.pause()
//                           : _controller.play();
//                     });
//                   },
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(_controller.value.isPlaying
//                           ? Icons.pause
//                           : Icons.play_arrow),
//                       SizedBox(width: 10),
//                       Text(_controller.value.isPlaying ? 'Pause' : 'Play'),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               Center(
//                 child: Text(
//                   _isExtracting ? "Extracting audio..." : _audioExtractMessage,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20),

//               Center(
//                 child: Text(
//                   _isTranscribing ? "Transcribing audio..." : _transcription,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20),

//               Center(
//                 child: Text(
//                   _isAnalyzing ? "Analyzing with AI..." : _aiResponse,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(height: 20),

//               if (_extractedAudioFile != null)
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: _openExtractedAudio,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.music_note),
//                         SizedBox(width: 10),
//                         Text('Open Extracted Audio'),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:astrolearn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:open_file/open_file.dart';
import 'package:flutter_gemini/flutter_gemini.dart'; // Import Gemini package

class CourseVideoPage extends StatefulWidget {
  final Module module;

  CourseVideoPage({required this.module});

  @override
  _CourseVideoPageState createState() => _CourseVideoPageState();
}

class _CourseVideoPageState extends State<CourseVideoPage> {
  late VideoPlayerController _controller;
  String _audioExtractMessage = "Extracting audio...";
  String _transcription = "Waiting for transcription...";
  String _aiResponse = "Waiting for AI analysis...";
  bool _isExtracting = false;
  bool _isTranscribing = false;
  bool _isAnalyzing = false;
  final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _speechAvailable = false;
  File? _extractedAudioFile;

  @override
  void initState() {
    super.initState();
    _initializeVideoAndAudio();
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    _speechAvailable = await _speech.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeVideoAndAudio() async {
    setState(() {
      _extractedAudioFile = null;
      _audioExtractMessage = "Extracting audio...";
      _transcription = "Waiting for transcription...";
      _aiResponse = "Waiting for AI analysis...";
    });

    _controller = VideoPlayerController.network(widget.module.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _extractAudioFromVideo(widget.module.videoUrl);
      }).catchError((error) {
        setState(() {
          _audioExtractMessage = 'Failed to load video: $error';
        });
      });
  }

  Future<void> _extractAudioFromVideo(String videoUrl) async {
    setState(() {
      _isExtracting = true;
    });

    try {
      final videoFile = await _downloadVideo(videoUrl);
      final audioFile = await _extractAudio(videoFile);

      setState(() {
        _extractedAudioFile = audioFile;
        _audioExtractMessage = "Audio extracted successfully.";
        _isExtracting = false;
      });

      _transcribeAudio(audioFile);
    } catch (e) {
      setState(() {
        _audioExtractMessage = 'Error extracting audio: $e';
        _isExtracting = false;
      });
    }
  }

  Future<File> _downloadVideo(String videoUrl) async {
    final response = await http.get(Uri.parse(videoUrl));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final file = File(
        '${documentDirectory.path}/temp_video_${DateTime.now().millisecondsSinceEpoch}.mp4');
    file.writeAsBytesSync(response.bodyBytes);
    return file;
  }

  Future<File> _extractAudio(File videoFile) async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final audioOutputPath =
        '${documentDirectory.path}/output_audio_${DateTime.now().millisecondsSinceEpoch}.wav';
    await _flutterFFmpeg
        .execute('-i ${videoFile.path} -q:a 0 -map a $audioOutputPath');
    return File(audioOutputPath);
  }

  Future<void> _transcribeAudio(File audioFile) async {
    setState(() {
      _isTranscribing = true;
      _transcription = "Transcribing audio...";
    });

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.39.36:5000/transcribe'),
      );
      request.files
          .add(await http.MultipartFile.fromPath('file', audioFile.path));

      var response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final data = jsonDecode(responseData.body);

        setState(() {
          _transcription = data['transcription'] ?? "Transcription failed";
          _isTranscribing = false;
        });

        _analyzeTranscription(_transcription); // Analyze the transcribed text
      } else {
        setState(() {
          _transcription = "Failed to transcribe audio.";
          _isTranscribing = false;
        });
      }
    } catch (e) {
      setState(() {
        _transcription = "Error transcribing audio: $e";
        _isTranscribing = false;
      });
    }
  }






String _simplifyExplanation(String explanation) {
  // Example simplification: This can be adjusted based on your needs
  // For instance, you can remove complex jargon, shorten sentences, etc.
  // This is just a basic example for demonstration.

  // Basic simplification: Replace complex words with simpler alternatives
  Map<String, String> simplifications = {
    'utilize': 'use',
    'implement': 'put in place',
    'facilitate': 'help',
    'integrate': 'combine',
    'analyze': 'look at',
  };

  // Loop through the simplifications and replace in the explanation
  simplifications.forEach((key, value) {
    explanation = explanation.replaceAll(key, value);
  });

  // Further simplification can be done as needed.
  // Here we could also shorten or modify sentences for clarity.

  return explanation;
}







Future<void> _analyzeTranscription(String transcribedText) async {
  setState(() {
    _isAnalyzing = true;
    _aiResponse = "Analyzing with AI...";
  });

  final gemini = Gemini.instance;

  log('Sending transcription to Gemini: $transcribedText');

  try {
    // Create a prompt for storytelling
    String prompt = "Please summarize and explain the following content as a story for learners: $transcribedText";
    final response = await gemini.text(prompt);
    log('Received response from Gemini: ${response?.output}');

    String aiResponse = response?.output ?? "No response from DBOT";
    aiResponse = aiResponse.replaceAll("Gemini", "DBOT");

    // Make the AI response child-friendly
    aiResponse = _simplifyExplanation(aiResponse);

    setState(() {
      _aiResponse = aiResponse;
      _isAnalyzing = false;
    });
  } catch (e) {
    log('Error analyzing transcription: $e');

    setState(() {
      _aiResponse = "Error analyzing transcription: $e";
      _isAnalyzing = false;
    });
  }
}








// Helper function to create a story from the AI response
String _createStoryFromResponse(String aiResponse) {
  // Example transformation into a story format
  return "Here's a story based on what was transcribed:\n\n"
      "Once upon a time, there was a great lesson learned: $aiResponse. "
      "This teaches us that understanding the concept deeply can lead us to success. "
      "Remember, every journey begins with a single step and every story has a valuable lesson to impart.";
}






  void _openExtractedAudio() async {
    if (_extractedAudioFile != null && await _extractedAudioFile!.exists()) {
      final result = await OpenFile.open(_extractedAudioFile!.path);
      if (result.type == ResultType.noAppToOpen) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No app installed to open the audio file.')),
        );
      } else if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Failed to open the audio file: ${result.message}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Audio file not available or not found.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.module.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video Player
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ),
              SizedBox(height: 20),

              // Play/Pause Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(_controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow),
                      SizedBox(width: 10),
                      Text(_controller.value.isPlaying ? 'Pause' : 'Play'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Audio Extraction Status
              Center(
                child: Text(
                  _isExtracting ? "Extracting audio..." : _audioExtractMessage,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),

              // Transcription
              _buildTranscriptionSection(),

              // AI Analysis
              _buildAIAnalysisSection(),

              SizedBox(height: 20),

              // Open Extracted Audio Button
              if (_extractedAudioFile != null)
                Center(
                  child: ElevatedButton(
                    onPressed: _openExtractedAudio,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.music_note),
                        SizedBox(width: 10),
                        Text('Open Extracted Audio'),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTranscriptionSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightBlue.shade50,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transcription:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            _isTranscribing ? "Transcribing audio..." : _transcription,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildAIAnalysisSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightGreen.shade50,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "AI Analysis (Explained Simply):",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            _isAnalyzing ? "Analyzing with AI..." : _aiResponse,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
