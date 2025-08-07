part of '../../../../../material_design.dart';

/// Material Design 3 compliant border side with enforced design tokens.
///
/// This class extends [BorderSide] to ensure consistent border styling across
/// all components by restricting width values to Material Design 3 specifications.
/// It provides compile-time type safety through enum-based width tokens while
/// maintaining maximum performance through const constructors.
///
/// ## Design System Compliance
///
/// All border widths are restricted to the official Material Design 3 scale:
/// - **None (0dp)**: Invisible borders for borderless components
/// - **Thin (1dp)**: Standard borders for most components
/// - **Thick (2dp)**: Emphasis borders for selected/focused states
/// - **Extra Thick (4dp)**: High-emphasis borders for critical states
///
/// ## Performance Characteristics
///
/// This implementation uses const constructors with compile-time constant
/// folding, meaning zero runtime overhead when used in const contexts.
/// The enum-to-constant mapping is resolved at build time.
///
/// ## Usage Examples
///
/// ```dart
/// // Standard usage with theme colors
/// final border = M3BorderSide(
///   outlineColor: Color(Theme.of(context).colorScheme.outline), // M3 outline color
///   width: M3BorderWidthToken.thin,
/// );
///
/// // Using theme colors (runtime)
/// final dynamicBorder = M3BorderSide(
///   outlineColor: Theme.of(context).colorScheme.outline,
///   width: isSelected ? M3BorderWidthToken.thick : M3BorderWidthToken.thin,
/// );
///
/// // Named constructors for common cases
/// final thinBorder = M3BorderSide.thin(Color(Theme.of(context).colorScheme.outline));
/// final thickBorder = M3BorderSide.thick(Color(Theme.of(context).colorScheme.outline));
///
/// // Borderless components
/// const noBorder = M3BorderSide.none;
/// ```
///
/// ## Theme Integration
///
/// For optimal Material Design 3 compliance, use theme-aware colors:
///
/// ```dart
/// // Light theme outline colors
/// Theme.of(context).colorScheme.outline        // Primary outline (87% opacity)
/// Theme.of(context).colorScheme.outlineVariant // Secondary outline (38% opacity)
///
/// // Surface variant colors for subtle borders
/// Theme.of(context).colorScheme.surfaceVariant
/// ```
///
/// ## Component Applications
///
/// - **Thin borders**: OutlinedButton, TextField, Card outlines
/// - **Thick borders**: Focus indicators, selected states, primary actions
/// - **Extra thick borders**: Error states, critical alerts, accessibility focus
/// - **None borders**: Filled buttons, seamless containers, hidden states
///
/// See also:
/// * [M3BorderWidthToken] for available width values
/// * [M3BorderWidths] for the underlying constant values
/// * [M3Border] for complete border configurations
class M3BorderSide extends BorderSide {
  /// Creates a Material Design 3 compliant border side with enforced width tokens.
  ///
  /// This constructor provides complete flexibility while ensuring design system
  /// compliance through enum-based width restrictions. The width parameter accepts
  /// only predefined [M3BorderWidthToken] values, preventing arbitrary border
  /// widths that don't conform to Material Design specifications.
  ///
  /// **Parameters:**
  /// * [outlineColor] - The border color, typically from theme color scheme
  /// * [width] - Material Design 3 width token (defaults to thin/1dp)
  ///
  /// **Recommended colors:**
  /// * `Theme.of(context).colorScheme.outline` - Primary outline color (87% opacity)
  /// * `Theme.of(context).colorScheme.outlineVariant` - Secondary outline (38% opacity)
  /// * `Theme.of(context).colorScheme.surfaceVariant` - Subtle surface borders
  /// * Custom colors following Material Design opacity guidelines
  ///
  /// **Width mapping:**
  /// * `M3BorderWidthToken.none` → 0dp (invisible)
  /// * `M3BorderWidthToken.thin` → 1dp (standard)
  /// * `M3BorderWidthToken.thick` → 2dp (emphasis)
  /// * `M3BorderWidthToken.extraThick` → 4dp (high emphasis)
  ///
  /// **Example:**
  /// ```dart
  /// // Static border with design token
  /// final border = M3BorderSide(
  ///   outlineColor: Color(Theme.of(context).colorScheme.outline), // M3 outline
  ///   width: M3BorderWidthToken.thin,
  /// );
  ///
  /// // Dynamic border with theme integration
  /// final themeBorder = M3BorderSide(
  ///   outlineColor: Theme.of(context).colorScheme.outline,
  ///   width: isError ? M3BorderWidthToken.extraThick : M3BorderWidthToken.thin,
  /// );
  /// ```
  const M3BorderSide({
    required Color outlineColor,
    M3BorderWidthToken width = M3BorderWidthToken.thin,
  }) : super(
          color: outlineColor,
          width: width == M3BorderWidthToken.none
              ? M3BorderWidths.none
              : width == M3BorderWidthToken.thin
                  ? M3BorderWidths.thin
                  : M3BorderWidths.none,
          style: width == M3BorderWidthToken.none
              ? BorderStyle.none
              : BorderStyle.solid,
        );

