# Gemini Development Guide: Find File Explorer

This document provides a detailed overview of the "Find" file explorer application for other Gemini models.

## Application Purpose

The "Find" file explorer is a desktop application for Linux and macOS, built with Flutter. Its purpose is to provide a simple, intuitive, and visually appealing interface for browsing and managing files and folders on the local file system, starting from the user's home directory. It includes features for navigating to the home directory and toggling the visibility of hidden files.

## Implementation Details

### Architecture

The application follows a Model-View-ViewModel (MVVM) inspired architecture to ensure a clean separation of concerns.

-   **Model**: The data layer, consisting of data models (`FileSystemEntity`, `FileEntity`, `DirectoryEntity`) and the `FileRepository`. The `FileRepository` is responsible for all interactions with the file system, using `dart:io`.
-   **View**: The UI layer, composed of Flutter widgets. The main view is the `HomeScreen`, which is composed of smaller, reusable widgets like `Sidebar`, `HeaderBar`, `FileListView`, `FileItem`, and `StatusBar`.
-   **ViewModel**: The `HomeViewModel` acts as the bridge between the View and the Model. It uses `ChangeNotifier` and `provider` to manage the application's state and business logic, such as navigation, file loading, selection, and toggling hidden file visibility.

### File Layout

-   `lib/main.dart`: The main entry point of the application.
-   `lib/src/app.dart`: The root widget of the application, responsible for setting up `MaterialApp`, themes, and `MultiProvider`.
-   `lib/src/theme.dart`: Contains the `ThemeData` for the light and dark themes.
-   `lib/src/core/errors/exceptions.dart`: Defines custom exceptions, like `FileSystemException`.
-   `lib/src/data/models/`: Contains the data models for file system entities.
    -   `file_system_entity.dart`: The abstract base class for files and directories.
    -   `file_entity.dart`: Represents a file.
    -   `directory_entity.dart`: Represents a directory.
-   `lib/src/data/repositories/file_repository.dart`: The single source of truth for file system operations.
-   `lib/src/home/`: The main feature folder for the file explorer UI.
    -   `home_screen.dart`: The main screen widget.
    -   `home_view_model.dart`: The state management class for the home screen.
    -   `widgets/`: Contains all the UI components for the home screen.
        -   `sidebar.dart`
        -   `header_bar.dart`
        -   `file_list_view.dart`
        -   `file_item.dart`
        -   `status_bar.dart`
-   `test/`: Contains the unit tests.
    -   `file_repository_test.dart`: Tests for the `FileRepository`.
    -   `home_view_model_test.dart`: (Currently disabled) Tests for the `HomeViewModel`.

### State Management

-   `provider` is used for dependency injection and state management.
-   `HomeViewModel` extends `ChangeNotifier` to notify listeners of state changes.
-   The UI widgets use `Consumer` or `context.watch<HomeViewModel>()` to react to state changes.

### Key Dependencies

-   `provider`: For state management.
-   `flutter_vector_icons`: For a rich set of icons.
-   `mockito`: (dev dependency) For mocking dependencies in tests.
