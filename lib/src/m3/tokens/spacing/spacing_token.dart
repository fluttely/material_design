part of '../../../../material_design.dart';

abstract final class M3Spacings {
  const M3Spacings._();

  /// No spacing (0dp).
  ///
  /// Used when you need to explicitly remove spacing or create tight layouts.
  static const double none = 0;

  /// 4dp spacing token.
  ///
  /// The smallest spacing unit in the Material Design grid system.
  /// Ideal for very tight component spacing or fine-tuning layouts.
  static const double space4 = 4;

  /// 8dp spacing token.
  ///
  /// Commonly used for small internal padding within components,
  /// such as button padding or small gaps between related elements.
  static const double space8 = 8;

  /// 12dp spacing token.
  ///
  /// Used for medium-tight spacing between related components
  /// or for internal padding in compact layouts.
  static const double space12 = 12;

  /// 16dp spacing token.
  ///
  /// The most commonly used spacing value in Material Design.
  /// Ideal for standard padding, margins, and gaps between components.
  /// This is the recommended baseline spacing for most use cases.
  static const double space16 = 16;

  /// 20dp spacing token.
  ///
  /// Used for slightly larger gaps between components or
  /// for padding in medium-density layouts.
  static const double space20 = 20;

  /// 24dp spacing token.
  ///
  /// Commonly used for container margins, section spacing,
  /// and padding in larger components like cards or dialogs.
  static const double space24 = 24;

  /// 28dp spacing token.
  ///
  /// Used for larger component spacing or when more visual
  /// separation is needed between interface elements.
  static const double space28 = 28;

  /// 32dp spacing token.
  ///
  /// Ideal for significant spacing between major sections,
  /// large component padding, or creating visual hierarchy.
  static const double space32 = 32;

  /// 36dp spacing token.
  ///
  /// Used for larger gaps between major interface sections
  /// or for padding in prominent components.
  static const double space36 = 36;

  /// 40dp spacing token.
  ///
  /// Suitable for large padding values, significant margins,
  /// or creating substantial visual separation.
  static const double space40 = 40;

  /// 48dp spacing token.
  ///
  /// Used for major layout spacing, large component margins,
  /// or creating clear visual divisions between content areas.
  static const double space48 = 48;

  /// 56dp spacing token.
  ///
  /// Ideal for substantial spacing between major layout sections
  /// or for padding in large containers and surfaces.
  static const double space56 = 56;

  /// 64dp spacing token.
  ///
  /// The largest spacing in the base scale. Used for maximum
  /// visual separation within standard layouts.
  static const double space64 = 64;

  /// 72dp spacing token.
  ///
  /// Extended scale spacing for larger layout requirements.
  /// Suitable for wide screens or when significant spacing is needed.
  static const double space72 = 72;

  /// 80dp spacing token.
  ///
  /// Large spacing for major layout divisions or when
  /// creating substantial visual breathing room.
  static const double space80 = 80;

  /// 96dp spacing token.
  ///
  /// Very large spacing for major sections in wide layouts
  /// or when maximum visual separation is required.
  static const double space96 = 96;

  /// 128dp spacing token.
  ///
  /// Maximum spacing token for the largest possible gaps
  /// in wide-screen layouts or special design requirements.
  static const double space128 = 128;

  /// Infinite spacing.
  ///
  /// Special case value representing unlimited space.
  /// Used in flexible layouts or when maximum available space is needed.
  static const double infinity = double.infinity;
}

abstract final class M3Margins {
  const M3Margins._();

  /// Margin for compact screen layouts (16dp).
  ///
  /// Optimal for phones in portrait mode and other compact interfaces.
  /// This smaller margin maximizes content area on constrained screens
  /// while maintaining sufficient breathing room.
  ///
  /// **Typical devices**: Phones in portrait orientation
  ///
  /// Reference: https://m3.material.io/foundations/layout/applying-layout/compact
  static const double compactScreen = 16;

  /// Margin for medium screen layouts (24dp).
  ///
  /// Ideal for phones in landscape mode and small tablets where more
  /// horizontal space allows for larger margins without compromising content.
  ///
  /// **Typical devices**: Phones in landscape, small tablets (iPad Mini)
  ///
  /// Reference: https://m3.material.io/foundations/layout/applying-layout/medium
  static const double mediumScreen = 24;

  /// Margin for expanded screen layouts (24dp).
  ///
  /// Suitable for large tablets and foldable devices in their expanded state,
  /// providing comfortable margins for multi-column or complex layouts.
  ///
  /// **Typical devices**: Large tablets, foldable devices (iPad Pro)
  ///
  /// Reference: https://m3.material.io/foundations/layout/applying-layout/expanded
  static const double expandedScreen = 24;

