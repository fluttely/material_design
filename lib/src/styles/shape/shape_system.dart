/// Material Design 3 shape system.
///
/// This file implements the Material Design 3 shape specifications including
/// corner radius scales, shape families, and integration with Flutter's
/// shape system.
///
/// The shape system helps create visual hierarchy and brand expression through
/// consistent use of corner shapes across components.
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/styles/shape/overview
library;

import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Material Design 3 shape scale defining corner radius values.
///
/// The shape scale provides a range of corner radius values from
/// sharp corners (0dp) to fully rounded corners.
///
/// Reference: https://m3.material.io/styles/shape/shape-scale-tokens
@immutable
class ShapeScale {
  const ShapeScale._();

  /// No corner radius (0dp).
  /// Creates sharp, rectangular corners.
  static const double none = 0.0;

  /// Extra small corner radius (4dp).
  /// Subtle rounding for minimal softness.
  static const double extraSmall = 4.0;

  /// Small corner radius (8dp).
  /// Noticeable but restrained rounding.
  static const double small = 8.0;

  /// Medium corner radius (12dp).
  /// Balanced rounding for most components.
  static const double medium = 12.0;

  /// Large corner radius (16dp).
  /// Prominent rounding for emphasis.
  static const double large = 16.0;

  /// Extra large corner radius (28dp).
  /// Very rounded corners for special emphasis.
  static const double extraLarge = 28.0;

  /// Full corner radius (circular/stadium).
  /// Creates pill-shaped or circular shapes.
  /// The actual value depends on the component size.
  static const double full = 9999.0;

  /// Gets the appropriate corner radius for a full/circular shape
  /// based on the component dimensions.
  static double getFullRadius(Size size) {
    return math.min(size.width, size.height) / 2.0;
  }

  /// Returns a human-readable name for a radius value.
  static String getName(double radius) {
    if (radius == none) return 'None';
    if (radius == extraSmall) return 'Extra Small';
    if (radius == small) return 'Small';
    if (radius == medium) return 'Medium';
    if (radius == large) return 'Large';
    if (radius == extraLarge) return 'Extra Large';
    if (radius >= full) return 'Full';
    return 'Custom (${radius.toStringAsFixed(1)}dp)';
  }

  /// Validates if a radius value is within the Material Design 3 scale.
  static bool isValidRadius(double radius) {
    return radius == none ||
        radius == extraSmall ||
        radius == small ||
        radius == medium ||
        radius == large ||
        radius == extraLarge ||
        radius >= full;
  }
}

/// Represents a corner shape with individual corner radii.
///
/// Allows for asymmetric shapes with different radii for each corner.
@immutable
class CornerShape {
  /// Creates a corner shape with individually specified corner radii.
  const CornerShape({
    this.topLeft = 0.0,
    this.topRight = 0.0,
    this.bottomRight = 0.0,
    this.bottomLeft = 0.0,
  });

  /// Creates a uniform corner shape with the same radius for all corners.
  const CornerShape.all(double radius)
      : topLeft = radius,
        topRight = radius,
        bottomRight = radius,
        bottomLeft = radius;

  /// Creates a corner shape with only top corners rounded.
  const CornerShape.top(double radius)
      : topLeft = radius,
        topRight = radius,
        bottomRight = 0.0,
        bottomLeft = 0.0;

  /// Creates a corner shape with only bottom corners rounded.
  const CornerShape.bottom(double radius)
      : topLeft = 0.0,
        topRight = 0.0,
        bottomRight = radius,
        bottomLeft = radius;

  /// Creates a corner shape with only left corners rounded.
  const CornerShape.left(double radius)
      : topLeft = radius,
        topRight = 0.0,
        bottomRight = 0.0,
        bottomLeft = radius;

  /// Creates a corner shape with only right corners rounded.
  const CornerShape.right(double radius)
      : topLeft = 0.0,
        topRight = radius,
        bottomRight = radius,
        bottomLeft = 0.0;

  /// Creates a corner shape with diagonal corners rounded.
  const CornerShape.diagonal({
    double topLeftBottomRight = 0.0,
    double topRightBottomLeft = 0.0,
  })  : topLeft = topLeftBottomRight,
        topRight = topRightBottomLeft,
        bottomRight = topLeftBottomRight,
        bottomLeft = topRightBottomLeft;

