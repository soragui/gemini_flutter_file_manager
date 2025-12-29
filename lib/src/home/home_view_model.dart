import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:find/src/data/models/directory_entity.dart';
import 'package:find/src/data/models/file_system_entity.dart';
import 'package:find/src/data/repositories/file_repository.dart';
import 'package:find/src/core/errors/exceptions.dart';

enum FileViewType { list, grid }

class HomeViewModel extends ChangeNotifier {
  final FileRepository _fileRepository;

  HomeViewModel(this._fileRepository) {
    _initHomeDirectory();
  }

  List<FileSystemEntity> _displayedEntities = [];
  List<FileSystemEntity> get displayedEntities => _displayedEntities;

  String _currentPath = '';
  String get currentPath => _currentPath;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<FileSystemEntity> _selectedEntities = [];
  List<FileSystemEntity> get selectedEntities => _selectedEntities;

  bool _showHiddenFiles = false;
  bool get showHiddenFiles => _showHiddenFiles;

  FileViewType _viewType = FileViewType.list;
  FileViewType get viewType => _viewType;

  void setViewType(FileViewType type) {
    if (_viewType != type) {
      _viewType = type;
      notifyListeners();
    }
  }

  Future<void> navigateToHomeDirectory() async {
    final homePath = await _fileRepository.getHomeDirectory();
    _selectedEntities = []; // Clear selection when navigating
    await _loadDirectoryContents(homePath);
  }

  void toggleShowHiddenFiles() {
    _showHiddenFiles = !_showHiddenFiles;
    _loadDirectoryContents(
      _currentPath,
    ); // Reload current directory with new setting
  }

  Future<void> _initHomeDirectory() async {
    _isLoading = true;
    notifyListeners();
    try {
      _currentPath = await _fileRepository.getHomeDirectory();
      await _loadDirectoryContents(_currentPath);
    } on FileSystemException catch (e) {
      debugPrint('Error initializing home directory: ${e.message}');
      // Handle error, e.g., show a snackbar or error screen
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadDirectoryContents(String path) async {
    _isLoading = true;
    notifyListeners();
    try {
      _displayedEntities = await _fileRepository.listDirectoryContents(
        path,
        showHidden: _showHiddenFiles,
      );
      _currentPath = path; // Update current path only on successful load
    } on FileSystemException catch (e) {
      debugPrint('Error loading directory contents: ${e.message}');
      // Handle error
      _displayedEntities = []; // Clear contents on error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> navigateToDirectory(DirectoryEntity directory) async {
    if (directory.isDirectory) {
      _selectedEntities = []; // Clear selection when navigating
      await _loadDirectoryContents(directory.path);
    }
  }

  Future<void> navigateBack() async {
    if (_currentPath.isNotEmpty &&
        _currentPath != await _fileRepository.getHomeDirectory()) {
      final parentDir = Directory(_currentPath).parent;
      _selectedEntities = []; // Clear selection when navigating
      await _loadDirectoryContents(parentDir.path);
    }
  }

  void toggleSelection(FileSystemEntity entity) {
    if (_selectedEntities.contains(entity)) {
      _selectedEntities.remove(entity);
    } else {
      _selectedEntities.add(entity);
    }
    notifyListeners();
  }

  void clearSelection() {
    _selectedEntities = [];
    notifyListeners();
  }
}
