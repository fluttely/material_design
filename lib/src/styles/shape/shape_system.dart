/// Material Design 3 shape system with design tokens.
///
/// This file implements the Material Design 3 shape specifications using
/// the design token hierarchy system for maintainable and scalable
/// shape management.
///
/// Token Hierarchy:
/// - Reference tokens: Raw radius values in dp
/// - System tokens: Semantic shape scales
/// - Component tokens: Component-specific shapes
///
/// Based on Material Design 3 specifications:
/// https://m3.material.io/styles/shape/overview
library;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_design/material_design.dart';

// ============================================================================
// REFERENCE TOKENS - Raw radius values in dp
// ============================================================================

/// Reference tokens for corner radius values.
class ShapeRadiusReferenceTokens {
  ShapeRadiusReferenceTokens._();

  static const radius0 = ReferenceToken<double>(
    0,
    'shape.radius0',
    description: 'No corner radius - sharp corners',
  );

  static const radius4 = ReferenceToken<double>(
    4,
    'shape.radius4',
    description: '4dp corner radius',
  );

  static const radius8 = ReferenceToken<double>(
    8,
    'shape.radius8',
    description: '8dp corner radius',
  );

  static const radius12 = ReferenceToken<double>(
    12,
    'shape.radius12',
    description: '12dp corner radius',
  );

  static const radius16 = ReferenceToken<double>(
    16,
    'shape.radius16',
    description: '16dp corner radius',
  );

  static const radius28 = ReferenceToken<double>(
    28,
    'shape.radius28',
    description: '28dp corner radius',
  );

  static const radiusFull = ReferenceToken<double>(
    9999,
    'shape.radiusFull',
    description: 'Full corner radius - circular or stadium shape',
  );
}

/// Reference tokens for corner families.
class ShapeFamilyReferenceTokens {
  ShapeFamilyReferenceTokens._();

  static const rounded = ReferenceToken<CornerFamily>(
    CornerFamily.rounded,
    'shape.family.rounded',
    description: 'Rounded corners using circular arcs',
  );

  static const cut = ReferenceToken<CornerFamily>(
    CornerFamily.cut,
    'shape.family.cut',
    description: 'Cut corners using straight diagonal cuts',
  );
}

// ============================================================================
// SYSTEM TOKENS - Semantic shape scales
// ============================================================================

/// System tokens for shape scale.
class ShapeScaleSystemTokens {
  ShapeScaleSystemTokens._();

  static final none = SystemToken<double>.fromReference(
    ShapeRadiusReferenceTokens.radius0,
    systemName: 'shape.scale.none',
    description: 'No corner radius for sharp corners',
  );

  static final extraSmall = SystemToken<double>.fromReference(
    ShapeRadiusReferenceTokens.radius4,
    systemName: 'shape.scale.extraSmall',
    description: 'Extra small corner radius for subtle rounding',
  );

  static final small = SystemToken<double>.fromReference(
    ShapeRadiusReferenceTokens.radius8,
    systemName: 'shape.scale.small',
    description: 'Small corner radius for noticeable rounding',
  );

  static final medium = SystemToken<double>.fromReference(
    ShapeRadiusReferenceTokens.radius12,
    systemName: 'shape.scale.medium',
    description: 'Medium corner radius for balanced rounding',
  );

  static final large = SystemToken<double>.fromReference(
    ShapeRadiusReferenceTokens.radius16,
    systemName: 'shape.scale.large',
    description: 'Large corner radius for prominent rounding',
  );

  static final extraLarge = SystemToken<double>.fromReference(
    ShapeRadiusReferenceTokens.radius28,
    systemName: 'shape.scale.extraLarge',
    description: 'Extra large corner radius for strong emphasis',
  );

  static final full = SystemToken<double>.fromReference(
    ShapeRadiusReferenceTokens.radiusFull,
    systemName: 'shape.scale.full',
    description: 'Full corner radius for circular or stadium shapes',
  );
}