  /// The radius for the top-left corner.
  final double topLeft;
  /// The radius for the top-right corner.
  final double topRight;
  /// The radius for the bottom-right corner.
  final double bottomRight;
  /// The radius for the bottom-left corner.
  final double bottomLeft;

  /// Creates a copy with the given fields replaced.
  CornerShape copyWith({
    double? topLeft,
    double? topRight,
    double? bottomRight,
    double? bottomLeft,
  }) {
    return CornerShape(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomRight: bottomRight ?? this.bottomRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
    );
  }

  /// Converts to Flutter's BorderRadius.
  BorderRadius toBorderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomRight: Radius.circular(bottomRight),
      bottomLeft: Radius.circular(bottomLeft),
    );
  }

  /// Lerps between two corner shapes.
  static CornerShape lerp(CornerShape? a, CornerShape? b, double t) {
    if (a == null && b == null) {
      return const CornerShape();
    }
    if (a == null) {
      return CornerShape(
        topLeft: b!.topLeft * t,
        topRight: b.topRight * t,
        bottomRight: b.bottomRight * t,
        bottomLeft: b.bottomLeft * t,
      );
    }
    if (b == null) {
      return CornerShape(
        topLeft: a.topLeft * (1.0 - t),
        topRight: a.topRight * (1.0 - t),
        bottomRight: a.bottomRight * (1.0 - t),
        bottomLeft: a.bottomLeft * (1.0 - t),
      );
    }
    return CornerShape(
      topLeft: lerpDouble(a.topLeft, b.topLeft, t)!,
      topRight: lerpDouble(a.topRight, b.topRight, t)!,
      bottomRight: lerpDouble(a.bottomRight, b.bottomRight, t)!,
      bottomLeft: lerpDouble(a.bottomLeft, b.bottomLeft, t)!,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CornerShape &&
          runtimeType == other.runtimeType &&
          topLeft == other.topLeft &&
          topRight == other.topRight &&
          bottomRight == other.bottomRight &&
          bottomLeft == other.bottomLeft;

  @override
  int get hashCode => Object.hash(topLeft, topRight, bottomRight, bottomLeft);
}

/// Linearly interpolates between two numbers.
///
/// Similar to [lerpDouble] from `dart:ui`.
double? lerpDouble(num? a, num? b, double t) {
  if (a == null && b == null) return null;
  a ??= 0.0;
  b ??= 0.0;
  return a + (b - a) * t;
}

/// Material Design 3 corner families.
///
/// Corner families define the type of corner treatment applied to shapes.
enum CornerFamily {
  /// Rounded corners using circular arcs.
  /// This is the default and most common corner family.
  rounded,

  /// Cut corners using straight diagonal cuts.
  /// Creates a more angular, technical appearance.
  cut,
}

/// Material Design 3 shape scheme.
///
/// Defines a consistent set of shapes for use across an application,
/// supporting both rounded and cut corner families.
@immutable
class ShapeScheme {
  /// Creates a shape scheme.
  const ShapeScheme({
    this.cornerFamily = CornerFamily.rounded,
    this.none = ShapeScale.none,
    this.extraSmall = ShapeScale.extraSmall,
    this.small = ShapeScale.small,
    this.medium = ShapeScale.medium,
    this.large = ShapeScale.large,
    this.extraLarge = ShapeScale.extraLarge,
    this.full = ShapeScale.full,
  });

  /// Creates the default Material Design 3 shape scheme.
  static const ShapeScheme m3Default = ShapeScheme();

  /// Creates a shape scheme with cut corners.
  static const ShapeScheme cut = ShapeScheme(
    cornerFamily: CornerFamily.cut,
  );

  /// The corner family for this shape scheme.
  final CornerFamily cornerFamily;

  /// No corner radius.
  final double none;

  /// Extra small corner radius.
  final double extraSmall;

  /// Small corner radius.
  final double small;

  /// Medium corner radius.
  final double medium;

  /// Large corner radius.
  final double large;

  /// Extra large corner radius.
  final double extraLarge;

  /// Full corner radius.
  final double full;

  /// Creates a copy with the given fields replaced.
  ShapeScheme copyWith({
    CornerFamily? cornerFamily,
    double? none,
    double? extraSmall,
    double? small,
    double? medium,
    double? large,
    double? extraLarge,
    double? full,
  }) {
    return ShapeScheme(
      cornerFamily: cornerFamily ?? this.cornerFamily,
      none: none ?? this.none,
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
      full: full ?? this.full,
    );
  }

  /// Gets a shape border for the specified radius.
  ///
  /// The [size] parameter is used to correctly calculate the radius
  /// for a 'full' shape (e.g., a circle or stadium).
  ShapeBorder getShape(double radius, {Size? size}) {
    final effectiveRadius = radius >= ShapeScale.full && size != null
        ? ShapeScale.getFullRadius(size)
        : radius;

    switch (cornerFamily) {
      case CornerFamily.rounded:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(effectiveRadius),
        );
      case CornerFamily.cut:
        return BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(effectiveRadius),
        );
    }
  }

  /// Lerps between two shape schemes.
  static ShapeScheme lerp(ShapeScheme? a, ShapeScheme? b, double t) {
    if (a == null && b == null) {
      return const ShapeScheme();
    }
    if (a == null) {
      return b!;
    }
    if (b == null) {
      return a;
    }

    // Don't interpolate corner family, use the target
    final cornerFamily = t < 0.5 ? a.cornerFamily : b.cornerFamily;

    return ShapeScheme(
      cornerFamily: cornerFamily,
      none: lerpDouble(a.none, b.none, t)!,
      extraSmall: lerpDouble(a.extraSmall, b.extraSmall, t)!,
      small: lerpDouble(a.small, b.small, t)!,
      medium: lerpDouble(a.medium, b.medium, t)!,
      large: lerpDouble(a.large, b.large, t)!,
      extraLarge: lerpDouble(a.extraLarge, b.extraLarge, t)!,
      full: lerpDouble(a.full, b.full, t)!,
    );
  }
}

