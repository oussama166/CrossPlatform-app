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
- [Firebase project configured for the application]()

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

### 3. Configure Firebase

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

#### Enable Authentication
1. Open the [Firebase Console](https://console.firebase.google.com)
2. Navigate to Authentication → Get Started
3. Enable desired sign-in methods (Email/Password, Google, etc.)

### 4. Update Main Entry Point

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

### 5. Launch the Application

```bash
flutter run
```

## Usage Guide

1. **Authentication**
   - Create an account or sign in using Firebase Authentication
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