import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';

class AssetsRenamePubspec {
  /// Rename project temporary pubspec to official pubspec.
  static void renamePubspec() {
    final path = AssetsPath();
    AssetsFile(path.pubspecPath).delete();
    AssetsFile(path.assetsTPubspecPath).rename('pubspec.yaml');
  }
}