/// Factory class for creating Material Design 3 shape borders.
class MaterialShapes {
  /// Private constructor to prevent instantiation.
  MaterialShapes._();

  /// Creates a rounded rectangle shape with the specified corner radius.
  static RoundedRectangleBorder rounded(double radius) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Creates a rounded rectangle shape with individual corner radii.
  static RoundedRectangleBorder roundedWith(CornerShape corners) {
    return RoundedRectangleBorder(
      borderRadius: corners.toBorderRadius(),
    );
  }

  /// Creates a beveled (cut) rectangle shape with the specified corner radius.
  static BeveledRectangleBorder cut(double radius) {
    return BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Creates a beveled (cut) rectangle shape with individual corner radii.
  static BeveledRectangleBorder cutWith(CornerShape corners) {
    return BeveledRectangleBorder(
      borderRadius: corners.toBorderRadius(),
    );
  }

  /// Creates a continuous (squircle) rectangle shape.
  /// This creates smoother corners than regular rounded rectangles.
  static ContinuousRectangleBorder continuous(double radius) {
    return ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Creates a continuous (squircle) rectangle shape with individual corner radii.
  static ContinuousRectangleBorder continuousWith(CornerShape corners) {
    return ContinuousRectangleBorder(
      borderRadius: corners.toBorderRadius(),
    );
  }

  /// Creates a stadium (pill) shape.
  static StadiumBorder stadium() {
    return const StadiumBorder();
  }

  /// Creates a circle shape.
  static CircleBorder circle() {
    return const CircleBorder();
  }

  /// Creates a shape appropriate for the given parameters.
  ///
  /// - [radius]: The desired corner radius. If `radius` is `ShapeScale.full`,
  ///   it creates a `StadiumBorder` or `CircleBorder` based on the [size].
  /// - [family]: The corner family ([CornerFamily.rounded] or [CornerFamily.cut]).
  /// - [continuous]: If true and family is rounded, creates a `ContinuousRectangleBorder`.
  /// - [size]: The size of the component, used to determine the shape for `ShapeScale.full`
  ///   (circular vs. stadium).
  static ShapeBorder create({
    required double radius,
    CornerFamily family = CornerFamily.rounded,
    bool continuous = false,
    Size? size,
  }) {
    // Handle full radius (stadium/circle shape)
    if (radius >= ShapeScale.full) {
      if (size != null && size.width == size.height) {
        return circle();
      }
      return stadium();
    }

    // Handle other shapes based on corner family
    switch (family) {
      case CornerFamily.rounded:
        if (continuous) {
          return MaterialShapes.continuous(radius);
        }
        return rounded(radius);
      case CornerFamily.cut:
        return cut(radius);
    }
  }
}

/// Component-specific shape specifications.
///
/// Provides predefined shapes for common Material Design 3 components.
class ComponentShapes {
  /// Private constructor to prevent instantiation.
  ComponentShapes._();

  /// Button shapes
  static const ShapeBorder button = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.full)),
  );

  static const ShapeBorder iconButton = CircleBorder();

  static const ShapeBorder fabSmall = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.medium)),
  );

  static const ShapeBorder fabRegular = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.large)),
  );

  static const ShapeBorder fabLarge = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.extraLarge)),
  );

  static const ShapeBorder fabExtended = StadiumBorder();

  /// Card shapes
  static const ShapeBorder card = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.medium)),
  );

  static const ShapeBorder cardElevated = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.medium)),
  );

  static const ShapeBorder cardFilled = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.medium)),
  );

  static const ShapeBorder cardOutlined = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.medium)),
  );

  /// Dialog shapes
  static const ShapeBorder dialog = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.extraLarge)),
  );

  static const ShapeBorder dialogFullscreen = RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  );

  /// Bottom sheet shapes
  static const ShapeBorder bottomSheet = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(ShapeScale.extraLarge),
      topRight: Radius.circular(ShapeScale.extraLarge),
    ),
  );

  static const ShapeBorder bottomSheetModal = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(ShapeScale.extraLarge),
      topRight: Radius.circular(ShapeScale.extraLarge),
    ),
  );

  /// Navigation shapes
  static const ShapeBorder navigationBar = RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  );

  static const ShapeBorder navigationRail = RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  );

  static const ShapeBorder navigationDrawer = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(ShapeScale.large),
      bottomRight: Radius.circular(ShapeScale.large),
    ),
  );

  /// Chip shapes
  static const ShapeBorder chip = StadiumBorder();

  static const ShapeBorder chipSmall = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.small)),
  );

  /// Menu shapes
  static const ShapeBorder menu = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.extraSmall)),
  );

  static const ShapeBorder menuItem = RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  );

  /// Text field shapes
  static const ShapeBorder textFieldFilled = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(ShapeScale.extraSmall),
      topRight: Radius.circular(ShapeScale.extraSmall),
    ),
  );

  static const ShapeBorder textFieldOutlined = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.extraSmall)),
  );

  /// Tooltip shape
  static const ShapeBorder tooltip = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.extraSmall)),
  );

  /// Snackbar shape
  static const ShapeBorder snackbar = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.extraSmall)),
  );

  /// Badge shape
  static const ShapeBorder badge = StadiumBorder();

  /// Progress indicator shapes
  static const ShapeBorder linearProgress = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(ShapeScale.full)),
  );

  /// Switch shapes
  static const ShapeBorder switchThumb = CircleBorder();

  static const ShapeBorder switchTrack = StadiumBorder();

  /// Slider shapes
  static const ShapeBorder sliderThumb = CircleBorder();

  static const ShapeBorder sliderTrack = StadiumBorder();
}

