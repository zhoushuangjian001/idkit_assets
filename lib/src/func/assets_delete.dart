import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/other/assets_log.dart';

class AssetsDelete {
  /// Delete resource file.
  static void deleteAssets(String path) {
    final dFile = AssetsFile(path);
    if (dFile.exist) {
      dFile.delete();
      AssetsLog.deleteSuccess();
    } else {
      AssetsLog.unDeletePath();
    }
  }
}
