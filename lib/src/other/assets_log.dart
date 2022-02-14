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
  static void rUnusedAPreconditions() => print(lightYellow.wrap('''\n                     To use the script to remove unused assets, 
      First check the unused asset files, you can run `idkit_assets unused check`.\n'''));

  /// Unused resource removal result prompt.
  static void rUnusedASuccess() => print(green.wrap('*                        Unused resource removal completed!                        *'));

  /// Incomplete run command prompt.
  static void incomplete() => print(lightYellow.wrap('''\n                           The run command is incomplete,
                   you can run `idkit_assets help` for more help.\n'''));

  /// Project Resource Management Success.
  static void success() => print(green.wrap('''
*                                                                                    *
*                        Project Resource Management Success!                        *
*                                                                                    *'''));

  /// Check completion prompt for unused resources in the project.
  static void unusedACSuccess() => print(green.wrap('''
*                                                                                    *
*           The resource file check is not used in the project is complete!          *
*                                                                                    *'''));

  /// No unused resource files.
  static void uUnusedAssets() => print(green.wrap('''
*                                                                                    *
*                             No unused resource files!                              *
*                                                                                    *'''));

  /// Unused resource file removal completed.
  static void removeUnusedAssestSuccess() => print(green.wrap('''
*                                                                                    *
*                      Unused resource file removal completed!                       *
*                                                                                    *'''));

  /// There are no resource files in the project to filter.
  static void unFilterAssets() => print(lightYellow.wrap('''
*                                                                                    *
*                There are no resource files in the project to filter!               *
*                                                                                    *
'''));

  /// There are no resource files in the project that exceed the specified size.
  static void unOverSizeAssets() => print(lightYellow.wrap('''
*                                                                                    *
*     There are no resource files in the project that exceed the specified size.     *
*                                                                                    *
'''));

  /// Cannot be a recognized execution order.
  static void unIdentifyCmd() => print(lightYellow.wrap('''
                          The entered command is not recognized, 
                    you can run `idkit_assets help` for more help.'''));
}

/// Enumeration of output colors.
enum OutColor {
  green,
  red,
  yellow,
  lightYellow,
}
