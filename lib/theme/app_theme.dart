import 'package:cineverse/theme/app_colors.dart';
import 'package:cineverse/theme/app_fonts.dart' show AppFonts;
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.primary,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: AppColors.white),
        titleTextStyle: AppFonts.heading5,
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.primary,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          foregroundColor: AppColors.white,
          minimumSize: const Size(88, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.secondary,
        hintStyle: AppFonts.body1.copyWith(color: AppColors.secondaryTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        labelStyle: AppFonts.body1.copyWith(
          color: AppColors.secondaryTextColor,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.inactive,
        type: BottomNavigationBarType.fixed,
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppFonts.heading,
        displayMedium: AppFonts.heading3,
        displaySmall: AppFonts.heading4,
        headlineMedium: AppFonts.heading5,
        headlineSmall: AppFonts.heading6,
        titleLarge: AppFonts.heading7.copyWith(color: AppColors.white),
        titleMedium: AppFonts.subtitle1,
        titleSmall: AppFonts.subtitle2,
        bodyLarge: AppFonts.body1,
        bodyMedium: AppFonts.body2,
        labelLarge: AppFonts.button,
        bodySmall: AppFonts.caption,
        labelSmall: AppFonts.overline,
        labelMedium: AppFonts.body2.copyWith(
          color: AppColors.secondaryTextColor,
        ),
      ),
    );
  }
}
