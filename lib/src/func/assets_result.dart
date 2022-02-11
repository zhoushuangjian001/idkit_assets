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
      final irRegularFile = AssetsFile(path.nameIrRegularPath).file;
      final content = irRegularFile.readAsStringSync();
      final result = heard + content;
      AssetsLog.out('\n$result\n', type: OutColor.red);
    } else {
      AssetsLog.success();
    }
  }
}
