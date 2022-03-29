import 'package:idkit_assets/src/func/assets_create.dart';
import 'package:idkit_assets/src/func/assets_delete.dart';
import 'package:idkit_assets/src/func/assets_filter.dart';
import 'package:idkit_assets/src/func/assets_manage_create.dart';
import 'package:idkit_assets/src/func/assets_pubspec_create.dart';
import 'package:idkit_assets/src/func/assets_rename_pubspec.dart';
import 'package:idkit_assets/src/func/assets_result.dart';
import 'package:idkit_assets/src/func/assets_tfd_create.dart';
import 'package:idkit_assets/src/func/assets_unused.dart';
import 'package:idkit_assets/src/other/assets_log.dart';
import 'package:idkit_assets/src/other/idkit_assets_const.dart' as mconst;

/// Regular execution of resource management scripts.
void run({String? name}) {
  AssetsCreate.createAssetsDirectory();
  AssetsTempFDCreate.createAssetsTempFD();
  AssetsManageCreate.createAssetsMange(clsName: name);
  AssetsPubSpecCreate.createAssetsPubspec();
  AssetsRenamePubspec.renamePubspec();
  AssetsResultCheck.checkRun();
  AssetsResultCheck.runDelete();
}

/// Check for unused resource methods.
void checkUnusedAssets() {
  AssetsUnused.checkAssetsUnused();
  AssetsResultCheck.checkUnused();
}

/// Remove unused resource method.
void removeUnusedAssets() {
  AssetsUnused.removeAssetsUnused();
}

/// Large project resource file filtering.
void filterBigAssets({String? size}) {
  AssetsFilter.filterAssets(size: size);
  AssetsResultCheck.checkFilter();
}

/// Delete the file at the specified path.
void deletePathAssets(String path) {
  AssetsDelete.deleteAssets(path);
}

/// Output the manual for idkit_assets.
void help() {
  final content = mconst.help;
  AssetsLog.out('$content', type: OutColor.yellow);
}
