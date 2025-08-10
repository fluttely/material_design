// /// Spacing scale based on Material Design 3 specification.
// ///
// /// Material Design 3 uses a 4dp baseline grid for spacing.
// /// Reference: https://m3.material.io/foundations/layout/applying-layout
// library;

// /// Material 3 spacing system provides consistent spacing throughout the UI.
// ///
// /// The spacing scale is based on a 4dp baseline grid system that ensures
// /// visual consistency and alignment. While M3 doesn't prescribe specific
// /// spacing tokens, it recommends using multiples of 4dp.
// abstract class M3SpacingScale {
//   /// Base unit for the grid system (4dp).
//   static const double baseUnit = 4;

//   /// No spacing.
//   static const double space0 = 0;

//   /// 4dp spacing - Minimal spacing.
//   static const double space4 = 4;

//   /// 8dp spacing - Tight spacing between related elements.
//   static const double space8 = 8;

//   /// 12dp spacing - Small spacing.
//   static const double space12 = 12;

//   /// 16dp spacing - Default spacing for margins and padding.
//   static const double space16 = 16;

//   /// 20dp spacing - Medium spacing.
//   static const double space20 = 20;

//   /// 24dp spacing - Large spacing between sections.
//   static const double space24 = 24;

//   /// 28dp spacing.
//   static const double space28 = 28;

//   /// 32dp spacing - Extra large spacing.
//   static const double space32 = 32;

//   /// 36dp spacing.
//   static const double space36 = 36;

//   /// 40dp spacing.
//   static const double space40 = 40;

//   /// 48dp spacing - Very large spacing.
//   static const double space48 = 48;

//   /// 56dp spacing.
//   static const double space56 = 56;

//   /// 64dp spacing - Maximum spacing for major sections.
//   static const double space64 = 64;

//   /// 72dp spacing - Used for content left margin in some layouts.
//   static const double space72 = 72;

//   /// 80dp spacing - Used for content left margin in larger screens.
//   static const double space80 = 80;
// }

// /// Layout margins based on Material Design 3 guidelines.
// /// These values are derived from the canonical layouts and responsive design principles.
// abstract class M3Margins {
//   /// Compact screens (phones) - 16dp
//   static const double compact = 16;

//   /// Medium screens (tablets) - 24dp
//   static const double medium = 24;

//   /// Expanded screens (desktops) - 24dp minimum, can go up to 200dp
//   static const double expanded = 24;

//   /// Content left margin from screen edge - varies by screen size
//   static const double contentLeftCompact = 72;
//   static const double contentLeftMedium = 80;
//   static const double contentLeftExpanded = 80;

//   /// Get appropriate margin based on screen width
//   static double getMargin(double screenWidth) {
//     if (screenWidth < M3WindowSizeClass.compactMax) {
//       return compact;
//     } else if (screenWidth < M3WindowSizeClass.mediumMax) {
//       return medium;
//     } else {
//       return expanded;
//     }
//   }
// }

// /// Touch target sizes based on Material Design accessibility guidelines.
// abstract class M3TouchTargets {
//   /// Minimum touch target size (48dp x 48dp).
//   /// Material Design requires at least 48x48dp for touch targets.
//   static const double minimum = 48;

//   /// Recommended touch target size (48dp).
//   static const double standard = 48;

//   /// Large touch target size for improved accessibility (56dp).
//   static const double large = 56;

//   /// Minimum spacing between touch targets (8dp).
//   static const double minSpacing = 8;
// }

// /// Window size classes based on Material Design 3 adaptive design.
// /// These replace the old breakpoint system with a more flexible approach.
// abstract class M3WindowSizeClass {
//   /// Compact width: 0-599dp (phones in portrait)
//   static const double compactMin = 0;
//   static const double compactMax = 599;

//   /// Medium width: 600-839dp (tablets, foldables)
//   static const double mediumMin = 600;
//   static const double mediumMax = 839;

//   /// Expanded width: 840dp+ (tablets in landscape, desktops)
//   static const double expandedMin = 840;

//   /// Get window size class for a given width
//   static WindowSizeClass getWindowSizeClass(double width) {
//     if (width < mediumMin) {
//       return WindowSizeClass.compact;
//     } else if (width < expandedMin) {
//       return WindowSizeClass.medium;
//     } else {
//       return WindowSizeClass.expanded;
//     }
//   }
// }

// /// Window size class enum
// enum WindowSizeClass {
//   compact,
//   medium,
//   expanded,
// }

// /// Column system for Material Design 3 layouts.
// /// The number of columns varies based on window size class.
// abstract class M3ColumnSystem {
//   /// Compact screens use 4 columns
//   static const int compactColumns = 4;

//   /// Medium screens use 8 columns
//   static const int mediumColumns = 8;

//   /// Expanded screens use 12 columns
//   static const int expandedColumns = 12;

//   /// Get number of columns based on window size class
//   static int getColumns(WindowSizeClass sizeClass) {
//     switch (sizeClass) {
//       case WindowSizeClass.compact:
//         return compactColumns;
//       case WindowSizeClass.medium:
//         return mediumColumns;
//       case WindowSizeClass.expanded:
//         return expandedColumns;
//     }
//   }

//   /// Get number of columns based on screen width
//   static int getColumnsByWidth(double width) {
//     final sizeClass = M3WindowSizeClass.getWindowSizeClass(width);
//     return getColumns(sizeClass);
//   }
// }

// /// Gutter widths for different screen sizes
// abstract class M3Gutters {
//   /// Compact screens: 16dp gutters
//   static const double compact = 16;

//   /// Medium screens: 24dp gutters
//   static const double medium = 24;

