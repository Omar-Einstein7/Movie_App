import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.backgroundLight,
      onSurface: AppColors.textPrimaryLight,
      secondaryContainer: AppColors.secondBackgroundLight,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.background,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondBackgroundLight,
      hintStyle: const TextStyle(
        color: AppColors.textSecondaryLight,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.background,
      onSurface: Colors.white,
      secondaryContainer: AppColors.secondBackground,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.background,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondBackground,
      hintStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
  );
}
