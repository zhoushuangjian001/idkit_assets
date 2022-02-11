import 'package:idkit_assets/idkit_assets.dart' as idkit_main;
import 'package:idkit_assets/src/func/assets_create.dart';
import 'package:idkit_assets/src/func/assets_manage_create.dart';
import 'package:idkit_assets/src/func/assets_pubspec_create.dart';
import 'package:idkit_assets/src/func/assets_tfd_create.dart';
import 'package:idkit_assets/src/other/assets_log.dart';
import 'package:idkit_assets/src/other/assets_tool.dart';
import 'package:idkit_assets/src/other/idkit_assets_const.dart';

void main(List<String> arguments) {
  // Check the input command.
  if (arguments.isEmpty) {
    AssetsLog.unknown();
    return;
  }

  // Check whether the input command is qualified.
  final firstArg = arguments.first;
  if (!cmdList.contains(firstArg)) {
    AssetsLog.unknown();
    return;
  }

  // Start.
  AssetsLog.start();

  // Check if execution is full project.
  if (AssetsTool.isIntact) {
    // Analysis of input instructions.
    switch (firstArg) {
      case 'run':
      case '-r':
        idkit_main.run();
        break;
      case 'rename':
      case '-rn':
        final name = arguments.length > 1 ? arguments[1] : null;
        idkit_main.run(name: name);
        break;
      case 'unused':
        if (arguments.length > 1) {
          final arg2 = arguments[1];
          final cmd = arg2.trim();
          if (cmd == 'check') {
            idkit_main.checkUnusedAssets();
          } else if (cmd == 'remove') {
            idkit_main.removeUnusedAssets();
          } else {
            AssetsLog.unknown();
          }
        } else {}
        break;
      case '-uc':
        idkit_main.checkUnusedAssets();
        break;
      case '-ur':
        idkit_main.removeUnusedAssets();
        break;
      default:
        AssetsLog.unknown();
    }
  } else {
    AssetsLog.unIntact();
  }

  // End.
  AssetsLog.end();
}
