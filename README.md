# House Organizer - Group-Home Task Management App

A comprehensive Flutter application for managing tasks, chores, and grocery lists in group home settings. Built with Flutter 3.35/Dart 3.9, targeting Android API 35 and iOS 17.

## Features

### Core Functionality
- **Task Management**: Create, assign, and track tasks with due dates and categories
- **Grocery Lists**: Shared shopping lists with item tracking and assignment
- **User Roles**: Resident, Supervisor, and Admin roles with appropriate permissions
- **Offline Support**: Full offline functionality with automatic sync when reconnected
- **Real-time Updates**: Live updates across all devices using Firebase Firestore

### Advanced Features
- **Push Notifications**: Task assignments, due date reminders, and daily summaries
- **Audit Logging**: Complete activity tracking for compliance and monitoring
- **Supervisor Dashboard**: Cross-house visibility and management tools
- **Accessibility**: WCAG 2.2 AA compliant with screen reader support
- **Canadian Data Residency**: All data stored in Canadian Firebase regions

## Tech Stack

- **Framework**: Flutter 3.35 / Dart 3.9
- **State Management**: Riverpod
- **Backend**: Firebase (Firestore, Auth, Cloud Messaging, Storage)
- **Local Storage**: Hive for offline caching
- **Navigation**: GoRouter
- **Notifications**: Firebase Cloud Messaging + Local Notifications
- **Code Generation**: Freezed, JSON Serializable, Hive Generator

## Project Structure

```
lib/
├── core/                 # Core utilities and constants
├── data/                 # Data models and repositories
├── features/             # Feature-based modules
│   ├── auth/            # Authentication and onboarding
│   ├── tasks/           # Task management
│   ├── lists/           # Grocery and errand lists
│   ├── notifications/   # Push and local notifications
│   └── dashboard/       # Supervisor dashboard
├── shared/              # Shared widgets and utilities
└── main.dart           # App entry point
```

## Setup Instructions

### Prerequisites
- Flutter 3.35+ installed
- Dart 3.9+ installed
- Android Studio / Xcode for mobile development
- Firebase project with Canadian region configuration

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd house_organizer
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a Firebase project in `northamerica-northeast1` or `northamerica-northeast2`
   - Enable Firestore, Authentication, Cloud Messaging, and Storage
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate directories

4. **Set up environment variables**
   - Copy `.env.example` to `.env`
   - Fill in your Firebase configuration

5. **Run code generation**
   ```bash
   flutter packages pub run build_runner build
   ```

6. **Run the app**
   ```bash
   flutter run
   ```

### Firebase Data Connect

- Ensure you have Firebase CLI v14.15.0+ and have configured the project in `house_organizer/firebase.json`.
- SDK is generated to `lib/dataconnect_generated/`.
- Regenerate SDK after schema/query changes:
  ```bash
  firebase dataconnect:sdk:generate
  ```
- Quick usage from code:
  ```dart
  import 'package:firebase_data_connect/firebase_data_connect.dart';
  import 'package:house_organizer/core/services/dataconnect_service.dart';

  // Example: create a task
  final dc = DataConnectService();
  final id = await dc.createTask(
    title: 'Clean kitchen',
    description: 'Wash dishes and counters',
    dueDate: Timestamp.now(),
    type: 'chore',
    createdAt: Timestamp.now(),
  );
  ```
 - Emulator: In debug builds, the app connects to the Data Connect emulator by default (localhost:9399). Adjust host/port in `lib/core/services/dataconnect_service.dart` if needed.

## Development

### Code Generation
The project uses code generation for data models and serialization:

```bash
# Generate code
flutter packages pub run build_runner build

# Watch for changes
flutter packages pub run build_runner watch
```

## Supervisor Dashboard

Supervisors and admins can view cross-house metrics in the dashboard. See `docs/supervisor-dashboard.md`.

### Testing
```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Run with coverage
flutter test --coverage
```

## Accessibility

The app targets WCAG 2.2 AA. Implementation notes and testing guidance: `docs/accessibility.md`.

## CI/CD

GitHub Actions workflows for tests and builds are included. Details in `docs/ci-cd.md`.

## Compliance

Privacy, security, and accessibility notes live in `docs/compliance.md`.

### Building for Production

#### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

#### iOS
```bash
flutter build ios --release
```

## Architecture

The app follows a feature-based architecture with:

- **Presentation Layer**: UI components and state management
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Repositories and data sources
- **Core Layer**: Shared utilities and constants

## Security & Compliance

- **Data Residency**: All data stored in Canadian Firebase regions
- **Access Control**: Role-based permissions with Firestore security rules
- **Privacy**: PIPEDA and Law 25 compliant
- **Accessibility**: WCAG 2.2 AA standards met

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please contact the development team or create an issue in the repository.
