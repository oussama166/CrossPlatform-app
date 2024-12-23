# AI-Powered Flutter Application

A Flutter-based mobile application that integrates advanced AI models and Firebase services to deliver a dynamic, interactive, and secure user experience.

## Key Features

- **Gemini AI Voice Assistant** - Natural language voice interaction for seamless conversations
- **Clothing Prediction with ANN** - Artificial Neural Network model for classifying clothing from images
- **Image Classification with CNN** - Convolutional Neural Network for enhanced image recognition
- **Firebase Authentication** - Secure user management and authentication flow

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Firebase CLI](https://firebase.google.com/docs/cli)
- [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/)
- Compatible IDE (Visual Studio Code or Android Studio)
- Firebase project configured for the application
- Gemini API key from Google AI Studio

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/your-repo.git
cd your-repo
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Environment Variables

Create a `.env` file in the root directory of your project:

```plaintext
geminiApiKey=your_gemini_api_key_here
webFireBaseApiKey=your_web_firebase_api_key_here
androidFireBaseApiKey=your_android_firebase_api_key_here
windowsFireBaseApiKey=your_windows_firebase_api_key_here
```

Replace the placeholder values with your actual API keys:
- Get your Gemini API key from [Google AI Studio](https://makersuite.google.com/app/apikey)
- Find your Firebase API keys in your Firebase Console project settings

⚠️ **Important**: 
- Never commit the `.env` file to version control
- Add `.env` to your `.gitignore` file
- Keep your API keys secure and private

### 4. Configure Firebase

#### Install Firebase CLI
```bash
npm install -g firebase-tools
```

#### Authentication
```bash
firebase login
```

#### Project Setup
```bash
flutterfire configure
```

Follow the prompts to:
1. Select your Firebase project
2. Generate the required `firebase_options.dart` file

#### Configure Firebase Authentication

1. Open the [Firebase Console](https://console.firebase.google.com)
2. Select your project
3. Navigate to Build → Authentication in the left sidebar
4. Click "Get Started"
5. Enable Email/Password Authentication:
   - Click the "Sign-in method" tab
   - Click "Email/Password" in the providers list
   - Toggle "Enable" to ON
   - Click "Save"
6. (Optional) Configure Password Requirements:
   - Go to the "Templates" tab
   - Customize email templates for:
     - Email verification
     - Password reset
     - Email address change

#### Update Security Rules ( Optional )

1. In the Firebase Console, go to Build → Authentication → Rules
2. Update the rules to allow authenticated access:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### 5. Update Main Entry Point

Add Firebase initialization to your `main.dart`:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
```

### 6. Launch the Application

```bash
flutter run
```

## Usage Guide

1. **Authentication**
   - Create an account or sign in using email and password
   - Verify your email address (if required)
   - Reset password functionality available
   - Manage your profile and settings

2. **Voice Assistant**
   - Access the Gemini AI assistant through voice commands
   - Natural language processing for intuitive interactions

3. **Image Analysis**
   - Upload images for clothing classification
   - Receive predictions powered by ANN and CNN models

## Contributing

We welcome contributions to improve the application! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to your branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.