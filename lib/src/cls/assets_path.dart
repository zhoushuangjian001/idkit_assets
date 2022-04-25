import 'dart:io' show Directory;
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

  /// Temporary resource file directory to store files.
  String get tempDAssetsPath => join(_rootPath, 'temp_directory_assets.txt');

  /// The file stored in the temporary resource file file path.
  String get tempFAssetsPath => join(_rootPath, 'temp_file_assets.txt');

  /// All resource paths of the project refer to the path of the management file.
  String get assetsManagePath => join(libPath, 'idkit_assets_manage.dart');

  /// Project release specification temporary file path.
  String get assetsTPubspecPath => join(_rootPath, 'temp_assets_pubspec.yaml');

  /// Resource naming unqualified file path.
  String get nameIrRegularPath => join(_rootPath, 'temp_unregular_assets.txt');

  /// The resource record file path is not used in the project.
  String get unusedAssetsPath => join(_rootPath, 'temp_unused_assets.txt');

  /// Project resource large file record file path.
  String get bigAssetsPath => join(_rootPath, 'temp_big_assets.txt');

  /// Project font resource temporary record file.
  String get fontsAssetsPath => join(_rootPath, 'temp_font_assets.txt');
}
