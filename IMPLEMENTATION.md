# Implementation Plan: Find File Explorer

This document outlines the phased implementation plan for the "Find" Flutter file explorer application. Each phase will consist of a set of tasks to be completed, followed by verification steps and an update to the Journal.

## General Instructions After Each Phase

After completing a task:
- [ ] Create/modify unit tests for testing the code added or modified in this phase, if relevant.
- [ ] Run the `dart_fix` tool to clean up the code.
- [ ] Run the `analyze_files` tool one more time and fix any issues.
- [ ] Run any tests to make sure they all pass.
- [ ] Run `dart_format` to make sure that the formatting is correct.
- [ ] Re-read the `IMPLEMENTATION.md` file to see what, if anything, has changed in the implementation plan, and if it has changed, take care of anything the changes imply.
- [ ] Update the `IMPLEMENTATION.md` file with the current state, including any learnings, surprises, or deviations in the Journal section. Check off any checkboxes of items that have been completed.
- [ ] Use `git diff` to verify the changes that have been made, and create a suitable commit message for any changes, following any guidelines you have about commit messages. Be sure to properly escape dollar signs and backticks, and present the change message to the user for approval.
- [ ] Wait for approval. Don't commit the changes or move on to the next phase of implementation until the user approves the commit.
- [ ] After commiting the change, if the app is running, use the `hot_reload` tool to reload it.

---

## Phase 1: Project Setup and Initial Commit

This phase focuses on setting up the basic Flutter project structure and committing the initial boilerplate.

- [ ] Create an empty Flutter project named `Find` in the current directory (`.`), supporting macOS and Linux platforms.
- [ ] Remove any boilerplate in the new package that will be replaced, including the `test` directory, if any.
- [ ] Update the description of the package in the `pubspec.yaml` and set the version number to `0.1.0`.
- [ ] Update the `README.md` to include a short placeholder description of the package.
- [ ] Create the `CHANGELOG.md` to have the initial version of `0.1.0`.
- [ ] Commit this empty version of the package to the current branch.
- [ ] After committing the change, start running the app with the `launch_app` tool on the user's preferred device.

---

## Phase 2: Core Data Models and File System Repository

This phase will establish the fundamental data structures for representing file system entities and a repository for abstracting file system interactions.

- [ ] Add `path_provider` as a dependency.
- [ ] Create `lib/src/data/models/file_system_entity.dart` with an abstract base class.
- [ ] Create `lib/src/data/models/file_entity.dart` and `lib/src/data/models/directory_entity.dart`.
- [ ] Implement `lib/src/data/repositories/file_repository.dart` with methods to:
    - Get the home directory using `path_provider`.
    - List contents of a given directory using `dart:io`.
    - Handle basic error cases (e.g., directory not found, permissions).
- [ ] Create initial unit tests for `FileRepository`.

---

## Phase 3: State Management (HomeViewModel)

This phase will implement the `HomeViewModel` to manage the state of the file explorer.

- [ ] Create `lib/src/home/home_view_model.dart`.
- [ ] Implement `HomeViewModel` using `ChangeNotifier` and expose properties for `currentPath`, `displayedEntities`, `selectedEntities`, and `isLoading`.
- [ ] Add methods to `HomeViewModel` for navigating to a directory, going back, and handling selection.
- [ ] Integrate `FileRepository` into `HomeViewModel`.
- [ ] Create unit tests for `HomeViewModel`.

---

## Phase 4: Basic UI Structure (App, Home Screen, Theming)

This phase focuses on setting up the main application structure and integrating basic UI components and theming.

- [ ] Create `lib/src/app.dart` to configure `MaterialApp` and integrate theming.
- [ ] Create `lib/src/theme.dart` and define light/dark themes using `ThemeData` and `ColorScheme.fromSeed`, following Material 3 guidelines.
- [ ] Create `lib/src/home/home_screen.dart` and connect it to `HomeViewModel` using `Provider`.
- [ ] Implement the basic layout for `HomeScreen` (e.g., using `Scaffold`, `Row` for sidebar/main content).
- [ ] Add `flutter_vector_icons` as a dependency.

---

## Phase 5: Sidebar and Header Bar

This phase implements the left sidebar and the top header bar of the file explorer.

- [ ] Create `lib/src/home/widgets/sidebar.dart` to display quick access locations.
- [ ] Create `lib/src/home/widgets/header_bar.dart` with navigation controls (back/forward), current path display, and placeholders for view options.
- [ ] Integrate `Sidebar` and `HeaderBar` into `HomeScreen`.
- [ ] Implement basic navigation logic in `HeaderBar` that interacts with `HomeViewModel`.

---

## Phase 6: File List View and Item Display

This phase will build the main content area for displaying files and folders.

- [ ] Create `lib/src/home/widgets/file_item.dart` to display a single `FileSystemEntity` (icon, name).
- [ ] Create `lib/src/home/widgets/file_list_view.dart` to render `displayedEntities` using `ListView.builder`.
- [ ] Implement tap interaction for `FileItem` to navigate into directories and select files.
- [ ] Integrate `FileListArea` into `HomeScreen`.
- [ ] Apply `WidgetStateProperty` for selection styling in `FileItem`.

---

## Phase 7: Status Bar and Refinements

This phase will add the status bar and refine the overall UI and functionality.

- [ ] Create `lib/src/home/widgets/status_bar.dart` to display selected item information.
- [ ] Integrate `StatusBar` into `HomeScreen`.
- [ ] Refine UI based on `home.png` for visual fidelity (e.g., padding, colors, fonts, shadows).
- [ ] Ensure responsiveness across different window sizes.

---

## Phase 8: Finalization and Documentation

The final phase involves comprehensive documentation and a final review.

- [ ] Create a comprehensive `README.md` file for the package, detailing its purpose, how to run it, features, and future plans.
- [ ] Create a `GEMINI.md` file in the project directory that describes the app, its purpose, and implementation details of the application and the layout of the files.
- [ ] Ask the user to inspect the app and the code and say if they are satisfied with it, or if any modifications are needed.

---

## Journal

### Phase 1: Project Setup and Initial Commit

- **Date:** 2025-12-25
- **Actions:**
    - Initialized git repository.
    - Generated `DESIGN.md`.
    - Researched relevant Flutter desktop development topics.
    - Refined `DESIGN.md` based on research.
- **Learnings:**
    - `path_provider` is crucial for cross-platform home directory access.
    - `dart:io` is suitable for file system operations.
    - Material Design 3 guidelines and `flutter_vector_icons` align well with the UI vision.
- **Surprises:** The `platform-channels` documentation link was broken, but `dart:io` and `path_provider` mitigate this.
- **Deviations:** None.
- **Completed Tasks:**
    - [x] Wait for user approval of DESIGN.md (from previous todo list).

---