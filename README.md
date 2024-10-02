# AstroLearn – AI Companion for the Next-Gen Learner

AstroLearn is a cutting-edge educational platform powered by AI that provides personalized learning pathways, dynamic simulations, and peer-to-peer skill exchange. It leverages GenAI to create a unique, adaptive learning experience tailored to each learner's needs, making learning more engaging, interactive, and efficient.

## Features

### 1. **Curiosity Pathways**
   - Personalized learning paths based on user questions and interactions.
   - Includes an interactive learning map, recommended topics, and progress tracking.

### 2. **SkillSwap AI Network**
   - Peer-to-peer skill exchange platform that matches users based on expertise.
   - Chat functionality and history of past exchanges are integrated.

### 3. **AI-Generated Adaptive Simulations**
   - Dynamic, subject-specific simulations to reinforce learning concepts.
   - Real-time feedback and progress tracking for simulations.

### 4. **MindSync AI Reflection**
   - AI-driven reflections on user performance, offering insights into strengths and areas for improvement.

### 5. **FocusSync Study Rituals**
   - AI-powered study schedules, reminders, and real-time study suggestions based on user energy and performance.

### 6. **Dynamic Challenge Generation**
   - Personalized challenges generated dynamically to keep learners engaged and motivated.

### 7. **Gemini Nexus (Cross-Curricular Insights)**
   - AI-powered insights connecting knowledge from multiple disciplines, fostering interdisciplinary understanding.

## Technologies Used
- **Flutter**: Cross-platform app development.
- **Firebase**: Backend for authentication, storage, and notifications.
- **Google ML Kit**: Used for OCR and text extraction from videos.
- **Gemini AI**: For personalized learning experiences, study suggestions, and adaptive simulations.
- **Dart**: Programming language for the Flutter framework.
- **IPFS**: Decentralized storage for user-generated content.
- **Blockchain**: For secure data storage and NFT management.
- **Speech Recognition**: For transcribing and analyzing video content.
- **OCR (Optical Character Recognition)**: Extracts text from video frames.

## In-Scope
- Building personalized learning experiences with GenAI and simulations.
- Skill exchange platform with real-time chat and AI-driven matching.
- Adaptive study rituals based on performance and productivity.

## Out of Scope
- Integration with external third-party APIs outside Gemini AI and Firebase.
- Extensive data processing beyond video frames and transcriptions.

## Future Opportunities
- Expand the AI capabilities to include more advanced simulations and interdisciplinary learning.
- Integrate IoT devices for real-time environmental feedback in simulations.
- Introduce AI-driven career guidance based on user learning patterns.

## Challenges We Ran Into
One of the major challenges we faced was integrating seamless video analysis into the app, specifically extracting relevant text and voice data from video content for educational purposes. We overcame this by combining **Google ML Kit** for OCR with a custom video processing pipeline to ensure accurate content transcription and analysis. Additionally, ensuring fluid interactions in our peer-to-peer SkillSwap network presented difficulties, but we optimized our matching algorithms to enhance user experience.

## How to Run the Project
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/astrolearn.git
    cd astrolearn
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Set up Firebase:
    - Add your Firebase configuration file (`google-services.json` for Android or `GoogleService-Info.plist` for iOS).

4. Run the app:
    ```bash
    flutter run
    ```
5. We need to start the python flask server for transcripting the text content 


PS C:\Users\migavel\Downloads\Astroleran> cd .\lib\       
PS C:\Users\migavel\Downloads\Astroleran\lib> cd .\backend\   
PS C:\Users\migavel\Downloads\Astroleran\lib\backend> python main.py                                                 
 * Serving Flask app 'main'


## Contributing
Contributions are welcome! Please fork the repository, create a new branch for your feature or fix, and open a pull request.

## License
This project is licensed under the MIT License.
