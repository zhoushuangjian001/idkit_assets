import 'package:io/ansi.dart';

/// Log output for resource management scripts.
class AssetsLog {
  /// Start of resource management script.
  static void start() => print(green.wrap('******************************** IDKITASSETS -- START ********************************'));

  /// End of resource management script.
  static void end() => print(green.wrap('******************************** IDKITASSETS -- >END< ********************************'));

  /// Unknown command.
  static void unknown() => print(lightYellow.wrap('''\n                         The input command is not recognized, 
          you can run `idkit_assets help` or `idkit_assets -h` for more help.\n'''));

  /// Check if execution is full project log.
  static void unIntact() => print(lightYellow.wrap('''\n       The execution of the resource management script should be carried out in
                         the root directory of the project.\n'''));
}
