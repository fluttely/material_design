part of '../../../../material_design.dart';

// // Supondo que 'token' seja uma constante de tempo de compilação.
// const M3Border token = M3Border.thick;

// // Ternário aninhado que mapeia o enum M3Border para M3BorderSide.
// const BorderSide result = token == M3Border.none
//     ? M3BorderSide.none
//     : token == M3Border.thin
//         ? M3BorderSide.thin
//         : token == M3Border.thick
//             ? M3BorderSide.thick
//             : M3BorderSide.extraThick;

// void main() {
//   // result terá o valor de M3BorderSide.thick
//   print(result);
// }

/// Material Design 3 border tokens for complete border styling.
///
/// This enum provides pre-configured [Border] objects that apply
/// consistent border styling to all sides of a container. Each token
/// uses the corresponding border width from the Material Design 3
/// specification.
///
/// These tokens ensure uniform border appearance across components
/// and provide a standardized approach to container styling.
///
/// ## Usage
///
/// ```dart
/// // Get a complete border
/// Border border = M3Border.thin.value;
///
/// // Use in decorations
/// Container(
///   decoration: BoxDecoration(
///     border: M3Border.thick.value,
///     borderRadius: BorderRadius.circular(8),
///   ),
/// )
/// ```
class M3Border extends Border {
  /// Creates a border with all sides using the same Material Design 3 token.
  ///
  /// This is the most common way to create a uniform border around a component.
  /// The width parameter must be a Material Design 3 border token to ensure
  /// consistent styling.
  ///
  /// The [side] parameter defines the border appearance for all sides.
  ///
  /// Example:
  /// ```dart
  /// final border = M3Border.all(
  ///   width: M3BorderWidthToken.thin,
  ///   color: Colors.grey,
  /// );
  /// ```
  const M3Border._all(M3BorderSide? side)
      : super(
          top: side ?? M3BorderSide.none,
          right: side ?? M3BorderSide.none,
          bottom: side ?? M3BorderSide.none,
          left: side ?? M3BorderSide.none,
        );

  /// No border on any side (0dp width).
  ///
  /// A completely borderless configuration.
  /// Used for seamless, boundary-free containers.
  static const M3Border none = M3Border._all(M3BorderSide.none);

  /// Thin border on all sides (1dp width).
  ///
  /// Standard border configuration for most components.
  /// Provides subtle container definition.
  static const M3Border thin = M3Border._all(M3BorderSide.thin);

  /// Thick border on all sides (2dp width).
  ///
  /// Enhanced border for emphasis and selected states.
  /// Creates clear container boundaries.
  static const M3Border thick = M3Border._all(M3BorderSide.thick);

  /// Extra thick border on all sides (4dp width).
  ///
  /// High-emphasis border for critical states.
  /// Maximum visual weight for important containers.
  static const M3Border extraThick = M3Border._all(M3BorderSide.extraThick);
}
