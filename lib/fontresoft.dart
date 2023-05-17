library fontresoft;

import 'package:flutter/material.dart';

enum ResoftStyle {
  inconsolata,
  inter,
  lato,
  oswald,
  poppins,
  quicksand,
  robotoCondensed,
  shantellSans,
  sourceSans,
}

class FontResoft {
  static String package = 'fontresoft';

  //Fonts
  static const String sourceSansPro = "SourceSansPro";
  static const String poppins = "Poppins";
  static const String shantellSans = "ShantellSans";
  static const String robotoCondensed = "RobotoCondensed";
  static const String quicksand = "Quicksand";
  static const String oswald = "Oswald";
  static const String inter = "Inter";
  static const String inconsolata = "Inconsolata";
  static const String lato = "Lato";
}

class Font {
  static TextStyle inconsolata({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: FontResoft.inconsolata, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(fontFamily: FontResoft.inconsolata, package: FontResoft.package);
  }

  static TextStyle inter({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: FontResoft.inter, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(fontFamily: FontResoft.inter, package: FontResoft.package);
  }

  static TextStyle lato({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: FontResoft.lato, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(fontFamily: FontResoft.lato, package: FontResoft.package);
  }

  static TextStyle oswald({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: FontResoft.oswald, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(fontFamily: FontResoft.oswald, package: FontResoft.package);
  }

  static TextStyle poppins({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: FontResoft.poppins, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(fontFamily: FontResoft.poppins, package: FontResoft.package);
  }

  static TextStyle quicksand({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: FontResoft.quicksand, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(fontFamily: FontResoft.quicksand, package: FontResoft.package);
  }

  static TextStyle robotoCondensed({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: FontResoft.robotoCondensed, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(fontFamily: FontResoft.robotoCondensed, package: FontResoft.package);
  }

  static TextStyle shantellSans({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: FontResoft.shantellSans, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(fontFamily: FontResoft.shantellSans, package: FontResoft.package);
  }

  static TextStyle sourceSans({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: FontResoft.sourceSansPro, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(fontFamily: FontResoft.sourceSansPro, package: FontResoft.package);
  }

/*  static List<E> generate<E>(int count, E Function(int index) item) {
    List<E> list = [];
    for (var i = 0; i <= count; ++i) {
      list.add(item(i));
    }
    return list;
  }*/
}
