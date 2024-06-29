import 'dart:io';
import 'package:yaml/yaml.dart';

void main() {
  final pubspecFile = File('pubspec.yaml');
  final fontsFile = File('fonts.yaml');
  final backupFile = File('pubspec-outdated.yaml');

  // Read the content of the pubspec.yaml and fonts.yaml files
  String pubspecContent;
  String fontsContent;
  try {
    pubspecContent = pubspecFile.readAsStringSync();
    fontsContent = fontsFile.readAsStringSync();
  } on FileSystemException catch (e) {
    print('Error reading files: $e');
    return;
  }

  // Backup the current pubspec.yaml to pubspec-outdated.yaml
  backupFile.writeAsStringSync(pubspecContent);

  // Parse the YAML content
  Map fontsYaml;
  try {
    fontsYaml = loadYaml(fontsContent) as Map;
  } on YamlException catch (e) {
    print('Error parsing fonts.yaml: $e');
    return;
  }

  final fontsSection = fontsYaml['fonts'];

  // Read the original lines of pubspec.yaml
  final pubspecLines = pubspecContent.split('\n');

  // Create a buffer to hold the new content
  final buffer = StringBuffer();
  bool insideFontsSection = false;
  bool fontsSectionFound = false;
  bool fontsAdded = false;

  // First pass to check if fonts section exists and ask for user confirmation
  for (var line in pubspecLines) {
    if (line.trim().startsWith('fonts:')) {
      fontsSectionFound = true;
      break;
    }
  }

  if (fontsSectionFound) {
    stdout.write(
        'A fonts section already exists in pubspec.yaml. Do you want to override it? (yes/no): ');
    final response = stdin.readLineSync()?.toLowerCase();

    if (response != 'yes') {
      print('Operation cancelled. No changes made.');
      return;
    }
  }

  // Second pass to rebuild the content
  insideFontsSection = false;

  for (var line in pubspecLines) {
    if (line.trim().startsWith('fonts:')) {
      insideFontsSection = true;
      // Skip the current fonts section
      continue;
    } else if (insideFontsSection && (line.startsWith(' ') || line.isEmpty)) {
      // Skip lines until we are out of the fonts section
      continue;
    } else {
      insideFontsSection = false;
      buffer.writeln(line);
    }

    if (line.trim() == 'uses-material-design: true' && !fontsAdded) {
      // Add the new fonts section here if uses-material-design is found and fonts are not yet added
      buffer.writeln('\n');
      buffer.writeln('  fonts:');
      for (var font in fontsSection) {
        buffer.writeln('    - family: ${font['family']}');
        buffer.writeln('      fonts:');
        for (var fontFile in font['fonts']) {
          buffer.writeln('        - asset: ${fontFile['asset']}');
          if (fontFile.containsKey('weight')) {
            buffer.writeln('          weight: ${fontFile['weight']}');
          }
          if (fontFile.containsKey('style')) {
            buffer.writeln('          style: ${fontFile['style']}');
          }
        }
      }
      fontsAdded = true;
    }

    // Add the remaining lines after the fonts section
    if (!insideFontsSection && fontsAdded) {
      buffer.writeln(line);
    }
  }

  if (!fontsAdded) {
    // If fonts are not added, print an error message
    print(
        'Error: uses-material-design: true section not found or fonts already added in pubspec.yaml.');
    return;
  }

  // Write the new content back to pubspec.yaml
  pubspecFile.writeAsStringSync(buffer.toString());

  print(
      'pubspec.yaml has been updated and a backup has been saved as pubspec-outdated.yaml.');
}
