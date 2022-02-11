/// Set of execution commands.
const List<String> cmdList = [
  'run',
  '-r',
  'rename',
  '-rn',
  'unused',
  '-uc',
  '-ur',
  'filter',
  '-f',
  'help',
  '-h',
];

/// Brief introductory text for resource file management scripts.
const String readme =
    'Welcome to use the idkit_assets script asset management project resources.\n For more details, please run `idkit_assets help` or `idkit_assets -h` for more help.';

/// Regular way to get the name of the resource management file class.
final clsNameRegExp = RegExp(r'^class [A-Z](\w)* {$');

/// Resource file naming convention.
final assetsNameRegExp = RegExp(r'[a-z](\w)*$');

/// The regularity of assets in the project release specification.
final pubspecAssetsRegExp = RegExp(r'^(# )?assets:$');

/// Citation rules for pre-project resources.
final assetsORegExp = RegExp(r'^(#   )?- [(\w)./]+.(png|jpeg|webp)$');

/// New citation rules for project resources.
final assetsRegExp = RegExp(r'^- [(\w)./]+/$');

const String help = '''

''';
