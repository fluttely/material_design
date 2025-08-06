part of '../../../material_design.dart';

/// Base interface for all Material Design 3 design tokens.
///
/// This interface defines the core contract that all Material Design 3 tokens
/// must implement. Design tokens are the atomic values that define the visual
/// properties of a design system, including colors, typography, spacing,
/// borders, and more.
///
/// The generic type [T] represents the underlying value type of the token,
/// such as [Color], [double], [TextStyle], or custom types.
///
/// ## Design Token Philosophy
///
/// Material Design 3 uses a three-tier token architecture:
/// 1. **Reference tokens**: Raw values (e.g., primary color palette)
/// 2. **System tokens**: Semantic meanings (e.g., primary color role)
/// 3. **Component tokens**: Component-specific values (e.g., button color)
///
/// This interface serves as the foundation for all token types, ensuring
/// consistency and type safety throughout the design system.
///
/// ## Usage
///
/// Typically, you won't implement this interface directly. Instead, use it
/// through concrete token enums like [M3SpacingToken] or [M3BorderWidthToken]:
///
/// ```dart
/// // System tokens implement this interface
/// IM3Token<double> spacingToken = M3SpacingToken.space16;
/// double spacing = spacingToken.value; // 16.0
///
/// // Generic token handling
/// T getTokenValue<T>(IM3Token<T> token) => token.value;
/// ```
///
/// ## Type Safety
///
/// The generic type parameter ensures compile-time type safety when working
/// with different token types:
///
/// ```dart
/// IM3Token<Color> colorToken = M3SysColor.primary;
/// IM3Token<double> sizeToken = M3SpacingToken.space24;
/// IM3Token<TextStyle> textToken = M3TextStyle.bodyLarge;
/// ```
///
/// ## Implementation Guidelines
///
/// When implementing this interface in new token types:
/// - Use enums for discrete token sets
/// - Provide comprehensive documentation for each token value
/// - Follow Material Design 3 naming conventions
/// - Ensure immutability with the [@immutable] annotation
///
/// Reference: https://m3.material.io/foundations/design-tokens
@immutable
abstract interface class IM3Token<T> {
  /// The actual value represented by this design token.
  ///
  /// This getter returns the concrete value that this token represents,
  /// such as a color, numeric value, text style, or other design property.
  /// The type is guaranteed by the generic parameter [T].
  ///
  /// ## Examples
  ///
  /// ```dart
  /// // For spacing tokens
  /// double spacing = M3SpacingToken.space16.value; // 16.0
  ///
  /// // For color tokens
  /// double borderWidth = M3BorderWidthToken.thick.value; // 2.0
  ///
  /// // For text style tokens
  /// double breakpoint = M3BreakpointToken.expanded.value; // 840.0
  /// ```
  T get value;
}

/// Contextual token that provides values based on BuildContext.
abstract interface class IM3ContextualToken<T>
    extends IM3Token<T Function(BuildContext)> {
  /// Resolves the token value based on the provided context.
  T resolve(BuildContext context);
}
