/// fontresoft.dart
///
/// A Flutter font package compiled and arranged by FontResoft for easy integration
/// of custom typography into Flutter applications.
///
/// This package provides a diverse selection of beautiful fonts, each with multiple
/// weights and styles, to cater to various design preferences and project requirements.
///
/// Fonts are locally stored within the package, ensuring consistent availability
/// and performance across different device environments.
///
/// Authors: Kenresoft (Kenneth Amadi).
/// Version: 0.0.2
/// Homepage: [GitHub Repo](https://github.com/kenresoft/fontresoft)

library fontresoft;

import 'package:flutter/material.dart';

/// Enumeration of available font styles.
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

/// A utility class providing font family names for easy access.
class FontResoft {
  /// Package name constant
  static const String package = 'fontresoft';

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
  static const String sFProDisplay = "SFProDisplay";
  static const String sFProText = "SFProText";
}

/// A utility class for applying text styles with specific font families.
class Font {
  /// Returns a TextStyle object with the Inconsolata font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle inconsolata({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.inconsolata, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(
        fontFamily: FontResoft.inconsolata, package: FontResoft.package);
  }

  /// Returns a TextStyle object with the Inter font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle inter({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.inter, package: FontResoft.package);
    return st ??= const TextStyle()
        .copyWith(fontFamily: FontResoft.inter, package: FontResoft.package);
  }

  /// Returns a TextStyle object with the Lato font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle lato({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.lato, package: FontResoft.package);
    return st ??= const TextStyle()
        .copyWith(fontFamily: FontResoft.lato, package: FontResoft.package);
  }

  /// Returns a TextStyle object with the Oswald font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle oswald({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.oswald, package: FontResoft.package);
    return st ??= const TextStyle()
        .copyWith(fontFamily: FontResoft.oswald, package: FontResoft.package);
  }

  /// Returns a TextStyle object with the Poppins font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle poppins({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.poppins, package: FontResoft.package);
    return st ??= const TextStyle()
        .copyWith(fontFamily: FontResoft.poppins, package: FontResoft.package);
  }

  /// Returns a TextStyle object with the Quicksand font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle quicksand({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.quicksand, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(
        fontFamily: FontResoft.quicksand, package: FontResoft.package);
  }

  /// Returns a TextStyle object with the Roboto Condensed font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle robotoCondensed({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.robotoCondensed, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(
        fontFamily: FontResoft.robotoCondensed, package: FontResoft.package);
  }

  /// Returns a TextStyle object with the Shantell Sans font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle shantellSans({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.shantellSans, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(
        fontFamily: FontResoft.shantellSans, package: FontResoft.package);
  }

  /// Returns a TextStyle object with the Source Sans font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle sourceSans({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.sourceSansPro, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(
        fontFamily: FontResoft.sourceSansPro, package: FontResoft.package);
  }

  /// Returns a TextStyle object with the SF Pro Display font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle sFProDisplay({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.sFProDisplay, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(
        fontFamily: FontResoft.sFProDisplay, package: FontResoft.package);
  }

  /// Returns a TextStyle object with the SF Pro Text font family applied.
  ///
  /// Optionally accepts a [style] parameter for additional text style customization.
  static TextStyle sFProText({TextStyle? style}) {
    var st = style?.copyWith(
        fontFamily: FontResoft.sFProText, package: FontResoft.package);
    return st ??= const TextStyle().copyWith(
        fontFamily: FontResoft.sFProText, package: FontResoft.package);
  }
}