/// System tokens for shape families.
class ShapeFamilySystemTokens {
  ShapeFamilySystemTokens._();

  static final rounded = SystemToken<CornerFamily>.fromReference(
    ShapeFamilyReferenceTokens.rounded,
    systemName: 'shape.family.rounded',
    description: 'Default rounded corner family',
  );

  static final cut = SystemToken<CornerFamily>.fromReference(
    ShapeFamilyReferenceTokens.cut,
    systemName: 'shape.family.cut',
    description: 'Angular cut corner family',
  );
}

// ============================================================================
// COMPONENT TOKENS - Component-specific shapes
// ============================================================================

/// Component tokens for button shapes.
class ButtonShapeTokens {
  ButtonShapeTokens._();

  static final common = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.full,
    component: 'Button',
    tokenName: 'shape',
    description: 'Common button shape with full rounding',
  );

  static final icon = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.full,
    component: 'IconButton',
    tokenName: 'shape',
    description: 'Icon button circular shape',
  );

  static final fabSmall = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.medium,
    component: 'FAB',
    tokenName: 'shape',
    variant: 'small',
    description: 'Small FAB corner radius',
  );

  static final fabRegular = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.large,
    component: 'FAB',
    tokenName: 'shape',
    variant: 'regular',
    description: 'Regular FAB corner radius',
  );

  static final fabLarge = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.extraLarge,
    component: 'FAB',
    tokenName: 'shape',
    variant: 'large',
    description: 'Large FAB corner radius',
  );

  static final fabExtended = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.full,
    component: 'FAB',
    tokenName: 'shape',
    variant: 'extended',
    description: 'Extended FAB stadium shape',
  );
}

/// Component tokens for card shapes.
class CardShapeTokens {
  CardShapeTokens._();

  static final elevated = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.medium,
    component: 'Card',
    tokenName: 'shape',
    variant: 'elevated',
    description: 'Elevated card corner radius',
  );

  static final filled = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.medium,
    component: 'Card',
    tokenName: 'shape',
    variant: 'filled',
    description: 'Filled card corner radius',
  );

  static final outlined = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.medium,
    component: 'Card',
    tokenName: 'shape',
    variant: 'outlined',
    description: 'Outlined card corner radius',
  );
}

/// Component tokens for dialog shapes.
class DialogShapeTokens {
  DialogShapeTokens._();

  static final standard = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.extraLarge,
    component: 'Dialog',
    tokenName: 'shape',
    description: 'Standard dialog corner radius',
  );

  static final fullscreen = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.none,
    component: 'Dialog',
    tokenName: 'shape',
    variant: 'fullscreen',
    description: 'Fullscreen dialog with no rounding',
  );
}

/// Component tokens for bottom sheet shapes.
class BottomSheetShapeTokens {
  BottomSheetShapeTokens._();

  static const standard = ComponentToken<CornerShape>(
    CornerShape.top(28),
    'bottomsheet.standard.shape',
    component: 'BottomSheet',
    description: 'Standard bottom sheet with top corners rounded',
  );

  static const modal = ComponentToken<CornerShape>(
    CornerShape.top(28),
    'bottomsheet.modal.shape',
    component: 'BottomSheet',
    variant: 'modal',
    description: 'Modal bottom sheet with top corners rounded',
  );
}

/// Component tokens for navigation shapes.
class NavigationShapeTokens {
  NavigationShapeTokens._();

  static final bar = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.none,
    component: 'NavigationBar',
    tokenName: 'shape',
    description: 'Navigation bar with no rounding',
  );

  static final rail = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.none,
    component: 'NavigationRail',
    tokenName: 'shape',
    description: 'Navigation rail with no rounding',
  );

  static const drawer = ComponentToken<CornerShape>(
    CornerShape.right(16),
    'navigationdrawer.shape',
    component: 'NavigationDrawer',
    description: 'Navigation drawer with right corners rounded',
  );
}

