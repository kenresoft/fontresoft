import 'dart:io';

import 'package:ansi_styles/ansi_styles.dart';
import 'package:fontresoft/src/exception.dart';
import 'package:prompts/prompts.dart' as prompts;
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

Future<void> generateConfig(String configFilePath) async {
  final config = {'fonts': []};
  final file = File(configFilePath);
  if (!file.existsSync()) {
    await writeConfigFile(file, config, configFilePath);
  } else {
    var decision = prompts.choose(
      AnsiStyles.yellowBright('\nConfiguration file already exists. Do you want to overwrite it?'),
      ['Yes', 'No'],
      defaultsTo: 'No',
    );
    if (decision == 'Yes') {
      await writeConfigFile(file, config, configFilePath);
    } else {
      print(AnsiStyles.cyan('\n✖ Cancelled!'));
    }
  }
}

Future<void> writeConfigFile(File file, Map<String, List<dynamic>> config, String configFilePath) async {
  await file.writeAsString(YamlWriter().write(config));
  print(AnsiStyles.greenBright.bold('\n✔ Configuration file generated at `$configFilePath`\n'));
}

Future<void> addFontToConfig(String configFilePath, List<String> fonts) async {
  final file = File(configFilePath);
  if (!file.existsSync()) {
    throw ConfigException("Configuration file `$configFilePath` not found.");
  }

  final contents = await file.readAsString();
  final yamlMap = loadYaml(contents) as YamlMap;

  final updatedFonts = Set<dynamic>.from(yamlMap['fonts'] ?? [])..addAll(fonts);
  final updatedConfig = {'fonts': updatedFonts.toList()};
  await file.writeAsString(YamlWriter().write(updatedConfig));
  print(AnsiStyles.greenBright.bold('\n✔ Fonts added to configuration file.\n'));
}

Future<void> removeFontFromConfig(String configFilePath, List<String> fonts) async {
  final file = File(configFilePath);
  if (!file.existsSync()) {
    throw ConfigException("Configuration file `$configFilePath` not found.");
  }

  final contents = await file.readAsString();
  final yamlMap = loadYaml(contents) as YamlMap;

  final updatedFonts = List<String>.from(yamlMap['fonts'] ?? [])
    ..removeWhere(
      (font) => fonts.contains(font),
    );
  final updatedConfig = {'fonts': updatedFonts};
  await file.writeAsString(YamlWriter().write(updatedConfig));
  print(AnsiStyles.greenBright.bold('\n✔ ︎Fonts removed from configuration file.\n'));
}

Future<void> listFontsInConfig(String configFilePath) async {
  final file = File(configFilePath);
  if (!file.existsSync()) {
    throw ConfigException("Configuration file `$configFilePath` not found.");
  }

  final contents = await file.readAsString();
  final yamlMap = loadYaml(contents) as YamlMap;

  final fonts = List<String>.from(yamlMap['fonts'] ?? []);
  print(AnsiStyles.blueBright.bold('\nFonts in configuration file:'));
  for (int i = 0; i < fonts.length; i++) {
    var font = fonts[i];
    print(AnsiStyles.magentaBright.italic('${i + 1}. $font'));
  }
  print('');
}

Future<void> deleteConfigFile(String configFilePath) async {
  final file = File(configFilePath);
  if (!file.existsSync()) {
    throw ConfigException("Configuration file `$configFilePath` not found.");
  }

  var decision = prompts.choose(
    AnsiStyles.yellowBright('\nAre you sure you want to delete the configuration file?'),
    ['Yes', 'No'],
    defaultsTo: 'No',
  );
  if (decision == 'Yes') {
    await file.delete();
    print(AnsiStyles.greenBright.bold('\n✔ Configuration file `$configFilePath` deleted \n'));
  } else {
    print(AnsiStyles.red('\n✖ Cancelled!'));
  }
}

/// ✖
/// ✔