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
  // const M3Border.all({
  //   Color color = const Color(0xFF000000),
  //   M3BorderWidthToken width = M3BorderWidthToken.thin,
  //   BorderStyle style = BorderStyle.solid,
  //   double strokeAlign = BorderSide.strokeAlignInside,
  // }) {
  //   final  side = M3BorderSide(
  //     outlineColor: color,
  //     width: width,
  //   );
  //   return M3Border.fromBorderSide(side);
  // }

  // const M3Border.all({
  //   required Color outlineColor,
  //   M3BorderWidthToken width = M3BorderWidthToken.thin,
  // }) : super(
  //       this.top = BorderSide.none,
  //       this.right = BorderSide.none,
  //       this.bottom = BorderSide.none,
  //       this.left = BorderSide.none,
  //         // color: outlineColor,
  //         // width: width == M3BorderWidthToken.none
  //         //     ? M3BorderWidths.none
  //         //     : width == M3BorderWidthToken.thin
  //         //         ? M3BorderWidths.thin
  //         //         : width == M3BorderWidthToken.thick
  //         //             ? M3BorderWidths.thick
  //         //             : M3BorderWidths.extraThick,
  //       );

  // static  asdad(Color color) =>  Border(
  //   top: M3BorderSide.none(color),
  //   right: M3BorderSide.none(color),
  //   bottom: M3BorderSide.none(color),
  //   left: M3BorderSide.none(color),
  // );

  const M3Border({
    M3BorderSide top = M3BorderSide.none,
    M3BorderSide right = M3BorderSide.none,
    M3BorderSide bottom = M3BorderSide.none,
    M3BorderSide left = M3BorderSide.none,
  }) : super(
          top: top,
          right: right,
          bottom: bottom,
          left: left,
        );

  const M3Border.fromBorderSide(M3BorderSide super.side)
      : super.fromBorderSide();

  M3Border.all({
    required Color outlineColor,
    M3BorderWidthToken width = M3BorderWidthToken.thin,
  }) : super.fromBorderSide(
          M3BorderSide(
            outlineColor: outlineColor,
            width: width,
          ),
        );

  /// Thin border on all sides (1dp width).
  ///
  /// Standard border configuration for most components.
  /// Provides subtle container definition.
  M3Border.thin(Color outlineColor)
      : super.fromBorderSide(M3BorderSide.thin(outlineColor));

  // /// Thick border on all sides (2dp width).
  // ///
  // /// Enhanced border for emphasis and selected states.
  // /// Creates clear container boundaries.
  // M3Border.thick(Color outlineColor)
  //   : super.fromBorderSide(M3BorderSide.thick(outlineColor));

  // /// Extra thick border on all sides (4dp width).
  // ///
  // /// High-emphasis border for critical states.
  // /// Maximum visual weight for important containers.
  // M3Border.extraThick(Color outlineColor)
  //   : super.fromBorderSide(M3BorderSide.extraThick(outlineColor));

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
  // const M3Border.fromBorderSide(M3BorderSide super.side)
  //     : super.fromBorderSide();

  /// No border on any side (0dp width).
  ///
  /// A completely borderless configuration.
  /// Used for seamless, boundary-free containers.
  static M3Border none = const M3Border.fromBorderSide(M3BorderSide.none);
}
