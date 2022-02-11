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
The manual for the `idkit_assets` asset management script is as follows:

    Optional            Description
    ___________________________________________________________________
        run             Regular running of resource management scripts.
         -r             Same as `run` introduction.
 
     rename             Change the resource reference class name.For example 
                        `idkit_assets rename IdkitAssets`.
        -rn             Same as `rename` introduction.
 
    unused:
      check             Check for unused resources in the project.For example 
                        `idkit_assets unused check`.
     remove             Remove unused resources from the project.For example 
                        `idkit_assets unused remove`.
      
        -uc             Same as `check` introduction.
        -ur             Same as `remove` introduction.
 
       help             Output the manual for idkit_assets.
         -h             Same as `help` introduction.
    ___________________________________________________________________

If the above description does not solve your problem, please contact the developer.
''';
