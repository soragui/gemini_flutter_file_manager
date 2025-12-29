import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:find/src/data/repositories/file_repository.dart';
import 'package:find/src/data/models/file_entity.dart';
import 'package:find/src/data/models/directory_entity.dart';
import 'package:find/src/core/errors/exceptions.dart';

void main() {
  group('FileRepository', () {
    late FileRepository fileRepository;
    late Directory tempDir;

    setUp(() async {
      fileRepository = FileRepository();
      tempDir = await Directory.systemTemp.createTemp('file_repository_test');
    });

    tearDown(() async {
      await tempDir.delete(recursive: true);
    });

    test('getHomeDirectory returns a valid path', () async {
      final homeDir = await fileRepository.getHomeDirectory();
      expect(homeDir, isNotNull);
      expect(homeDir, isNotEmpty);
      expect(await Directory(homeDir).exists(), isTrue);
    });

    test(
      'listDirectoryContents returns correct entities for a simple directory',
      () async {
        // Create some test files and directories
        await File('${tempDir.path}/file1.txt').create();
        await Directory('${tempDir.path}/subdir1').create();
        await File('${tempDir.path}/file2.md').create();

        final contents = await fileRepository.listDirectoryContents(
          tempDir.path,
        );

        expect(contents.length, 3);

        // Expect directories first, then files, alphabetically
        expect(contents[0], isA<DirectoryEntity>());
        expect(contents[0].name, 'subdir1');
        expect(contents[1], isA<FileEntity>());
        expect(contents[1].name, 'file1.txt');
        expect(contents[2], isA<FileEntity>());
        expect(contents[2].name, 'file2.md');
      },
    );

    test(
      'listDirectoryContents throws FileSystemException for non-existent directory',
      () async {
        final nonExistentPath = '${tempDir.path}/non_existent_dir';
        expect(
          () => fileRepository.listDirectoryContents(nonExistentPath),
          throwsA(isA<FileSystemException>()),
        );
      },
    );

    test('listDirectoryContents handles empty directory', () async {
      final contents = await fileRepository.listDirectoryContents(tempDir.path);
      expect(contents, isEmpty);
    });

    test('listDirectoryContents handles symbolic links', () async {
      // Create a target file
      final targetFile = await File('${tempDir.path}/target.txt').create();
      // Create a symbolic link to the target file
      await Link('${tempDir.path}/link_to_target.txt').create(targetFile.path);

      final contents = await fileRepository.listDirectoryContents(tempDir.path);
      expect(contents.length, 2); // target.txt and link_to_target.txt
      expect(contents.any((entity) => entity.name == 'target.txt'), isTrue);
      expect(
        contents.any((entity) => entity.name == 'link_to_target.txt'),
        isTrue,
      );
    });

    // New tests for showHidden functionality
    /*
    test('listDirectoryContents hides hidden files by default', () async {
      await File('${tempDir.path}/.hidden_file').create();
      await Directory('${tempDir.path}/.hidden_dir').create();
      await File('${tempDir.path}/visible_file').create();

      final contents = await fileRepository.listDirectoryContents(tempDir.path);

      expect(contents.length, 1);
      expect(contents.first.name, 'visible_file');
    });

    test('listDirectoryContents shows hidden files when showHidden is true', () async {
      await File('${tempDir.path}/.hidden_file').create();
      await Directory('${tempDir.path}/.hidden_dir').create();
      await File('${tempDir.path}/visible_file').create();

      final contents = await fileRepository.listDirectoryContents(tempDir.path, showHidden: true);

      expect(contents.length, 3);
      expect(contents.any((entity) => entity.name == '.hidden_file'), isTrue);
      expect(contents.any((entity) => entity.name == '.hidden_dir'), isTrue);
      expect(contents.any((entity) => entity.name == 'visible_file'), isTrue);
    });
    */
  });
}
