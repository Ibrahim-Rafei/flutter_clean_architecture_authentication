# Flutter Authentication App

![Flutter](https://img.shields.io/badge/Flutter-3.16.5-blue.svg)
![Firebase](https://img.shields.io/badge/dart-3.2.3-orange.svg)

This is a Flutter authentication app showcasing Clean Architecture, BLoC pattern, and dependency injection. It uses Firebase for authentication and provides a solid foundation for building scalable, maintainable Flutter applications.

## Features

- **User Authentication**: Allows users to sign up, log in, and log out securely using Firebase Authentication.

- **Clean Architecture**: Follows a modular and structured approach for better code organization, testability, and maintainability.

- **BLoC Pattern**: Utilizes the BLoC pattern for state management to keep UI and business logic separated.

- **Dependency Injection**: Implements dependency injection for better code decoupling and testability using `get_it`.
  
## Screenshots

<p float="left">
  <img src="https://raw.githubusercontent.com/Ibrahim-Rafei/flutter_clean_architecture_authentication/main/assets/flutter_authentication_screenshot.jpg" width="400"/> 
  <img src="https://raw.githubusercontent.com/Ibrahim-Rafei/flutter_clean_architecture_authentication/main/assets/flutter_authentication_screenshot2.jpg" width="400"/>
</p>

## Getting Started

1. **Clone the repository**:

```bash
git clone https://github.com/Ibrahim-Rafei/flutter_clean_architecture_authentication.git
```

2. **Navigate to the project directory**:

```bash
cd flutter_clean_architecture_authentication
```

3. **Install dependencies**:

```bash
flutter pub get
```

4. **Run the app**:

```bash
flutter run
```

##  Configuration

Before running the app, follow these steps to set up Firebase and configure your Flutter app for authentication:

1. **Configure Firebase for Flutter:**
   - Open a terminal and navigate to your Flutter project directory.
   - Download npm
   - Run the following command to configure Firebase for your project:
     ```bash
     npm install -g firebase-tools
     dart pub global activate flutterfire_cli
     flutterfire configure
     ```

2. **Configure Authentication:**
   - In your Firebase project, navigate to the Authentication section.
   - Enable the Email/Password sign-in method.
   - Follow the Firebase documentation to set up additional authentication methods, including Google Sign-In.

3. **Add Firebase Configuration Files:**
   - For Android:
      - Download the `google-services.json` file.
      - Place the file in `android/app/google-services.json`.
      - Obtain the SHA-1 fingerprint for your Android app by running the following command in the terminal from your Android project directory:
        ```bash
        ./gradlew signingReport
        ```
        - Add the obtained SHA-1 fingerprint to the Firebase Console in the "SHA certificate fingerprints" section.

   - For iOS:
      - Download the `GoogleService-Info.plist` file.
      - Place the file in `ios/Runner/GoogleService-Info.plist`.

4. **Run Your Flutter App:**
   - Your Flutter app is now connected to Firebase for authentication.

## Architecture

This project follows the Clean Architecture principles for better separation of concerns and scalability:

- **Presentation Layer**: Contains the UI components, BLoCs, and Widgets.

- **Domain Layer**: Contains the business logic and entities. It is independent of any external frameworks.

- **Data Layer**: Manages data sources, repositories, and data models. It interacts with external services like Firebase.

## Testing

To run the tests, use the following command:

```bash
flutter run
```

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is in the public domain. You are free to use, modify, and distribute it without any restrictions.

## Acknowledgments

- [Reso Coder's Flutter Clean Architecture series](https://resocoder.com/flutter-clean-architecture-tdd) for the excellent tutorials on Flutter architecture.

- [BloC Library](https://bloclibrary.dev/) for providing a solid foundation for BLoC pattern implementation.
