/*
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:find/src/home/home_view_model.dart';
import 'package:find/src/data/repositories/file_repository.dart';
import 'package:find/src/data/models/file_system_entity.dart';
import 'package:find/src/data/models/file_entity.dart';
import 'package:find/src/data/models/directory_entity.dart';
import 'package:find/src/core/errors/exceptions.dart';

// Generate a MockFileRepository
@GenerateMocks([FileRepository])
import 'home_view_model_test.mocks.dart';
*/

/*
void main() {
  group('HomeViewModel', () {
    late HomeViewModel viewModel;
    late MockFileRepository mockFileRepository;
    late String mockHomePath;

    setUp(() async {
      mockFileRepository = MockFileRepository();
      mockHomePath = '/mock/home'; // Simulate home directory
      when(mockFileRepository.getHomeDirectory()).thenAnswer((_) async => mockHomePath);

      // Default mock for listDirectoryContents
      when(mockFileRepository.listDirectoryContents(any)).thenAnswer((_) async => []);

      viewModel = HomeViewModel(mockFileRepository);
      // Wait for initial async operations to complete
      await Future.delayed(Duration.zero);
    });

    test('initializes with home directory and loads contents', () async {
      final mockEntities = [
        DirectoryEntity(path: '$mockHomePath/dir1', name: 'dir1'),
        FileEntity(path: '$mockHomePath/file1.txt', name: 'file1.txt', fileSize: 100, lastModified: DateTime.now()),
      ];
      when(mockFileRepository.listDirectoryContents(mockHomePath)).thenAnswer((_) async => mockEntities);

      viewModel = HomeViewModel(mockFileRepository);
      await Future.delayed(Duration.zero); // Wait for _initHomeDirectory to complete

      verify(mockFileRepository.getHomeDirectory()).called(1);
      verify(mockFileRepository.listDirectoryContents(mockHomePath)).called(1);
      expect(viewModel.currentPath, mockHomePath);
      expect(viewModel.displayedEntities, mockEntities);
      expect(viewModel.isLoading, false);
    });

    test('navigateToDirectory loads new directory contents', () async {
      final subDirPath = '$mockHomePath/sub_dir';
      final subDirEntity = DirectoryEntity(path: subDirPath, name: 'sub_dir');
      final mockSubDirEntities = [
        FileEntity(path: '$subDirPath/sub_file.txt', name: 'sub_file.txt', fileSize: 50, lastModified: DateTime.now()),
      ];

      when(mockFileRepository.listDirectoryContents(subDirPath)).thenAnswer((_) async => mockSubDirEntities);

      await viewModel.navigateToDirectory(subDirEntity);

      expect(viewModel.currentPath, subDirPath);
      expect(viewModel.displayedEntities, mockSubDirEntities);
      expect(viewModel.isLoading, false);
      expect(viewModel.selectedEntities, isEmpty); // Selection should be cleared
    });

    test('navigateBack returns to parent directory', () async {
      final parentDirPath = '$mockHomePath/parent_dir';
      final currentDirPath = '$parentDirPath/current_dir';
      final currentDirEntity = DirectoryEntity(path: currentDirPath, name: 'current_dir');

      // Setup initial state as if we navigated into current_dir
      viewModel.navigateToDirectory(currentDirEntity);
      await Future.delayed(Duration.zero);

      final mockParentDirContents = [
        DirectoryEntity(path: parentDirPath, name: 'parent_dir'),
        FileEntity(path: '$parentDirPath/file.txt', name: 'file.txt', fileSize: 10, lastModified: DateTime.now()),
      ];
      when(mockFileRepository.listDirectoryContents(parentDirPath)).thenAnswer((_) async => mockParentDirContents);

      await viewModel.navigateBack();

      expect(viewModel.currentPath, parentDirPath);
      expect(viewModel.displayedEntities, mockParentDirContents);
      expect(viewModel.isLoading, false);
      expect(viewModel.selectedEntities, isEmpty);
    });

    test('toggleSelection adds and removes entity', () async {
      final file = FileEntity(path: '/a/b.txt', name: 'b.txt', fileSize: 10, lastModified: DateTime.now());

      expect(viewModel.selectedEntities, isEmpty);

      viewModel.toggleSelection(file);
      expect(viewModel.selectedEntities, contains(file));

      viewModel.toggleSelection(file);
      expect(viewModel.selectedEntities, isEmpty);
    });

    test('clearSelection clears all selected entities', () async {
      final file1 = FileEntity(path: '/a/b1.txt', name: 'b1.txt', fileSize: 10, lastModified: DateTime.now());
      final file2 = FileEntity(path: '/a/b2.txt', name: 'b2.txt', fileSize: 20, lastModified: DateTime.now());
      viewModel.toggleSelection(file1);
      viewModel.toggleSelection(file2);

      expect(viewModel.selectedEntities.length, 2);

      viewModel.clearSelection();
      expect(viewModel.selectedEntities, isEmpty);
    });

    test('handles FileSystemException during _initHomeDirectory', () async {
      when(mockFileRepository.getHomeDirectory()).thenThrow(FileSystemException('Access denied'));

      viewModel = HomeViewModel(mockFileRepository);
      await Future.delayed(Duration.zero);

      expect(viewModel.currentPath, ''); // Should remain empty on error
      expect(viewModel.displayedEntities, isEmpty);
      expect(viewModel.isLoading, false);
      // Further checks can be added to verify error handling (e.g., if a debugPrint was called)
    });

    test('handles FileSystemException during _loadDirectoryContents', () async {
      final subDirPath = '$mockHomePath/sub_dir';
      final subDirEntity = DirectoryEntity(path: subDirPath, name: 'sub_dir');

      when(mockFileRepository.listDirectoryContents(subDirPath)).thenThrow(FileSystemException('Dir not found'));

      await viewModel.navigateToDirectory(subDirEntity);
      await Future.delayed(Duration.zero);

      expect(viewModel.currentPath, mockHomePath); // Path should not change if loading fails
      expect(viewModel.displayedEntities, isEmpty); // Contents should be cleared
      expect(viewModel.isLoading, false);
    });
  });
}
*/
