import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff546341),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff121f04),
      onPrimaryContainer: Color(0xff798964),
      secondary: Color(0xff5a6150),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdce2cd),
      onSecondaryContainer: Color(0xff5e6554),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff091e25),
      onTertiaryContainer: Color(0xff728790),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffbf9f4),
      onSurface: Color(0xff1b1c19),
      onSurfaceVariant: Color(0xff45483f),
      outline: Color(0xff75786e),
      outlineVariant: Color(0xffc5c8bc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff30312d),
      inversePrimary: Color(0xffbbcda2),
      primaryFixed: Color(0xffd7e9bd),
      onPrimaryFixed: Color(0xff121f04),
      primaryFixedDim: Color(0xffbbcda2),
      onPrimaryFixedVariant: Color(0xff3d4b2b),
      secondaryFixed: Color(0xffdfe5d0),
      onSecondaryFixed: Color(0xff181d11),
      secondaryFixedDim: Color(0xffc3c9b5),
      onSecondaryFixedVariant: Color(0xff434939),
      tertiaryFixed: Color(0xffd0e6f0),
      onTertiaryFixed: Color(0xff091e25),
      tertiaryFixedDim: Color(0xffb4cad4),
      onTertiaryFixedVariant: Color(0xff364a52),
      surfaceDim: Color(0xffdbdad5),
      surfaceBright: Color(0xfffbf9f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f3ee),
      surfaceContainer: Color(0xfff0eee8),
      surfaceContainerHigh: Color(0xffeae8e3),
      surfaceContainerHighest: Color(0xffe4e2dd),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff546341),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff121f04),
      onPrimaryContainer: Color(0xff9cad84),
      secondary: Color(0xff32382a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff696f5e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff091e25),
      onTertiaryContainer: Color(0xff95aab3),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf9f4),
      onSurface: Color(0xff11110f),
      onSurfaceVariant: Color(0xff34372f),
      outline: Color(0xff51544a),
      outlineVariant: Color(0xff6b6e64),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff30312d),
      inversePrimary: Color(0xffbbcda2),
      primaryFixed: Color(0xff62724e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4a5a38),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff696f5e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff515747),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5c7079),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff445860),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc8c6c1),
      surfaceBright: Color(0xfffbf9f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f3ee),
      surfaceContainer: Color(0xffeae8e3),
      surfaceContainerHigh: Color(0xffdeddd8),
      surfaceContainerHighest: Color(0xffd3d1cc),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff546341),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff121f04),
      onPrimaryContainer: Color(0xffc5d6ac),
      secondary: Color(0xff282e20),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff454b3c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff091e25),
      onTertiaryContainer: Color(0xffbed4dd),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf9f4),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2a2d25),
      outlineVariant: Color(0xff474a41),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff30312d),
      inversePrimary: Color(0xffbbcda2),
      primaryFixed: Color(0xff3f4e2d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff293719),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff454b3c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2f3526),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff384c54),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff22353d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbab9b4),
      surfaceBright: Color(0xfffbf9f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f1eb),
      surfaceContainer: Color(0xffe4e2dd),
      surfaceContainerHigh: Color(0xffd6d4cf),
      surfaceContainerHighest: Color(0xffc8c6c1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbbcda2),
      surfaceTint: Color(0xffbbcda2),
      onPrimary: Color(0xff273517),
      primaryContainer: Color(0xff081400),
      onPrimaryContainer: Color(0xff72825d),
      secondary: Color(0xffc3c9b5),
      onSecondary: Color(0xff2c3224),
      secondaryContainer: Color(0xff434939),
      onSecondaryContainer: Color(0xffb1b8a4),
      tertiary: Color(0xffb4cad4),
      onTertiary: Color(0xff1f333b),
      tertiaryContainer: Color(0xff00131a),
      onTertiaryContainer: Color(0xff6b8089),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff131411),
      onSurface: Color(0xffe4e2dd),
      onSurfaceVariant: Color(0xffc5c8bc),
      outline: Color(0xff8f9287),
      outlineVariant: Color(0xff45483f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2dd),
      inversePrimary: Color(0xff546341),
      primaryFixed: Color(0xffd7e9bd),
      onPrimaryFixed: Color(0xff121f04),
      primaryFixedDim: Color(0xffbbcda2),
      onPrimaryFixedVariant: Color(0xff3d4b2b),
      secondaryFixed: Color(0xffdfe5d0),
      onSecondaryFixed: Color(0xff181d11),
      secondaryFixedDim: Color(0xffc3c9b5),
      onSecondaryFixedVariant: Color(0xff434939),
      tertiaryFixed: Color(0xffd0e6f0),
      onTertiaryFixed: Color(0xff091e25),
      tertiaryFixedDim: Color(0xffb4cad4),
      onTertiaryFixedVariant: Color(0xff364a52),
      surfaceDim: Color(0xff131411),
      surfaceBright: Color(0xff393936),
      surfaceContainerLowest: Color(0xff0e0e0c),
      surfaceContainerLow: Color(0xff1b1c19),
      surfaceContainer: Color(0xff1f201d),
      surfaceContainerHigh: Color(0xff2a2a27),
      surfaceContainerHighest: Color(0xff343532),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd1e3b7),
      surfaceTint: Color(0xffbbcda2),
      onPrimary: Color(0xff1c290d),
      primaryContainer: Color(0xff869670),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd9dfca),
      onSecondary: Color(0xff22281a),
      secondaryContainer: Color(0xff8d9381),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffcae0ea),
      onTertiary: Color(0xff142830),
      tertiaryContainer: Color(0xff7f949d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131411),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdbddd1),
      outline: Color(0xffb1b3a7),
      outlineVariant: Color(0xff8f9187),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2dd),
      inversePrimary: Color(0xff3e4d2c),
      primaryFixed: Color(0xffd7e9bd),
      onPrimaryFixed: Color(0xff081400),
      primaryFixedDim: Color(0xffbbcda2),
      onPrimaryFixedVariant: Color(0xff2c3a1c),
      secondaryFixed: Color(0xffdfe5d0),
      onSecondaryFixed: Color(0xff0d1307),
      secondaryFixedDim: Color(0xffc3c9b5),
      onSecondaryFixedVariant: Color(0xff32382a),
      tertiaryFixed: Color(0xffd0e6f0),
      onTertiaryFixed: Color(0xff00141b),
      tertiaryFixedDim: Color(0xffb4cad4),
      onTertiaryFixedVariant: Color(0xff253941),
      surfaceDim: Color(0xff131411),
      surfaceBright: Color(0xff444541),
      surfaceContainerLowest: Color(0xff070806),
      surfaceContainerLow: Color(0xff1d1e1b),
      surfaceContainer: Color(0xff272825),
      surfaceContainerHigh: Color(0xff32332f),
      surfaceContainerHighest: Color(0xff3d3e3a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe4f6ca),
      surfaceTint: Color(0xffbbcda2),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb7c99f),
      onPrimaryContainer: Color(0xff050e00),
      secondary: Color(0xffecf3dd),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbfc5b1),
      onSecondaryContainer: Color(0xff080d03),
      tertiary: Color(0xffdef3fe),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb1c6d0),
      onTertiaryContainer: Color(0xff000d13),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff131411),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeff1e4),
      outlineVariant: Color(0xffc1c4b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2dd),
      inversePrimary: Color(0xff3e4d2c),
      primaryFixed: Color(0xffd7e9bd),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffbbcda2),
      onPrimaryFixedVariant: Color(0xff081400),
      secondaryFixed: Color(0xffdfe5d0),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc3c9b5),
      onSecondaryFixedVariant: Color(0xff0d1307),
      tertiaryFixed: Color(0xffd0e6f0),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb4cad4),
      onTertiaryFixedVariant: Color(0xff00141b),
      surfaceDim: Color(0xff131411),
      surfaceBright: Color(0xff50504d),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1f201d),
      surfaceContainer: Color(0xff30312d),
      surfaceContainerHigh: Color(0xff3b3c38),
      surfaceContainerHighest: Color(0xff474743),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