/// Component tokens for chip shapes.
class ChipShapeTokens {
  ChipShapeTokens._();

  static final standard = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.full,
    component: 'Chip',
    tokenName: 'shape',
    description: 'Standard chip stadium shape',
  );

  static final small = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.small,
    component: 'Chip',
    tokenName: 'shape',
    variant: 'small',
    description: 'Small chip with reduced rounding',
  );
}

/// Component tokens for menu shapes.
class MenuShapeTokens {
  MenuShapeTokens._();

  static final container = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.extraSmall,
    component: 'Menu',
    tokenName: 'shape',
    description: 'Menu container corner radius',
  );

  static final item = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.none,
    component: 'MenuItem',
    tokenName: 'shape',
    description: 'Menu item with no rounding',
  );
}

/// Component tokens for text field shapes.
class TextFieldShapeTokens {
  TextFieldShapeTokens._();

  static const filled = ComponentToken<CornerShape>(
    CornerShape.top(4),
    'textfield.filled.shape',
    component: 'TextField',
    variant: 'filled',
    description: 'Filled text field with top corners rounded',
  );

  static final outlined = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.extraSmall,
    component: 'TextField',
    tokenName: 'shape',
    variant: 'outlined',
    description: 'Outlined text field corner radius',
  );
}

/// Component tokens for other component shapes.
class MiscShapeTokens {
  MiscShapeTokens._();

  static final tooltip = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.extraSmall,
    component: 'Tooltip',
    tokenName: 'shape',
    description: 'Tooltip corner radius',
  );

  static final snackbar = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.extraSmall,
    component: 'Snackbar',
    tokenName: 'shape',
    description: 'Snackbar corner radius',
  );

  static final badge = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.full,
    component: 'Badge',
    tokenName: 'shape',
    description: 'Badge stadium shape',
  );

  static final linearProgress = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.full,
    component: 'LinearProgress',
    tokenName: 'shape',
    description: 'Linear progress bar rounding',
  );

  static final switchThumb = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.full,
    component: 'Switch',
    tokenName: 'shape',
    state: 'thumb',
    description: 'Switch thumb circular shape',
  );

  static final switchTrack = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.full,
    component: 'Switch',
    tokenName: 'shape',
    state: 'track',
    description: 'Switch track stadium shape',
  );

  static final sliderThumb = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.full,
    component: 'Slider',
    tokenName: 'shape',
    state: 'thumb',
    description: 'Slider thumb circular shape',
  );

  static final sliderTrack = ComponentToken<double>.fromSystem(
    ShapeScaleSystemTokens.full,
    component: 'Slider',
    tokenName: 'shape',
    state: 'track',
    description: 'Slider track stadium shape',
  );
}

// ============================================================================
// PUBLIC API - Shape utilities and helpers
// ============================================================================

/// Material Design 3 corner families.
enum CornerFamily {
  /// Rounded corners using circular arcs.
  rounded,

  /// Cut corners using straight diagonal cuts.
  cut,
}

/// Represents a corner shape with individual corner radii.
@immutable
class CornerShape {
  const CornerShape({
    this.topLeft = 0.0,
    this.topRight = 0.0,
    this.bottomRight = 0.0,
    this.bottomLeft = 0.0,
  });

  const CornerShape.all(double radius)
      : topLeft = radius,
        topRight = radius,
        bottomRight = radius,
        bottomLeft = radius;

  const CornerShape.top(double radius)
      : topLeft = radius,
        topRight = radius,
        bottomRight = 0.0,
        bottomLeft = 0.0;

  const CornerShape.bottom(double radius)
      : topLeft = 0.0,
        topRight = 0.0,
        bottomRight = radius,
        bottomLeft = radius;

  const CornerShape.left(double radius)
      : topLeft = radius,
        topRight = 0.0,
        bottomRight = 0.0,
        bottomLeft = radius;

