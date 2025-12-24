// coverage:ignore-file

import 'package:flutter/material.dart';

/// A class that defines color tokens used throughout the application.
///
/// This class serves as a centralized location for managing color values,
/// ensuring consistency and reusability across the app's UI components.
///
/// Color palette designed for a corporate IoT dashboard with:
/// - Blue as the primary brand color (professional, trustworthy, tech-focused)
/// - Orange as complementary accent color (energy, attention, highlights)
/// - Standard status colors for alerts and notifications
class ColorsTokens {
  const ColorsTokens._();

  // ============================================================================
  // PRIMARY BRAND COLORS - Blue (IoT Dashboard Corporate Theme)
  // ============================================================================

  /// Primary blue color scale for the IoT dashboard.
  /// Professional shades optimized for data visualization and corporate interfaces.
  static const Color blue50 = Color(0xFFEFF6FF);
  static const Color blue100 = Color(0xFFDBEAFE);
  static const Color blue200 = Color(0xFFBFDBFE);
  static const Color blue300 = Color(0xFF93C5FD);
  static const Color blue400 = Color(0xFF60A5FA);
  static const Color blue500 = Color(0xFF3B82F6);
  static const Color blue600 = Color(0xFF2563EB);
  static const Color blue700 = Color(0xFF1D4ED8);
  static const Color blue800 = Color(0xFF1E40AF);
  static const Color blue900 = Color(0xFF1E3A8A);
  static const Color blue950 = Color(0xFF172554);

  // ============================================================================
  // COMPLEMENTARY ACCENT COLORS - Orange
  // ============================================================================

  /// Orange accent color scale for highlights and call-to-action elements.
  /// Used sparingly to add visual interest and draw attention to important features.
  static const Color orange50 = Color(0xFFFFF7ED);
  static const Color orange100 = Color(0xFFFFEDD5);
  static const Color orange200 = Color(0xFFFED7AA);
  static const Color orange300 = Color(0xFFFDBA74);
  static const Color orange400 = Color(0xFFFB923C);
  static const Color orange500 = Color(0xFFF97316);
  static const Color orange600 = Color(0xFFEA580C);
  static const Color orange700 = Color(0xFFC2410C);
  static const Color orange800 = Color(0xFF9A3412);
  static const Color orange900 = Color(0xFF7C2D12);
  static const Color orange950 = Color(0xFF431407);

  // ============================================================================
  // NEUTRAL COLORS - Grays
  // ============================================================================

  /// Neutral gray scale for text, backgrounds, borders, and UI elements.
  /// Optimized for readability and professional appearance in corporate dashboards.
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFE5E5E5);
  static const Color neutral300 = Color(0xFFD4D4D4);
  static const Color neutral400 = Color(0xFFA3A3A3);
  static const Color neutral500 = Color(0xFF737373);
  static const Color neutral600 = Color(0xFF525252);
  static const Color neutral700 = Color(0xFF404040);
  static const Color neutral800 = Color(0xFF262626);
  static const Color neutral900 = Color(0xFF171717);
  static const Color neutral950 = Color(0xFF0A0A0A);

  // ============================================================================
  // STATUS COLORS - Success (Green)
  // ============================================================================

  /// Green color scale for success states, positive indicators, and confirmed actions.
  static const Color green50 = Color(0xFFF0FDF4);
  static const Color green100 = Color(0xFFDCFCE7);
  static const Color green200 = Color(0xFFBBF7D0);
  static const Color green300 = Color(0xFF86EFAC);
  static const Color green400 = Color(0xFF4ADE80);
  static const Color green500 = Color(0xFF22C55E);
  static const Color green600 = Color(0xFF16A34A);
  static const Color green700 = Color(0xFF15803D);
  static const Color green800 = Color(0xFF166534);
  static const Color green900 = Color(0xFF14532D);
  static const Color green950 = Color(0xFF052E16);

  // ============================================================================
  // STATUS COLORS - Warning (Yellow/Amber)
  // ============================================================================

  /// Yellow/Amber color scale for warning states and caution indicators.
  static const Color yellow50 = Color(0xFFFEFCE8);
  static const Color yellow100 = Color(0xFFFEF9C3);
  static const Color yellow200 = Color(0xFFFEF08A);
  static const Color yellow300 = Color(0xFFFDE047);
  static const Color yellow400 = Color(0xFFFACC15);
  static const Color yellow500 = Color(0xFFEAB308);
  static const Color yellow600 = Color(0xFFCA8A04);
  static const Color yellow700 = Color(0xFFA16207);
  static const Color yellow800 = Color(0xFF854D0E);
  static const Color yellow900 = Color(0xFF713F12);
  static const Color yellow950 = Color(0xFF422006);

  // ============================================================================
  // STATUS COLORS - Danger (Red)
  // ============================================================================

  /// Red color scale for error states, danger alerts, and destructive actions.
  static const Color red50 = Color(0xFFFEF2F2);
  static const Color red100 = Color(0xFFFEE2E2);
  static const Color red200 = Color(0xFFFECACA);
  static const Color red300 = Color(0xFFFCA5A5);
  static const Color red400 = Color(0xFFF87171);
  static const Color red500 = Color(0xFFEF4444);
  static const Color red600 = Color(0xFFDC2626);
  static const Color red700 = Color(0xFFB91C1C);
  static const Color red800 = Color(0xFF991B1B);
  static const Color red900 = Color(0xFF7F1D1D);
  static const Color red950 = Color(0xFF450A0A);

  // ============================================================================
  // OFFICIAL BRAND COLORS - Main Palette
  // ============================================================================

  /// Primary brand color - Main blue used for primary actions, key UI elements,
  /// and brand identity. This is the cornerstone color of the IoT dashboard.
  static const Color primary = Color(0xFF2563EB);

  /// Secondary brand color - Supporting blue shade for secondary actions,
  /// backgrounds, and complementary elements. Lighter than primary.
  static const Color secondary = Color(0xFF3B82F6);

  /// Tertiary brand color - Alternative blue for tertiary elements, subtle accents,
  /// and depth variation. More muted than primary and secondary.
  static const Color tertiary = Color(0xFF60A5FA);

  /// Info color - Blue tone specifically for informational states, data highlights,
  /// and informative UI elements. Provides clear distinction from interactive elements.
  static const Color info = Color(0xFF1D4ED8);

  /// Accent color - Orange accent for highlights, call-to-action buttons,
  /// important notifications, and visual emphasis. Used sparingly for maximum impact.
  static const Color accent = Color(0xFFF97316);

  /// Interactive color - Vibrant blue-cyan for interactive elements, hover states,
  /// active indicators, and dynamic UI feedback. Slightly brighter for visibility.
  static const Color interactive = Color(0xFF06B6D4);

  // ============================================================================
  // UTILITY COLORS
  // ============================================================================

  /// Transparent color (fully transparent).
  static const Color transparent = Color(0x00000000);

  /// Pure white color.
  static const Color white = Color(0xFFFFFFFF);

  /// Pure black color.
  static const Color black = Color(0xFF000000);
}
