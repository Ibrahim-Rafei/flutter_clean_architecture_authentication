# Flutter Authentication App

![Flutter](https://img.shields.io/badge/Flutter-3.13.9-blue.svg)
![Firebase](https://img.shields.io/badge/dart-3.1.5-orange.svg)

This is a Flutter authentication app showcasing Clean Architecture, BLoC pattern, and dependency injection. It uses Firebase for authentication and provides a solid foundation for building scalable, maintainable Flutter applications.

## Features

- **User Authentication**: Allows users to sign up, log in, and log out securely using Firebase Authentication.

- **Clean Architecture**: Follows a modular and structured approach for better code organization, testability, and maintainability.

- **BLoC Pattern**: Utilizes the BLoC pattern for state management to keep UI and business logic separated.

- **Dependency Injection**: Implements dependency injection for better code decoupling and testability using `get_it`.

## Screenshots

![Screenshot](https://github.com/Ibrahim-Rafei/flutter_clean_architecture_authentication/tree/main/assets/flutter_authentication_screenshot.jpg) | ![Screenshot](https://github.com/Ibrahim-Rafei/flutter_clean_architecture_authentication/tree/main/assets/flutter_authentication_screenshot2.jpg)

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

## Configuration

Before running the app, you need to set up Firebase and add the configuration files. Follow these steps:

1. Create a new Firebase project on the [Firebase Console](https://console.firebase.google.com/).

2. In your Firebase project, navigate to the Authentication section and enable the Email/Password sign-in method.

3. Follow the Firebase documentation for setting up the required authentication methods.

4. Add the Firebase configuration file to the project:

    - For Android: Download the `google-services.json` file and place it in `android/app/google-services.json`.

    - For iOS: Download the `GoogleService-Info.plist` file and place it in `ios/Runner/GoogleService-Info.plist`.

5. That's it! Your Flutter app is now connected to Firebase for authentication.

## Architecture

This project follows the Clean Architecture principles for better separation of concerns and scalability:

- **Presentation Layer**: Contains the UI components, BLoCs, and Widgets.

- **Domain Layer**: Contains the business logic and entities. It is independent of any external frameworks.

- **Data Layer**: Manages data sources, repositories, and data models. It interacts with external services like Firebase.

- **Injection Layer**: Handles dependency injection using the `get_it` package.

## Testing

To run the tests, use the following command:

```bash
flutter run
```

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Reso Coder](https://resocoder.com/) for the excellent tutorials on Flutter architecture.

- [BloC Library](https://bloclibrary.dev/) for providing a solid foundation for BLoC pattern implementation.
