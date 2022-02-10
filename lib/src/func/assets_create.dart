import 'package:idkit_assets/src/cls/assets_directory.dart';
import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';
import 'package:idkit_assets/src/other/idkit_assets_const.dart';

/// Create a resource directory for the project.
class AssetsCreate {
  static void createAssetsDirectory() {
    final path = AssetsPath();
    AssetsDirectory(path.assetsPath).directory;
    final readmeFile = AssetsFile(path.readmePath);
    if (!readmeFile.exist) {
      readmeFile.blank.writeAsStringSync(readme);
    }
  }
}
