import 'package:idkit_assets/idkit_assets.dart' as idkit_assets;
import 'package:idkit_assets/src/function/assets_path.dart';
import 'package:idkit_assets/src/idkit_assets_const.dart';
import 'package:idkit_assets/src/other/assets_log.dart';

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

  // Analysis of input instructions.
  switch (firstArg) {
    case 'run':
    case '-r':
      final path = AssetsPath().rootPath;
      print(path);
      break;
    case 'rename':
    case '-rn':
      break;
    default:
      AssetsLog.unknown();
  }
  AssetsLog.end();
}
