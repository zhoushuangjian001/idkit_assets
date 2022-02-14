import 'dart:io';

import 'package:idkit_assets/src/cls/assets_directory.dart';
import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';
import 'package:idkit_assets/src/other/assets_log.dart';
import 'package:idkit_assets/src/other/assets_tool.dart';

class AssetsFilter {
  /// Filter large resource files in a project.
  static void filterAssets({String? size}) {
    final path = AssetsPath();
    final aFile = AssetsDirectory(path.assetsPath);
    if (aFile.exist) {
      late final bigFile = AssetsFile(path.bigAssetsPath).blank;
      final aLines = aFile.directory.listSync();
      if (aLines.isNotEmpty) {
        for (var line in aLines) {
          final fpath = line.path;
          final isFile = FileSystemEntity.isFileSync(fpath);
          if (isFile) {
            final csize = AssetsTool.size(fpath);
            final limitSize = size ??= '200';
            final bsize = (int.tryParse(limitSize) ?? 0) * 1024;
            print(bsize);
            if (csize >= bsize) {
              final rpath = AssetsTool.getRAssetsPath(fpath);
              bigFile.writeAsStringSync('PATH: $rpath\n', mode: FileMode.append);
              final sizeDesc = AssetsTool.sizeFormat(csize);
              bigFile.writeAsStringSync('SIZE: $sizeDesc\n\n', mode: FileMode.append);
            }
          }
        }
      } else {
        AssetsLog.unFilterAssets();
      }
    } else {
      AssetsLog.init();
    }
  }
}
