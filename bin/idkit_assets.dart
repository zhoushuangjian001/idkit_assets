import 'package:idkit_assets/idkit_assets.dart' as idkit_assets;
import 'package:idkit_assets/src/idkit_assets_const.dart';
import 'package:idkit_assets/src/other/assets_log.dart';

void main(List<String> arguments) {
  // Check the input command.
  if (arguments.isEmpty) {
    // TODO: 输入不合法
    return;
  }

  // Check whether the input command is qualified.
  final firstArg = arguments.first;
  if (!cmdList.contains(firstArg)) {
    // TODO: 输入不合法
    return;
  }

  // Start.
  AssetsLog.start();

  // Analysis of input instructions.
  switch (firstArg) {
    case 'run':
    case '-r':
      print('指令--测试');
      break;
    default:
  }
  AssetsLog.end();
}
