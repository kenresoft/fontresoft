import 'package:flutter/material.dart';

import '../fontresoft.dart';

const path = 'packages/fontresoft/';

extension TextStyleExtension on TextStyle {
  String get getFontName {
    switch (fontFamily) {
      case '$path${FontResoft.inconsolata}':
        return FontResoft.inconsolata;
      case '$path${FontResoft.inter}':
        return FontResoft.inter;
      case '$path${FontResoft.lato}':
        return FontResoft.lato;
      case '$path${FontResoft.oswald}':
        return FontResoft.oswald;
      case '$path${FontResoft.poppins}':
        return FontResoft.poppins;
      case '$path${FontResoft.quicksand}':
        return FontResoft.quicksand;
      case '$path${FontResoft.robotoCondensed}':
        return FontResoft.robotoCondensed;
      case '$path${FontResoft.shantellSans}':
        return FontResoft.shantellSans;
      case '$path${FontResoft.sourceSansPro}':
        return FontResoft.sourceSansPro;
      default:
        throw ArgumentError("Unknown font: $fontFamily");
    }
  }
}
