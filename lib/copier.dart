import 'dart:io';

import 'package:ansi_styles/ansi_styles.dart';
import 'package:fontresoft/src/exception.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

class Copier {
  final String configFilePath;

  Copier(this.configFilePath);

  Future<void> loadConfig() async {
    final file = File(configFilePath);
    if (!file.existsSync()) {
      throw ConfigException("Configuration file `$configFilePath` not found");
    }

    final contents = await file.readAsString();
    final yamlMap = loadYaml(contents);

    if (yamlMap == null || !yamlMap.containsKey('fonts')) {
      throw ConfigException("Invalid configuration file `$configFilePath`");
    }
  }

  Future<List<String>> loadFontFamilies() async {
    final file = File(configFilePath);
    final contents = await file.readAsString();
    final yamlMap = loadYaml(contents) as YamlMap?;

    if (yamlMap == null || !yamlMap.containsKey('fonts')) {
      throw CopierException("Invalid configuration file `$configFilePath`");
    }

    final fonts = yamlMap['fonts'] as List<dynamic>;
    return List<String>.from(fonts);
  }

  List<String> findFontFiles(String fontFamily, String packagePath, YamlMap pubspecYaml) {
    final fonts = pubspecYaml['flutter']?['fonts'] as List? ?? [];
    final fontPaths = <String>[];

    for (var font in fonts) {
      if (font['family'] == fontFamily) {
        final fontAssets = font['fonts'] as List? ?? [];
        for (var fontAsset in fontAssets) {
          String assetPath = fontAsset['asset'] as String;
          assetPath = assetPath.replaceFirst('packages/fontresoft/', 'lib/');
          fontPaths.add(path.join(packagePath, assetPath).fixPath);
        }
        break;
      }
    }

    return fontPaths;
  }

  void copyFonts(List<String> fontFiles, String fontFamily, String outputDirPath) {
    final outputDir = Directory(outputDirPath);
    if (!outputDir.existsSync()) {
      outputDir.createSync(recursive: true);
    }
    if (fontFiles.isNotEmpty) {
      for (var fontFile in fontFiles) {
        final file = File(fontFile);
        if (!file.existsSync()) {
          print("\n✖ Font file `$fontFile` not found");
          continue;
        }
        final destination = path.join(outputDir.path, path.basename(fontFile)).fixPath;
        print(AnsiStyles.blueBright("- Copying font file `${fontFile.split('/').last}` to `$destination`"));
        try {
          file.copySync(destination);
        } catch (e) {
          if (e is PathExistsException) {
            /// Cannot create a file when that file already exists.
            throw CopierException('${e.message}.\n'
                '${AnsiStyles.italic("Cannot create a file when that file already exists.")}');
          } else if (e is PathNotFoundException) {
            /// The system cannot find the path specified.
            throw CopierException('${e.message}.\n'
                '${AnsiStyles.italic("-help: The system cannot find the path specified.")}');
          } else {
            throw CopierException(e.toString());
          }
        }
      }
    } else {
      print(AnsiStyles.blueBright('\nWe\'re sorry, `$fontFamily` font is not yet available for fontresoft!'));

      /// SEND MSG TO DEVELOPER TO ADD FONT
    }
  }

  ({List<String> beforeFlutter, String afterFlutter}) loadYamlCustom(String yamlContent) {
    final List<String> lines = yamlContent.split('\n');
    final List<String> formattedLines = [];
    final StringBuffer yamlBuffer = StringBuffer();
    bool isBeforeFlutterSection = true;
    bool isAfterFlutterSection = true;

    for (var line in lines) {
      if (isBeforeFlutterSection) {
        if (line.trimRight() == 'flutter:') {
          isBeforeFlutterSection = false;
        } else {
          formattedLines.add(line);
        }
      }
      if (!isBeforeFlutterSection && isAfterFlutterSection) {
        if (line.trimRight() == '  fonts:') {
          isAfterFlutterSection = false;
        } else {
          yamlBuffer.writeln(line);
        }
      }
    }

    return (beforeFlutter: formattedLines, afterFlutter: yamlBuffer.toString());
  }

  Future<void> updatePubspec(List<String> fontFamilies, String outputDirPath, String pubspecPath) async {
    final pubspecFile = File(pubspecPath);

    // Reading the output pubspec.yaml file
    final pubspecContent = await pubspecFile.readAsString();

    // Parse the YAML content
    final pubspecYamlCustom = loadYamlCustom(pubspecContent);
    final pubspecYaml = loadYaml(pubspecYamlCustom.afterFlutter);

    final newFontsSection = <Map<String, dynamic>>[];
    for (var fontFamily in fontFamilies) {
      // We can actually not copy the fonts, and then search the font files directly from the
      // package lib/font folder using this same search
      final fontFiles = Directory(outputDirPath.fixPath).listSync().whereType<File>().where((file) {
        return path.basenameWithoutExtension(file.path).startsWith(fontFamily);
      }).map((e) {
        return File(e.path.replaceAll('\\', '/'));
      }).toList();

      final fontsList = <Map<String, dynamic>>[];
      for (var fontFile in fontFiles) {
        final fontWeight = path.basenameWithoutExtension(fontFile.path).split('-').last;
        final weight = _getFontWeight(fontWeight);
        final assetPath = path.join(outputDirPath, path.basename(fontFile.path)).fixPath;

        final fontMap = {
          'asset': assetPath,
          if (weight != null) 'weight': weight,
        };
        fontsList.add(fontMap);
      }
      newFontsSection.add({
        'family': fontFamily,
        'fonts': fontsList,
      });
    }

    final mutablePubspecYaml = Map<String, dynamic>.from(pubspecYaml ?? {});
    final flutterSection = Map<String, dynamic>.from(mutablePubspecYaml['flutter'] ?? {});

    flutterSection['fonts'] = newFontsSection;
    mutablePubspecYaml['flutter'] = flutterSection;

    StringBuffer stringBuffer = StringBuffer();

    final yamlWriter = YamlWriter();
    var newPart = yamlWriter.write(mutablePubspecYaml);

    for (var o in pubspecYamlCustom.beforeFlutter) {
      stringBuffer.writeln(o);
    }

    stringBuffer.write(newPart);
    await pubspecFile.writeAsString(stringBuffer.toString());
    print(AnsiStyles.greenBright.bold("\n✔ pubspec.yaml updated successfully."));
  }

  int? _getFontWeight(String fontWeight) {
    switch (fontWeight.toLowerCase()) {
      case 'thin':
        return 100;
      case 'extralight':
        return 200;
      case 'light':
        return 300;
      case 'regular':
        return 400;
      case 'medium':
        return 500;
      case 'semibold':
        return 600;
      case 'bold':
        return 700;
      case 'extrabold':
        return 800;
      case 'black':
        return 900;
      default:
        return null;
    }
  }
}

extension PathExt on String {
  String get fixPath => replaceAll('\\', '/');
}
