# hirelyticsinc

It is a mobile version of the web potfolio for Hirelytics Inc. Design and UI is based on the web version.

## Tech Stack

- Flutter (v3.32.6)
- Dart (v3.8.1)
- Riverpod for state management
- Dio for networking
- Firebase Cloud Messaging (FCM) for push notifications
- Go Router for navigation
- Local Json for storing data

## Project Structure

```
lib/
  ├── core/                     # Core functionalities
  │   ├── config/               # App configuration
  │   │   ├── router/           # Navigation
  │   │   ├── theme/            # Theme settings
  │   ├── database/             # Local storage (Hive)
  │   ├── error/                # Error handling
  │   ├── network/              # API handling
  │   ├── notification/         # Notifications
  │   ├── usecase/              # Business logic
  │   ├── utils/                # Helpers and utilities
  ├── app/                      # Feature-specific modules
  │   ├── data/                 # Models, repositories, and services
  │   ├── domain/               # Entities, repositories, and use cases
  │   ├── presentation/         # UI pages, providers, and widgets
  │   │   ├── dashboared/       # Dashboard page, provider, and widgets
  │   │   │   ├── page/         
  │   │   │   ├── provider/     
  │   │   │   ├── widget/       
  │   │   ├── about_us/
  │   │   ├── choose_us/
  │   │   ├── contact_us/
  │   │   ├── blogs/
  │   │   ├── home/
  │   │   ├── service/
  │   │   ├── team/
  │   │   ├── footer/
  │   ├── shared/ # UI pages, providers, and widgets
  │   ├── app.dart
  ├── firebase_options.dart # Firebase configuration
  ├── main.dart         # App entry point
```

## Setup

### Prerequisites

- Flutter: **3.32.6**
- Dart: **3.8.1**

```sh
git clone https://github.com/devatiq/hirelyticsinc.git hirelyticsinc
cd hirelyticsinc
flutter pub get
flutter run
```

## Firebase Setup

1. Create a Firebase project.
2. Add Android and iOS apps to Firebase.
3. Download `google-services.json` and `GoogleService-Info.plist`.
4. Place them in:
    - `android/app/` for Android
    - `ios/Runner/` for iOS
5. Make sure Firebase is initialized in `main.dart`.

## Build & Deployment

```sh
flutter build apk --release --obfuscate --split-debug-info=build/symbols --dart-define="FORM_CONSUMER_KEY=<form_consumer_key>" --dart-define="FORM_CONSUMER_SECRET=<form_consumer_secret>"
flutter build ios --release --obfuscate --split-debug-info=build/symbols --dart-define="FORM_CONSUMER_KEY=<form_consumer_key>" --dart-define="FORM_CONSUMER_SECRET=<form_consumer_secret>"

flutter build appbundle --release --obfuscate --split-debug-info=build/symbols --dart-define="FORM_CONSUMER_KEY=<form_consumer_key>" --dart-define="FORM_CONSUMER_SECRET=<form_consumer_secret>"
flutter build ipa --release --obfuscate --split-debug-info=build/symbols --dart-define="FORM_CONSUMER_KEY=<form_consumer_key>" --dart-define="FORM_CONSUMER_SECRET=<form_consumer_secret>"
```
[Note]: replace `<form_consumer_key>` and `<form_consumer_secret>` with your form consumer key and secret.

## License

This project is proprietary. All rights reserved. © 2025 Hirelytics Inc.