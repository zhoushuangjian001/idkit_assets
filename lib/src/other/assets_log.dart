import 'package:io/ansi.dart';

/// Log output for resource management scripts.
class AssetsLog {
  /// Start of resource management script.
  static void start() => print(green.wrap('******************************** IDKITASSETS -- START ********************************'));

  /// End of resource management script.
  static void end() => print(green.wrap('******************************** IDKITASSETS -- >END< ********************************'));
}
