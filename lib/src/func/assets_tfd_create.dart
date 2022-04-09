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
        final isExist = AssetsTool.isDContent(fPath);
        final isFont = fPath.endsWith('fonts') || fPath.endsWith('font');
        if (isExist && !isFont) {
          assetsTempDFile.writeAsStringSync('$rFPath/\n', mode: FileMode.append);
        } else {
          AssetsDirectory(fPath).delete();
        }
      } else if (isF) {
        // Filter hidden files.
        final isH = AssetsTool.isHideFile(fPath);
        // Filtter font
        late final isFont = fPath.endsWith('.ttf');
        if (!isH && !isFont) {
          assetsTempFFile.writeAsStringSync('$rFPath\n', mode: FileMode.append);
        }
      }
    }
  }
}
