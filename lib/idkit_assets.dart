import 'package:idkit_assets/src/func/assets_create.dart';
import 'package:idkit_assets/src/func/assets_manage_create.dart';
import 'package:idkit_assets/src/func/assets_pubspec_create.dart';
import 'package:idkit_assets/src/func/assets_tfd_create.dart';
import 'package:idkit_assets/src/func/assets_unused.dart';

/// Regular execution of resource management scripts.
void run({String? name}) {
  AssetsCreate.createAssetsDirectory();
  AssetsTempFDCreate.createAssetsTempFD();
  AssetsManageCreate.createAssetsMange(clsName: name);
  AssetsPubSpecCreate.createAssetsPubspec();
}

/// Check for unused resource methods.
void checkUnusedAssets() {
  AssetsUnused.checkAssetsUnused();
}

/// Remove unused resource method.
void removeUnusedAssets() {
  AssetsUnused.removeAssetsUnused();
}
