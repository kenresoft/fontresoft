import 'dart:convert';
import 'dart:io';

import 'package:ansi_styles/ansi_styles.dart';
import 'package:args/args.dart';
import 'package:fontresoft/src/exception.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

import 'copier.dart';

class Setup {
  static Future<void> copyAndGenerateFonts(ArgResults argResults, ArgParser parser) async {
    final configFilePath = argResults['config'] as String?;
    final pubspecPath = argResults['pubspec'] as String?;

    if (configFilePath == null || pubspecPath == null) {
      throw OptionException('Missing required options.');
    }

    final fontCopier = Copier(configFilePath);

    try {
      await fontCopier.loadConfig();
      final fontFamilies = await fontCopier.loadFontFamilies();
      final packagePath = await findPackagePath();
      print(AnsiStyles.magentaBright("\nUsing package path: `$packagePath`"));

      const assetFontDir = 'assets/fonts'; // Fixed output directory

      final pubspecFile = File(path.join(packagePath, "pubspec.yaml").fixPath);
      final pubspecContent = await pubspecFile.readAsString();
      final pubspecYaml = loadYaml(pubspecContent) as YamlMap;

      for (var fontFamily in fontFamilies) {
        final fontFiles = fontCopier.findFontFiles(fontFamily, packagePath, pubspecYaml);
        fontCopier.copyFonts(fontFiles, fontFamily, assetFontDir);
      }

      await fontCopier.updatePubspec(fontFamilies, assetFontDir, pubspecPath);
      print(AnsiStyles.greenBright.bold("\n✔ Fonts copied and pubspec.yaml updated successfully.\n"));
    } catch (e) {
      if (e is PathNotFoundException) {
        print(AnsiStyles.redBright('\n✖ The system cannot find the file `$pubspecPath` specified.'));
        print(AnsiStyles.yellowBright('\nRecommendation:\n'
            '1. Ensure that the `-p` or `--pubspec` option points to the correct location of your `pubspec.yaml` file.\n'
            '2. If you don\'t want to modify the `pubspec.yaml` file, you can create a custom `.yaml` file manually and \n'
            'copy the generated font map into your `pubspec.yaml` file, which is where the generated font yaml are supposed to be written.\n'));
      } else {
        print(AnsiStyles.redBright("\n✖ $e"));
      }
    }
  }

  static Future<String> findPackagePath() async {
    final packageConfigFile = File(path.join('.dart_tool', 'package_config.json').fixPath);
    if (!packageConfigFile.existsSync()) {
      throw CopierException("`${packageConfigFile.path}` not found.");
    }

    final packageConfigContent = jsonDecode(await packageConfigFile.readAsString());
    final packages = packageConfigContent['packages'] as List;
    final package = packages.firstWhere((pkg) => pkg['name'] == 'fontresoft', orElse: () => null);

    if (package == null) {
      throw Exception("Package fontresoft not found in package_config.json.");
    }

    final rootUri = package['rootUri'] as String;
    final packageConfigDir = packageConfigFile.parent.path;
    final resolvedRootUri = path.normalize(path.join(packageConfigDir, rootUri)).fixPath;

    return resolvedRootUri;
  }
}
