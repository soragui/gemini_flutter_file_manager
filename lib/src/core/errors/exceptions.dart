/// Custom exception for file system errors
class FileSystemException implements Exception {
  final String message;
  const FileSystemException(this.message);

  @override
  String toString() => 'FileSystemException: $message';
}
