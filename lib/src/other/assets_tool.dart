import 'dart:io';
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
    final isOS = AssetsTool.getPlatform();
    var lastPath = path.split(isOS ? '/assets/' : '\\assets\\').last;
    if (!isOS) {
      lastPath = lastPath.replaceAll('\\', '/');
    }
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

  /// Determine if a file is a hidden file.
  static bool isHideFile(String path) {
    var res = false;
    final isOS = AssetsTool.getPlatform();
    final Pattern pattern = isOS ? '/.' : '\\.';
    if (path.contains(pattern)) {
      final last = path.split(pattern).last;
      res = !last.contains(isOS ? '/' : '\\');
    }
    return res;
  }

  /// Determine if a file has content.
  static bool isContent(String path) {
    var result = false;
    final aFile = AssetsFile(path);
    if (aFile.exist) {
      final file = aFile.file;
      final fileStat = file.statSync();
      result = fileStat.size != 0;
    }
    return result;
  }

  /// Get the number of times the content of the specified condition appears in the file.
  static int count(String path, String rule) {
    var count = 0;
    final fileA = AssetsFile(path);
    if (fileA.exist) {
      final file = fileA.file;
      final fileLines = file.readAsLinesSync();
      for (var line in fileLines) {
        final isExist = line.contains(rule);
        if (isExist) {
          count++;
        }
      }
    }
    return count;
  }

  /// Get the size of the specified file.
  static int size(String path) {
    var size = 0;
    final fileA = AssetsFile(path);
    if (fileA.exist) {
      final file = fileA.file;
      final fileStat = file.statSync();
      size = fileStat.size;
    }
    return size;
  }

  /// Project file size formatting.
  static String sizeFormat(int byte) {
    var rs = byte.toStringAsFixed(2);
    var desc = '$rs B';
    final kb = byte / 1024;
    if (kb > 1) {
      final mb = kb / 1024;
      if (mb > 1) {
        final gb = mb / 1024;
        if (gb > 1) {
          rs = gb.toStringAsFixed(2);
          desc = '$rs GB';
        } else {
          rs = mb.toStringAsFixed(2);
          desc = '$rs MB';
        }
      } else {
        rs = kb.toStringAsFixed(2);
        desc = '$rs KB';
      }
    }
    return desc;
  }

  /// Check if there is a file in a directory.
  static bool isDContent(String path) {
    var result = false;
    final dDirectory = AssetsDirectory(path);
    if (dDirectory.exist) {
      final dd = dDirectory.directory;
      final lines = dd.listSync(recursive: true);
      for (var item in lines) {
        final isHide = AssetsTool.isHideFile(item.path);
        if (!isHide) {
          result = true;
          break;
        }
      }
    }
    return result;
  }

  /// Platform distinction
  static bool getPlatform() {
    if (Platform.isWindows) {
      return false;
    }
    return true;
  }
}
