import 'package:ansi_styles/ansi_styles.dart';
import 'package:args/args.dart';
import 'package:fontresoft/executable.dart';
import 'package:fontresoft/setup.dart';
import 'package:fontresoft/src/exception.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('config',
        abbr: 'c', help: 'Path to the configuration YAML file')
    ..addOption('pubspec', abbr: 'p', help: 'Path to the pubspec.yaml file')
    ..addFlag('help',
        abbr: 'h', negatable: false, help: 'Show this help message')
    ..addCommand('generate')
    ..addCommand('add')
    ..addCommand('remove')
    ..addCommand('list')
    ..addCommand('delete');

  try {
    final argResults = parser.parse(arguments);

    if (argResults['help'] as bool) {
      printHelp(parser);
      return;
    }

    final command = argResults.command?.name;

    switch (command) {
      case 'generate':
        await generateConfig(argResults['config'] as String);
        break;
      case 'add':
        await addFontToConfig(
            argResults['config'] as String, argResults.command!.rest);
        break;
      case 'remove':
        await removeFontFromConfig(
            argResults['config'] as String, argResults.command!.rest);
        break;
      case 'list':
        await listFontsInConfig(argResults['config'] as String);
        break;
      case 'delete':
        await deleteConfigFile(argResults['config'] as String);
        break;
      default:
        await Setup.copyAndGenerateFonts(argResults, parser);
    }
  } catch (e) {
    if (e is FormatException || e is OptionException) {
      print(AnsiStyles.redBright('\n✖ $e\n'));
      printHelp(parser);
    } else {
      print(AnsiStyles.redBright('\n✖ $e\n'));
    }
  }
}

void printHelp(ArgParser parser) {
  print(AnsiStyles.blueBright
      .bold('\nUsage: fontresoft [options] <command> [arguments]'));
  print(AnsiStyles.whiteBright('${parser.usage}\n'));

  print(AnsiStyles.blueBright.bold('Commands:'));
  print(AnsiStyles.whiteBright(
      '  generate     Generate configuration based on the provided config file'));
  print(AnsiStyles.whiteBright(
      '  add          Add fonts to the configuration file'));
  print(AnsiStyles.whiteBright(
      '  remove       Remove fonts from the configuration file'));
  print(AnsiStyles.whiteBright(
      '  list         List all fonts in the configuration file'));
  print(AnsiStyles.whiteBright('  delete       Delete the configuration file'));

  print(AnsiStyles.blueBright.bold('\nExample Usage:'));
  print(AnsiStyles.whiteBright('  fontresoft -c path/to/config.yaml generate'));
  print(AnsiStyles.whiteBright(
      '  fontresoft -c path/to/config.yaml add font1 font2'));
  print(AnsiStyles.whiteBright(
      '  fontresoft -c path/to/config.yaml remove font1'));
  print(AnsiStyles.whiteBright('  fontresoft -c path/to/config.yaml list'));
  print(AnsiStyles.whiteBright('  fontresoft -c path/to/config.yaml delete\n'));
}
