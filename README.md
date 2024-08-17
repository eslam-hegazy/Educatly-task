# Chat App with Authentication

## Project Overview
This project is a real-time chat application built with Flutter 3.24.0, using Firebase for backend services. The app includes authentication, a home screen, and a chat screen, allowing users to send and receive messages in real-time.

## Features
1- User Authentication: Users can sign up, log in, and log out using their email and password.
2- Real-Time Messaging: Messages are sent and received in real-time using Firebase Firestore.
3- Home Screen: Displays a list of chat rooms or user contacts.
4- Chat Screen: Allows users to send and view messages.

## Installation
### Prerequisites
1- Flutter SDK (version 3.24.0)
2- Firebase project setup
3- Android/iOS emulator or physical device for testing

## Steps to Set Up

1- Clone the Repository

``` yaml
git clone https://github.com/eslam-hegazy/Educatly-task
```
2- Install Dependencies
Run the following command to install the necessary dependencies:
```yaml
flutter pub get
```
3- Firebase Configuration
- Go to the Firebase Console.
- Create a new project.
- Add your Android/iOS app to the project.
- Download google-services.json (for Android) or GoogleService-Info.plist (for iOS) and place it in the appropriate directory (android/app or ios/Runner).

4- Run the App
Use the following command to run the app on your connected device:
```yaml
flutter run
```
## Usage
1- Sign Up/Login
- Launch the app.
- Sign up or log in using an email and password.
2- Accessing the Home Screen
- After logging in, you will be directed to the home screen.
- The home screen lists available chat rooms or contacts.
3- Sending Messages
- Select a chat room or contact from the home screen to enter the chat screen.
- Type your message and send it. The message will appear in real-time.

## Dependencies
- firebase_core: ^3.3.0
- get: ^4.6.6
- firebase_auth: ^5.1.4
- google_fonts: ^6.2.1
- cloud_firestore: ^5.2.1
- into: ^0.19.0
  
