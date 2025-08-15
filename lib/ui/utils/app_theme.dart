import 'package:evently/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final TextTheme _lightTextTheme = TextTheme(
    titleSmall: const TextStyle(
      fontSize: 16,
      color: AppColors.gray,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: const TextStyle(
      fontSize: 16,
      color: AppColors.blue,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: const TextStyle(
      fontSize: 20,
      color: AppColors.blue,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: const TextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: const TextStyle(
      fontSize: 24,
      color: AppColors.blue,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: const TextStyle(
      fontSize: 16,
      color: AppColors.blue,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: const TextStyle(
      fontSize: 20,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    ),
  );

  static final TextTheme _dartTextTheme = TextTheme(
    titleSmall: const TextStyle(
      fontSize: 16,
      color: AppColors.offWhite,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: const TextStyle(
      fontSize: 16,
      color: AppColors.blue,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      color: AppColors.blue,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: const TextStyle(
      fontSize: 16,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: const TextStyle(
      fontSize: 24,
      color: AppColors.blue,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: const TextStyle(
      fontSize: 16,
      color: AppColors.blue,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: const TextStyle(
      fontSize: 20,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    ),
  );

  static final lightDefaultTextBoarder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: AppColors.gray),
  );
  static final darkDefaultTextBoarder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: AppColors.gray),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.blue,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.blue,
      primary: AppColors.blue,
      onPrimary: AppColors.blue,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      tertiary: AppColors.white,
    ),
    brightness: Brightness.light,
    textTheme: _lightTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.blue,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.blue),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        textStyle: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: lightDefaultTextBoarder,
      focusedBorder: lightDefaultTextBoarder,
      enabledBorder: lightDefaultTextBoarder,
      hintStyle: _lightTextTheme.titleSmall,
    ),
    dividerTheme: DividerThemeData(color: AppColors.blue, thickness: 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
      selectedLabelStyle: TextStyle(color: AppColors.white),
      unselectedLabelStyle: TextStyle(color: AppColors.white),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.dartPurple,
    primaryColor: AppColors.blue,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.blue,
      primary: AppColors.blue,
      onPrimary: AppColors.dartPurple,
      secondary: AppColors.white,
      onSecondary: AppColors.black,
      tertiary: AppColors.dartPurple,
    ),
    brightness: Brightness.dark,
    textTheme: _dartTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.dartPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.blue),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        textStyle: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: darkDefaultTextBoarder,
      focusedBorder: darkDefaultTextBoarder,
      enabledBorder: darkDefaultTextBoarder,
    ),
  );
}