/// Theme extension for Material Design 3 shapes.
///
/// Integrates the shape system with Flutter's theme system.
@immutable
class ShapeTheme extends ThemeExtension<ShapeTheme> {
  /// Creates a shape theme.
  const ShapeTheme({
    this.scheme = const ShapeScheme(),
    this.buttonShape,
    this.cardShape,
    this.dialogShape,
    this.bottomSheetShape,
    this.chipShape,
    this.menuShape,
    this.textFieldShape,
  });

  /// The shape scheme for this theme.
  final ShapeScheme scheme;

  /// Override shape for buttons.
  final ShapeBorder? buttonShape;

  /// Override shape for cards.
  final ShapeBorder? cardShape;

  /// Override shape for dialogs.
  final ShapeBorder? dialogShape;

  /// Override shape for bottom sheets.
  final ShapeBorder? bottomSheetShape;

  /// Override shape for chips.
  final ShapeBorder? chipShape;

  /// Override shape for menus.
  final ShapeBorder? menuShape;

  /// Override shape for text fields.
  final ShapeBorder? textFieldShape;

  /// Gets the effective button shape.
  ShapeBorder get effectiveButtonShape =>
      buttonShape ?? ComponentShapes.button;

  /// Gets the effective card shape.
  ShapeBorder get effectiveCardShape => cardShape ?? ComponentShapes.card;

  /// Gets the effective dialog shape.
  ShapeBorder get effectiveDialogShape =>
      dialogShape ?? ComponentShapes.dialog;

  /// Gets the effective bottom sheet shape.
  ShapeBorder get effectiveBottomSheetShape =>
      bottomSheetShape ?? ComponentShapes.bottomSheet;

