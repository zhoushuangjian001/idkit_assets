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
      final heard = 'The project resources do not meet the specifications as follows:\n';
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
    if (isContent) {
      final heard = 'The results of the unused resource check in the project are as follows:\n';
      AssetsLog.out('$heard', type: OutColor.red);
      final irRegularFile = AssetsFile(path.unusedAssetsPath).file;
      final content = irRegularFile.readAsStringSync();
      AssetsLog.out('$content', type: OutColor.red);
      final count = AssetsTool.count(path.unusedAssetsPath, 'PATH:');
      final end = 'There are a total of $count unused resource files.';
      AssetsLog.out('$end', type: OutColor.red);
    } else {
      AssetsLog.unusedACSuccess();
    }
  }
}
