import 'package:find/src/data/models/file_system_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class DirectoryEntity extends FileSystemEntity {
  const DirectoryEntity({
    required super.path,
    required super.name,
    this.itemCount, // Number of items in this directory
  }) : super(isDirectory: true);

  final int? itemCount;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DirectoryEntity) return false;
    return path == other.path &&
        name == other.name &&
        isDirectory == other.isDirectory &&
        itemCount == other.itemCount;
  }

  @override
  int get hashCode => super.hashCode ^ itemCount.hashCode;

  @override
  String toString() {
    return 'DirectoryEntity{path: $path, name: $name, itemCount: $itemCount}';
  }
}