  const CornerShape.right(double radius)
      : topLeft = 0.0,
        topRight = radius,
        bottomRight = radius,
        bottomLeft = 0.0;

  const CornerShape.diagonal({
    double topLeftBottomRight = 0.0,
    double topRightBottomLeft = 0.0,
  })  : topLeft = topLeftBottomRight,
        topRight = topRightBottomLeft,
        bottomRight = topLeftBottomRight,
        bottomLeft = topRightBottomLeft;

  final double topLeft;
  final double topRight;
  final double bottomRight;
  final double bottomLeft;

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

  BorderRadius toBorderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomRight: Radius.circular(bottomRight),
      bottomLeft: Radius.circular(bottomLeft),
    );
  }

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

/// Material Design 3 shape scale.
class ShapeScale {
  ShapeScale._();

  static double get none => ShapeScaleSystemTokens.none.value;
  static double get extraSmall => ShapeScaleSystemTokens.extraSmall.value;
  static double get small => ShapeScaleSystemTokens.small.value;
  static double get medium => ShapeScaleSystemTokens.medium.value;
  static double get large => ShapeScaleSystemTokens.large.value;
  static double get extraLarge => ShapeScaleSystemTokens.extraLarge.value;
  static double get full => ShapeScaleSystemTokens.full.value;

  /// Gets the appropriate corner radius for a full/circular shape.
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

  /// Gets a shape token by its semantic name.
  static DesignToken<double>? getToken(String name) {
    final tokens = <String, DesignToken<double>>{
      'none': ShapeScaleSystemTokens.none,
      'extraSmall': ShapeScaleSystemTokens.extraSmall,
      'small': ShapeScaleSystemTokens.small,
      'medium': ShapeScaleSystemTokens.medium,
      'large': ShapeScaleSystemTokens.large,
      'extraLarge': ShapeScaleSystemTokens.extraLarge,
      'full': ShapeScaleSystemTokens.full,
    };
    return tokens[name];
  }
}

/// Material Design 3 shape scheme.
@immutable
class ShapeScheme {
  const ShapeScheme({
    this.cornerFamilyToken,
    this.noneToken,
    this.extraSmallToken,
    this.smallToken,
    this.mediumToken,
    this.largeToken,
    this.extraLargeToken,
    this.fullToken,
  });

  /// Creates the default Material Design 3 shape scheme.
  factory ShapeScheme.m3Default() {
    return ShapeScheme(
      cornerFamilyToken: ShapeFamilySystemTokens.rounded,
      noneToken: ShapeScaleSystemTokens.none,
      extraSmallToken: ShapeScaleSystemTokens.extraSmall,
      smallToken: ShapeScaleSystemTokens.small,
      mediumToken: ShapeScaleSystemTokens.medium,
      largeToken: ShapeScaleSystemTokens.large,
      extraLargeToken: ShapeScaleSystemTokens.extraLarge,
      fullToken: ShapeScaleSystemTokens.full,
    );
  }

  /// Creates a shape scheme with cut corners.
  factory ShapeScheme.cut() {
    return ShapeScheme(
      cornerFamilyToken: ShapeFamilySystemTokens.cut,
      noneToken: ShapeScaleSystemTokens.none,
      extraSmallToken: ShapeScaleSystemTokens.extraSmall,
      smallToken: ShapeScaleSystemTokens.small,
      mediumToken: ShapeScaleSystemTokens.medium,
      largeToken: ShapeScaleSystemTokens.large,
      extraLargeToken: ShapeScaleSystemTokens.extraLarge,
      fullToken: ShapeScaleSystemTokens.full,
    );
  }

  final DesignToken<CornerFamily>? cornerFamilyToken;
  final DesignToken<double>? noneToken;
  final DesignToken<double>? extraSmallToken;
  final DesignToken<double>? smallToken;
  final DesignToken<double>? mediumToken;
  final DesignToken<double>? largeToken;
  final DesignToken<double>? extraLargeToken;
  final DesignToken<double>? fullToken;

