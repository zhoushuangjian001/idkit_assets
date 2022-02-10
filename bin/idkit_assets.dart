import 'package:idkit_assets/src/func/assets_create.dart';
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
        AssetsCreate.createAssetsDirectory();
        break;
      case 'rename':
      case '-rn':
        AssetsCreate.createAssetsDirectory();
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
