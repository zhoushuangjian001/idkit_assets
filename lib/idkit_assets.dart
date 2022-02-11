import 'dart:io';
import 'package:idkit_assets/src/func/assets_create.dart';
import 'package:idkit_assets/src/func/assets_manage_create.dart';
import 'package:idkit_assets/src/func/assets_pubspec_create.dart';
import 'package:idkit_assets/src/func/assets_result.dart';
import 'package:idkit_assets/src/func/assets_tfd_create.dart';
import 'package:idkit_assets/src/func/assets_unused.dart';
import 'package:idkit_assets/src/other/assets_log.dart';

/// Regular execution of resource management scripts.
void run({String? name}) {
  AssetsCreate.createAssetsDirectory();
  AssetsTempFDCreate.createAssetsTempFD();
  AssetsManageCreate.createAssetsMange(clsName: name);
  AssetsPubSpecCreate.createAssetsPubspec();
  AssetsResultCheck.checkRun();
}

/// Check for unused resource methods.
void checkUnusedAssets() {
  AssetsUnused.checkAssetsUnused();
}

/// Remove unused resource method.
void removeUnusedAssets() {
  AssetsUnused.removeAssetsUnused();
}

/// Output the manual for idkit_assets.
void help() {
  final file = File('lib/src/other/assets_help.txt');
  final content = file.readAsStringSync();
  AssetsLog.out('\n$content\n', type: OutColor.yellow);
}
