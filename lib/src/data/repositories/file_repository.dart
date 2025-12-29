import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:find/src/core/errors/exceptions.dart';

import 'package:find/src/data/models/file_system_entity.dart';
import 'package:find/src/data/models/file_entity.dart';
import 'package:find/src/data/models/directory_entity.dart';

class FileRepository {
  /// Returns the path to the user's home directory.
  Future<String> getHomeDirectory() async {
    final String? homePath = Platform.environment['HOME']; // For Linux/macOS
    if (homePath == null) {
      throw FileSystemException('Could not determine home directory.');
    }
    return homePath;
  }

  /// Lists the contents of a given directory.
  Future<List<FileSystemEntity>> listDirectoryContents(
    String path, {
    bool showHidden = false,
  }) async {
    final directory = Directory(path);
    if (!await directory.exists()) {
      throw FileSystemException('Directory not found: $path');
    }

    final List<FileSystemEntity> contents = [];
    try {
      await for (final entity in directory.list()) {
        final name = entity.path.split('/').last;
        if (!showHidden && name.startsWith('.')) {
          continue; // Skip hidden files
        }

        final stat = await entity.stat();

        if (entity is File) {
          contents.add(
            FileEntity(
              path: entity.path,
              name: name,
              fileSize: stat.size,
              lastModified: stat.changed,
            ),
          );
        } else if (entity is Directory) {
          // For directories, we can optionally count items for display
          // This might be slow for large directories, consider optimizing later
          int? itemCount;
          try {
            // Count items only if not hidden or if showing hidden files.
            // This prevents errors on trying to list contents of hidden directories with restricted permissions.
            if (showHidden || !name.startsWith('.')) {
              itemCount = await entity.list().length;
            }
          } catch (e) {
            // Handle permission errors or other issues when listing sub-directory
            debugPrint('Error counting items in ${entity.path}: $e');
          }

          contents.add(
            DirectoryEntity(
              path: entity.path,
              name: name,
              itemCount: itemCount,
            ),
          );
        }
      }
      // Sort directories first, then files, both alphabetically
      contents.sort((a, b) {
        if (a.isDirectory && !b.isDirectory) return -1;
        if (!a.isDirectory && b.isDirectory) return 1;
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });
    } on FileSystemException catch (e) {
      throw FileSystemException(
        'Error accessing directory $path: ${e.message}',
      );
    } catch (e) {
      throw FileSystemException('An unexpected error occurred: $e');
    }

    return contents;
  }
}
