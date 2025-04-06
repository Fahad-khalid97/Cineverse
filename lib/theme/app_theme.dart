import 'package:cineverse/theme/app_colors.dart';
import 'package:cineverse/theme/app_fonts.dart' show AppFonts;
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get dartTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
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

      // Icon Theme
      iconTheme: IconThemeData(color: AppColors.white),

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
        labelStyle: AppFonts.body1.copyWith(color: AppColors.white),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.bottomNavColor,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.secondaryTextColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: AppFonts.body2.copyWith(color: AppColors.white),
        unselectedLabelStyle: AppFonts.caption.copyWith(
          color: AppColors.secondaryTextColor,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
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

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: AppColors.white),
        titleTextStyle: AppFonts.heading5.copyWith(color: AppColors.primary),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.secondary,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // Icon Theme
      iconTheme: IconThemeData(color: AppColors.primary),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: AppColors.primary,
        ),
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
        fillColor: AppColors.secondaryTextColor,
        hintStyle: AppFonts.body1.copyWith(color: AppColors.secondaryTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        labelStyle: AppFonts.body1.copyWith(color: AppColors.primary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondaryTextColor,
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        selectedLabelStyle: AppFonts.body2.copyWith(color: AppColors.primary),
        unselectedLabelStyle: AppFonts.caption.copyWith(
          color: AppColors.secondaryTextColor,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppFonts.heading.copyWith(color: AppColors.primary),
        displayMedium: AppFonts.heading3.copyWith(color: AppColors.primary),
        displaySmall: AppFonts.heading4.copyWith(color: AppColors.primary),
        headlineMedium: AppFonts.heading5.copyWith(color: AppColors.primary),
        headlineSmall: AppFonts.heading6.copyWith(color: AppColors.primary),
        titleLarge: AppFonts.heading7.copyWith(color: AppColors.primary),
        titleMedium: AppFonts.subtitle1.copyWith(color: AppColors.primary),
        titleSmall: AppFonts.subtitle2.copyWith(color: AppColors.primary),
        bodyLarge: AppFonts.body1.copyWith(color: AppColors.primary),
        bodyMedium: AppFonts.body2.copyWith(color: AppColors.primary),
        labelLarge: AppFonts.button.copyWith(color: AppColors.primary),
        bodySmall: AppFonts.caption.copyWith(color: AppColors.primary),
        labelSmall: AppFonts.overline.copyWith(color: AppColors.primary),
        labelMedium: AppFonts.body2.copyWith(color: AppColors.secondary),
      ),
    );
  }
}
