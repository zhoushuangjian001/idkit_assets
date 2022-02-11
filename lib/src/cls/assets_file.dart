import 'dart:io';

/// Resource management script file class.
class AssetsFile {
  const AssetsFile(this.path);
  final String path;

  /// Does the file exist.
  bool get exist => File(path).existsSync();

  /// Get file object.
  File get file {
    final _file = File(path);
    if (!exist) {
      _file.createSync();
    }
    return _file;
  }

  /// Get blank content file.
  File get blank {
    file.openWrite();
    return file;
  }

  /// File renaming.
  void rename(String name) {
    file.renameSync(name);
  }

  /// File deletion.
  void delete() => file.deleteSync();
}
