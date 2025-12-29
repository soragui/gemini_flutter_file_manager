# Find File Explorer

A desktop file explorer application built with Flutter for Linux and macOS.

## Features

-   Browse files and folders starting from your home directory.
-   Navigate through the directory structure.
-   View files and folders in a list or grid layout.
-   Toggle visibility of hidden files (`.files`) with `Ctrl-H`.
-   Select single or multiple files.
-   Light and dark theme support.

## Getting Started

To run this application, you need to have Flutter installed.

1.  Clone this repository.
2.  Navigate to the project directory.
3.  Run `flutter pub get` to install dependencies.
4.  Run `flutter run -d linux` or `flutter run -d macos` to launch the application.

## Project Structure

The project follows a feature-first approach with a clear separation of concerns:

-   `lib/src/app.dart`: Main application widget, handles `MaterialApp` and theming.
-   `lib/src/theme.dart`: Defines the application's light and dark themes.
-   `lib/src/home/`: Contains all components related to the main file explorer screen.
    -   `home_screen.dart`: The primary UI for the file explorer.
    -   `home_view_model.dart`: Manages the state and business logic.
    -   `widgets/`: Contains the `Sidebar`, `HeaderBar`, `FileListView`, `FileItem`, and `StatusBar` widgets.
-   `lib/src/data/`: Handles data models and data access logic.
    -   `models/`: Contains the data models for file system entities.
    -   `repositories/`: Contains the `FileRepository` for abstracting file system operations.
-   `lib/src/core/`: Contains shared code, like custom exceptions.

## Future Plans

-   File operations: copy, cut, paste, delete, rename.
-   Search functionality.
-   File previews/thumbnails.
-   Context menus.
-   Settings screen.
