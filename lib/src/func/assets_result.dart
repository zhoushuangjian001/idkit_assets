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
      final heard = '\nThe project resources do not meet the specifications as follows:\n';
      AssetsLog.out('$heard', type: OutColor.red);
      final irRegularFile = AssetsFile(path.nameIrRegularPath).file;
      final content = irRegularFile.readAsStringSync();
      AssetsLog.out('$content', type: OutColor.red);
    } else {
      AssetsLog.success();
    }
  }
}
