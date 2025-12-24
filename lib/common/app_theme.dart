import 'package:flutter/material.dart';
import 'package:iot_dashboard/common/constants/colors.dart';
import 'package:iot_dashboard/common/constants/sizes.dart';

/// Creates a light theme for the IoT Dashboard application.
///
/// This theme uses the color foundations and size constants to create
/// a consistent, professional appearance for the corporate IoT dashboard.
ThemeData createLightTheme() {
  const colorFoundations = ColorsFoundations();

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Primary colors from foundation
    primaryColor: colorFoundations.interactionPrimary,

    // Color scheme using semantic colors
    colorScheme: ColorScheme.light(
      primary: colorFoundations.interactionPrimary,
      secondary: colorFoundations.interactionSecondary,
      tertiary: colorFoundations.interactionTertiary,
      error: colorFoundations.statusDangerPrimary,
      surface: colorFoundations.backgroundComponentPrimary,
      onPrimary: colorFoundations.textSecondary,
      onSecondary: colorFoundations.textPrimary,
      onTertiary: colorFoundations.textPrimary,
      onError: colorFoundations.textSecondary,
      onSurface: colorFoundations.textPrimary,
      brightness: Brightness.light,
    ),

    // Scaffold background
    scaffoldBackgroundColor: colorFoundations.backgroundPagePrimary,

    // Text selection theme
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colorFoundations.interactionPrimary,
      selectionColor: colorFoundations.interactionTertiary,
      selectionHandleColor: colorFoundations.interactionPrimary,
    ),

    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorFoundations.interactionPrimary,
        foregroundColor: colorFoundations.textSecondary,
        disabledBackgroundColor: colorFoundations.disabledBackgroundPrimary,
        disabledForegroundColor: colorFoundations.disabledTextPrimary,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sizeMd,
          vertical: AppSizes.sizeXs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        ),
      ),
    ),

    // Outlined button theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorFoundations.interactionPrimary,
        disabledForegroundColor: colorFoundations.disabledTextPrimary,
        side: BorderSide(
          color: colorFoundations.borderPrimary,
          width: AppSizes.size1,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sizeMd,
          vertical: AppSizes.sizeXs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        ),
      ),
    ),

    // Text button theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorFoundations.interactionPrimary,
        disabledForegroundColor: colorFoundations.disabledTextPrimary,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sizeXs,
          vertical: AppSizes.size2Xs,
        ),
      ),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorFoundations.backgroundComponentPrimary,
      hintStyle: TextStyle(
        color: colorFoundations.disabledTextPrimary,
      ),
      labelStyle: TextStyle(
        color: colorFoundations.textTertiary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.borderPrimary,
          width: AppSizes.size1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.borderPrimary,
          width: AppSizes.size1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.interactionPrimary,
          width: AppSizes.size2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.disabledBorderPrimary,
          width: AppSizes.size1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.statusDangerPrimary,
          width: AppSizes.size1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.statusDangerPrimary,
          width: AppSizes.size2,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.sizeXs,
        vertical: AppSizes.sizeXs,
      ),
    ),

    // Floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorFoundations.interactionPrimary,
      foregroundColor: colorFoundations.textSecondary,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.sizeMd),
      ),
    ),

    // Badge theme
    badgeTheme: BadgeThemeData(
      backgroundColor: colorFoundations.statusDangerPrimary,
      textColor: colorFoundations.textSecondary,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.size2Xs,
        vertical: AppSizes.size1,
      ),
    ),

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: colorFoundations.backgroundComponentPrimary,
      foregroundColor: colorFoundations.textPrimary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: colorFoundations.textPrimary,
        size: AppSizes.size24,
      ),
    ),

    // Card theme
    cardTheme: CardThemeData(
      color: colorFoundations.backgroundComponentPrimary,
      elevation: 0,
      margin: EdgeInsets.all(AppSizes.sizeXs),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        side: BorderSide(
          color: colorFoundations.borderPrimary,
          width: AppSizes.size1,
        ),
      ),
    ),

    // Divider theme
    dividerTheme: DividerThemeData(
      color: colorFoundations.borderPrimary,
      space: AppSizes.sizeMd,
      thickness: AppSizes.size1,
      indent: 0,
      endIndent: 0,
    ),

    // Icon theme
    iconTheme: IconThemeData(
      color: colorFoundations.textPrimary,
      size: AppSizes.size24,
    ),

    // Text theme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size60,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size44,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size3Xl,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.sizeMd,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size28,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size24,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: colorFoundations.textTertiary,
        fontSize: AppSizes.size2Xs,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size14,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: colorFoundations.textPrimary,
        fontSize: AppSizes.size2Xs,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: colorFoundations.textTertiary,
        fontSize: AppSizes.size10,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

