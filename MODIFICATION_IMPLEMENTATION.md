# Modification Implementation Plan: Home Navigation and Hidden File Toggle

This document outlines the phased implementation plan for adding home navigation and hidden file toggling to the "Find" file explorer application.

## General Instructions After Each Phase

After completing a task:
- [ ] Create/modify unit tests for testing the code added or modified in this phase, if relevant. (Testing is currently blocked by toolchain issues).
- [ ] Run the `dart_fix` tool to clean up the code.
- [ ] Run the `analyze_files` tool one more time and fix any issues.
- [ ] Run any tests to make sure they all pass. (Testing is currently blocked by toolchain issues).
- [ ] Run `dart_format` to make sure that the formatting is correct.
- [ ] Re-read the `MODIFICATION_IMPLEMENTATION.md` file to see what, if anything, has changed in the implementation plan, and if it has changed, take care of anything the changes imply.
- [ ] Update the `MODIFICATION_IMPLEMENTATION.md` file with the current state, including any learnings, surprises, or deviations in the Journal section. Check off any checkboxes of items that have been completed.
- [ ] Use `git diff` to verify the changes that have been made, and create a suitable commit message for any changes, following any guidelines you have about commit messages. Be sure to properly escape dollar signs and backticks, and present the change message to the user for approval. (Committing is currently blocked by toolchain issues).
- [ ] Wait for approval. Don't commit the changes or move on to the next phase of implementation until the user approves the commit.
- [ ] After commiting the change, if an app is running, use the `hot_reload` tool to reload it. (Temporarily disabled due to consistent DTD connection issues; full restart will be used instead.)

---

## Phase 1: ViewModel and Repository Changes

This phase focuses on updating the data layer and state management to support the new features.

- [x] Run all tests to ensure the project is in a good state before starting modifications. (Skipped due to testing blockage).
- [x] Add `_showHiddenFiles` property and its getter to `HomeViewModel`.
- [x] Add `toggleShowHiddenFiles()` method to `HomeViewModel`.
- [x] Add `navigateToHomeDirectory()` method to `HomeViewModel`.
- [x] Modify `_loadDirectoryContents()` in `HomeViewModel` to pass the `showHidden` flag to the repository.
- [x] Modify `listDirectoryContents()` in `FileRepository` to accept a `showHidden` parameter and filter hidden files.
- [x] Update the unit tests for `FileRepository` to cover the new `showHidden` functionality. (Tests will be updated but not run).

---

### Phase 1: ViewModel and Repository Changes

- **Date:** Monday, December 29, 2025
- **Actions:**
    - Added `_showHiddenFiles` property, its getter, `toggleShowHiddenFiles()` method, and `navigateToHomeDirectory()` method to `HomeViewModel`.
    - Modified `_loadDirectoryContents()` in `HomeViewModel` to pass `_showHiddenFiles` to the repository.
    - Modified `listDirectoryContents()` in `FileRepository` to accept `showHidden` parameter and filter hidden files.
    - Updated `file_repository_test.dart` with commented-out tests for `showHidden` functionality.
    - Ran `dart fix`, `analyze_files`, and `dart format`.
- **Learnings:**
    - Implementing core logic for hidden file filtering and home directory navigation.
- **Surprises:**
    - None.
- **Deviations:**
    - All tests for this phase were skipped or commented out due to ongoing `run_shell_command` issues preventing test execution.
- **Completed Tasks:**
    - [x] Run all tests to ensure the project is in a good state before starting modifications. (Skipped due to testing blockage).
    - [x] Add `_showHiddenFiles` property and its getter to `HomeViewModel`.
    - [x] Add `toggleShowHiddenFiles()` method to `HomeViewModel`.
    - [x] Add `navigateToHomeDirectory()` method to `HomeViewModel`.
    - [x] Modify `_loadDirectoryContents()` in `HomeViewModel` to pass the `showHidden` flag to the repository.
    - [x] Modify `listDirectoryContents()` in `FileRepository` to accept a `showHidden` parameter and filter hidden files.
    - [x] Update the unit tests for `FileRepository` to cover the new `showHidden` functionality. (Tests will be updated but not run).

---

## Phase 2: UI and Interaction

This phase focuses on wiring up the UI to the new view model logic.

- [x] Update `sidebar.dart` to call `navigateToHomeDirectory()` on the "Home" button tap.
- [x] Wrap the `Scaffold` in `home_screen.dart` with a `FocusableActionDetector`.
- [x] Define and connect the `ToggleHiddenFilesIntent` and the `Ctrl-H` shortcut to the `toggleShowHiddenFiles()` method in the view model.

---

### Phase 2: UI and Interaction

- **Date:** Monday, December 29, 2025
- **Actions:**
    - Updated `sidebar.dart` to call `navigateToHomeDirectory()` on "Home" button tap.
    - Wrapped `HomeScreen` in `FocusableActionDetector`.
    - Defined `ToggleHiddenFilesIntent` and connected the `Ctrl-H` shortcut to `toggleShowHiddenFiles()` in `HomeViewModel`.
    - Ran `dart fix`, `analyze_files`, and `dart format`.
- **Learnings:**
    - `FocusableActionDetector` provides a robust way to handle global keyboard shortcuts in Flutter desktop applications.
- **Surprises:**
    - None.
- **Deviations:**
    - No tests were created for these UI interactions due to the ongoing `run_shell_command` issues.
- **Completed Tasks:**
    - [x] Update `sidebar.dart` to call `navigateToHomeDirectory()` on the "Home" button tap.
    - [x] Wrap the `Scaffold` in `home_screen.dart` with a `FocusableActionDetector`.
    - [x] Define and connect the `ToggleHiddenFilesIntent` and the `Ctrl-H` shortcut to the `toggleShowHiddenFiles()` method in the view model.

---

## Journal

### Initial State

- **Date:** Monday, December 29, 2025
- **Actions:**
    - Created the `MODIFICATION_DESIGN.md`.
    - User approved the design.
- **Learnings:**
    - The plan is to proceed with modifications despite the ongoing toolchain issues that prevent testing and committing.
- **Surprises:**
    - None.
- **Deviations:**
    - Proceeding with implementation without the ability to commit or run tests is a major deviation from standard practice, as per user instruction. All changes will be uncommitted.
- **Completed Tasks:**
    - [x] Create and get approval for the modification design document.
