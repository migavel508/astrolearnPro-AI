import speech_recognition as sr
from pydub import AudioSegment
from pydub.silence import split_on_silence
import os

# Initialize the recognizer
recognizer = sr.Recognizer()

# Function to reduce noise from audio using pydub
def reduce_noise(audio_segment):
    # Apply a simple filter to reduce background noise
    return audio_segment.low_pass_filter(3000)

# Function to convert wav to text in chunks
def wav_to_text_in_chunks(wav_file):
    try:
        # Load the audio file
        sound = AudioSegment.from_wav(wav_file)

        # Reduce noise from the audio
        sound = reduce_noise(sound)

        # Split audio where silence is 500ms or more and keep the silence for 500ms
        chunks = split_on_silence(sound, 
                                  min_silence_len=500,
                                  silence_thresh=sound.dBFS-14,
                                  keep_silence=500)

        folder_name = "audio_chunks"
        if not os.path.exists(folder_name):
            os.mkdir(folder_name)

        full_text = ""

        # Process each audio chunk
        for i, audio_chunk in enumerate(chunks):
            chunk_filename = os.path.join(folder_name, f"chunk{i}.wav")
            audio_chunk.export(chunk_filename, format="wav")
            
            # Recognize speech from the audio chunk
            with sr.AudioFile(chunk_filename) as source:
                recognizer.adjust_for_ambient_noise(source)
                audio_data = recognizer.record(source)
                
                try:
                    # Recognize speech using Google Web Speech API
                    text = recognizer.recognize_google(audio_data)
                except sr.UnknownValueError:
                    text = ""
                except sr.RequestError as e:
                    text = f"[API Error: {e}]"
                
                full_text += f"{text} "

        return full_text.strip()

    except Exception as e:
        return f"Error processing the audio file: {e}"

# Example usage
wav_file = "C:/Users/migavel/AppData/Local/Temp/output_audio_output_audio_1727862436142.wav"
text_output = wav_to_text_in_chunks(wav_file)
print("Converted Text:", text_output)
