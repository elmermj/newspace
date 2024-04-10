import 'dart:ui';

import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff705861),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff332028),
      onPrimaryContainer: Color(0xffc7aab3),
      secondary: Color(0xff675b5f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff3e2e6),
      onSecondaryContainer: Color(0xff53474b),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff332213),
      onTertiaryContainer: Color(0xffc7ac96),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff8f8),
      onBackground: Color(0xff1d1b1b),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff1d1b1b),
      surfaceVariant: Color(0xffeedfe2),
      onSurfaceVariant: Color(0xff4e4447),
      outline: Color(0xff807477),
      outlineVariant: Color(0xffd1c3c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333030),
      inverseOnSurface: Color(0xfff6efef),
      inversePrimary: Color(0xffddbfc9),
      primaryFixed: Color(0xfffadae5),
      onPrimaryFixed: Color(0xff28161e),
      primaryFixedDim: Color(0xffddbfc9),
      onPrimaryFixedVariant: Color(0xff574149),
      secondaryFixed: Color(0xffefdee3),
      onSecondaryFixed: Color(0xff22191c),
      secondaryFixedDim: Color(0xffd3c2c7),
      onSecondaryFixedVariant: Color(0xff4f4447),
      tertiaryFixed: Color(0xfffbddc5),
      onTertiaryFixed: Color(0xff27180a),
      tertiaryFixedDim: Color(0xffddc1ab),
      onTertiaryFixedVariant: Color(0xff564332),
      surfaceDim: Color(0xffdfd8d9),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f2f2),
      surfaceContainer: Color(0xfff3eced),
      surfaceContainerHigh: Color(0xffede7e7),
      surfaceContainerHighest: Color(0xffe8e1e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff705861),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff332028),
      onPrimaryContainer: Color(0xfff4d4df),
      secondary: Color(0xff4b4043),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7e7175),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff332213),
      onTertiaryContainer: Color(0xfff4d7c0),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f8),
      onBackground: Color(0xff1d1b1b),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff1d1b1b),
      surfaceVariant: Color(0xffeedfe2),
      onSurfaceVariant: Color(0xff4a4043),
      outline: Color(0xff675c5f),
      outlineVariant: Color(0xff83787b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333030),
      inverseOnSurface: Color(0xfff6efef),
      inversePrimary: Color(0xffddbfc9),
      primaryFixed: Color(0xff876e77),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6d565e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7e7175),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff65595d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff87705d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6d5846),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdfd8d9),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f2f2),
      surfaceContainer: Color(0xfff3eced),
      surfaceContainerHigh: Color(0xffede7e7),
      surfaceContainerHighest: Color(0xffe8e1e1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff705861),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff332028),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff292023),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4b4043),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff332213),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f8),
      onBackground: Color(0xff1d1b1b),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffeedfe2),
      onSurfaceVariant: Color(0xff2a2224),
      outline: Color(0xff4a4043),
      outlineVariant: Color(0xff4a4043),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333030),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffe6ed),
      primaryFixed: Color(0xff523d45),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3b272f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4b4043),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff342a2d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff523f2e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3a291a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdfd8d9),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f2f2),
      surfaceContainer: Color(0xfff3eced),
      surfaceContainerHigh: Color(0xffede7e7),
      surfaceContainerHighest: Color(0xffe8e1e1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffddbfc9),
      surfaceTint: Color(0xffddbfc9),
      onPrimary: Color(0xff3f2b33),
      primaryContainer: Color(0xff14050b),
      onPrimaryContainer: Color(0xffaf939d),
      secondary: Color(0xffd3c2c7),
      onSecondary: Color(0xff382e31),
      secondaryContainer: Color(0xff473d40),
      onSecondaryContainer: Color(0xffe1d0d4),
      tertiary: Color(0xffddc1ab),
      onTertiary: Color(0xff3e2d1d),
      tertiaryContainer: Color(0xff120700),
      onTertiaryContainer: Color(0xffaf9681),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff151313),
      onBackground: Color(0xffe8e1e1),
      surface: Color(0xff151313),
      onSurface: Color(0xffe8e1e1),
      surfaceVariant: Color(0xff4e4447),
      onSurfaceVariant: Color(0xffd1c3c6),
      outline: Color(0xff9a8e91),
      outlineVariant: Color(0xff4e4447),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e1e1),
      inverseOnSurface: Color(0xff333030),
      inversePrimary: Color(0xff705861),
      primaryFixed: Color(0xfffadae5),
      onPrimaryFixed: Color(0xff28161e),
      primaryFixedDim: Color(0xffddbfc9),
      onPrimaryFixedVariant: Color(0xff574149),
      secondaryFixed: Color(0xffefdee3),
      onSecondaryFixed: Color(0xff22191c),
      secondaryFixedDim: Color(0xffd3c2c7),
      onSecondaryFixedVariant: Color(0xff4f4447),
      tertiaryFixed: Color(0xfffbddc5),
      onTertiaryFixed: Color(0xff27180a),
      tertiaryFixedDim: Color(0xffddc1ab),
      onTertiaryFixedVariant: Color(0xff564332),
      surfaceDim: Color(0xff151313),
      surfaceBright: Color(0xff3c3839),
      surfaceContainerLowest: Color(0xff100e0e),
      surfaceContainerLow: Color(0xff1d1b1b),
      surfaceContainer: Color(0xff221f1f),
      surfaceContainerHigh: Color(0xff2c292a),
      surfaceContainerHighest: Color(0xff373434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe1c3cd),
      surfaceTint: Color(0xffddbfc9),
      onPrimary: Color(0xff221118),
      primaryContainer: Color(0xffa58a93),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd7c7cb),
      onSecondary: Color(0xff1c1417),
      secondaryContainer: Color(0xff9b8d91),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe2c6af),
      onTertiary: Color(0xff211306),
      tertiaryContainer: Color(0xffa58c77),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff151313),
      onBackground: Color(0xffe8e1e1),
      surface: Color(0xff151313),
      onSurface: Color(0xfffff9f9),
      surfaceVariant: Color(0xff4e4447),
      onSurfaceVariant: Color(0xffd5c7cb),
      outline: Color(0xffaca0a3),
      outlineVariant: Color(0xff8c8083),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e1e1),
      inverseOnSurface: Color(0xff2c292a),
      inversePrimary: Color(0xff58424a),
      primaryFixed: Color(0xfffadae5),
      onPrimaryFixed: Color(0xff1c0c13),
      primaryFixedDim: Color(0xffddbfc9),
      onPrimaryFixedVariant: Color(0xff453038),
      secondaryFixed: Color(0xffefdee3),
      onSecondaryFixed: Color(0xff170f12),
      secondaryFixedDim: Color(0xffd3c2c7),
      onSecondaryFixedVariant: Color(0xff3e3337),
      tertiaryFixed: Color(0xfffbddc5),
      onTertiaryFixed: Color(0xff1b0e03),
      tertiaryFixedDim: Color(0xffddc1ab),
      onTertiaryFixedVariant: Color(0xff443322),
      surfaceDim: Color(0xff151313),
      surfaceBright: Color(0xff3c3839),
      surfaceContainerLowest: Color(0xff100e0e),
      surfaceContainerLow: Color(0xff1d1b1b),
      surfaceContainer: Color(0xff221f1f),
      surfaceContainerHigh: Color(0xff2c292a),
      surfaceContainerHighest: Color(0xff373434),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xffddbfc9),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe1c3cd),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd7c7cb),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf8),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe2c6af),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff151313),
      onBackground: Color(0xffe8e1e1),
      surface: Color(0xff151313),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff4e4447),
      onSurfaceVariant: Color(0xfffff9f9),
      outline: Color(0xffd5c7cb),
      outlineVariant: Color(0xffd5c7cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e1e1),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff38242c),
      primaryFixed: Color(0xffffdfe9),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe1c3cd),
      onPrimaryFixedVariant: Color(0xff221118),
      secondaryFixed: Color(0xfff4e3e7),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd7c7cb),
      onSecondaryFixedVariant: Color(0xff1c1417),
      tertiaryFixed: Color(0xffffe2ca),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe2c6af),
      onTertiaryFixedVariant: Color(0xff211306),
      surfaceDim: Color(0xff151313),
      surfaceBright: Color(0xff3c3839),
      surfaceContainerLowest: Color(0xff100e0e),
      surfaceContainerLow: Color(0xff1d1b1b),
      surfaceContainer: Color(0xff221f1f),
      surfaceContainerHigh: Color(0xff2c292a),
      surfaceContainerHighest: Color(0xff373434),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
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

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
