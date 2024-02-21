import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/font_sizes.dart';
import 'package:flutter_application/core/constants/spacings.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = _getTheme(_lightColorScheme);
final darkTheme = _getTheme(_darkColorScheme);

final _lightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF47828F),
  brightness: Brightness.light,
);

final _darkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFFA7C8FF),
  brightness: Brightness.dark,
);

ThemeData _getTheme(ColorScheme colorScheme) {
  final textTheme = _getTextTheme(colorScheme);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.background,
      titleTextStyle: textTheme.titleLarge,
      iconTheme: IconThemeData(
        color: colorScheme.primary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacing.s16),
        ),
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.s16,
          horizontal: Spacing.s32,
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(Spacing.s24),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Spacing.s16),
        ),
      ),
    ),
  );
}

TextTheme _getTextTheme(ColorScheme colorScheme) {
  final textTheme = TextTheme(
      //Headline
      headlineLarge: TextStyle(
        fontSize: FontSize.s24,
        fontWeight: FontWeight.w700,
        color: colorScheme.primary,
      ),
      headlineMedium: TextStyle(
        fontSize: FontSize.s18,
        fontWeight: FontWeight.w700,
        color: colorScheme.onBackground,
      ),
      //Display
      displayLarge: TextStyle(
        fontSize: FontSize.s36,
        fontWeight: FontWeight.w700,
        color: colorScheme.primary,
      ),
      displayMedium: const TextStyle(
        fontSize: FontSize.s18,
        fontWeight: FontWeight.w500,
      ),
      //Title
      titleLarge: TextStyle(
        fontSize: FontSize.s20,
        fontWeight: FontWeight.w400,
        color: colorScheme.onBackground,
      ),
      titleMedium: TextStyle(
        fontSize: FontSize.s18,
        fontWeight: FontWeight.w400,
        color: colorScheme.onBackground,
      ),
      //Body
      bodyMedium: const TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w400,
        color: colorScheme.onBackground,
      ),
      //Label
      labelSmall: TextStyle(
        fontSize: FontSize.s10,
        fontWeight: FontWeight.w400,
        color: colorScheme.primary,
      ));

  return GoogleFonts.rubikTextTheme(textTheme);
}
