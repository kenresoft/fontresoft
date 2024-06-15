import 'package:flutter/material.dart';

import '../fontresoft.dart';

const path = 'packages/fontresoft/';

/// Extension on TextStyle to extract the font family name.
extension TextStyleExtension on TextStyle {
  /// Retrieves the font family name from a TextStyle object.
  ///
  /// Throws ArgumentError if the font family is unknown.
  String get getFontName {
    return switch (fontFamily) {
      '$path${FontResoft.inconsolata}' => FontResoft.inconsolata,
      '$path${FontResoft.inter}' => FontResoft.inter,
      '$path${FontResoft.lato}' => FontResoft.lato,
      '$path${FontResoft.oswald}' => FontResoft.oswald,
      '$path${FontResoft.poppins}' => FontResoft.poppins,
      '$path${FontResoft.quicksand}' => FontResoft.quicksand,
      '$path${FontResoft.robotoCondensed}' => FontResoft.robotoCondensed,
      '$path${FontResoft.shantellSans}' => FontResoft.shantellSans,
      '$path${FontResoft.sourceSansPro}' => FontResoft.sourceSansPro,
      '$path${FontResoft.sFProDisplay}' => FontResoft.sFProDisplay,
      '$path${FontResoft.sFProText}' => FontResoft.sFProText,
      '$path${FontResoft.comfortaa}' => FontResoft.comfortaa,
      _ => throw ArgumentError("Unknown font: $fontFamily")
    };
  }
}
