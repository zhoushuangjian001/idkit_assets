import 'dart:io';
import 'package:path/path.dart';

/// Path management in resource management scripts.
class AssetsPath {
  /// Path Simple Profit Management.
  late String _rootPath;
  factory AssetsPath() => _path ??= AssetsPath._();
  static AssetsPath? _path;
  AssetsPath._() {
    _rootPath = Directory.current.path;
  }

  /// The root directory where the currently executed
  /// resource management script is located.
  String get rootPath => _rootPath;

  /// Lib folder path in the project.
  String get libPath => join(_rootPath, 'lib');

  /// The resource folder path in the project.
  String get assetsPath => join(_rootPath, 'assets');

  /// Project release specification file path.
  String get pubspecPath => join(_rootPath, 'pubspec.yaml');

  /// The path to the brief introduction text of the resource file management script.
  String get readmePath => join(assetsPath, 'readme.txt');
}
