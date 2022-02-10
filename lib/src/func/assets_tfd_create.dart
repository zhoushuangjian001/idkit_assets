import 'dart:io';

import 'package:idkit_assets/src/cls/assets_directory.dart';
import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';
import 'package:idkit_assets/src/other/assets_tool.dart';

class AssetsTempFDCreate {
  static void createAssetsTempFD() {
    final path = AssetsPath();
    // The path of directory file create.
    final assetsTempDFile = AssetsFile(path.tempDAssetsPath).blank;
    assetsTempDFile.writeAsStringSync('assets/\n', mode: FileMode.append);
    // The path of file create.
    final assetsTempFFile = AssetsFile(path.tempFAssetsPath).blank;
    // Resource file directory.
    final assetsDirectory = AssetsDirectory(path.assetsPath).directory;
    final fileSEntity = assetsDirectory.listSync(recursive: true);
    for (var item in fileSEntity) {
      final fPath = item.path;
      final isD = FileSystemEntity.isDirectorySync(fPath);
      final isF = FileSystemEntity.isFileSync(fPath);
      final rFPath = AssetsTool.getRAssetsPath(fPath);
      if (isD) {
        assetsTempDFile.writeAsStringSync('$rFPath/\n', mode: FileMode.append);
      } else if (isF) {
        // Filter hidden files.
        final hide = fPath.split('/').last;
        if (!hide.startsWith('.')) {
          assetsTempFFile.writeAsStringSync('$rFPath\n', mode: FileMode.append);
        }
      }
    }
  }
}