  CornerFamily get cornerFamily =>
      cornerFamilyToken?.value ?? CornerFamily.rounded;
  double get none => noneToken?.value ?? 0.0;
  double get extraSmall => extraSmallToken?.value ?? 4.0;
  double get small => smallToken?.value ?? 8.0;
  double get medium => mediumToken?.value ?? 12.0;
  double get large => largeToken?.value ?? 16.0;
  double get extraLarge => extraLargeToken?.value ?? 28.0;
  double get full => fullToken?.value ?? 9999.0;

  ShapeScheme copyWith({
    DesignToken<CornerFamily>? cornerFamilyToken,
    DesignToken<double>? noneToken,
    DesignToken<double>? extraSmallToken,
    DesignToken<double>? smallToken,
    DesignToken<double>? mediumToken,
    DesignToken<double>? largeToken,
    DesignToken<double>? extraLargeToken,
    DesignToken<double>? fullToken,
  }) {
    return ShapeScheme(
      cornerFamilyToken: cornerFamilyToken ?? this.cornerFamilyToken,
      noneToken: noneToken ?? this.noneToken,
      extraSmallToken: extraSmallToken ?? this.extraSmallToken,
      smallToken: smallToken ?? this.smallToken,
      mediumToken: mediumToken ?? this.mediumToken,
      largeToken: largeToken ?? this.largeToken,
      extraLargeToken: extraLargeToken ?? this.extraLargeToken,
      fullToken: fullToken ?? this.fullToken,
    );
  }

  /// Gets a shape border for the specified radius token.
  ShapeBorder getShape(DesignToken<double> radiusToken, {Size? size}) {
    final radius = radiusToken.value;
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

  static ShapeScheme lerp(ShapeScheme? a, ShapeScheme? b, double t) {
    if (a == null && b == null) {
      return ShapeScheme.m3Default();
    }
    if (a == null) {
      return b!;
    }
    if (b == null) {
      return a;
    }

    // Don't interpolate corner family, use the target
    final cornerFamilyToken =
        t < 0.5 ? a.cornerFamilyToken : b.cornerFamilyToken;

    return ShapeScheme(
      cornerFamilyToken: cornerFamilyToken,
      // Tokens don't interpolate, use step function
      noneToken: t < 0.5 ? a.noneToken : b.noneToken,
      extraSmallToken: t < 0.5 ? a.extraSmallToken : b.extraSmallToken,
      smallToken: t < 0.5 ? a.smallToken : b.smallToken,
      mediumToken: t < 0.5 ? a.mediumToken : b.mediumToken,
      largeToken: t < 0.5 ? a.largeToken : b.largeToken,
      extraLargeToken: t < 0.5 ? a.extraLargeToken : b.extraLargeToken,
      fullToken: t < 0.5 ? a.fullToken : b.fullToken,
    );
  }
}

/// Factory class for creating Material Design 3 shape borders.
class MaterialShapes {
  MaterialShapes._();

  /// Creates a rounded rectangle shape with the specified radius token.
  static RoundedRectangleBorder rounded(DesignToken<double> radiusToken) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radiusToken.value),
    );
  }

  /// Creates a rounded rectangle shape with individual corner radii.
  static RoundedRectangleBorder roundedWith(CornerShape corners) {
    return RoundedRectangleBorder(
      borderRadius: corners.toBorderRadius(),
    );
  }

  /// Creates a beveled (cut) rectangle shape with the specified radius token.
  static BeveledRectangleBorder cut(DesignToken<double> radiusToken) {
    return BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(radiusToken.value),
    );
  }

  /// Creates a beveled (cut) rectangle shape with individual corner radii.
  static BeveledRectangleBorder cutWith(CornerShape corners) {
    return BeveledRectangleBorder(
      borderRadius: corners.toBorderRadius(),
    );
  }

  /// Creates a continuous (squircle) rectangle shape.
  static ContinuousRectangleBorder continuous(DesignToken<double> radiusToken) {
    return ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(radiusToken.value),
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
  static ShapeBorder create({
    required DesignToken<double> radiusToken,
    DesignToken<CornerFamily>? familyToken,
    bool continuous = false,
    Size? size,
  }) {
    final radius = radiusToken.value;
    final family = familyToken?.value ?? CornerFamily.rounded;

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
          return MaterialShapes.continuous(radiusToken);
        }
        return rounded(radiusToken);
      case CornerFamily.cut:
        return cut(radiusToken);
    }
  }
}

