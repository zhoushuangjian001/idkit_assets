import 'dart:io';
import 'package:idkit_assets/src/cls/assets_directory.dart';
import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';
import 'package:idkit_assets/src/other/assets_log.dart';
import 'package:path/path.dart';

class AssetsDelete {
  /// Delete resource file.
  static void deleteAssets(String path) {
    final rpath = AssetsPath().rootPath;
    if (!path.contains(rpath)) {
      path = join(rpath, path);
    }
    final isD = FileSystemEntity.isDirectorySync(path);
    if (isD) {
      final dfile = AssetsDirectory(path);
      if (dfile.exist) {
        dfile.delete();
        AssetsLog.deleteSuccess();
      } else {
        AssetsLog.unDeletePath();
      }
    } else {
      final ffile = AssetsFile(path);
      if (ffile.exist) {
        ffile.delete();
        AssetsLog.deleteSuccess();
      } else {
        AssetsLog.unDeletePath();
      }
    }
  }
}
