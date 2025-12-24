import 'package:flutter/material.dart';
import 'package:iot_dashboard/common/constants/base_colors.dart';

/// A class that serves as a foundation for defining and managing color-related
/// constants and utilities within the application.
///
/// This class is intended to centralize color definitions, making it easier
/// to maintain consistency across the app's UI and simplify updates to the
/// color palette when needed.
class ColorsFoundations {
  const ColorsFoundations({
    this.backgroundComponentPrimary = ColorsTokens.neutral50,
    this.backgroundComponentSecondary = ColorsTokens.neutral100,
    this.backgroundComponentTertiary = ColorsTokens.neutral900,
    this.backgroundOpacityBlack60 = const Color(0x99000000),
    this.backgroundOpacityWhite50 = const Color(0x80FFFFFF),
    this.backgroundPagePrimary = ColorsTokens.neutral50,
    this.backgroundPageSecondary = ColorsTokens.blue50,
    this.borderPrimary = ColorsTokens.neutral200,
    this.borderSecondary = ColorsTokens.neutral300,
    this.borderTertiary = ColorsTokens.neutral500,
    this.borderQuaternary = ColorsTokens.neutral700,
    this.shapePrimary = ColorsTokens.neutral600,
    this.shapeSecondary = ColorsTokens.neutral50,
    this.shapeTertiary = ColorsTokens.neutral900,
    this.shapeQuaternary = ColorsTokens.neutral200,
    this.shapeOpacityPrimary = const Color(0x99000000),
    this.shapeOpacitySecondary = ColorsTokens.blue100,
    this.textPrimary = ColorsTokens.neutral950,
    this.textSecondary = ColorsTokens.neutral50,
    this.textTertiary = ColorsTokens.neutral800,
    this.disabledBackgroundPrimary = ColorsTokens.neutral200,
    this.disabledBackgroundSecondary = ColorsTokens.neutral500,
    this.disabledBorderPrimary = ColorsTokens.neutral500,
    this.disabledShapePrimary = ColorsTokens.neutral500,
    this.disabledShapeSkeleton = ColorsTokens.neutral300,
    this.disabledTextPrimary = ColorsTokens.neutral600,
    this.disabledTextSecondary = ColorsTokens.neutral700,
    this.interactionPrimary = ColorsTokens.primary,
    this.interactionSecondary = ColorsTokens.blue100,
    this.interactionTertiary = ColorsTokens.blue50,
    this.interactionBackground = ColorsTokens.blue100,
    this.statusDangerPrimary = ColorsTokens.red500,
    this.statusDangerSecondary = ColorsTokens.red50,
    this.statusDangerTertiary = ColorsTokens.red50,
    this.statusDangerQuaternary = ColorsTokens.red800,
    this.statusInfoPrimary = ColorsTokens.info,
    this.statusInfoSecondary = ColorsTokens.blue50,
    this.statusInfoTertiary = ColorsTokens.blue900,
    this.statusSuccessPrimary = ColorsTokens.green500,
    this.statusSuccessSecondary = ColorsTokens.green50,
    this.statusSuccessTertiary = ColorsTokens.green900,
    this.statusSuccessQuaternary = ColorsTokens.green100,
    this.statusSuccessAlternative = ColorsTokens.green700,
    this.statusWarningPrimary = ColorsTokens.yellow500,
    this.statusWarningSecondary = ColorsTokens.yellow50,
    this.statusWarningQuaternary = ColorsTokens.orange50,
    this.statusWarningTertiary = ColorsTokens.yellow900,
    this.statusWarningAlternative = ColorsTokens.accent,
    this.statusBlueBrandBackground = ColorsTokens.blue50,
    this.blueBrand = ColorsTokens.primary,
    this.darkSlate = ColorsTokens.neutral900,
    this.statusCartPrimary = ColorsTokens.accent,
    this.progressBarPrimary = ColorsTokens.green800,
  });

  final Color backgroundComponentPrimary;
  final Color backgroundComponentSecondary;
  final Color backgroundComponentTertiary;
  final Color backgroundOpacityBlack60;
  final Color backgroundOpacityWhite50;
  final Color backgroundPagePrimary;
  final Color backgroundPageSecondary;
  final Color borderPrimary;
  final Color borderSecondary;
  final Color borderTertiary;
  final Color borderQuaternary;
  final Color shapePrimary;
  final Color shapeSecondary;
  final Color shapeTertiary;
  final Color shapeQuaternary;
  final Color shapeOpacityPrimary;
  final Color shapeOpacitySecondary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color disabledBackgroundPrimary;
  final Color disabledBackgroundSecondary;
  final Color disabledBorderPrimary;
  final Color disabledShapePrimary;
  final Color disabledShapeSkeleton;
  final Color disabledTextPrimary;
  final Color disabledTextSecondary;
  final Color interactionPrimary;
  final Color interactionSecondary;
  final Color interactionTertiary;
  final Color interactionBackground;
  final Color statusDangerPrimary;
  final Color statusDangerSecondary;
  final Color statusDangerTertiary;
  final Color statusDangerQuaternary;
  final Color statusInfoPrimary;
  final Color statusInfoSecondary;
  final Color statusInfoTertiary;
  final Color statusSuccessPrimary;
  final Color statusSuccessSecondary;
  final Color statusSuccessTertiary;
  final Color statusSuccessQuaternary;
  final Color statusSuccessAlternative;
  final Color statusWarningPrimary;
  final Color statusWarningSecondary;
  final Color statusWarningTertiary;
  final Color statusWarningQuaternary;
  final Color statusWarningAlternative;
  final Color statusBlueBrandBackground;
  final Color blueBrand;
  final Color darkSlate;
  final Color statusCartPrimary;
  final Color progressBarPrimary;
}