/// Theme extension for Material Design 3 shapes.
@immutable
class ShapeTheme extends ThemeExtension<ShapeTheme> {
  const ShapeTheme({
    this.scheme,
    this.buttonShapeToken,
    this.cardShapeToken,
    this.dialogShapeToken,
    this.bottomSheetShapeToken,
    this.chipShapeToken,
    this.menuShapeToken,
    this.textFieldShapeToken,
  });

  /// Creates the default Material Design 3 shape theme.
  factory ShapeTheme.m3Default() {
    return ShapeTheme(
      scheme: ShapeScheme.m3Default(),
      buttonShapeToken: ButtonShapeTokens.common,
      cardShapeToken: CardShapeTokens.elevated,
      dialogShapeToken: DialogShapeTokens.standard,
      chipShapeToken: ChipShapeTokens.standard,
      menuShapeToken: MenuShapeTokens.container,
      textFieldShapeToken: TextFieldShapeTokens.outlined,
    );
  }

  final ShapeScheme? scheme;
  final DesignToken<double>? buttonShapeToken;
  final DesignToken<double>? cardShapeToken;
  final DesignToken<double>? dialogShapeToken;
  final DesignToken<CornerShape>? bottomSheetShapeToken;
  final DesignToken<double>? chipShapeToken;
  final DesignToken<double>? menuShapeToken;
  final DesignToken<double>? textFieldShapeToken;

  ShapeScheme get effectiveScheme => scheme ?? ShapeScheme.m3Default();

  ShapeBorder get effectiveButtonShape =>
      MaterialShapes.rounded(buttonShapeToken ?? ButtonShapeTokens.common);

  ShapeBorder get effectiveCardShape =>
      MaterialShapes.rounded(cardShapeToken ?? CardShapeTokens.elevated);

  ShapeBorder get effectiveDialogShape =>
      MaterialShapes.rounded(dialogShapeToken ?? DialogShapeTokens.standard);

  ShapeBorder get effectiveBottomSheetShape {
    final token = bottomSheetShapeToken ?? BottomSheetShapeTokens.standard;
    return MaterialShapes.roundedWith(token.value);
    // return MaterialShapes.rounded(ShapeScaleSystemTokens.extraLarge);
  }

  ShapeBorder get effectiveChipShape =>
      MaterialShapes.rounded(chipShapeToken ?? ChipShapeTokens.standard);

  ShapeBorder get effectiveMenuShape =>
      MaterialShapes.rounded(menuShapeToken ?? MenuShapeTokens.container);

  ShapeBorder get effectiveTextFieldShape => MaterialShapes.rounded(
      textFieldShapeToken ?? TextFieldShapeTokens.outlined);

  @override
  ShapeTheme copyWith({
    ShapeScheme? scheme,
    DesignToken<double>? buttonShapeToken,
    DesignToken<double>? cardShapeToken,
    DesignToken<double>? dialogShapeToken,
    DesignToken<CornerShape>? bottomSheetShapeToken,
    DesignToken<double>? chipShapeToken,
    DesignToken<double>? menuShapeToken,
    DesignToken<double>? textFieldShapeToken,
  }) {
    return ShapeTheme(
      scheme: scheme ?? this.scheme,
      buttonShapeToken: buttonShapeToken ?? this.buttonShapeToken,
      cardShapeToken: cardShapeToken ?? this.cardShapeToken,
      dialogShapeToken: dialogShapeToken ?? this.dialogShapeToken,
      bottomSheetShapeToken:
          bottomSheetShapeToken ?? this.bottomSheetShapeToken,
      chipShapeToken: chipShapeToken ?? this.chipShapeToken,
      menuShapeToken: menuShapeToken ?? this.menuShapeToken,
      textFieldShapeToken: textFieldShapeToken ?? this.textFieldShapeToken,
    );
  }

