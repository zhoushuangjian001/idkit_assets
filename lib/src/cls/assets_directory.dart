import 'dart:io';

/// Resource management script directory class.
class AssetsDirectory {
  const AssetsDirectory(this.path);
  final String path;

  /// Does the file exist.
  bool get exist => Directory(path).existsSync();

  /// Get directory object.
  Directory get directory {
    final _directory = Directory(path);
    if (!_directory.existsSync()) {
      _directory.createSync();
    }
    return _directory;
  }

  //
  void createReadme() {}

  /// Directory deletion.
  void delete() => directory.deleteSync();
}