  /// Gets the effective chip shape.
  ShapeBorder get effectiveChipShape => chipShape ?? ComponentShapes.chip;

  /// Gets the effective menu shape.
  ShapeBorder get effectiveMenuShape => menuShape ?? ComponentShapes.menu;

  /// Gets the effective text field shape.
  ShapeBorder get effectiveTextFieldShape =>
      textFieldShape ?? ComponentShapes.textFieldOutlined;

  @override
  ShapeTheme copyWith({
    ShapeScheme? scheme,
    ShapeBorder? buttonShape,
    ShapeBorder? cardShape,
    ShapeBorder? dialogShape,
    ShapeBorder? bottomSheetShape,
    ShapeBorder? chipShape,
    ShapeBorder? menuShape,
    ShapeBorder? textFieldShape,
  }) {
    return ShapeTheme(
      scheme: scheme ?? this.scheme,
      buttonShape: buttonShape ?? this.buttonShape,
      cardShape: cardShape ?? this.cardShape,
      dialogShape: dialogShape ?? this.dialogShape,
      bottomSheetShape: bottomSheetShape ?? this.bottomSheetShape,
      chipShape: chipShape ?? this.chipShape,
      menuShape: menuShape ?? this.menuShape,
      textFieldShape: textFieldShape ?? this.textFieldShape,
    );
  }

  @override
  ShapeTheme lerp(ThemeExtension<ShapeTheme>? other, double t) {
    if (other is! ShapeTheme) {
      return this;
    }

    return ShapeTheme(
      scheme: ShapeScheme.lerp(scheme, other.scheme, t),
      // ShapeBorder doesn't have a standard lerp, so we switch at midpoint
      buttonShape: t < 0.5 ? buttonShape : other.buttonShape,
      cardShape: t < 0.5 ? cardShape : other.cardShape,
      dialogShape: t < 0.5 ? dialogShape : other.dialogShape,
      bottomSheetShape: t < 0.5 ? bottomSheetShape : other.bottomSheetShape,
      chipShape: t < 0.5 ? chipShape : other.chipShape,
      menuShape: t < 0.5 ? menuShape : other.menuShape,
      textFieldShape: t < 0.5 ? textFieldShape : other.textFieldShape,
    );
  }

  /// Gets the ShapeTheme from the current context.
  static ShapeTheme of(BuildContext context) {
    return Theme.of(context).extension<ShapeTheme>() ?? const ShapeTheme();
  }

  /// Gets the ShapeTheme from the current context, or null if not found.
  static ShapeTheme? maybeOf(BuildContext context) {
    return Theme.of(context).extension<ShapeTheme>();
  }
}

/// Extension methods for easy access to shapes in BuildContext.
extension ShapeContext on BuildContext {
  /// Gets the shape theme from the current context.
  ShapeTheme get shapeTheme => ShapeTheme.of(this);

  /// Gets the shape scheme from the current context.
  ShapeScheme get shapeScheme => shapeTheme.scheme;

  /// Creates a shape with the specified radius using the current scheme.
  ShapeBorder shape(double radius) {
    return shapeScheme.getShape(radius);
  }
}

/// Utility class for shape calculations and transformations.
class ShapeUtils {
  /// Private constructor to prevent instantiation.
  ShapeUtils._();

  /// Calculates the corner radius for a stadium shape based on size.
  static double getStadiumRadius(Size size) {
    return math.min(size.width, size.height) / 2.0;
  }

  /// Determines if a shape should be circular based on aspect ratio.
  static bool shouldBeCircular(Size size, {double tolerance = 0.1}) {
    final aspectRatio = size.width / size.height;
    return (aspectRatio - 1.0).abs() < tolerance;
  }

  /// Converts a corner radius to a percentage of the component size.
  static double radiusToPercentage(double radius, Size size) {
    final minDimension = math.min(size.width, size.height);
    return (radius / minDimension) * 100;
  }

  /// Converts a percentage to a corner radius based on component size.
  static double percentageToRadius(double percentage, Size size) {
    final minDimension = math.min(size.width, size.height);
    return (percentage / 100) * minDimension;
  }

  /// Clamps a radius value to valid bounds.
  static double clampRadius(double radius, Size size) {
    final maxRadius = math.min(size.width, size.height) / 2.0;
    return radius.clamp(0.0, maxRadius);
  }

