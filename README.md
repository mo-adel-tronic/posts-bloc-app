# Restaurant

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

## Clean Architecture

[blog 1](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

[blog 2](https://blog.codemagic.io/clean-architecture-explored/)


## Posts Feature Ex

1. first create post entity by reading json carefully.
2. Create Post Repository at domain folder to put all use cases:
   1. v1: adding all use cases.
   2. v2: use dartz for create a functions with 2 promises values: `<left: error, right: val OR unit if void>`
   3. handle Errors at core
3. Create All use cases at domain folder:
   1. create all use cases classes as a callable class.
4. Start to work at data layer, prepare a model.
5. create data sources
6. handle repository in data layer