/// Creates a dark theme for the IoT Dashboard application.
///
/// This theme provides a dark mode variant optimized for low-light
/// environments and extended viewing sessions.
ThemeData createDarkTheme() {
  const colorFoundations = ColorsFoundations();

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // Primary colors from foundation
    primaryColor: colorFoundations.interactionPrimary,

    // Color scheme using semantic colors (inverted for dark mode)
    colorScheme: ColorScheme.dark(
      primary: colorFoundations.interactionPrimary,
      secondary: colorFoundations.interactionSecondary,
      tertiary: colorFoundations.interactionTertiary,
      error: colorFoundations.statusDangerPrimary,
      surface: colorFoundations.backgroundComponentTertiary,
      onPrimary: colorFoundations.textPrimary,
      onSecondary: colorFoundations.textSecondary,
      onTertiary: colorFoundations.textPrimary,
      onError: colorFoundations.textSecondary,
      onSurface: colorFoundations.textSecondary,
      brightness: Brightness.dark,
    ),

    // Scaffold background
    scaffoldBackgroundColor: colorFoundations.backgroundComponentTertiary,

    // Text selection theme
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colorFoundations.interactionPrimary,
      selectionColor: colorFoundations.interactionTertiary,
      selectionHandleColor: colorFoundations.interactionPrimary,
    ),

    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorFoundations.interactionPrimary,
        foregroundColor: colorFoundations.textPrimary,
        disabledBackgroundColor: colorFoundations.disabledBackgroundSecondary,
        disabledForegroundColor: colorFoundations.disabledTextPrimary,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sizeMd,
          vertical: AppSizes.sizeXs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        ),
      ),
    ),

    // Outlined button theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorFoundations.interactionPrimary,
        disabledForegroundColor: colorFoundations.disabledTextPrimary,
        side: BorderSide(
          color: colorFoundations.borderSecondary,
          width: AppSizes.size1,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sizeMd,
          vertical: AppSizes.sizeXs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        ),
      ),
    ),

    // Text button theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorFoundations.interactionPrimary,
        disabledForegroundColor: colorFoundations.disabledTextPrimary,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sizeXs,
          vertical: AppSizes.size2Xs,
        ),
      ),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorFoundations.backgroundComponentTertiary,
      hintStyle: TextStyle(
        color: colorFoundations.disabledTextSecondary,
      ),
      labelStyle: TextStyle(
        color: colorFoundations.textSecondary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.borderQuaternary,
          width: AppSizes.size1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.borderQuaternary,
          width: AppSizes.size1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.interactionPrimary,
          width: AppSizes.size2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.disabledBorderPrimary,
          width: AppSizes.size1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.statusDangerPrimary,
          width: AppSizes.size1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        borderSide: BorderSide(
          color: colorFoundations.statusDangerPrimary,
          width: AppSizes.size2,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.sizeXs,
        vertical: AppSizes.sizeXs,
      ),
    ),

    // Floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorFoundations.interactionPrimary,
      foregroundColor: colorFoundations.textPrimary,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.sizeMd),
      ),
    ),

    // Badge theme
    badgeTheme: BadgeThemeData(
      backgroundColor: colorFoundations.statusDangerPrimary,
      textColor: colorFoundations.textSecondary,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.size2Xs,
        vertical: AppSizes.size1,
      ),
    ),

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: colorFoundations.backgroundComponentTertiary,
      foregroundColor: colorFoundations.textSecondary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: colorFoundations.textSecondary,
        size: AppSizes.size24,
      ),
    ),

    // Card theme
    cardTheme: CardThemeData(
      color: colorFoundations.backgroundComponentTertiary,
      elevation: 0,
      margin: EdgeInsets.all(AppSizes.sizeXs),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.size2Xs),
        side: BorderSide(
          color: colorFoundations.borderQuaternary,
          width: AppSizes.size1,
        ),
      ),
    ),

    // Divider theme
    dividerTheme: DividerThemeData(
      color: colorFoundations.borderQuaternary,
      space: AppSizes.sizeMd,
      thickness: AppSizes.size1,
      indent: 0,
      endIndent: 0,
    ),

    // Icon theme
    iconTheme: IconThemeData(
      color: colorFoundations.textSecondary,
      size: AppSizes.size24,
    ),

    // Text theme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size60,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.sizeXl,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size3Xl,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.sizeMd,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size28,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size24,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: colorFoundations.textTertiary,
        fontSize: AppSizes.size2Xs,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size14,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: colorFoundations.textSecondary,
        fontSize: AppSizes.size2Xs,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: colorFoundations.textTertiary,
        fontSize: AppSizes.size10,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

