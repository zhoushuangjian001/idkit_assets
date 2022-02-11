import 'dart:io';
import 'package:idkit_assets/src/func/assets_create.dart';
import 'package:idkit_assets/src/func/assets_manage_create.dart';
import 'package:idkit_assets/src/func/assets_pubspec_create.dart';
import 'package:idkit_assets/src/func/assets_rename_pubspec.dart';
import 'package:idkit_assets/src/func/assets_result.dart';
import 'package:idkit_assets/src/func/assets_tfd_create.dart';
import 'package:idkit_assets/src/func/assets_unused.dart';
import 'package:idkit_assets/src/other/assets_log.dart';
import 'package:idkit_assets/src/other/idkit_assets_const.dart' as mConst;

/// Regular execution of resource management scripts.
void run({String? name}) {
  AssetsCreate.createAssetsDirectory();
  AssetsTempFDCreate.createAssetsTempFD();
  AssetsManageCreate.createAssetsMange(clsName: name);
  AssetsPubSpecCreate.createAssetsPubspec();
  AssetsRenamePubspec.renamePubspec();
  AssetsResultCheck.checkRun();
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

/// Output the manual for idkit_assets.
void help() {
  final content = mConst.help;
  AssetsLog.out('$content', type: OutColor.yellow);
}
