import 'dart:io';
import 'package:idkit_assets/src/cls/assets_directory.dart';
import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';
import 'package:idkit_assets/src/func/assets_manage_create.dart';
import 'package:idkit_assets/src/func/assets_pubspec_create.dart';
import 'package:idkit_assets/src/func/assets_rename_pubspec.dart';
import 'package:idkit_assets/src/func/assets_tfd_create.dart';
import 'package:idkit_assets/src/other/assets_log.dart';
import 'package:idkit_assets/src/other/assets_tool.dart';
import 'package:path/path.dart';

class AssetsUnused {
  /// Check for unused resource files in the project.
  static void checkAssetsUnused() {
    final path = AssetsPath();
    final aMFile = AssetsFile(path.assetsManagePath);
    final libDirectory = AssetsDirectory(path.libPath).directory;
    final libDList = libDirectory.listSync();
    late var unAFile = AssetsFile(path.unusedAssetsPath).blank;
    if (aMFile.exist) {
      final file = aMFile.file;
      final aName = AssetsTool.clsName;
      final aMLines = file.readAsLinesSync();
      for (var line in aMLines) {
        final lineTirm = line.trim();
        late var count = 0;
        if (lineTirm.startsWith('static String ')) {
          final name = lineTirm.split(' ')[2];
          final word = aName + '.' + name;
          for (var item in libDList) {
            final fPath = item.path;
            final isFile = FileSystemEntity.isFileSync(fPath);
            late var isDart = fPath.contains('.dart');
            late var isMF = fPath.contains('idkit_assets_manage.dart');
            if (isFile && isDart && !isMF) {
              final contentLines = AssetsFile(fPath).file.readAsLinesSync();
              for (var itemLine in contentLines) {
                final lineTirm = itemLine.trim();
                if (!lineTirm.startsWith('//')) {
                  final rline = lineTirm.split('//').first;
                  final isExist = rline.contains(word);
                  if (isExist) {
                    count = 1;
                    break;
                  }
                }
              }
            }
          }
          if (count == 0) {
            final path = lineTirm.split('\'')[1];
            unAFile.writeAsStringSync('PATH: $path\n', mode: FileMode.append);
          }
        }
      }
    } else {
      AssetsLog.init();
    }
  }

  /// Remove unused resource files from the project.
  static void removeAssetsUnused() {
    final path = AssetsPath();
    final unFile = AssetsFile(path.unusedAssetsPath);
    if (unFile.exist) {
      final file = unFile.file;
      final lines = file.readAsLinesSync();
      if (lines.isNotEmpty) {
        for (var item in lines) {
          final fPath = item.split('PATH:').last;
          final filePath = join(path.rootPath, fPath.trim());
          final fFile = AssetsFile(filePath);
          if (fFile.exist) {
            fFile.delete();
          }
        }
        AssetsLog.removeUnusedAssestSuccess();
        unFile.delete();
        // Update project resource configuration.
        AssetsTempFDCreate.createAssetsTempFD();
        AssetsManageCreate.createAssetsMange();
        AssetsPubSpecCreate.createAssetsPubspec();
        try {
          AssetsRenamePubspec.renamePubspec();
        } catch (e) {
          sleep(Duration(milliseconds: 500));
          AssetsRenamePubspec.renamePubspec();
        }
      } else {
        AssetsLog.uUnusedAssets();
      }
    } else {
      AssetsLog.rUnusedAPreconditions();
    }
  }
}
