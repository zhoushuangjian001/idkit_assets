import 'dart:io';

/// Path management in resource management scripts.
class AssetsPath {
  late String _rootPath;
  factory AssetsPath() => _path ??= AssetsPath._();
  static AssetsPath? _path;
  AssetsPath._() {
    _rootPath = Directory.current.path;
  }

  /// The root directory where the currently executed
  /// resource management script is located.
  String get rootPath => _rootPath;
}
