# todo_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Flutter To-Do List App 📝

A simple and user-friendly To-Do List application built with **Flutter** and **Dart**. The app uses `shared_preferences` to store tasks locally on the device, allowing users to keep their tasks saved even after closing and reopening the application.

## ✨ Features

- ➕ Add new tasks
- ✅ Mark tasks as completed
- ✏️ Edit existing tasks (if implemented)
- 🗑️ Delete tasks
- 💾 Save tasks locally using `shared_preferences`
- 📱 Simple and responsive user interface

## 🛠️ Technologies Used

- **Flutter** — Cross-platform UI framework
- **Dart** — Programming language
- **shared_preferences** — Local key-value storage for persisting tasks

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code
- An Android emulator or a physical device

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Salam0000/Flutter_todo_app
   ```

2. Navigate to the project directory:

   ```bash
   cd TODO_APP
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## 📦 Dependencies

This project uses the following package:

- [`shared_preferences`](https://pub.dev/packages/shared_preferences) — Stores task data locally on the device.

Install it using:

```bash
flutter pub add shared_preferences
```

## 💾 Data Storage

The application uses `shared_preferences` to save task data locally on the device.

- Data is stored locally rather than in a remote database.
- Uninstalling the application or clearing its data may remove the saved tasks.
- `shared_preferences` is intended for relatively small key-value data, not sensitive information or large databases.

## 📁 Project Structure

```text
lib/
├── main.dart
├── models/
├── pages/
├── component/
└── services/
```

*Note: Adjust this structure to match your actual project.*

## 🎯 Purpose

This project demonstrates basic Flutter application development, state management, and local data persistence using `shared_preferences`.

## 👨‍💻 Author

Salam Alshami

- GitHub: https://github.com/Salam0000/Flutter_todo_app
