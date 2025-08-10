// /// Spacing scale based on Material Design 3 specification.
// ///
// /// Reference: https://m3.material.io/foundations/layout/applying-layout
// library;

// /// Material 3 spacing system provides consistent spacing throughout the UI.
// /// 
// /// The spacing scale is based on a 4dp grid system that ensures
// /// visual consistency and alignment.
// abstract class M3SpacingScale {
//   /// No spacing.
//   static const double none = 0;

//   /// Extra small spacing - 4dp.
//   /// Used for minimal spacing between closely related elements.
//   static const double extraSmall = 4;

//   /// Small spacing - 8dp.
//   /// Used for spacing within components.
//   static const double small = 8;

//   /// Medium spacing - 12dp.
//   /// Used for moderate spacing between elements.
//   static const double medium = 12;

//   /// Large spacing - 16dp.
//   /// Used for spacing between different sections.
//   static const double large = 16;

//   /// Extra large spacing - 24dp.
//   /// Used for significant spacing and layout margins.
//   static const double extraLarge = 24;

//   /// Extra extra large spacing - 32dp.
//   /// Used for major layout sections and page margins.
//   static const double extraExtraLarge = 32;

//   /// Huge spacing - 48dp.
//   /// Used for large content separations.
//   static const double huge = 48;

//   /// Extra huge spacing - 64dp.
//   /// Used for maximum content separation.
//   static const double extraHuge = 64;
// }

// /// Semantic spacing tokens for common use cases.
// abstract class M3SpacingTokens {
//   /// Spacing for padding inside components.
//   static const double componentPadding = M3SpacingScale.small;

//   /// Spacing between related elements.
//   static const double relatedElements = M3SpacingScale.medium;

//   /// Spacing between unrelated elements.
//   static const double unrelatedElements = M3SpacingScale.large;

//   /// Spacing for page margins.
//   static const double pageMargin = M3SpacingScale.extraLarge;

//   /// Spacing for section separators.
//   static const double sectionSeparator = M3SpacingScale.extraExtraLarge;

//   /// Minimum touch target size (48dp).
//   static const double minTouchTarget = 48;

//   /// Recommended touch target size (48dp).
//   static const double touchTarget = 48;

//   /// Large touch target size for accessibility (56dp).
//   static const double largeTouchTarget = 56;
// }

// /// Grid system for Material 3 layouts.
// abstract class M3GridSystem {
//   /// Base grid unit (4dp).
//   static const double baseUnit = 4;

//   /// Number of columns in the grid system.
//   static const int maxColumns = 12;

//   /// Minimum column width.
//   static const double minColumnWidth = 56;

//   /// Maximum column width.
//   static const double maxColumnWidth = 72;

//   /// Gutter width between columns.
//   static const double gutterWidth = M3SpacingScale.extraLarge;

//   /// Margin width on the sides.
//   static const double marginWidth = M3SpacingScale.extraLarge;
// }

// /// Breakpoint system for responsive layouts.
// abstract class M3Breakpoints {
//   /// Extra small screens (phones in portrait).
//   static const double extraSmall = 600;

//   /// Small screens (phones in landscape, small tablets).
//   static const double small = 905;

//   /// Medium screens (tablets).
//   static const double medium = 1240;

//   /// Large screens (laptops).
//   static const double large = 1440;

//   /// Extra large screens (desktops).
//   static const double extraLarge = 1920;
// }

// /// Utility functions for working with spacing.
// abstract class M3SpacingUtils {
//   /// Calculates grid-based spacing.
//   /// 
//   /// [multiplier] - Number of grid units to multiply by.
//   static double gridSpacing(int multiplier) {
//     return M3GridSystem.baseUnit * multiplier;
//   }

//   /// Gets the appropriate spacing for a given screen width.
//   static double getResponsiveSpacing(double screenWidth) {
//     if (screenWidth < M3Breakpoints.extraSmall) {
//       return M3SpacingScale.medium;
//     } else if (screenWidth < M3Breakpoints.small) {
//       return M3SpacingScale.large;
//     } else if (screenWidth < M3Breakpoints.medium) {
//       return M3SpacingScale.extraLarge;
//     } else {
//       return M3SpacingScale.extraExtraLarge;
//     }
//   }

//   /// Gets the appropriate number of columns for a given screen width.
//   static int getResponsiveColumns(double screenWidth) {
//     if (screenWidth < M3Breakpoints.extraSmall) {
//       return 4;
//     } else if (screenWidth < M3Breakpoints.small) {
//       return 8;
//     } else {
//       return M3GridSystem.maxColumns;
//     }
//   }

//   /// Calculates the width of a single column based on screen width.
//   static double getColumnWidth(double screenWidth) {
//     final columns = getResponsiveColumns(screenWidth);
//     final totalGutters = (columns - 1) * M3GridSystem.gutterWidth;
//     final totalMargins = 2 * M3GridSystem.marginWidth;
//     final availableWidth = screenWidth - totalGutters - totalMargins;
//     return availableWidth / columns;
//   }

//   /// Validates that a value aligns with the grid system.
//   static bool isGridAligned(double value) {
//     return value % M3GridSystem.baseUnit == 0;
//   }

//   /// Rounds a value to the nearest grid unit.
//   static double snapToGrid(double value) {
//     return (value / M3GridSystem.baseUnit).round() * M3GridSystem.baseUnit;
//   }
// }