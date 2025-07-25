import 'package:flutter/material.dart';
import '../../ref/typeface/typeface.dart';

/// System typescale tokens for Material Design 3.
/// 
/// These define the complete text style system with appropriate
/// font sizes, line heights, and weights for different contexts.
/// 
/// Specification: https://m3.material.io/styles/typography/tokens
abstract class MdSysTypescale {
  /// Token: md.sys.typescale.display-large
  static const TextStyle displayLarge = TextStyle(
    fontFamily: MdRefTypeface.brand,
    fontSize: 57.0,
    height: 64.0 / 57.0,
    letterSpacing: -0.25,
    fontWeight: MdRefTypeface.weightRegular,
  );

  /// Token: md.sys.typescale.display-medium
  static const TextStyle displayMedium = TextStyle(
    fontFamily: MdRefTypeface.brand,
    fontSize: 45.0,
    height: 52.0 / 45.0,
    letterSpacing: 0.0,
    fontWeight: MdRefTypeface.weightRegular,
  );

  /// Token: md.sys.typescale.display-small
  static const TextStyle displaySmall = TextStyle(
    fontFamily: MdRefTypeface.brand,
    fontSize: 36.0,
    height: 44.0 / 36.0,
    letterSpacing: 0.0,
    fontWeight: MdRefTypeface.weightRegular,
  );

  /// Token: md.sys.typescale.headline-large
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: MdRefTypeface.brand,
    fontSize: 32.0,
    height: 40.0 / 32.0,
    letterSpacing: 0.0,
    fontWeight: MdRefTypeface.weightRegular,
  );

  /// Token: md.sys.typescale.headline-medium
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: MdRefTypeface.brand,
    fontSize: 28.0,
    height: 36.0 / 28.0,
    letterSpacing: 0.0,
    fontWeight: MdRefTypeface.weightRegular,
  );

  /// Token: md.sys.typescale.headline-small
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: MdRefTypeface.brand,
    fontSize: 24.0,
    height: 32.0 / 24.0,
    letterSpacing: 0.0,
    fontWeight: MdRefTypeface.weightRegular,
  );

  /// Token: md.sys.typescale.title-large
  static const TextStyle titleLarge = TextStyle(
    fontFamily: MdRefTypeface.brand,
    fontSize: 22.0,
    height: 28.0 / 22.0,
    letterSpacing: 0.0,
    fontWeight: MdRefTypeface.weightRegular,
  );

  /// Token: md.sys.typescale.title-medium
  static const TextStyle titleMedium = TextStyle(
    fontFamily: MdRefTypeface.plain,
    fontSize: 16.0,
    height: 24.0 / 16.0,
    letterSpacing: 0.15,
    fontWeight: MdRefTypeface.weightMedium,
  );

  /// Token: md.sys.typescale.title-small
  static const TextStyle titleSmall = TextStyle(
    fontFamily: MdRefTypeface.plain,
    fontSize: 14.0,
    height: 20.0 / 14.0,
    letterSpacing: 0.1,
    fontWeight: MdRefTypeface.weightMedium,
  );

  /// Token: md.sys.typescale.label-large
  static const TextStyle labelLarge = TextStyle(
    fontFamily: MdRefTypeface.plain,
    fontSize: 14.0,
    height: 20.0 / 14.0,
    letterSpacing: 0.1,
    fontWeight: MdRefTypeface.weightMedium,
  );

  /// Token: md.sys.typescale.label-medium
  static const TextStyle labelMedium = TextStyle(
    fontFamily: MdRefTypeface.plain,
    fontSize: 12.0,
    height: 16.0 / 12.0,
    letterSpacing: 0.5,
    fontWeight: MdRefTypeface.weightMedium,
  );

  /// Token: md.sys.typescale.label-small
  static const TextStyle labelSmall = TextStyle(
    fontFamily: MdRefTypeface.plain,
    fontSize: 11.0,
    height: 16.0 / 11.0,
    letterSpacing: 0.5,
    fontWeight: MdRefTypeface.weightMedium,
  );

  /// Token: md.sys.typescale.body-large
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: MdRefTypeface.plain,
    fontSize: 16.0,
    height: 24.0 / 16.0,
    letterSpacing: 0.15,
    fontWeight: MdRefTypeface.weightRegular,
  );

  /// Token: md.sys.typescale.body-medium
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: MdRefTypeface.plain,
    fontSize: 14.0,
    height: 20.0 / 14.0,
    letterSpacing: 0.25,
    fontWeight: MdRefTypeface.weightRegular,
  );

  /// Token: md.sys.typescale.body-small
  static const TextStyle bodySmall = TextStyle(
    fontFamily: MdRefTypeface.plain,
    fontSize: 12.0,
    height: 16.0 / 12.0,
    letterSpacing: 0.4,
    fontWeight: MdRefTypeface.weightRegular,
  );

  /// Convert to Flutter TextTheme
  static TextTheme toTextTheme() {
    return const TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
    );
  }
}