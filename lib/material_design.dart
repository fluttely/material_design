/// A comprehensive toolkit for implementing Material Design 3 in Flutter.
///
/// This library provides a complete design token system and utilities that
/// align
/// with the official Material Design 3 specification, making it easier to build
/// beautiful and consistent user interfaces.
///
/// ## Design Token System
///
/// The library implements the Material Design 3 token hierarchy:
/// - **Reference tokens**: Raw values (colors, numbers, strings)
/// - **System tokens**: Semantic tokens derived from reference tokens
/// - **Component tokens**: Component-specific tokens derived from system tokens
///
/// ## Usage
///
/// Import this file to access the complete Material Design 3 system:
/// ```dart
/// import 'package:material_design/material_design.dart';
///
/// // Create reference tokens
/// const primaryRef = ReferenceToken<Color>(
///   Color(0xFF6750A4),
///   'purple.40'
/// );
///
/// // Create system tokens
/// const primaryColor = SystemToken<Color>(
///   Color(0xFF6750A4),
///   'color.primary',
///   referenceToken: primaryRef,
/// );
///
/// // Create component tokens
/// const buttonBackground = ComponentToken<Color>(
///   Color(0xFF6750A4),
///   'button.filled.background',
///   systemToken: primaryColor,
///   component: 'Button',
/// );
/// ```
library;

// Foundations
export 'src/foundations/accessibility.dart';
export 'src/foundations/adaptive.dart';
export 'src/foundations/design_tokens.dart';
export 'src/styles/elevation/elevation_system.dart';
export 'src/styles/motion/duration.dart';
export 'src/styles/motion/easing.dart';
export 'src/styles/shape/shape_system.dart';
