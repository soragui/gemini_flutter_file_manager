import 'package:flutter/foundation.dart';

@immutable
abstract class FileSystemEntity {
  const FileSystemEntity({
    required this.path,
    required this.name,
    required this.isDirectory,
  });

  final String path;
  final String name;
  final bool isDirectory;

  // Implement equality for comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileSystemEntity &&
          runtimeType == other.runtimeType &&
          path == other.path &&
          name == other.name &&
          isDirectory == other.isDirectory;

  @override
  int get hashCode => path.hashCode ^ name.hashCode ^ isDirectory.hashCode;

  @override
  String toString() {
    return 'FileSystemEntity{path: $path, name: $name, isDirectory: $isDirectory}';
  }
}
