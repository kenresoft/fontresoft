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
  static const String sansPro = "SansPro";
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
    var st = style?.copyWith(fontFamily: 'Inconsolata', package: 'fontresoft');
    return st ??= const TextStyle().copyWith(fontFamily: 'Inconsolata', package: 'fontresoft');
  }

  static TextStyle inter({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: 'Inter', package: 'fontresoft');
    return st ??= const TextStyle().copyWith(fontFamily: 'Inter', package: 'fontresoft');
  }

  static TextStyle lato({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: 'Lato', package: 'fontresoft');
    return st ??= const TextStyle().copyWith(fontFamily: 'Lato', package: 'fontresoft');
  }

  static TextStyle oswald({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: 'Oswald', package: 'fontresoft');
    return st ??= const TextStyle().copyWith(fontFamily: 'Oswald', package: 'fontresoft');
  }

  static TextStyle poppins({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: 'Poppins', package: 'fontresoft');
    return st ??= const TextStyle().copyWith(fontFamily: 'Poppins', package: 'fontresoft');
  }

  static TextStyle quicksand({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: 'Quicksand', package: 'fontresoft');
    return st ??= const TextStyle().copyWith(fontFamily: 'Quicksand', package: 'fontresoft');
  }

  static TextStyle robotoCondensed({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: 'RobotoCondensed', package: 'fontresoft');
    return st ??= const TextStyle().copyWith(fontFamily: 'RobotoCondensed', package: 'fontresoft');
  }

  static TextStyle shantellSans({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: 'ShantellSans', package: 'fontresoft');
    return st ??= const TextStyle().copyWith(fontFamily: 'ShantellSans', package: 'fontresoft');
  }

  static TextStyle sourceSans({TextStyle? style}) {
    var st = style?.copyWith(fontFamily: 'SourceSans', package: 'fontresoft');
    return st ??= const TextStyle().copyWith(fontFamily: 'SourceSans', package: 'fontresoft');
  }

  static List<E> generate<E>(int count, E Function(int index) item) {
    List<E> list = [];
    for (var i = 0; i <= count; ++i) {
      list.add(item(i));
    }
    return list;
  }
}
