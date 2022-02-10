import 'package:idkit_assets/src/cls/assets_directory.dart';
import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';

/// A collection of small functions used during resource management script processing.
class AssetsTool {
  /// Check if the current root directory is the complete project.
  static bool get isIntact {
    final path = AssetsPath();
    final libFile = AssetsDirectory(path.libPath).exist;
    final pubspecFile = AssetsFile(path.pubspecPath).exist;
    return libFile && pubspecFile;
  }
}
