import 'package:build/build.dart';
import 'package:fontresoft/src/font_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder fontStyleBuilder(BuilderOptions options) => LibraryBuilder(
      FontStyleGenerator(),
      generatedExtension: '.fontresoft.g.dart',
    );
