import 'package:flutter/material.dart';

import '../fontresoft.dart';
/*extension TextStyleExtension on TextStyle {
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
}*/


extension TextStyleExtension on TextStyle {
  String get getFontName {
    switch (fontFamily) {
      case FontResoft.inconsolata:
        return FontResoft.inconsolata;
      case FontResoft.inter:
        return FontResoft.inter;
      case FontResoft.lato:
        return FontResoft.lato;
      case FontResoft.oswald:
        return FontResoft.oswald;
      case FontResoft.poppins:
        return FontResoft.poppins;
      case FontResoft.quicksand:
        return FontResoft.quicksand;
      case FontResoft.robotoCondensed:
        return FontResoft.robotoCondensed;
      case FontResoft.shantellSans:
        return FontResoft.shantellSans;
      case FontResoft.sourceSansPro:
        return FontResoft.sourceSansPro;
      default:
        throw ArgumentError("Unknown font: $fontFamily");
    }
  }
}
