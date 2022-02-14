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
            if (csize >= bsize) {
              final rpath = AssetsTool.getRAssetsPath(fpath);
              final sizeDesc = AssetsTool.sizeFormat(csize);
              final result = 'PATH: $rpath\nSIZE: $sizeDesc';
              bigFile.writeAsStringSync('\n$result\n', mode: FileMode.append);
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
