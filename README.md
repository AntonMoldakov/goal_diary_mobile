# goal_diary

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Project Architecture

## Layers

- data - layer for data operations. For example, we can describe the work with external API on this level.
- domain - layer for business logic.
- internal - layer for application logic. On this level, we inject dependencies.
- presentation - layer for presentation. We describe the UI of the application on this level.
- shared - reusable functionality not about business logic.
