import 'dart:io';
import 'package:idkit_assets/src/cls/assets_file.dart';
import 'package:idkit_assets/src/cls/assets_path.dart';
import 'package:idkit_assets/src/other/assets_tool.dart';
import 'package:idkit_assets/src/other/idkit_assets_const.dart';

class AssetsManageCreate {
  static void createAssetsMange({String? clsName}) {
    // Get name of assets manage class.
    final clsname = clsName ??= AssetsTool.clsName;
    final path = AssetsPath();
    final assetsMFile = AssetsFile(path.assetsManagePath).blank;
    assetsMFile.writeAsStringSync('class $clsname {\n');
    // Get the temporary file object of the resource management file path.
    final assetsTFFile = AssetsFile(path.tempFAssetsPath).file;
    final assetsTDFile = AssetsFile(path.tempDAssetsPath).file;
    final assetsNURFile = AssetsFile(path.nameIrRegularPath).blank;
    // Create manage file.
    final linesTD = assetsTDFile.readAsLinesSync();
    final linesTF = assetsTFFile.readAsLinesSync();
    for (var itemDF in linesTD) {
      assetsMFile.writeAsStringSync('\t/// $itemDF\n', mode: FileMode.append);
      for (var itemTF in linesTF) {
        if (itemTF.contains(itemDF)) {
          final last = itemTF.split(itemDF).last;
          if (!last.contains('/')) {
            var name = last.split('.').first;
            final isReg = assetsNameRegExp.hasMatch(name);
            if (isReg) {
              if (name.contains('_')) {
                name = name.replaceAllMapped(RegExp(r'_[a-z]'), (match) {
                  var char = match.group(0)!;
                  char = char.split('_').last;
                  return char.toUpperCase();
                });
              }
              // Check if the resource has the same name.
              final amContent = assetsMFile.readAsStringSync();
              final rule = 'static String $name =';
              if (RegExp(rule).hasMatch(amContent)) {
                final line = AssetsTool.getLineFrom(path.assetsManagePath, rule);
                final sPath = line.split('\'')[1];
                final errorInfo = '''
REASON: Resource file names are duplicated.
  NAME: $last
  PATH: $itemTF
  SPATH: $sPath
''';
                assetsNURFile.writeAsStringSync('$errorInfo', mode: FileMode.append);
              } else {
                assetsMFile.writeAsStringSync('\tstatic String $name = \'$itemTF\';\n', mode: FileMode.append);
              }
            } else {
              final errorInfo = '''
REASON: Resource file naming is not standard. 
  NAME: $last
  PATH: $itemTF
''';
              assetsNURFile.writeAsStringSync('$errorInfo', mode: FileMode.append);
            }
          }
        }
      }
      assetsMFile.writeAsStringSync('\n', mode: FileMode.append);
    }
    assetsMFile.writeAsStringSync('}', mode: FileMode.append);
  }
}
