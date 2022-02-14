import 'package:idkit_assets/idkit_assets.dart' as idkit_main;
import 'package:idkit_assets/src/func/assets_result.dart';
import 'package:idkit_assets/src/other/assets_log.dart';
import 'package:idkit_assets/src/other/assets_tool.dart';
import 'package:idkit_assets/src/other/idkit_assets_const.dart';

void main(List<String> arguments) {
  // Start.
  AssetsLog.start();

  // Check the input command.
  if (arguments.isEmpty) {
    AssetsLog.unknown();
    AssetsLog.end();
    return;
  }

  // Check whether the input command is qualified.
  final firstArg = arguments.first;
  if (!cmdList.contains(firstArg)) {
    AssetsLog.unknown();
    AssetsLog.end();
    return;
  }

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
        } else {
          AssetsLog.incomplete();
        }
        break;
      case '-uc':
        idkit_main.checkUnusedAssets();
        break;
      case '-ur':
        idkit_main.removeUnusedAssets();
        break;
      case 'filter':
      case '-f':
        String? size;
        if (arguments.length >= 2) {
          final limit = arguments[1];
          final isRule = RegExp(r'^[0-9]+$').hasMatch(limit);
          if (isRule) {
            size = limit;
          } else {
            AssetsLog.unIdentifyCmd();
            AssetsLog.end();
            return;
          }
        }
        idkit_main.filterBigAssets(size: size);
        break;
      case 'delete':
      case '-d':
        if (arguments.length >= 2) {
          final path = arguments[1];
          idkit_main.deletePathAssets(path);
        } else {
          AssetsLog.incomplete();
        }
        break;
      case 'help':
      case '-h':
        idkit_main.help();
        break;
      default:
        AssetsLog.unknown();
    }
  } else {
    AssetsLog.unIntact();
  }

  // Clear redundant files.
  AssetsResultCheck.checkTemporaryFiles();

  // End.
  AssetsLog.end();
}