  @override
  ShapeTheme lerp(ThemeExtension<ShapeTheme>? other, double t) {
    if (other is! ShapeTheme) {
      return this;
    }

    return ShapeTheme(
      scheme: ShapeScheme.lerp(scheme, other.scheme, t),
      // Tokens don't interpolate, use step function
      buttonShapeToken: t < 0.5 ? buttonShapeToken : other.buttonShapeToken,
      cardShapeToken: t < 0.5 ? cardShapeToken : other.cardShapeToken,
      dialogShapeToken: t < 0.5 ? dialogShapeToken : other.dialogShapeToken,
      bottomSheetShapeToken:
          t < 0.5 ? bottomSheetShapeToken : other.bottomSheetShapeToken,
      chipShapeToken: t < 0.5 ? chipShapeToken : other.chipShapeToken,
      menuShapeToken: t < 0.5 ? menuShapeToken : other.menuShapeToken,
      textFieldShapeToken:
          t < 0.5 ? textFieldShapeToken : other.textFieldShapeToken,
    );
  }

  static ShapeTheme of(BuildContext context) {
    return Theme.of(context).extension<ShapeTheme>() ?? ShapeTheme.m3Default();
  }

  static ShapeTheme? maybeOf(BuildContext context) {
    return Theme.of(context).extension<ShapeTheme>();
  }
}

// /// Extension methods for easy access to shape tokens.
// extension ShapeContext on BuildContext {
//   /// Gets the shape theme from the current context.
//   ShapeTheme get shapeTheme => ShapeTheme.of(this);

//   /// Gets the shape scheme from the current context.
//   ShapeScheme get shapeScheme => shapeTheme.effectiveScheme;

//   /// Gets the button shape tokens.
//   ButtonShapeTokens get buttonShape => ButtonShapeTokens();

//   /// Gets the card shape tokens.
//   CardShapeTokens get cardShape => CardShapeTokens();

//   /// Gets the dialog shape tokens.
//   DialogShapeTokens get dialogShape => DialogShapeTokens();

//   /// Gets the bottom sheet shape tokens.
//   BottomSheetShapeTokens get bottomSheetShape => BottomSheetShapeTokens();

//   /// Gets the navigation shape tokens.
//   NavigationShapeTokens get navigationShape => NavigationShapeTokens();

//   /// Gets the chip shape tokens.
//   ChipShapeTokens get chipShape => ChipShapeTokens();

//   /// Gets the menu shape tokens.
//   MenuShapeTokens get menuShape => MenuShapeTokens();

//   /// Gets the text field shape tokens.
//   TextFieldShapeTokens get textFieldShape => TextFieldShapeTokens();

//   /// Creates a shape with the specified radius token using the current scheme.
//   ShapeBorder shape(DesignToken<double> radiusToken) {
//     return shapeScheme.getShape(radiusToken);
//   }
// }

/// Utility class for shape calculations and transformations.
class ShapeUtils {
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
          borderRadius:
              BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t)!,
        );
      }
      if (a is BeveledRectangleBorder && b is BeveledRectangleBorder) {
        return BeveledRectangleBorder(
          borderRadius:
              BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t)!,
        );
      }
      if (a is ContinuousRectangleBorder && b is ContinuousRectangleBorder) {
        return ContinuousRectangleBorder(
          borderRadius:
              BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t)!,
        );
      }
    }

    // If different types, switch at midpoint
    return t < 0.5 ? a : b;
  }
}

