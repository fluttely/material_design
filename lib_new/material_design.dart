/// A comprehensive toolkit for implementing Material Design 3 in Flutter.
///
/// This library provides a complete implementation of the Material Design 3
/// specification, including design tokens, component specifications, practical
/// widgets, theme builders, and utility functions.
///
/// ## Design System Architecture
///
/// The library is organized into three main modules:
///
/// ### Design (`src/design/`)
/// Contains the official Material 3 specifications:
/// - **sys/**: Foundation system (colors, typography, motion, shapes, elevation, spacing)
/// - **ref/**: Reference tokens and palettes
/// - **comp/**: Component specifications
///
/// ### Toolkit (`src/toolkit/`)
/// Contains practical Flutter implementations:
/// - **widgets/**: Ready-to-use M3 widgets
/// - **builders/**: Theme and component builders
/// - **painters/**: Custom painters for M3 effects
///
/// ### Helpers (`src/helpers/`)
/// Contains utilities and extensions:
/// - **utils/**: Utility functions
/// - **extensions/**: Dart extensions
/// - **converters/**: Design-to-Flutter converters
///
/// ## Usage
///
/// ```dart
/// import 'package:material_design/material_design.dart';
///
/// // Use M3 theme builder
/// MaterialApp(
///   theme: M3ThemeBuilder.lightTheme(seedColor: Colors.blue),
///   darkTheme: M3ThemeBuilder.darkTheme(seedColor: Colors.blue),
///   // ...
/// )
///
/// // Use M3 widgets
/// M3ElevatedButton(
///   onPressed: () {},
///   child: Text('Click me'),
/// )
///
/// // Use M3 design tokens
/// Container(
///   decoration: BoxDecoration(
///     color: M3TonalPalettes.primary.tone40,
///     borderRadius: BorderRadius.circular(M3ShapeScale.medium),
///   ),
///   padding: EdgeInsets.all(M3SpacingScale.large),
///   child: Text(
///     'Hello World',
///     style: TextStyle(
///       fontSize: M3TypeScale.bodyLarge.fontSize,
///       fontWeight: M3TypeScale.bodyLarge.fontWeight,
///     ),
///   ),
/// )
/// ```
library;

// Design System - Foundation (sys/)
export 'src/design/sys/sys.dart';

// Design System - Reference (ref/)
export 'src/design/ref/ref.dart';

// Design System - Components (comp/)
export 'src/design/comp/comp.dart';

// Toolkit - Widgets
export 'src/toolkit/widgets/widgets.dart';

// Toolkit - Builders
export 'src/toolkit/builders/builders.dart';

// Toolkit - Painters
export 'src/toolkit/painters/painters.dart';

// Helpers - Utilities
export 'src/helpers/utils/utils.dart';

// Helpers - Extensions
export 'src/helpers/extensions/extensions.dart';

// Helpers - Converters
export 'src/helpers/converters/converters.dart';