//   /// Expanded screens: 24dp gutters
//   static const double expanded = 24;

//   /// Get gutter width based on window size class
//   static double getGutter(WindowSizeClass sizeClass) {
//     switch (sizeClass) {
//       case WindowSizeClass.compact:
//         return compact;
//       case WindowSizeClass.medium:
//         return medium;
//       case WindowSizeClass.expanded:
//         return expanded;
//     }
//   }
// }

// /// Utility functions for working with Material 3 spacing and layout.
// abstract class M3SpacingUtils {
//   /// Calculates grid-based spacing.
//   ///
//   /// [multiplier] - Number of grid units to multiply by.
//   /// Returns a value that aligns to the 4dp grid.
//   static double gridSpacing(int multiplier) {
//     return M3SpacingScale.baseUnit * multiplier;
//   }

//   /// Gets the appropriate margin for a given screen width.
//   static double getResponsiveMargin(double screenWidth) {
//     return M3Margins.getMargin(screenWidth);
//   }

//   /// Gets the appropriate gutter width for a given screen width.
//   static double getResponsiveGutter(double screenWidth) {
//     final sizeClass = M3WindowSizeClass.getWindowSizeClass(screenWidth);
//     return M3Gutters.getGutter(sizeClass);
//   }

//   /// Calculates the width of content area after accounting for margins.
//   static double getContentWidth(double screenWidth) {
//     final margin = getResponsiveMargin(screenWidth);
//     return screenWidth - (2 * margin);
//   }

//   /// Calculates the width of a single column based on screen width.
//   static double getColumnWidth(double screenWidth) {
//     final sizeClass = M3WindowSizeClass.getWindowSizeClass(screenWidth);
//     final columns = M3ColumnSystem.getColumns(sizeClass);
//     final gutter = M3Gutters.getGutter(sizeClass);
//     final margin = M3Margins.getMargin(screenWidth);

//     final totalGutters = (columns - 1) * gutter;
//     final totalMargins = 2 * margin;
//     final availableWidth = screenWidth - totalGutters - totalMargins;

//     return availableWidth / columns;
//   }

//   /// Validates that a value aligns with the 4dp grid system.
//   static bool isGridAligned(double value) {
//     return value % M3SpacingScale.baseUnit == 0;
//   }

//   /// Rounds a value to the nearest 4dp grid unit.
//   static double snapToGrid(double value) {
//     return (value / M3SpacingScale.baseUnit).round() * M3SpacingScale.baseUnit;
//   }

//   /// Gets appropriate spacing based on relationship between elements.
//   static double getRelationalSpacing(ElementRelationship relationship) {
//     switch (relationship) {
//       case ElementRelationship.related:
//         return M3SpacingScale.space8;
//       case ElementRelationship.slightlyRelated:
//         return M3SpacingScale.space16;
//       case ElementRelationship.unrelated:
//         return M3SpacingScale.space24;
//       case ElementRelationship.sections:
//         return M3SpacingScale.space32;
//     }
//   }
// }

// /// Relationship between UI elements
// enum ElementRelationship {
//   /// Elements that are closely related (e.g., icon and label)
//   related,

//   /// Elements that are somewhat related (e.g., items in a list)
//   slightlyRelated,

//   /// Elements that are unrelated (e.g., different content sections)
//   unrelated,

//   /// Major sections of the layout
//   sections,
// }

// /// Semantic spacing tokens for common use cases.
// /// These provide meaningful names for spacing values.
// abstract class M3SpacingTokens {
//   /// No spacing
//   static const double none = M3SpacingScale.space0;

//   /// Spacing between icon and text (8dp)
//   static const double iconTextGap = M3SpacingScale.space8;

//   /// Internal padding for components (12dp)
//   static const double componentPaddingSmall = M3SpacingScale.space12;

//   /// Standard internal padding for components (16dp)
//   static const double componentPadding = M3SpacingScale.space16;

//   /// Spacing between list items (8dp)
//   static const double listItemGap = M3SpacingScale.space8;

//   /// Spacing between cards or tiles (16dp)
//   static const double cardGap = M3SpacingScale.space16;

//   /// Section spacing (24dp)
//   static const double sectionGap = M3SpacingScale.space24;

//   /// Page padding on mobile (16dp)
//   static const double pagePaddingMobile = M3SpacingScale.space16;

//   /// Page padding on tablet (24dp)
//   static const double pagePaddingTablet = M3SpacingScale.space24;

//   /// Content area left margin (72dp)
//   static const double contentAreaMargin = M3SpacingScale.space72;
// }

// /// Adaptive layout utilities
// abstract class M3AdaptiveLayout {
//   /// Determines if the current layout should use a single pane
//   static bool isSinglePane(double width) {
//     return width < M3WindowSizeClass.mediumMin;
//   }

//   /// Determines if the current layout can use two panes
//   static bool canUseTwoPane(double width, double height) {
//     // Two pane is suitable for medium+ width and when height is not compact
//     return width >= M3WindowSizeClass.mediumMin && height > 480;
//   }

//   /// Gets the recommended layout type based on screen dimensions
//   static LayoutType getLayoutType(double width, double height) {
//     if (width < M3WindowSizeClass.mediumMin) {
//       return LayoutType.singlePane;
//     } else if (width < M3WindowSizeClass.expandedMin) {
//       // For medium screens, check if height allows for two pane
//       return height > 480 ? LayoutType.twoPane : LayoutType.singlePane;
//     } else {
//       return LayoutType.twoPane;
//     }
//   }
// }

// /// Layout types for adaptive design
// enum LayoutType {
//   singlePane,
//   twoPane,
// }