  /// Margin for large screen layouts (24dp).
  ///
  /// Designed for desktop and laptop screens where content width is
  /// often constrained to maintain readability despite large screen size.
  ///
  /// **Typical devices**: Desktop monitors, laptops
  ///
  /// Reference: https://m3.material.io/foundations/layout/applying-layout/large-extra-large
  static const double largeScreen = 24;

  /// Margin for extra-large screen layouts (24dp).
  ///
  /// Optimized for very large displays and ultra-wide monitors where
  /// consistent margins help maintain content focus and readability.
  ///
  /// **Typical devices**: Large monitors, ultra-wide displays
  ///
  /// Reference: https://m3.material.io/foundations/layout/applying-layout/large-extra-large
  static const double extraLargeScreen = 24;
}

abstract final class M3Spacers {
  const M3Spacers._();

  /// Standard spacer width between content panes (24dp).
  ///
  /// This value provides optimal visual separation between distinct content
  /// areas in multi-pane layouts such as master-detail views, navigation
  /// panels, or side-by-side content areas.
  ///
  /// The 24dp spacing ensures clear content boundaries while maintaining
  /// visual cohesion across the interface. It's particularly effective in
  /// responsive layouts where content relationships need to be preserved
  /// across different screen sizes.
  ///
  /// **Common use cases**:
  /// - Split-view layouts
  /// - Master-detail interfaces
  /// - Navigation panel separation
  /// - Multi-column content areas
  static const double pane = 24;
}

/// Contract for Material Design 3 spacing tokens.
@immutable
abstract interface class IM3SpacingToken implements IM3Token<double> {}

/// Material Design 3 spacing tokens based on a 4dp grid system.
///
/// This enum provides a comprehensive set of pre-defined, Material 3-compliant
/// spacing values based on a 4dp grid. Using these tokens ensures consistent
/// and rhythmic spacing throughout the UI, following the official Material
/// Design 3 spacing guidelines.
///
/// Each token represents a specific spacing value in density-independent
/// pixels (dp). The system is designed around 4dp increments for optimal
/// visual rhythm and consistency across different screen densities and
/// accessibility requirements.
///
/// ## Design Philosophy
///
/// The Material Design 3 spacing system is built on these principles:
/// - **Consistent rhythm**: 4dp base unit creates predictable patterns
/// - **Semantic naming**: Token names reflect size and common use cases
/// - **Scalable hierarchy**: Progressive spacing supports visual hierarchy
/// - **Accessibility ready**: Spacing meets touch target and readability standards
/// - **Cross-platform consistency**: Works across mobile, tablet, and desktop
///
/// ## Spacing Categories
///
/// ### Micro Spacing (4dp-12dp)
/// Fine-tuned spacing for component internal padding and tight layouts:
/// - `space4`: Minimal spacing, icon padding
/// - `space8`: Small component padding, button internals
/// - `space12`: Compact list item spacing, form element gaps
///
/// ### Standard Spacing (16dp-24dp)
/// Primary spacing for most interface components:
/// - `space16`: **Most common** - standard padding and margins
/// - `space20`: Medium spacing for related content groups
/// - `space24`: Large component margins, section spacing
///
/// ### Macro Spacing (28dp-64dp)
/// Larger spacing for layout structure and visual separation:
/// - `space28-40`: Major component spacing, feature separation
/// - `space48-64`: Layout section spacing, content area margins
///
/// ### Extended Spacing (72dp-128dp)
/// Wide-screen and desktop layout spacing:
/// - `space72-96`: Large screen content margins
/// - `space128`: Maximum spacing for wide layouts
///
/// ## Usage Examples
///
/// ```dart
/// // Basic spacing
/// double spacing = M3SpacingToken.space16.value; // 16.0
///
/// // Component padding
/// Padding(
///   padding: EdgeInsets.all(M3SpacingToken.space16.value),
///   child: Text('Content'),
/// )
///
/// // Layout margins
/// Container(
///   margin: EdgeInsets.symmetric(
///     horizontal: M3SpacingToken.space24.value,
///     vertical: M3SpacingToken.space16.value,
///   ),
/// )
///
/// // With Material Design 3 utilities
/// M3Padding(
///   padding: M3EdgeInsets.all(M3SpacingToken.space16),
///   child: content,
/// )
///
/// // Gap widgets
/// Column(
///   children: [
///     widget1,
///     M3Gap(M3SpacingToken.space12),
///     widget2,
///   ],
/// )
/// ```
///
/// ## Responsive Considerations
///
/// Different spacing may be appropriate for different screen sizes:
/// ```dart
/// // Responsive spacing selection
/// final spacing = screenWidth > 600
///     ? M3SpacingToken.space24  // Tablet/desktop
///     : M3SpacingToken.space16; // Mobile
/// ```
///
/// ## Best Practices
///
/// 1. **Start with space16** - Most common spacing value
/// 2. **Use semantic tokens** - Choose based on content relationship
/// 3. **Maintain rhythm** - Stick to 4dp multiples
/// 4. **Consider accessibility** - Ensure adequate touch targets
/// 5. **Test across devices** - Verify spacing works on different screens
///
/// Reference: https://m3.material.io/foundations/layout/understanding-layout
/// /spacing
enum M3SpacingToken implements IM3SpacingToken {
  /// No spacing (0dp).
  ///
  /// Used when you need to explicitly remove spacing or create tight layouts.
  none(M3Spacings.none),

