import 'package:find/src/data/models/file_system_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class FileEntity extends FileSystemEntity {
  const FileEntity({
    required super.path,
    required super.name,
    required this.fileSize,
    required this.lastModified,
  }) : super(isDirectory: false);

  final int fileSize;
  final DateTime lastModified;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FileEntity) return false;
    return path == other.path &&
        name == other.name &&
        isDirectory == other.isDirectory &&
        fileSize == other.fileSize &&
        lastModified == other.lastModified;
  }

  @override
  int get hashCode =>
      super.hashCode ^ fileSize.hashCode ^ lastModified.hashCode;

  @override
  String toString() {
    return 'FileEntity{path: $path, name: $name, fileSize: $fileSize, lastModified: $lastModified}';
  }
}
