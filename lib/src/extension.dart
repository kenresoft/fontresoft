import 'package:flutter/material.dart';

import '../fontresoft.dart';
extension TextStyleExtension on Font {
  String get getFont {
    switch (this) {
      case Font.inconsolata:
        return FontResoft.inconsolata;
      case Font.inter:
        return FontResoft.inter;
      case Font.lato:
        return FontResoft.lato;
      case Font.oswald:
        return FontResoft.oswald;
      case Font.poppins:
        return FontResoft.poppins;
      case Font.quicksand:
        return FontResoft.quicksand;
      case Font.robotoCondensed:
        return FontResoft.robotoCondensed;
      case Font.shantellSans:
        return FontResoft.shantellSans;
      case Font.sourceSans:
        return FontResoft.sourceSansPro;
      default:
        throw ArgumentError("Unknown font: $this");
    }
  }
}