  /// 4dp spacing token.
  ///
  /// The smallest spacing unit in the Material Design grid system.
  /// Ideal for very tight component spacing or fine-tuning layouts.
  space4(M3Spacings.space4),

  /// 8dp spacing token.
  ///
  /// Commonly used for small internal padding within components,
  /// such as button padding or small gaps between related elements.
  space8(M3Spacings.space8),

  /// 12dp spacing token.
  ///
  /// Used for medium-tight spacing between related components
  /// or for internal padding in compact layouts.
  space12(M3Spacings.space12),

  /// 16dp spacing token.
  ///
  /// The most commonly used spacing value in Material Design.
  /// Ideal for standard padding, margins, and gaps between components.
  /// This is the recommended baseline spacing for most use cases.
  space16(M3Spacings.space16),

  /// 20dp spacing token.
  ///
  /// Used for slightly larger gaps between components or
  /// for padding in medium-density layouts.
  space20(M3Spacings.space20),

  /// 24dp spacing token.
  ///
  /// Commonly used for container margins, section spacing,
  /// and padding in larger components like cards or dialogs.
  space24(M3Spacings.space24),

  /// 28dp spacing token.
  ///
  /// Used for larger component spacing or when more visual
  /// separation is needed between interface elements.
  space28(M3Spacings.space28),

  /// 32dp spacing token.
  ///
  /// Ideal for significant spacing between major sections,
  /// large component padding, or creating visual hierarchy.
  space32(M3Spacings.space32),

  /// 36dp spacing token.
  ///
  /// Used for larger gaps between major interface sections
  /// or for padding in prominent components.
  space36(M3Spacings.space36),

  /// 40dp spacing token.
  ///
  /// Suitable for large padding values, significant margins,
  /// or creating substantial visual separation.
  space40(M3Spacings.space40),

  /// 48dp spacing token.
  ///
  /// Used for major layout spacing, large component margins,
  /// or creating clear visual divisions between content areas.
  space48(M3Spacings.space48),

  /// 56dp spacing token.
  ///
  /// Ideal for substantial spacing between major layout sections
  /// or for padding in large containers and surfaces.
  space56(M3Spacings.space56),

  /// 64dp spacing token.
  ///
  /// The largest spacing in the base scale. Used for maximum
  /// visual separation within standard layouts.
  space64(M3Spacings.space64),

  /// 72dp spacing token.
  ///
  /// Extended scale spacing for larger layout requirements.
  /// Suitable for wide screens or when significant spacing is needed.
  space72(M3Spacings.space72),

  /// 80dp spacing token.
  ///
  /// Large spacing for major layout divisions or when
  /// creating substantial visual breathing room.
  space80(M3Spacings.space80),

  /// 96dp spacing token.
  ///
  /// Very large spacing for major sections in wide layouts
  /// or when maximum visual separation is required.
  space96(M3Spacings.space96),

  /// 128dp spacing token.
  ///
  /// Maximum spacing token for the largest possible gaps
  /// in wide-screen layouts or special design requirements.
  space128(M3Spacings.space128),

  /// Infinite spacing.
  ///
  /// Special case value representing unlimited space.
  /// Used in flexible layouts or when maximum available space is needed.
  infinity(M3Spacings.infinity);

  /// Creates a spacing token with the specified value.
  const M3SpacingToken(this.value);

  /// The spacing value in density-independent pixels (dp).
  @override
  final double value;
}

