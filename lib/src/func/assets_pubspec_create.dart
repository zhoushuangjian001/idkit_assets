import 'dart:io';

import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';
import 'package:idkit_assets/src/other/idkit_assets_const.dart';

class AssetsPubSpecCreate {
  static void createAssetsPubspec() {
    final path = AssetsPath();
    final pbFile = AssetsFile(path.pubspecPath).file;
    final tpbFile = AssetsFile(path.assetsTPubspecPath).blank;
    final linesDF = pbFile.readAsLinesSync();
    for (var line in linesDF) {
      final tirmLine = line.trim();
      if (pubspecAssetsRegExp.hasMatch(tirmLine)) {
        tpbFile.writeAsStringSync('\tassets:\n', mode: FileMode.append);
        final tADFile = AssetsFile(path.tempDAssetsPath).file;
        final tadLines = tADFile.readAsLinesSync();
        for (var item in tadLines) {
          tpbFile.writeAsStringSync('\t\t- $item\n', mode: FileMode.append);
        }
      } else if (assetsORegExp.hasMatch(tirmLine) || assetsORegExp.hasMatch(tirmLine)) {
        ;
      } else {
        tpbFile.writeAsStringSync('$line\n', mode: FileMode.append);
      }
    }
  }
}
