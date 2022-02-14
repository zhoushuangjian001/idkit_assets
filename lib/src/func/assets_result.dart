import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';
import 'package:idkit_assets/src/other/assets_log.dart';
import 'package:idkit_assets/src/other/assets_tool.dart';

class AssetsResultCheck {
  /// Check the results of a regular run.
  static void checkRun() {
    final path = AssetsPath();
    final isContent = AssetsTool.isContent(path.nameIrRegularPath);
    if (isContent) {
      final heard = 'The project resources do not meet the specifications as follows:';
      AssetsLog.out('$heard', type: OutColor.red);
      final irRegularFile = AssetsFile(path.nameIrRegularPath).file;
      final content = irRegularFile.readAsStringSync();
      AssetsLog.out('$content', type: OutColor.red);
      final count = AssetsTool.count(path.nameIrRegularPath, 'REASON:');
      final end = 'There are a total of $count non-standard resource files.';
      AssetsLog.out('$end', type: OutColor.red);
    } else {
      AssetsLog.success();
    }
  }

  /// Check logs for unused resources.
  static void checkUnused() {
    final path = AssetsPath();
    final isContent = AssetsTool.isContent(path.unusedAssetsPath);
    final uAFile = AssetsFile(path.unusedAssetsPath);
    if (isContent) {
      final heard = 'The results of the unused resource check in the project are as follows:\n';
      AssetsLog.out('$heard', type: OutColor.red);
      final irRegularFile = uAFile.file;
      final content = irRegularFile.readAsStringSync();
      AssetsLog.out('$content', type: OutColor.red);
      final count = AssetsTool.count(path.unusedAssetsPath, 'PATH:');
      final end = 'There are a total of $count unused resource files.';
      AssetsLog.out('$end', type: OutColor.red);
    } else {
      uAFile.delete();
      AssetsLog.unusedACSuccess();
    }
  }

  /// Regular script execution delete.
  static void runDelete() {
    final path = AssetsPath();
    late final uRAFile = AssetsFile(path.nameIrRegularPath);
    final isExist = AssetsTool.isContent(path.nameIrRegularPath);
    if (!isExist) {
      uRAFile.delete();
    }

    late final tDAFile = AssetsFile(path.tempDAssetsPath);
    if (tDAFile.exist) {
      tDAFile.delete();
    }

    late final tFAFile = AssetsFile(path.tempFAssetsPath);
    if (tFAFile.exist) {
      tFAFile.delete();
    }

    late final uUAFile = AssetsFile(path.unusedAssetsPath);
    if (uUAFile.exist) {
      uUAFile.delete();
    }

    late final bAFile = AssetsFile(path.bigAssetsPath);
    if (bAFile.exist) {
      bAFile.delete();
    }
  }

  /// Project resource filtered checks.
  static void checkFilter() {
    final path = AssetsPath();
    final bAPAth = path.bigAssetsPath;
    final bAFile = AssetsFile(bAPAth);
    if (bAFile.exist) {
      final isContent = AssetsTool.isContent(bAPAth);
      if (isContent) {
        final heard = 'Filter results for files larger than the specified size:';
        AssetsLog.out('$heard', type: OutColor.red);
        final content = bAFile.file.readAsStringSync();
        AssetsLog.out('$content', type: OutColor.red);
        final count = AssetsTool.count(bAPAth, 'PATH:');
        final end = 'There are a total of $count resource files that exceed the specified size.';
        AssetsLog.out('$end', type: OutColor.red);
      } else {
        bAFile.delete();
        AssetsLog.unOverSizeAssets();
      }
    } else {
      AssetsLog.unOverSizeAssets();
    }
  }
}
