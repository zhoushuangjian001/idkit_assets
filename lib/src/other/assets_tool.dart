import 'package:idkit_assets/src/cls/assets_directory.dart';
import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';
import 'package:idkit_assets/src/other/idkit_assets_const.dart';

/// A collection of small functions used during resource management script processing.
class AssetsTool {
  /// Check if the current root directory is the complete project.
  static bool get isIntact {
    final path = AssetsPath();
    final libFile = AssetsDirectory(path.libPath).exist;
    final pubspecFile = AssetsFile(path.pubspecPath).exist;
    return libFile && pubspecFile;
  }

  /// Get the name of the resource management file class.
  static String get clsName {
    var name = 'IDKitAssets';
    final file = AssetsFile(AssetsPath().assetsManagePath).file;
    final lines = file.readAsLinesSync();
    if (lines.isNotEmpty) {
      for (var item in lines) {
        final isReg = clsNameRegExp.hasMatch(item);
        if (isReg) {
          name = item.split(' ')[1];
          break;
        }
      }
    }
    return name;
  }

  /// Get the relative path of the resource file.
  static String getRAssetsPath(String path) {
    final lastPath = path.split('/assets/').last;
    return 'assets/$lastPath';
  }

  /// Get a line of content of a specified rule in a file.
  static String getLineFrom(String path, String rule) {
    var content = '';
    final file = AssetsFile(path).file;
    final lines = file.readAsLinesSync();
    for (var item in lines) {
      final isRule = RegExp(rule).hasMatch(item);
      if (isRule) {
        content = item;
      }
    }
    return content;
  }
}