/// A versatile container widget that applies a Material Design 3 shape.
class ShapeContainer extends StatelessWidget {
  const ShapeContainer({
    required this.child,
    super.key,
    this.shape,
    this.radiusToken,
    this.cornerFamilyToken,
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

  final Widget child;
  final ShapeBorder? shape;
  final DesignToken<double>? radiusToken;
  final DesignToken<CornerFamily>? cornerFamilyToken;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final double? elevation;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    // final shapeTheme = context.shapeTheme;
    final effectiveShape = shape ??
        (radiusToken != null
            ? MaterialShapes.create(
                radiusToken: radiusToken!,
                familyToken:
                    cornerFamilyToken ?? ShapeFamilySystemTokens.rounded,
              )
            : null);

    var result = child;

    if (padding != null) {
      result = Padding(padding: padding!, child: result);
    }

    if (effectiveShape != null || color != null || borderColor != null) {
      final decoration = ShapeDecoration(
        shape: effectiveShape ?? const RoundedRectangleBorder(),
        color: color,
      );

      if (borderColor != null && borderWidth != null) {
        var finalShape = effectiveShape ?? const RoundedRectangleBorder();

        // To add a border, the shape must be an OutlinedBorder. We check its type
        // to safely call `copyWith` and add the border side.
        if (finalShape is OutlinedBorder) {
          finalShape = finalShape.copyWith(
            side: BorderSide(
              color: borderColor!,
              width: borderWidth!,
            ),
          );
        }

        // Since ShapeDecoration is immutable and has no `copyWith` method,
        // we create a new instance with the updated shape.
        result = Container(
          width: width,
          height: height,
          constraints: constraints,
          decoration: ShapeDecoration(
            color: color,
            shape: finalShape,
          ),
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

/// Linearly interpolates between two numbers.
double? lerpDouble(num? a, num? b, double t) {
  if (a == null && b == null) return null;
  a ??= 0.0;
  b ??= 0.0;
  return a + (b - a) * t;
}

/// Component-specific shape specifications using tokens.
class ComponentShapes {
  ComponentShapes._();

  /// Gets a button shape from tokens.
  static ShapeBorder button({DesignToken<double>? radiusToken}) {
    return MaterialShapes.rounded(radiusToken ?? ButtonShapeTokens.common);
  }

  /// Gets a card shape from tokens.
  static ShapeBorder card({DesignToken<double>? radiusToken}) {
    return MaterialShapes.rounded(radiusToken ?? CardShapeTokens.elevated);
  }

  /// Gets a dialog shape from tokens.
  static ShapeBorder dialog({DesignToken<double>? radiusToken}) {
    return MaterialShapes.rounded(radiusToken ?? DialogShapeTokens.standard);
  }

  /// Gets a bottom sheet shape from tokens.
  static ShapeBorder bottomSheet({DesignToken<CornerShape>? shapeToken}) {
    final token = shapeToken ?? BottomSheetShapeTokens.standard;
    return MaterialShapes.roundedWith(token.value);
  }

  /// Gets a chip shape from tokens.
  static ShapeBorder chip({DesignToken<double>? radiusToken}) {
    return MaterialShapes.rounded(radiusToken ?? ChipShapeTokens.standard);
  }

  /// Gets a FAB shape from tokens.
  static ShapeBorder fab({
    FABSize size = FABSize.regular,
    bool extended = false,
  }) {
    if (extended) {
      return MaterialShapes.rounded(ButtonShapeTokens.fabExtended);
    }

    switch (size) {
      case FABSize.small:
        return MaterialShapes.rounded(ButtonShapeTokens.fabSmall);
      case FABSize.regular:
        return MaterialShapes.rounded(ButtonShapeTokens.fabRegular);
      case FABSize.large:
        return MaterialShapes.rounded(ButtonShapeTokens.fabLarge);
    }
  }
}

/// FAB size options.
enum FABSize { small, regular, large }