  /// Creates an animated shape that transitions between two shapes.
  ///
  /// If the shapes are of the same type ([RoundedRectangleBorder],
  /// [BeveledRectangleBorder], or [ContinuousRectangleBorder]), this method
  /// will smoothly interpolate their `borderRadius`.
  ///
  /// If the shapes are of different types, it will switch from [a] to [b]
  /// at the midpoint (t = 0.5).
  static ShapeBorder? lerpShapes(
    ShapeBorder? a,
    ShapeBorder? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }
    if (a == null) {
      return b;
    }
    if (b == null) {
      return a;
    }

    // Try to lerp if both are the same type
    if (a.runtimeType == b.runtimeType) {
      if (a is RoundedRectangleBorder && b is RoundedRectangleBorder) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t)!,
        );
      }
      if (a is BeveledRectangleBorder && b is BeveledRectangleBorder) {
        return BeveledRectangleBorder(
          borderRadius: BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t)!,
        );
      }
      if (a is ContinuousRectangleBorder && b is ContinuousRectangleBorder) {
        return ContinuousRectangleBorder(
          borderRadius: BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t)!,
        );
      }
    }

    // If different types, switch at midpoint
    return t < 0.5 ? a : b;
  }
}

/// A versatile container widget that applies a Material Design 3 shape,
/// color, border, and elevation to its child.
///
/// It simplifies creating shaped containers by integrating with the [ShapeTheme]
/// and providing direct properties for customization.
class ShapeContainer extends StatelessWidget {
  /// Creates a ShapeContainer.
  ///
  /// At least one of [shape] or [radius] should typically be provided to define
  /// the container's shape. If neither is given, it behaves like a standard
  /// `Container` but can still have margin, padding, etc.
  const ShapeContainer({
    super.key,
    required this.child,
    this.shape,
    this.radius,
    this.cornerFamily,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.elevation,
    this.shadowColor,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.constraints,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The explicit shape of the container's border.
  /// Overrides any shape generated from [radius] and [cornerFamily].
  final ShapeBorder? shape;

  /// The corner radius for the container.
  /// This is used to create a shape if [shape] is not provided.
  /// The final shape also depends on the [cornerFamily].
  final double? radius;

  /// The corner family to use when creating a shape from [radius].
  /// If null, it defaults to the `cornerFamily` from the [ShapeTheme].
  final CornerFamily? cornerFamily;

  /// The background color of the container.
  final Color? color;

  /// The color of the border.
  /// [borderWidth] must also be non-null for the border to be drawn.
  final Color? borderColor;

  /// The width of the border.
  /// [borderColor] must also be non-null for the border to be drawn.
  final double? borderWidth;

  /// The z-coordinate at which to place this container.
  /// This controls the size of the shadow below the container.
  final double? elevation;

  /// The color of the shadow when [elevation] is greater than 0.
  final Color? shadowColor;

  /// Empty space to inscribe inside the container's decoration. The [child],
  /// if any, is placed inside this padding.
  final EdgeInsetsGeometry? padding;

  /// Empty space to surround the container.
  final EdgeInsetsGeometry? margin;

  /// The width of the container.
  final double? width;

  /// The height of the container.
  final double? height;

  /// Additional constraints to apply to the child.
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final shapeTheme = context.shapeTheme;
    final effectiveShape = shape ??
        (radius != null
            ? MaterialShapes.create(
                radius: radius!,
                family: cornerFamily ?? shapeTheme.scheme.cornerFamily,
              )
            : null);

    Widget result = child;

    if (padding != null) {
      result = Padding(padding: padding!, child: result);
    }

    if (effectiveShape != null || color != null || borderColor != null) {
      final decoration = ShapeDecoration(
        shape: effectiveShape ?? const RoundedRectangleBorder(),
        color: color,
      );

      if (borderColor != null && borderWidth != null) {
        result = Container(
          width: width,
          height: height,
          constraints: constraints,
          decoration: decoration,
          child: result,
        );
      } else {
        result = DecoratedBox(
          decoration: decoration,
          child: SizedBox(
            width: width,
            height: height,
            child: result,
          ),
        );
      }
    }

    if (elevation != null && elevation! > 0) {
      result = Material(
        elevation: elevation!,
        shadowColor: shadowColor,
        shape: effectiveShape,
        color: color ?? Colors.transparent,
        child: result,
      );
    }

    if (margin != null) {
      result = Padding(padding: margin!, child: result);
    }

    return result;
  }
}