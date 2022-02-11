import 'package:io/ansi.dart';

/// Log output for resource management scripts.
class AssetsLog {
  /// Log output.
  static void out(String content, {OutColor type = OutColor.green}) {
    switch (type) {
      case OutColor.green:
        print(green.wrap(content));
        break;
      case OutColor.red:
        print(red.wrap(content));
        break;
      case OutColor.yellow:
        print(yellow.wrap(content));
        break;
      case OutColor.lightYellow:
        print(lightYellow.wrap(content));
        break;
      default:
        print(content);
    }
  }

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

  /// Use the script function to initialize the script first.
  static void init() => print(lightYellow.wrap('''\n       To use the asset management script function, the initialization script 
               must be initialized. You can run the `idkit_assets run` or
               `idkit_assets rename xx` command to initialize it.\n'''));

  /// No unused resource record prompts.
  static void rUnusedA() => print(lightYellow.wrap('''\n        Before removing unused files, run the `idkit_assets unused check` or
            `idkit_assets -uc` command to check for unused asset files.\n'''));

  /// Unused resource removal result prompt.
  static void rUnusedASuccess() => print(green.wrap('*                        Unused resource removal completed!                        *'));

  /// Incomplete run command prompt.
  static void incomplete() => print(lightYellow.wrap('''\n                           The run command is incomplete,
                   you can run `idkit_assets help` for more help.\n'''));

  /// Project Resource Management Success.
  static void success() => print(green.wrap('*                       Project Resource Management Success!                       *'));
}

/// Enumeration of output colors.
enum OutColor {
  green,
  red,
  yellow,
  lightYellow,
}