/// Material Design 3 margin tokens for responsive screen layouts.
///
/// This enum provides semantic margin values for different screen sizes,
/// representing the space between the edge of a window or screen and the
/// content within it. These values are specifically designed to optimize
/// readability and usability across various device sizes.
///
/// The margin values are based on Material Design 3's responsive layout
/// guidelines and window size classes, ensuring optimal content presentation
/// across different screen configurations.
///
/// ## Usage
///
/// ```dart
/// // Get margin for current screen size
/// double margin = M3MarginToken.compactScreen.value; // 16.0
///
/// // Use with responsive design
/// M3EdgeInsets.symmetric(
///   horizontal: M3MarginToken.mediumScreen.value,
/// )
/// ```
///
/// ## Screen Size Guidelines
///
/// - **Compact (0-599dp)**: Phones in portrait - 16dp margin
/// - **Medium (600-839dp)**: Phones in landscape, small tablets - 24dp margin
/// - **Expanded (840-1199dp)**: Large tablets, foldables - 24dp margin
/// - **Large (1200-1599dp)**: Desktop screens - 24dp margin
/// - **Extra Large (1600dp+)**: Large monitors - 24dp margin
///
/// Reference: https://m3.material.io/foundations/layout/applying-layout/pane-layouts
enum M3MarginToken implements IM3SpacingToken {
  /// Margin for compact screen layouts (16dp).
  ///
  /// Optimal for phones in portrait mode and other compact interfaces.
  /// This smaller margin maximizes content area on constrained screens
  /// while maintaining sufficient breathing room.
  ///
  /// **Typical devices**: Phones in portrait orientation
  ///
  /// Reference: https://m3.material.io/foundations/layout/applying-layout/compact
  compactScreen(M3Margins.compactScreen),

  /// Margin for medium screen layouts (24dp).
  ///
  /// Ideal for phones in landscape mode and small tablets where more
  /// horizontal space allows for larger margins without compromising content.
  ///
  /// **Typical devices**: Phones in landscape, small tablets (iPad Mini)
  ///
  /// Reference: https://m3.material.io/foundations/layout/applying-layout/medium
  mediumScreen(M3Margins.mediumScreen),

  /// Margin for expanded screen layouts (24dp).
  ///
  /// Suitable for large tablets and foldable devices in their expanded state,
  /// providing comfortable margins for multi-column or complex layouts.
  ///
  /// **Typical devices**: Large tablets, foldable devices (iPad Pro)
  ///
  /// Reference: https://m3.material.io/foundations/layout/applying-layout/expanded
  expandedScreen(M3Margins.expandedScreen),

  /// Margin for large screen layouts (24dp).
  ///
  /// Designed for desktop and laptop screens where content width is
  /// often constrained to maintain readability despite large screen size.
  ///
  /// **Typical devices**: Desktop monitors, laptops
  ///
  /// Reference: https://m3.material.io/foundations/layout/applying-layout/large-extra-large
  largeScreen(M3Margins.largeScreen),

  /// Margin for extra-large screen layouts (24dp).
  ///
  /// Optimized for very large displays and ultra-wide monitors where
  /// consistent margins help maintain content focus and readability.
  ///
  /// **Typical devices**: Large monitors, ultra-wide displays
  ///
  /// Reference: https://m3.material.io/foundations/layout/applying-layout/large-extra-large
  extraLargeScreen(M3Margins.extraLargeScreen);

  /// Creates a margin token with the specified value.
  const M3MarginToken(this.value);

  /// The margin value in density-independent pixels (dp).
  @override
  final double value;
}

/// Material Design 3 spacer tokens for layout pane separation.
///
/// This enum provides standardized spacing values for separating distinct
/// regions of content in multi-pane layouts, such as split-view interfaces,
/// navigation panels, and content areas.
///
/// Spacers create visual and functional separation between different content
/// areas, helping users distinguish between primary and secondary content
/// or different functional regions of the interface.
///
/// ## Usage
///
/// ```dart
/// // Create spacing between panes
/// double spacing = M3SpacerToken.pane; // 24.0
///
/// // Use in split layouts
/// Row(
///   children: [
///     Expanded(child: primaryContent),
///     const M3Gap(M3SpacerToken.pane),
///     Expanded(child: secondaryContent),
///   ],
/// )
/// ```
///
/// ## Design Guidelines
///
/// Spacers should provide sufficient visual separation while maintaining
/// content relationship. The 24dp pane spacer is optimized for most
/// multi-pane layouts and responsive design scenarios.
///
/// Reference: https://m3.material.io/foundations/layout/understanding-layout/spacing
enum M3SpacerToken implements IM3SpacingToken {
  /// Standard spacer width between content panes (24dp).
  ///
  /// This value provides optimal visual separation between distinct content
  /// areas in multi-pane layouts such as master-detail views, navigation
  /// panels, or side-by-side content areas.
  ///
  /// The 24dp spacing ensures clear content boundaries while maintaining
  /// visual cohesion across the interface. It's particularly effective in
  /// responsive layouts where content relationships need to be preserved
  /// across different screen sizes.
  ///
  /// **Common use cases**:
  /// - Split-view layouts
  /// - Master-detail interfaces
  /// - Navigation panel separation
  /// - Multi-column content areas
  pane(M3Spacers.pane);

  /// Creates a spacer token with the specified value.
  const M3SpacerToken(this.value);

  /// The spacer value in density-independent pixels (dp).
  @override
  final double value;
}
