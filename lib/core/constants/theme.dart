import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285093005),
      surfaceTint: Color(4285093005),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4293647615),
      onPrimaryContainer: Color(4280553029),
      secondary: Color(4284701552),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293582583),
      onSecondaryContainer: Color(4280227882),
      tertiary: Color(4286534237),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957536),
      onTertiaryContainer: Color(4281471002),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294899711),
      onSurface: Color(4280097568),
      onSurfaceVariant: Color(4282991950),
      outline: Color(4286215551),
      outlineVariant: Color(4291544271),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      inversePrimary: Color(4292131836),
      primaryFixed: Color(4293647615),
      onPrimaryFixed: Color(4280553029),
      primaryFixedDim: Color(4292131836),
      onPrimaryFixedVariant: Color(4283513972),
      secondaryFixed: Color(4293582583),
      onSecondaryFixed: Color(4280227882),
      secondaryFixedDim: Color(4291674843),
      onSecondaryFixedVariant: Color(4283122519),
      tertiaryFixed: Color(4294957536),
      onTertiaryFixed: Color(4281471002),
      tertiaryFixedDim: Color(4294031300),
      onTertiaryFixedVariant: Color(4284758853),
      surfaceDim: Color(4292794592),
      surfaceBright: Color(4294899711),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294504953),
      surfaceContainer: Color(4294175988),
      surfaceContainerHigh: Color(4293781230),
      surfaceContainerHighest: Color(4293386472),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283185263),
      surfaceTint: Color(4285093005),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286605989),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282859347),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286214535),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284495681),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288112499),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294899711),
      onSurface: Color(4280097568),
      onSurfaceVariant: Color(4282728778),
      outline: Color(4284636519),
      outlineVariant: Color(4286478723),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      inversePrimary: Color(4292131836),
      primaryFixed: Color(4286605989),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284895883),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286214535),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284569709),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4288112499),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4286336858),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794592),
      surfaceBright: Color(4294899711),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294504953),
      surfaceContainer: Color(4294175988),
      surfaceContainerHigh: Color(4293781230),
      surfaceContainerHighest: Color(4293386472),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281013836),
      surfaceTint: Color(4285093005),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283185263),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280688433),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282859347),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281997089),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284495681),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294899711),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280689195),
      outline: Color(4282728778),
      outlineVariant: Color(4282728778),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478965),
      inversePrimary: Color(4294174975),
      primaryFixed: Color(4283185263),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281737559),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282859347),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281411900),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284495681),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282786091),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292794592),
      surfaceBright: Color(4294899711),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294504953),
      surfaceContainer: Color(4294175988),
      surfaceContainerHigh: Color(4293781230),
      surfaceContainerHighest: Color(4293386472),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292131836),
      surfaceTint: Color(4292131836),
      onPrimary: Color(4281935195),
      primaryContainer: Color(4283513972),
      onPrimaryContainer: Color(4293647615),
      secondary: Color(4291674843),
      onSecondary: Color(4281609536),
      secondaryContainer: Color(4283122519),
      onSecondaryContainer: Color(4293582583),
      tertiary: Color(4294031300),
      onTertiary: Color(4283049263),
      tertiaryContainer: Color(4284758853),
      onTertiaryContainer: Color(4294957536),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279570968),
      onSurface: Color(4293386472),
      onSurfaceVariant: Color(4291544271),
      outline: Color(4287925913),
      outlineVariant: Color(4282991950),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386472),
      inversePrimary: Color(4285093005),
      primaryFixed: Color(4293647615),
      onPrimaryFixed: Color(4280553029),
      primaryFixedDim: Color(4292131836),
      onPrimaryFixedVariant: Color(4283513972),
      secondaryFixed: Color(4293582583),
      onSecondaryFixed: Color(4280227882),
      secondaryFixedDim: Color(4291674843),
      onSecondaryFixedVariant: Color(4283122519),
      tertiaryFixed: Color(4294957536),
      onTertiaryFixed: Color(4281471002),
      tertiaryFixedDim: Color(4294031300),
      onTertiaryFixedVariant: Color(4284758853),
      surfaceDim: Color(4279570968),
      surfaceBright: Color(4282071102),
      surfaceContainerLowest: Color(4279176467),
      surfaceContainerLow: Color(4280097568),
      surfaceContainer: Color(4280360740),
      surfaceContainerHigh: Color(4281084207),
      surfaceContainerHighest: Color(4281807930),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292395263),
      surfaceTint: Color(4292131836),
      onPrimary: Color(4280158272),
      primaryContainer: Color(4288513731),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292003551),
      onSecondary: Color(4279898917),
      secondaryContainer: Color(4288122276),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294294728),
      onTertiary: Color(4281010965),
      tertiaryContainer: Color(4290151310),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279570968),
      onSurface: Color(4294965758),
      onSurfaceVariant: Color(4291807443),
      outline: Color(4289175979),
      outlineVariant: Color(4287070603),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386472),
      inversePrimary: Color(4283579765),
      primaryFixed: Color(4293647615),
      onPrimaryFixed: Color(4279829051),
      primaryFixedDim: Color(4292131836),
      onPrimaryFixedVariant: Color(4282329954),
      secondaryFixed: Color(4293582583),
      onSecondaryFixed: Color(4279504415),
      secondaryFixedDim: Color(4291674843),
      onSecondaryFixedVariant: Color(4282004294),
      tertiaryFixed: Color(4294957536),
      onTertiaryFixed: Color(4280616464),
      tertiaryFixedDim: Color(4294031300),
      onTertiaryFixedVariant: Color(4283509301),
      surfaceDim: Color(4279570968),
      surfaceBright: Color(4282071102),
      surfaceContainerLowest: Color(4279176467),
      surfaceContainerLow: Color(4280097568),
      surfaceContainer: Color(4280360740),
      surfaceContainerHigh: Color(4281084207),
      surfaceContainerHighest: Color(4281807930),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965758),
      surfaceTint: Color(4292131836),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4292395263),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965758),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292003551),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294294728),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279570968),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965758),
      outline: Color(4291807443),
      outlineVariant: Color(4291807443),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386472),
      inversePrimary: Color(4281540437),
      primaryFixed: Color(4293911039),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4292395263),
      onPrimaryFixedVariant: Color(4280158272),
      secondaryFixed: Color(4293845756),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292003551),
      onSecondaryFixedVariant: Color(4279898917),
      tertiaryFixed: Color(4294959077),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294294728),
      onTertiaryFixedVariant: Color(4281010965),
      surfaceDim: Color(4279570968),
      surfaceBright: Color(4282071102),
      surfaceContainerLowest: Color(4279176467),
      surfaceContainerLow: Color(4280097568),
      surfaceContainer: Color(4280360740),
      surfaceContainerHigh: Color(4281084207),
      surfaceContainerHighest: Color(4281807930),
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