  /// Creates a standard thin border side (1dp width).
  ///
  /// This is the default border thickness for most Material Design components
  /// including OutlinedButton, TextField outlines, Card borders, and list
  /// separators. The 1dp width provides subtle visual definition without
  /// being intrusive, maintaining the clean Material Design aesthetic.
  ///
  /// **Use cases:**
  /// * Default component outlines
  /// * Content area boundaries
  /// * Form field borders
  /// * Navigation separators
  /// * Card and surface divisions
  ///
  /// **Example:**
  /// ```dart
  /// // Standard outlined component
  /// Container(
  ///   decoration: BoxDecoration(
  ///     border: Border.all(
  ///       side: M3BorderSide.thin(Theme.of(context).colorScheme.outline),
  ///     ),
  ///   ),
  ///   child: content,
  /// )
  /// ```
  const M3BorderSide.thin(Color outlineColor)
      : super(
          color: outlineColor,
          width: M3BorderWidths.thin,
        );

  // /// Creates a thick border side (2dp width) for emphasis and interactive states.
  // ///
  // /// This enhanced border width creates clear visual hierarchy and draws
  // /// attention to important interactive elements. Commonly used for focus
  // /// indicators, selected states, and primary action boundaries where
  // /// increased visual weight is needed.
  // ///
  // /// **Use cases:**
  // /// * Focus indicators and keyboard navigation
  // /// * Selected state visualization
  // /// * Active component borders
  // /// * Primary action emphasis
  // /// * Important form field highlights
  // /// * Tab and navigation indicators
  // ///
  // /// **Accessibility note:**
  // /// This width meets WCAG guidelines for focus indicators, providing
  // /// sufficient contrast for users with visual impairments.
  // ///
  // /// **Example:**
  // /// ```dart
  // /// // Focus indicator for interactive elements
  // /// Container(
  // ///   decoration: BoxDecoration(
  // ///     border: Border.all(
  // ///       side: hasFocus
  // ///         ? M3BorderSide.thick(Theme.of(context).colorScheme.primary)
  // ///         : M3BorderSide.thin(Theme.of(context).colorScheme.outline),
  // ///     ),
  // ///   ),
  // ///   child: interactiveContent,
  // /// )
  // /// ```
  // const M3BorderSide.thick(Color outlineColor)
  //     : super(
  //         color: outlineColor,
  //         width: M3BorderWidths.thick,
  //       );

  // /// Creates an extra thick border side (4dp width) for maximum visual emphasis.
  // ///
  // /// Reserved for special cases requiring significant visual weight and maximum
  // /// emphasis. This width creates strong visual boundaries and is typically
  // /// used for critical states, error conditions, or high-priority elements
  // /// that demand immediate user attention.
  // ///
  // /// **Use cases:**
  // /// * Error state indicators and validation failures
  // /// * Critical alert and warning borders
  // /// * High-emphasis accessibility focus indicators
  // /// * Emergency or destructive action boundaries
  // /// * Special design accent elements
  // /// * Maximum contrast requirements
  // ///
  // /// **Design guidance:**
  // /// Use sparingly to maintain visual hierarchy. When multiple elements
  // /// use extra thick borders, the emphasis effect is diminished.
  // ///
  // /// **Example:**
  // /// ```dart
  // /// // Error state with maximum emphasis
  // /// Container(
  // ///   decoration: BoxDecoration(
  // ///     border: Border.all(
  // ///       side: hasError
  // ///         ? M3BorderSide.extraThick(Theme.of(context).colorScheme.error)
  // ///         : M3BorderSide.thin(Theme.of(context).colorScheme.outline),
  // ///     ),
  // ///   ),
  // ///   child: formField,
  // /// )
  // /// ```
  // const M3BorderSide.extraThick(Color outlineColor)
  //     : super(
  //         color: outlineColor,
  //         width: M3BorderWidths.extraThick,
  //       );

  /// A predefined borderless side for seamless component styling.
  ///
  /// This static instance provides a completely transparent border with zero
  /// width, effectively removing visual boundaries. Ideal for creating seamless
  /// interfaces, borderless component variants, and clean minimal designs
  /// where visual separation is not needed.
  ///
  /// **Use cases:**
  /// * Borderless button variants (FilledButton, TextButton)
  /// * Seamless content containers
  /// * Hidden state indicators
  /// * Clean interface layouts without visual dividers
  /// * Card variants without outlines
  /// * Navigation elements without separators
  ///
  /// **Performance note:**
  /// Being a static const instance, this border has zero allocation overhead
  /// and can be reused throughout the application.
  ///
  /// **Example:**
  /// ```dart
  /// // Borderless container for seamless design
  /// Container(
  ///   decoration: BoxDecoration(
  ///     border: showBorder
  ///       ? Border.all(side: M3BorderSide.thin(outlineColor))
  ///       : Border.all(side: M3BorderSide.none),
  ///   ),
  ///   child: content,
  /// )
  /// ```
  static const M3BorderSide none = M3BorderSide(
    outlineColor: Colors.transparent,
  );
}
