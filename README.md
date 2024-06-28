# pizza

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project folder structure (Clean Archeticture)

lib/
│
├── features
|   ├── feature_name/
│   │   ├── presentation/
|   |   |   ├── pages/
│   │   |   ├── widgets/
|   |   |   └── bloc/
│   │   ├── data/
|   |   |   ├── data_sources/
│   │   |   ├── models/
|   |   |   └── repositories/
|   |   └── domain/
|   |   |   ├── entities/
│   │   |   ├── repositories/
|   |   |   └── usecases/
├── core/
│   ├── config/
│   │   ├── theme.dart
│   │   └── routes.dart
│   ├── utils/
│   │   ├── constants.dart
│   │   ├── extensions.dart
│   │   └── helpers.dart
│   └── widgets/
│   |   ├── custom_button.dart
│   |   └── custom_text_field.dart
│
└── main.dart

## Handle Data State

>> Go to core > data_atate > to handle different data states