# Movie App

![Movie App Logo](assets/vectors/logo.svg)

A modern Flutter application for browsing movies and TV shows, built with clean architecture principles and BLoC pattern for state management.

## Features

- **Authentication**: User sign-up and sign-in functionality
- **Movie Browsing**: View trending and now playing movies
- **TV Shows**: Browse popular TV shows
- **Search**: Search for movies and TV shows
- **Details**: View detailed information about movies and TV shows
- **Trailers**: Watch trailers for movies
- **Recommendations**: Get movie and TV show recommendations

## Screenshots

*Coming soon*

## Architecture

The app follows Clean Architecture principles with the following layers:

- **Presentation Layer**: UI components, BLoC for state management
- **Domain Layer**: Business logic, use cases, and repository interfaces
- **Data Layer**: Repository implementations, data sources, and models

### Project Structure

```
lib/
├── common/           # Common widgets, helpers, and BLoC utilities
├── core/             # Core functionality, constants, and configurations
├── data/             # Data sources, repositories, and models
├── domain/           # Business logic, entities, and use cases
├── presentation/     # UI components, screens, and BLoC
└── service_locator.dart  # Dependency injection
```

## Technologies Used

- **Flutter**: UI framework
- **Flutter BLoC**: State management
- **Dio**: HTTP client for API requests
- **Get_It**: Dependency injection
- **Dartz**: Functional programming features
- **YouTube Player**: For playing movie trailers
- **Chewie & Video Player**: For video playback
- **Flutter SVG**: For SVG rendering

## API Integration

The app integrates with a custom backend API for movie and TV show data. The API endpoints include:

- Authentication (signup, signin)
- Movie listings (trending, now playing)
- TV show listings (popular)
- Search functionality
- Movie and TV show details

## Getting Started

### Prerequisites

- Flutter SDK (^3.6.1)
- Dart SDK
- Android Studio / VS Code
- An emulator or physical device

### Installation

1. Clone the repository
   ```
   git clone https://github.com/yourusername/movie-app.git
   ```

2. Navigate to the project directory
   ```
   cd movie-app
   ```

3. Install dependencies
   ```
   flutter pub get
   ```

4. Run the app
   ```
   flutter run
   ```

## Configuration

The app uses a custom backend API. You may need to update the API URL in `lib/core/constants/api_url.dart` to point to your backend server.

```dart
class ApiUrl {
  static const baseURL = 'http://your-api-url:5000/';
  // ...
}
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- [The Movie Database (TMDb)](https://www.themoviedb.org/) for movie data and images
- Flutter and Dart team for the amazing framework
- All the package authors that made this project possible
